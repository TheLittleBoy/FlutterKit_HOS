import 'package:dio/dio.dart';

/// Dio 请求执行器
///
/// 承载业务域的接口基础地址，负责把相对接口地址与共享 [Dio] 的根地址拼接，
/// 发起请求并把响应体解析为 JSON Map，交由数据源转换为业务模型。
class DioRequest {
  /// 创建 Dio 请求执行器
  ///
  /// [dio] 共享 Dio 客户端。
  /// [baseUrl] 业务域接口基础地址，可为绝对地址或相对 [Dio] 根地址的路径。
  const DioRequest(this._dio, this._baseUrl);

  /// 共享 Dio 客户端
  final Dio _dio;

  /// 业务域接口基础地址
  final String _baseUrl;

  /// 发起请求并返回 JSON 响应体
  ///
  /// [method] HTTP 方法。
  /// [path] 业务域内的接口路径。
  /// [data] 可选请求体，Map 会按 JSON 协议序列化。
  /// [queryParameters] 可选查询参数。
  ///
  /// 返回解析后的 JSON Map；HTTP 状态码与业务错误码由 [HttpInterceptor] 统一拒绝。
  Future<Map<String, dynamic>> fetchJson(
    String method,
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final RequestOptions options = Options(method: method)
        .compose(
          _dio.options,
          path,
          data: data,
          queryParameters: queryParameters,
        )
        .copyWith(
          baseUrl: _resolveBaseUrl(),
          responseType: ResponseType.json,
        );
    final Response<Map<String, dynamic>> response = await _dio
        .fetch<Map<String, dynamic>>(options);
    return response.data!;
  }

  /// 将业务域接口地址解析为绝对地址
  ///
  /// 返回可直接用于请求的绝对地址。
  String _resolveBaseUrl() {
    if (_baseUrl.trim().isEmpty) {
      return _dio.options.baseUrl;
    }
    final Uri domain = Uri.parse(_baseUrl);
    if (domain.isAbsolute) {
      return domain.toString();
    }
    return Uri.parse(_dio.options.baseUrl).resolveUri(domain).toString();
  }
}
