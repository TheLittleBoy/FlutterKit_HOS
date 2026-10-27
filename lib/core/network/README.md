# Network

网络层包是应用程序的网络请求处理层，负责所有与后端服务的通信。该包采用模块化结构，确保网络请求的可维护性和可扩展性。

## 目录结构

### 1. datasource/
- 按业务模块组织的网络数据源接口与实现
- 每个模块的 `*_network_data_source.dart` 定义对外契约
- 每个模块的 `*_network_data_source_impl.dart` 基于共享 Dio 手写请求实现，不依赖代码生成

#### 模块化组织
- `goods/`: 商品相关数据源
- `user/`: 用户相关数据源
- `auth/`: 认证相关数据源
- 等等...

### 2. interceptor/
- 网络请求拦截器
- 请求/响应的预处理逻辑
- 统一的错误处理机制

### 3. provider/
- Dio 实例提供者与请求执行器
- `DioProvider` 管理 [Dio] 单例的创建与配置，业务层通过 `DioProvider().dio` 直接使用，也便于测试 mock
- `DioRequest` 按业务域拼接接口地址、发起请求并返回 JSON 响应体

### 4. exception/
- 自定义异常类定义
- 错误处理工具类
- 统一的异常处理策略

## API请求处理

### RequestHelper 使用

`RequestHelper` 提供了统一的网络请求处理方式：

```dart
await RequestHelper.repository<Goods>(
  GoodsRepository().getGoodsInfo(1),
)
  .loading(true)
  .toast(true)
  .execute();
```

详细使用说明请参考 [API请求处理器文档](../result/README.md)

## 代码生成

数据源实现不再依赖代码生成，只有 JSON 模型需要生成 `fromJson`、`toJson`。

### 何时需要生成代码

在以下情况下需要运行代码生成命令：

1. 新增或修改 `@JsonSerializable` 模型
   - 添加或调整字段
   - 修改注解参数

2. 新增业务模块的请求与响应模型

### 生成命令

在项目根目录下执行以下命令：

```shell
# 生成代码（一次性）
dart run build_runner build --delete-conflicting-outputs
```

```shell
# 清理旧的生成文件
dart run build_runner clean
```

```shell
# 持续监听文件变化并自动生成
dart run build_runner watch
```

## 使用指南

1. 添加新的业务模块：
   ```dart
   // 1. 在 datasource/ 下创建新模块目录
   // 2. 创建 *_network_data_source.dart 定义接口契约
   // 3. 创建 *_network_data_source_impl.dart，注入共享 Dio 并手写请求
   class NewModuleNetworkDataSourceImpl implements NewModuleNetworkDataSource {
     NewModuleNetworkDataSourceImpl(Dio dio, {String? baseUrl})
       : _request = DioRequest(dio, baseUrl ?? 'new-module');

     final DioRequest _request;

     @override
     Future<BaseResponse<MyData>> getData() async {
       final Map<String, dynamic> json = await _request.fetchJson('GET', '/list');
       return BaseResponse<MyData>.fromJson(
         json,
         (Object? data) => MyData.fromJson(data! as Map<String, dynamic>),
       );
     }
   }
   ```

2. API 接口规范：
   - 数据源接口只暴露业务方法，不暴露 HTTP 细节
   - `DioRequest.fetchJson` 传入 HTTP 方法与业务域内的相对路径
   - 请求体使用明确的请求模型并调用其 `toJson()`
   - 响应数据使用 `BaseResponse<T>` 封装并调用 `fromJson()`

3. 错误处理：
   - 使用 RequestHelper 统一处理请求状态
   - 使用拦截器处理通用错误
   - 在业务层处理特定错误

## 注意事项

1. 代码生成
   - 只有 JSON 模型需要生成代码，修改模型后运行生成命令
   - 数据源实现为手写代码，不需要生成，也不应存在 `*_network_data_source_impl.g.dart`

2. 模块化原则
   - 每个业务模块独立维护自己的数据源
   - 相关的 API 放在同一模块目录下
   - 保持模块之间的独立性
   - 在 `datasource/` 下按业务模块组织接口与实现

3. 性能优化
   - 合理使用请求缓存
   - 实现请求取消机制
   - 处理并发请求
   - 监控网络性能

4. 安全考虑
   - 实现统一的认证机制
   - 保护敏感数据
   - 使用 HTTPS
   - 处理证书验证

5. 测试
   - 为每个 API 编写单元测试
   - 模拟不同网络状况
   - 测试错误处理逻辑

## 开发流程

1. 创建新模块
   - 在 datasource/ 下创建新模块目录
   - 实现数据源接口与手写请求实现
   - 按需为模型运行代码生成命令

2. 更新现有模块
   - 修改对应模块的数据源实现
   - 模型字段变更后运行代码生成命令

3. 测试验证
   - 运行单元测试
   - 进行集成测试
   - 验证错误处理
