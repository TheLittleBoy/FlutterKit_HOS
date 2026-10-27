import 'package:dio/dio.dart';

import '../../../../core/model/entity/auth/auth.dart';
import '../../../../core/model/request/login_request.dart';
import '../../../../core/model/response/base/base_response.dart';
import '../../provider/dio_request.dart';
import 'auth_network_data_source.dart';

/// 认证网络数据源实现
///
/// 基于共享 Dio 直接发起认证接口请求，并解析为认证业务模型。
class AuthNetworkDataSourceImpl implements AuthNetworkDataSource {
  /// 创建认证网络数据源实现
  ///
  /// [dio] Dio 网络客户端。
  /// [baseUrl] 可选认证接口基础地址，默认 `auth`。
  AuthNetworkDataSourceImpl(Dio dio, {String? baseUrl})
    : _request = DioRequest(dio, baseUrl ?? 'auth');

  /// 认证请求执行器
  final DioRequest _request;

  /// 密码登录
  ///
  /// [request] 登录请求参数。
  ///
  /// 返回登录结果响应。
  @override
  Future<BaseResponse<Auth>> loginByPassword(LoginRequest request) async {
    final Map<String, dynamic> json = await _request.fetchJson(
      'POST',
      '/login',
      data: request.toJson(),
    );
    return BaseResponse<Auth>.fromJson(
      json,
      (Object? data) => Auth.fromJson(data! as Map<String, dynamic>),
    );
  }
}
