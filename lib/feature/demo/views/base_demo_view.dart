import 'package:get/get.dart';
import 'package:flutter_kit/core/base/base/base_view.dart';
import 'package:flutter_kit/core/design_system/extensions/extensions.dart';
import 'package:flutter_kit/core/design_system/theme/size.dart';
import 'package:flutter_kit/core/ui/preview/app_preview_annotations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../localization/demo_keys.dart';
import '../logics/base_demo_logic.dart';

/// Base 示例页
///
/// 展示 BaseView 的导航栏、下拉菜单、FloatingActionButton 与底部 TabBar。
class BaseDemoView extends BaseView<BaseDemoLogic> {
  /// 创建 Base 示例页面
  ///
  /// [logic] 外部注入的 Base 示例 Logic 一般用于测试和预览。
  BaseDemoView({super.key, super.logic});

  /// 导航栏高度
  @override
  double get navHeight => 88;

  /// 导航栏标题
  @override
  String? get navTitle => DemoKeys.titleBaseDemo.tr;

  /// 导航栏右侧操作项
  @override
  List<TNavBarItem>? get rightBarItems => [
    TNavBarItem(
      icon: TIcons.notification,
      iconSize: 20,
      padding: EdgeInsets.only(right: spaceHorizontalXLarge),
    ),
    TNavBarItem(
      icon: TIcons.logo_github,
      iconSize: 20,
      padding: EdgeInsets.only(right: spaceHorizontalLarge),
    ),
  ];

  /// 导航栏底部下拉菜单
  @override
  Widget? get navBottomWidget => TDropdownMenu(
    items: [
      TDropdownMenuItem(
        label: DemoKeys.baseAllProducts.tr,
        panelBuilder: (context, controller) => TDropdownSingleSelectPanel<String>(
          controller: controller,
          value: 'all',
          onChanged: (_) {},
          options: [
            TDropdownMenuOption<String>(
              label: DemoKeys.baseAllProducts.tr,
              value: 'all',
            ),
            TDropdownMenuOption<String>(
              label: DemoKeys.baseLatestProducts.tr,
              value: 'new',
            ),
            TDropdownMenuOption<String>(
              label: DemoKeys.basePopularProducts.tr,
              value: 'hot',
            ),
          ],
        ),
      ),
      TDropdownMenuItem(
        label: DemoKeys.baseDefaultSort.tr,
        panelBuilder: (context, controller) => TDropdownSingleSelectPanel<String>(
          controller: controller,
          value: 'default',
          onChanged: (_) {},
          options: [
            TDropdownMenuOption<String>(
              label: DemoKeys.baseDefaultSort.tr,
              value: 'default',
            ),
            TDropdownMenuOption<String>(
              label: DemoKeys.basePriceHighToLow.tr,
              value: 'price',
            ),
          ],
        ),
      ),
    ],
  );

  /// 构建 Base 示例页面内容
  @override
  Widget body() => TText(
    '${DemoKeys.baseContentTitle.tr}\n${DemoKeys.baseContentDescription.tr}',
    textAlign: TextAlign.center,
  ).center().backgroundColor(appTheme.backgroundSecondaryContainer);

  /// 构建悬浮操作按钮
  @override
  Widget? floatingAction() {
    return TFab(text: DemoKeys.baseFloatingAction.tr);
  }

  /// 构建示例底部导航栏
  @override
  Widget? bottom() {
    return TTabBar(
      type: TTabBarType.iconText,
      value: 2,
      navigationTabs: [
        _buildTabItem(
          DemoKeys.baseTabMessages.tr,
          TIcons.chat_message,
          TIcons.chat_message_filled,
          0,
        ),
        _buildTabItem(
          DemoKeys.baseTabTasks.tr,
          TIcons.file_1,
          TIcons.file_1_filled,
          1,
        ),
        _buildTabItem(
          DemoKeys.baseTabWorkspace.tr,
          TIcons.app,
          TIcons.app_filled,
          2,
        ),
        _buildTabItem(
          DemoKeys.baseTabContacts.tr,
          TIcons.personal_information,
          TIcons.personal_information_filled,
          3,
        ),
        _buildTabItem(
          DemoKeys.baseTabProfile.tr,
          TIcons.user_1,
          TIcons.user_1_filled,
          4,
        ),
      ],
    );
  }

  /// 构建底部导航栏选项
  ///
  /// [title] 导航标题。
  /// [icon] 未选中图标。
  /// [iconFill] 选中图标。
  /// [index] 导航下标。
  ///
  /// 返回 TDesign 底部导航选项。
  TTabBarItemConfig _buildTabItem(
    String title,
    IconData icon,
    IconData iconFill,
    int index,
  ) {
    return TTabBarItemConfig(
      tabText: title,
      selectedIcon: Icon(iconFill, color: appTheme.primary),
      unselectedIcon: Icon(icon),
      onTap: () {},
    );
  }
}

/// Base 示例页面预览
@ResponsivePreview()
Widget previewBaseDemoView() => BaseDemoView(logic: BaseDemoLogic());
