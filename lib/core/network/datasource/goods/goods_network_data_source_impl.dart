import 'package:dio/dio.dart';

import '../../../../core/model/entity/goods/goods.dart';
import '../../../../core/model/request/goods_search_request.dart';
import '../../../../core/model/response/base/base_list_response.dart';
import '../../../../core/model/response/base/base_response.dart';
import '../../provider/dio_request.dart';
import 'goods_network_data_source.dart';

/// 商品网络数据源实现
///
/// 基于共享 Dio 直接发起商品接口请求，并解析为商品业务模型。
class GoodsNetworkDataSourceImpl implements GoodsNetworkDataSource {
  /// 创建商品网络数据源实现
  ///
  /// [dio] Dio 网络客户端。
  /// [baseUrl] 可选商品接口基础地址，默认 `goods/info`。
  GoodsNetworkDataSourceImpl(Dio dio, {String? baseUrl})
    : _request = DioRequest(dio, baseUrl ?? 'goods/info');

  /// 商品请求执行器
  final DioRequest _request;

  /// 分页查询商品
  ///
  /// [request] 商品搜索分页请求参数。
  ///
  /// 返回商品分页列表响应。
  @override
  Future<BaseResponse<BaseListResponse<Goods>>> getGoodsPage(
    GoodsSearchRequest request,
  ) async {
    final Map<String, dynamic> json = await _request.fetchJson(
      'POST',
      '/page',
      data: request.toJson(),
    );
    return BaseResponse<BaseListResponse<Goods>>.fromJson(
      json,
      (Object? data) => BaseListResponse<Goods>.fromJson(
        data! as Map<String, dynamic>,
        (Object? item) => Goods.fromJson(item! as Map<String, dynamic>),
      ),
    );
  }

  /// 获取商品详情
  ///
  /// [id] 商品 ID。
  ///
  /// 返回商品详情响应。
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
