# 网络请求

网络模块位于 `lib/core/network/`，由 `DioProvider`、HTTP 拦截器、调试拦截器和按业务域拆分的 DataSource 构成。它只负责协议、接口与传输错误；Feature 通过 `core/data` 的 Repository 访问网络，不能直接在 View 或 Logic 创建 Dio 和数据源实现。

## 介绍

网络请求模块统一管理接口调用与拦截器配置，对外由 DataSource 提供业务协议。业务层不直接依赖 `core/network`：Logic 通过数据层的 Repository 发起请求，Repository 再依赖 DataSource。这样替换底层客户端、调整 URL 或补充缓存策略时，不会扩散到 Feature。

## 模块结构

```text
core/network/
├── provider/dio_provider.dart              # Dio 单例和基础配置
├── provider/dio_request.dart                # 业务域地址拼接与 JSON 请求执行
├── interceptor/interceptor.dart            # HTTP 与业务状态码拦截
├── debug/network_debug_tools.dart           # Debug 模式网络面板与日志
├── exception/error_exception.dart           # 网络错误转换
└── datasource/<domain>/
    ├── <domain>_network_data_source.dart    # 业务接口契约
    └── <domain>_network_data_source_impl.dart # 基于共享 Dio 的手写实现
```

## DioProvider（网络客户端）

文件：`lib/core/network/provider/dio_provider.dart`

| 配置 | 当前值 / 来源 | 含义 |
| --- | --- | --- |
| 单例 | `DioProvider()` | 整个应用复用同一 Dio |
| `baseUrl` | `Env.baseUrl` | 环境配置提供的接口根地址 |
| 连接超时 | 10 秒 | `connectTimeout` |
| 接收超时 | 10 秒 | `receiveTimeout` |
| 请求头 | JSON Content-Type、Accept | 默认 JSON 协议 |
| 拦截器 | `HttpInterceptor`、`NetworkDebugTools.interceptors` | 正常错误处理与 Debug 调试 |

```dart
/// 创建项目唯一的 Dio 配置。
static Dio _createDio() {
  return Dio()
    // 先处理 HTTP 与业务状态码。
    ..interceptors.add(HttpInterceptor())
    // Debug 模式追加 Alice、PrettyDioLogger；Release 返回空列表。
    ..interceptors.addAll(NetworkDebugTools.interceptors)
    ..options = BaseOptions(
      baseUrl: Env.baseUrl,
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
      headers: const {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
}
```

## 拦截器

### HTTP 与业务错误拦截

`HttpInterceptor` 对 HTTP 非 200 响应和响应 JSON 内的业务错误码调用 `handler.reject(DioException(...))`。这意味着数据源 Future 会以异常完成，随后由 `RequestHelper`、`BaseNetworkLogic` 或业务 `try / catch` 统一处理。业务成功码来自 `AppConfig.successCode`。

文件：`lib/core/network/interceptor/interceptor.dart`

```dart
/// 响应拦截：正常结果继续传递，异常结果转换为 DioException。
@override
void onResponse(
  Response<dynamic> response,
  ResponseInterceptorHandler handler,
) {
  // 同时检查 HTTP 状态和业务 code。
  final BaseError? error = _handleResponse(response);
  if (error != null) {
    LogUtil.e('错误代码: ${error.code}, 错误信息: ${error.message}');
    handler.reject(
      DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: error,
      ),
    );
    return;
  }
  handler.next(response);
}
```

`_handleResponse()` 对 `statusCode != 200` 使用 `CustomErrorHandler` 转换；对 Map 响应读取业务 code，非 `AppConfig.successCode` 同样视为错误。401 已预留认证失效处理位置，但当前代码不在拦截器内直接跳转登录页。

### Debug 日志与网络面板

Debug 模式下 `NetworkDebugTools` 注入 Alice 与 `PrettyDioLogger`；Release 返回空拦截器列表，调试工具不参与正式请求。`NetworkDebugTools.initialize()` 必须在 `GetMaterialApp` 构建前由启动过程调用。

## 数据源接口与实现

### 商品 DataSource 接口

文件：`lib/core/network/datasource/goods/goods_network_data_source.dart`

```dart
/// 商品网络接口契约。
abstract class GoodsNetworkDataSource {
  /// POST 分页查询，参数是明确的请求模型。
  Future<BaseResponse<BaseListResponse<Goods>>> getGoodsPage(
    GoodsSearchRequest request,
  );

  /// GET 查询商品详情，id 通过 Query 传递。
  Future<BaseResponse<Goods>> getGoodsInfo(int id);
}
```

### 请求执行器

文件：`lib/core/network/provider/dio_request.dart`

`DioRequest` 绑定业务域接口基础地址，负责把相对接口地址与共享 Dio 的根地址拼接，发起请求并把响应体交给模型解析。

```dart
/// 业务域请求执行器，按相对地址发起请求并返回 JSON 响应体。
class DioRequest {
  /// 绑定共享 Dio 与业务域基础地址。
  const DioRequest(this._dio, this._baseUrl);

  /// 发起请求，HTTP 与业务错误由拦截器统一拒绝。
  Future<Map<String, dynamic>> fetchJson(
    String method,
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final RequestOptions options = Options(method: method)
        .compose(_dio.options, path, data: data, queryParameters: queryParameters)
        .copyWith(baseUrl: _resolveBaseUrl(), responseType: ResponseType.json);
    final Response<Map<String, dynamic>> response =
        await _dio.fetch<Map<String, dynamic>>(options);
    return response.data!;
  }
}
```

### 商品数据源实现

文件：`lib/core/network/datasource/goods/goods_network_data_source_impl.dart`

```dart
/// 商品网络数据源实现，基于共享 Dio 手写请求。
class GoodsNetworkDataSourceImpl implements GoodsNetworkDataSource {
  /// 绑定共享 Dio，baseUrl 默认 goods/info。
  GoodsNetworkDataSourceImpl(Dio dio, {String? baseUrl})
    : _request = DioRequest(dio, baseUrl ?? 'goods/info');

  /// 商品请求执行器。
  final DioRequest _request;

  /// 分页接口：request 序列化为 JSON 请求体。
  @override
  Future<BaseResponse<BaseListResponse<Goods>>> getGoodsPage(
    GoodsSearchRequest request,
  ) async {
    final Map<String, dynamic> json =
        await _request.fetchJson('POST', '/page', data: request.toJson());
    return BaseResponse<BaseListResponse<Goods>>.fromJson(
      json,
      (Object? data) => BaseListResponse<Goods>.fromJson(
        data! as Map<String, dynamic>,
        (Object? item) => Goods.fromJson(item! as Map<String, dynamic>),
      ),
    );
  }

  /// 详情接口：id 通过 Query 传递。
  @override
  Future<BaseResponse<Goods>> getGoodsInfo(int id) async {
    final Map<String, dynamic> json = await _request.fetchJson(
      'GET',
      '/info',
      queryParameters: <String, dynamic>{'id': id},
    );
    return BaseResponse<Goods>.fromJson(
      json,
      (Object? data) => Goods.fromJson(data! as Map<String, dynamic>),
    );
  }
}
```

数据源实现是手写代码，不产生 `*_network_data_source_impl.g.dart`。只有 `@JsonSerializable` 模型需要 build_runner 生成，变更模型字段或注解后运行 `dart run build_runner build --delete-conflicting-outputs`。

## 仓库示例

文件：`lib/core/data/repository/goods_repository.dart`

```dart
/// 商品仓库是网络模块对 Feature 暴露的唯一入口。
class GoodsRepository {
  /// 面向接口的依赖，便于单测传入 fake 数据源。
  final GoodsNetworkDataSource _dataSource;

  /// 默认创建 Dio 数据源；测试可传入自定义 DataSource。
  GoodsRepository({GoodsNetworkDataSource? dataSource})
      : _dataSource =
            dataSource ?? GoodsNetworkDataSourceImpl(DioProvider().dio);

  /// 转发分页业务请求，不向上层暴露 HTTP 注解与 URL。
  Future<BaseResponse<BaseListResponse<Goods>>> getGoodsPage(
    GoodsSearchRequest request,
  ) => _dataSource.getGoodsPage(request);

  /// 转发商品详情请求。
  Future<BaseResponse<Goods>> getGoodsInfo(int id) =>
      _dataSource.getGoodsInfo(id);
}
```

## Logic 使用示例

```dart
/// 网络详情页面状态。
class NetworkDemoState extends BaseNetworkState {
  /// 请求成功后的商品详情。
  final Rx<Goods> goods = Goods().obs;
}

/// 网络详情 Logic 只依赖仓库，并将请求交给网络父类。
class NetworkDemoLogic extends BaseNetworkLogic<Goods> {
  /// 页面自己的展示状态。
  final NetworkDemoState networkDemoState = NetworkDemoState();

  /// 网络父类复用页面声明的 State。
  @override
  NetworkDemoState get networkState => networkDemoState;

  /// 商品数据仓库。
  final GoodsRepository _goodsRepository = GoodsRepository();

  @override
  Future<BaseResponse<Goods>> Function()? get apiRequest =>
      // 父类在 initData / 重试时调用这个函数创建新请求。
      () => _goodsRepository.getGoodsInfo(1);

  @override
  void requestOk(Goods data) {
    // 成功数据写入 State，View 通过 Obx 订阅。
    networkDemoState.goods.value = data;
  }
}
```

### 分页 POST 使用示例

文件：`lib/feature/demo/logics/network_list_demo_logic.dart`

```dart
/// 网络分页列表状态。
class NetworkListDemoState extends BaseListState<Goods> {
  /// 示例接口每页请求 15 条商品。
  @override
  int get pageSize => 15;
}

/// 分页列表 Logic 将父类页码转换为明确请求模型。
class NetworkListDemoLogic extends BaseListLogic<Goods> {
  /// 分页列表页面状态。
  final NetworkListDemoState networkListDemoState = NetworkListDemoState();

  /// 分页父类复用页面声明的 State。
  @override
  NetworkListDemoState get listState => networkListDemoState;

  /// 商品数据仓库。
  final GoodsRepository _goodsRepository = GoodsRepository();

  @override
  Future<BaseResponse<BaseListResponse<Goods>>> Function()? get apiRequest =>
      () => _goodsRepository.getGoodsPage(
        // 数据源接收 GoodsSearchRequest 并序列化为请求体。
        GoodsSearchRequest(
          page: listState.currentPage,
          size: listState.pageSize,
        ),
      );
}
```

## 与数据层的关系

- 网络模块负责客户端、拦截器和 DataSource，不向 Feature 直接暴露调用入口。
- Repository 负责对上提供 `getGoodsInfo`、`getGoodsPage` 这类业务方法。
- Logic 根据页面形态选择 BaseNetwork、BaseList、BaseRefresh 或 RequestHelper，不能直接发 Dio 请求。

## 如何新增接口

1. 在 `core/model/request`、`entity`、`response` 定义明确参数与响应模型。
2. 在 `core/network/datasource/<domain>/` 定义 DataSource 抽象契约。
3. 新增实现类，注入共享 `DioProvider().dio`，用 `DioRequest` 手写请求并解析 `BaseResponse<T>`。
4. 在 `core/data/repository/` 新增或扩展业务 Repository。
5. 根据页面类型在 Logic 使用 RequestHelper、BaseNetwork、BaseList 或 BaseRefresh。
6. 模型变更后执行 `dart run build_runner build --delete-conflicting-outputs` 并补充测试。

## 注意事项

- Feature 不直接调用 `DioProvider` 或数据源实现；网络模块不直接操作页面状态。
- 数据源实现是手写代码，不依赖代码生成；只有 `@JsonSerializable` 模型需要 build_runner。
- 不要用 HTTP 200 判断业务成功，业务码由拦截器和 `BaseResponse.isSucceeded` 统一判断。
- 日志不能记录 token、密码和敏感个人数据，即使只在 Debug 模式也要审查输出。

## 关联阅读

- [数据层](./data.md)
- [结果处理](./result.md)
- [BaseNetwork](./base-network.md)
