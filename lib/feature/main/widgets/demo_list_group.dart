import 'package:get/get.dart';
import 'package:flutter_kit/application.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../models/demo_item.dart';
import '../states/core_demo_state.dart';
import 'demo_card.dart';

/// 示例列表组
///
/// 使用一个 TDesign 卡片列表承载同一模块下的全部示例入口。
class DemoListGroup extends StatelessWidget {
  /// 示例数据
  final List<DemoItem> items;

  /// 列表头部附加单元格
  final List<TCell> leadingCells;

  /// 右侧组件构建器
  final Widget? Function(BuildContext context, int index, DemoItem item)?
  trailingBuilder;

  /// 菜单点击回调
  final ValueChanged<DemoItem>? onItemTap;

  /// 创建示例列表组
  const DemoListGroup({
    super.key,
    required this.items,
    this.leadingCells = const [],
    this.trailingBuilder,
    this.onItemTap,
  });

  /// 构建 TDesign 卡片列表组
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final localeTag = Application.locale.value.toLanguageTag();
      final itemCells = List<TCell>.generate(items.length, (index) {
        final item = items[index];
        final isLastItem = index == items.length - 1;
        return DemoCard.buildCell(
          context,
          title: item.localizedTitle,
          description: item.localizedDescription,
          icon: item.icon,
          onTap: onItemTap == null ? null : () => onItemTap!(item),
          trailing: trailingBuilder?.call(context, index, item),
          bordered: !isLastItem,
        );
      });

      return TCellGroup(
        key: ValueKey<String>(localeTag),
        variant: TCellGroupVariant.card,
        cells: [...leadingCells, ...itemCells],
      );
    });
  }
}

/// 示例列表组组件预览
@Preview(
  name: '组件',
  size: componentPreviewSize,
  theme: buildAppPreviewTheme,
  wrapper: wrapAppComponentPreview,
)
Widget previewDemoListGroup() =>
    DemoListGroup(items: CoreDemoState.defaultDemoItems.take(3).toList());
