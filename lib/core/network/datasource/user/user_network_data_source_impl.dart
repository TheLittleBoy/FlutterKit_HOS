import 'package:dio/dio.dart';

import '../../../../core/model/entity/user/user.dart';
import '../../../../core/model/response/base/base_response.dart';
import '../../provider/dio_request.dart';
import 'user_network_data_source.dart';

/// 用户网络数据源实现
///
/// 基于共享 Dio 直接发起用户接口请求，并解析为用户业务模型。
class UserNetworkDataSourceImpl implements UserNetworkDataSource {
  /// 创建用户网络数据源实现
  ///
  /// [dio] Dio 网络客户端。
  /// [baseUrl] 可选用户接口基础地址，默认 `user`。
  UserNetworkDataSourceImpl(Dio dio, {String? baseUrl})
    : _request = DioRequest(dio, baseUrl ?? 'user');

  /// 用户请求执行器
  final DioRequest _request;

  /// 获取用户个人信息
  ///
  /// 返回用户详情响应。
  @override
  Future<BaseResponse<User>> getPersonInfo() async {
    final Map<String, dynamic> json = await _request.fetchJson('GET', '/info');
    return BaseResponse<User>.fromJson(
      json,
      (Object? data) => User.fromJson(data! as Map<String, dynamic>),
    );
  }
}
