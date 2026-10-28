import 'package:get/get.dart';
import 'package:flutter_kit/core/data/preview/goods_preview_data.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../localization/common/common_keys.dart';
import '../../design_system/theme/app_theme.dart';
import '../../design_system/theme/shape.dart';
import '../../design_system/theme/size.dart';
import '../../design_system/widgets/space.dart';
import '../../model/entity/goods/goods.dart';

/// 商品卡片组件
class GoodsListCard extends StatelessWidget {
  /// 商品数据
  final Goods goods;

  /// 创建商品卡片组件
  ///
  /// [key] 组件标识。
  /// [goods] 商品展示数据。
  const GoodsListCard({super.key, required this.goods});

  /// 构建商品卡片组件
  ///
  /// [context] 当前构建上下文。
  @override
  Widget build(BuildContext context) {
    return TCell(
      align: TCellAlign.top,
      image: _buildProductImage(),
      title: _buildTitle(context),
      subtitle: _buildProductDescription(context),
    ).clipRadius(radiusLarge);
  }

  /// 构建商品图片
  Widget _buildProductImage() {
    // 如果有主图，显示图片
    return TImage(src: goods.mainPic, width: spacer96, height: spacer96);
  }

  /// 构建商品描述
  ///
  /// [context] 当前构建上下文。
  Widget _buildProductDescription(BuildContext context) {
    return [
      // 副标题（如果有）
      if (goods.subTitle?.isNotEmpty == true) ...[
        TText(
          goods.subTitle!,
          font: AppTheme.of(context).fontBodySmall,
          style: TextStyle(color: AppTheme.of(context).textSecondary),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SpaceVerticalXSmall(),
      ],

      [
        _buildPriceInfo(context),
        TText(
          CommonKeys.goodsSold.trArgs([goods.sold.toString()]),
          font: AppTheme.of(context).fontMarkSmall,
          style: TextStyle(color: AppTheme.of(context).textPlaceholder),
        ),
      ].toRowBetween(),
    ].toColumnStart();
  }

  /// 构建商品标题
  ///
  /// [context] 当前构建上下文。
  Widget _buildTitle(BuildContext context) {
    return TText(
      goods.title,
      font: AppTheme.of(context).fontTitleMedium,
      style: TextStyle(
        color: AppTheme.of(context).textPrimary,
        fontWeight: AppTheme.of(context).fontWeightBold,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// 构建价格信息
  ///
  /// [context] 当前构建上下文。
  Widget _buildPriceInfo(BuildContext context) {
    return TText(
      '¥${(goods.price).toStringAsFixed(2)}',
      font: AppTheme.of(context).fontTitleLarge,
      style: TextStyle(
        color: AppTheme.of(context).error,
        fontWeight: AppTheme.of(context).fontWeightBold,
      ),
    );
  }
}

/// 商品卡片组件预览
@Preview(
  name: '组件',
  size: componentPreviewSize,
  theme: buildAppPreviewTheme,
  wrapper: wrapAppComponentPreview,
)
Widget previewGoodsListCard() => GoodsListCard(goods: previewGoods.first);
