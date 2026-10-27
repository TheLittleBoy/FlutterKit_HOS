# TabBar 标签栏

> 用于在不同功能模块之间进行快速切换，位于页面底部。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/tab-bar)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 纯文本标签栏

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextTabBarExample extends StatefulWidget {
  const TextTabBarExample({super.key});

  @override
  State<TextTabBarExample> createState() => _TextTabBarExampleState();
}

class _TextTabBarExampleState extends State<TextTabBarExample> {
  /// 核心片段：导入 material.dart 和 tdesign_flutter.dart。
  /// 在 StatefulWidget 的 State 中声明 `int _textValue = 0;`，
  /// 从 build 调用本方法；状态由 State 持有并通过 setState 重建。
  Widget _textTabBar(BuildContext context) {
    const labels = ['首页', '应用', '聊天', '我的'];
    return TTabBar(
      type: TTabBarType.text,
      useSafeArea: false,
      value: _textValue,
      onChanged: (newValue) => setState(() => _textValue = newValue),
      navigationTabs: List.generate(
        4,
        (index) => TTabBarItemConfig(
          tabText: labels[index],
          allowMultipleTaps: true,
          onTap: () => TToast.showText(
            '第 ${index + 1} 项',
            context: context,
          ),
        ),
      ),
    );
  }

  int _textValue = 0;

  @override
  Widget build(BuildContext context) {
    return _textTabBar(context);
  }
}
```

##### 图标加文本标签栏

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class IconTextTabBarExample extends StatefulWidget {
  const IconTextTabBarExample({super.key});

  @override
  State<IconTextTabBarExample> createState() => _IconTextTabBarExampleState();
}

class _IconTextTabBarExampleState extends State<IconTextTabBarExample> {
  /// 核心片段：导入 material.dart 和 tdesign_flutter.dart。
  /// 在 StatefulWidget 的 State 中声明 `int _iconTextValue = 0;`，
  /// 从 build 调用本方法；状态由 State 持有并通过 setState 重建。
  Widget _iconTextTabBar(BuildContext context) {
    const labels = ['首页', '应用', '聊天', '我的'];
    const icons = [TIcons.home, TIcons.app, TIcons.chat, TIcons.user];
    return TTabBar(
      type: TTabBarType.iconText,
      useSafeArea: false,
      value: _iconTextValue,
      onChanged: (newValue) => setState(() => _iconTextValue = newValue),
      navigationTabs: List.generate(
        4,
        (index) => TTabBarItemConfig(
          tabText: labels[index],
          selectedIcon: Icon(icons[index]),
          unselectedIcon: Icon(icons[index]),
          allowMultipleTaps: true,
          onTap: () => TToast.showText(
            '第 ${index + 1} 项',
            context: context,
          ),
        ),
      ),
    );
  }

  int _iconTextValue = 0;

  @override
  Widget build(BuildContext context) {
    return _iconTextTabBar(context);
  }
}
```

##### 纯图标标签栏

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class IconTabBarExample extends StatefulWidget {
  const IconTabBarExample({super.key});

  @override
  State<IconTabBarExample> createState() => _IconTabBarExampleState();
}

class _IconTabBarExampleState extends State<IconTabBarExample> {
  /// 核心片段：导入 material.dart 和 tdesign_flutter.dart。
  /// 在 StatefulWidget 的 State 中声明 `int _iconValue = 0;`，
  /// 从 build 调用本方法；状态由 State 持有并通过 setState 重建。
  Widget _iconTabBar(BuildContext context) {
    const icons = [TIcons.home, TIcons.app, TIcons.chat, TIcons.user];
    return TTabBar(
      type: TTabBarType.icon,
      useSafeArea: false,
      value: _iconValue,
      onChanged: (newValue) => setState(() => _iconValue = newValue),
      navigationTabs: List.generate(
        4,
        (index) => TTabBarItemConfig(
          selectedIcon: Icon(icons[index]),
          unselectedIcon: Icon(icons[index]),
          allowMultipleTaps: true,
          onTap: () => TToast.showText(
            '第 ${index + 1} 项',
            context: context,
          ),
        ),
      ),
    );
  }

  int _iconValue = 0;

  @override
  Widget build(BuildContext context) {
    return _iconTabBar(context);
  }
}
```

##### 双层级文本标签栏

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DoubleLayerTabBarExample extends StatefulWidget {
  const DoubleLayerTabBarExample({super.key});

  @override
  State<DoubleLayerTabBarExample> createState() =>
      _DoubleLayerTabBarExampleState();
}

class _DoubleLayerTabBarExampleState extends State<DoubleLayerTabBarExample> {
  /// 核心片段：导入 material.dart 和 tdesign_flutter.dart。
  /// 在 StatefulWidget 的 State 中声明 `int _doubleLayerValue = 2;`，
  /// 从 build 调用本方法；状态由 State 持有并通过 setState 重建。
  Widget _doubleLayerTabBar(BuildContext context) {
    const labels = ['首页', '应用', '我的'];
    return TTabBar(
      type: TTabBarType.doubleLayer,
      useSafeArea: false,
      value: _doubleLayerValue,
      onChanged: (newValue) => setState(() => _doubleLayerValue = newValue),
      navigationTabs: List.generate(
        labels.length,
        (index) => TTabBarItemConfig(
          tabText: labels[index],
          allowMultipleTaps: true,
          onTap: () => TToast.showText('第 ${index + 1} 项', context: context),
          popUpButtonConfig: index == 2
              ? TTabBarPopUpBtnConfig(
                  items: const [
                    TTabBarMenuItem(value: '基本信息'),
                    TTabBarMenuItem(value: '个人主页'),
                    TTabBarMenuItem(value: '设置'),
                  ],
                  onChanged: (item) =>
                      TToast.showText('选择了$item', context: context),
                )
              : null,
        ),
      ),
    );
  }

  int _doubleLayerValue = 2;

  @override
  Widget build(BuildContext context) {
    return _doubleLayerTabBar(context);
  }
}
```

#### 组件样式

##### 弱选中标签栏

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class WeakTabBarsExample extends StatefulWidget {
  const WeakTabBarsExample({super.key});

  @override
  State<WeakTabBarsExample> createState() => _WeakTabBarsExampleState();
}

class _WeakTabBarsExampleState extends State<WeakTabBarsExample> {
  /// 核心片段：导入 material.dart 和 tdesign_flutter.dart。
  /// 在 StatefulWidget 的 State 中声明 `final _weakValues = [0, 0, 0];`，
  /// 从 build 调用本方法；状态由 State 持有并通过 setState 重建。
  Widget _weakTabBars(BuildContext context) {
    const labels = ['首页', '应用', '聊天', '我的'];
    const icons = [TIcons.home, TIcons.app, TIcons.chat, TIcons.user];
    const badges = [
      TBadgeConfig(label: '16'),
      TBadgeConfig(variant: TBadgeVariant.dot),
      TBadgeConfig(label: 'New'),
      TBadgeConfig(label: '···'),
    ];
    return Column(
      children: [
        TTabBar(
          type: TTabBarType.text,
          itemStyle: TTabBarItemStyle.normal,
          split: true,
          useSafeArea: false,
          value: _weakValues[0],
          onChanged: (value) => setState(() => _weakValues[0] = value),
          navigationTabs: List.generate(
            4,
            (index) => TTabBarItemConfig(
              tabText: labels[index],
              badge: badges[index],
              allowMultipleTaps: true,
              onTap: () => TToast.showText(
                '第 ${index + 1} 项',
                context: context,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TTabBar(
          type: TTabBarType.icon,
          itemStyle: TTabBarItemStyle.normal,
          useSafeArea: false,
          value: _weakValues[1],
          onChanged: (value) => setState(() => _weakValues[1] = value),
          navigationTabs: List.generate(
            4,
            (index) => TTabBarItemConfig(
              selectedIcon: Icon(icons[index]),
              unselectedIcon: Icon(icons[index]),
              badge: badges[index],
              allowMultipleTaps: true,
              onTap: () => TToast.showText(
                '第 ${index + 1} 项',
                context: context,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TTabBar(
          type: TTabBarType.iconText,
          itemStyle: TTabBarItemStyle.normal,
          useSafeArea: false,
          value: _weakValues[2],
          onChanged: (value) => setState(() => _weakValues[2] = value),
          navigationTabs: List.generate(
            4,
            (index) => TTabBarItemConfig(
              tabText: labels[index],
              selectedIcon: Icon(icons[index]),
              unselectedIcon: Icon(icons[index]),
              badge: badges[index],
              allowMultipleTaps: true,
              onTap: () => TToast.showText(
                '第 ${index + 1} 项',
                context: context,
              ),
            ),
          ),
        ),
      ],
    );
  }

  final _weakValues = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return _weakTabBars(context);
  }
}
```

##### 悬浮胶囊标签栏

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CapsuleTabBarExample extends StatefulWidget {
  const CapsuleTabBarExample({super.key});

  @override
  State<CapsuleTabBarExample> createState() => _CapsuleTabBarExampleState();
}

class _CapsuleTabBarExampleState extends State<CapsuleTabBarExample> {
  /// 核心片段：导入 material.dart 和 tdesign_flutter.dart。
  /// 在 StatefulWidget 的 State 中声明 `int _capsuleValue = 0;`，
  /// 从 build 调用本方法；状态由 State 持有并通过 setState 重建。
  Widget _capsuleTabBar(BuildContext context) {
    return TTabBar(
      type: TTabBarType.iconText,
      style: TTabBarStyle.capsule,
      useSafeArea: false,
      value: _capsuleValue,
      onChanged: (newValue) => setState(() => _capsuleValue = newValue),
      navigationTabs: List.generate(
        4,
        (index) => TTabBarItemConfig(
          tabText: 'Item',
          selectedIcon: const Icon(TIcons.app),
          unselectedIcon: const Icon(TIcons.app),
          badge: index == 0
              ? const TBadgeConfig(variant: TBadgeVariant.dot)
              : null,
          allowMultipleTaps: true,
          onTap: () => TToast.showText(
            '第 ${index + 1} 项',
            context: context,
          ),
        ),
      ),
    );
  }

  int _capsuleValue = 0;

  @override
  Widget build(BuildContext context) {
    return _capsuleTabBar(context);
  }
}
```

#### 自定义

##### 自定义样式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CustomTabBarExample extends StatefulWidget {
  const CustomTabBarExample({super.key});

  @override
  State<CustomTabBarExample> createState() => _CustomTabBarExampleState();
}

class _CustomTabBarExampleState extends State<CustomTabBarExample> {
  /// 核心片段：导入 material.dart 和 tdesign_flutter.dart。
  /// 在 StatefulWidget 的 State 中声明 `int _customValue = 0;`，
  /// 从 build 调用本方法；状态由 State 持有并通过 setState 重建。
  Widget _customTabBar(BuildContext context) {
    const icons = [TIcons.home, TIcons.app, TIcons.chat, TIcons.user];
    return TTabBar(
      type: TTabBarType.icon,
      itemStyle: TTabBarItemStyle.normal,
      useSafeArea: false,
      value: _customValue,
      onChanged: (newValue) => setState(() => _customValue = newValue),
      navigationTabs: List.generate(
        4,
        (index) => TTabBarItemConfig(
          selectedIcon: Icon(icons[index]),
          unselectedIcon: Icon(icons[index]),
          allowMultipleTaps: true,
          onTap: () => TToast.showText('第 ${index + 1} 项', context: context),
        ),
      ),
    );
  }

  int _customValue = 0;

  @override
  Widget build(BuildContext context) {
    return _customTabBar(context);
  }
}
```

## API

1. [TTabBar](#ttabbar)
2. [TTabBarItemConfig](#ttabbaritemconfig)
3. [TTabBarPopUpBtnConfig](#ttabbarpopupbtnconfig)
4. [TTabBarPopUpShapeConfig](#ttabbarpopupshapeconfig)
5. [TTabBarMenuItem](#ttabbarmenuitem)
6. [TTabBarType](#ttabbartype)
7. [TTabBarItemStyle](#ttabbaritemstyle)
8. [TTabBarStyle](#ttabbarstyle)
9. [TTabBarIconTextLayout](#ttabbaricontextlayout)
10. [TTabBarIndicatorAnimation](#ttabbarindicatoranimation)
11. [TTabBarThemeData](#ttabbarthemedata)

### TTabBar

#### 构造方法

##### TTabBar

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| animationCurve | Curve? | - | 动画曲线 null 时使用 Curves.easeInOutCubic。 | 否 |
| animationDuration | Duration? | - | 动画时长 null 时为 300 毫秒。 | 否 |
| iconTextLayout | TTabBarIconTextLayout | TTabBarIconTextLayout.stacked | 图文项的图标与文字排列方式；仅当 `type` 为 `TTabBarType.iconText` 时生效。 默认为 `TTabBarIconTextLayout.stacked`。上下排列时图文间距为 0px， 左右排列时为 4px。该参数不改变标签栏 自身的水平方向，也不影响双层级菜单入口。 | 否 |
| indicatorAnimation | TTabBarIndicatorAnimation | TTabBarIndicatorAnimation.none | 指示器动画类型 | 否 |
| itemStyle | TTabBarItemStyle | TTabBarItemStyle.label | 单个标签项的选中样式。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| navigationTabs | List<TTabBarItemConfig> | - | tabs配置 | 是 |
| needInkWell | bool | false | 是否需要水波纹效果 | 否 |
| onChanged | ValueChanged<int>? | - | 选中项变化；null 时整栏禁用 | 否 |
| split | bool | false | 是否使用竖线分隔；`itemStyle` 为 `TTabBarItemStyle.label` 时不显示。 | 否 |
| style | TTabBarStyle | TTabBarStyle.filled | 标签栏容器样式。 | 否 |
| type | TTabBarType | - | 标签栏内容类型。 | 是 |
| useSafeArea | bool | true | 是否填充底部安全区域；默认 true，使用标签栏背景色填充。 嵌入页面内部且不需要底部安全区时可设为 false。 | 否 |
| value | int | - | 选中的 index | 是 |

### TTabBarItemConfig

单个 tab 配置

#### 构造方法

##### TTabBarItemConfig

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| allowMultipleTaps | bool | false | 是否允许重复点击当前选中项时再次调用 `onTap`，默认为 false。 该字段不影响点击未选中项，也不会让 `TTabBar.onChanged` 重复通知当前值。 | 否 |
| badge | TBadgeConfig? | - | 展示在标签内容右上角的徽标；为空时不显示。 徽标内容和样式由 `TBadgeConfig` 描述，`TBadgeConfig.offset` 可用于逐项 调整默认位置。纯文本项未设置实例 offset 时使用 TabBar 的 文本徽标默认位置；纯图标项与上下排列的图文项以图标作为锚点， 左右排列的图文项以整组图文作为锚点，均使用徽标的默认右上角位置。 显式 offset 优先于组件默认值，不读取 Material BadgeTheme。 TabBar 自己拥有徽标锚点与点击区域；点击行为通过 `onTap` 配置。调用方 已经拥有目标 Widget 时，应直接使用 `TBadge` 包装该 Widget。 | 否 |
| onLongPress | GestureLongPressCallback? | - | 长按事件 | 否 |
| onTap | GestureTapCallback? | - | 标签项被选中时的附加点击回调。 点击未选中项时，在 `TTabBar.onChanged` 之前调用；重复点击当前选中项时， 仅当 `allowMultipleTaps` 为 true 才调用。整栏禁用时不会调用。 | 否 |
| popUpButtonConfig | TTabBarPopUpBtnConfig? | - | 弹窗配置 | 否 |
| selectedIcon | Widget? | - | 选中时图标。未指定尺寸的 Icon 默认使用 TabBar 的 20px 图标尺寸； Icon 自身显式指定的尺寸优先。 | 否 |
| selectTabTextStyle | TextStyle? | - | 选中时的文字样式，按字段覆盖继承主题与内置默认值。 | 否 |
| tabText | String? | - | tab 文本 | 否 |
| unselectedIcon | Widget? | - | 未选中时图标。尺寸默认值与 `selectedIcon` 相同。 | 否 |
| unselectTabTextStyle | TextStyle? | - | 未选中时的文字样式，按字段覆盖继承主题与内置默认值。 | 否 |

### TTabBarPopUpBtnConfig

展开项配置

#### 构造方法

##### TTabBarPopUpBtnConfig

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| items | List<TTabBarMenuItem> | - | 选项list | 是 |
| onChanged | ValueChanged<String> | - | 统一在 onChanged 中处理各item点击事件 | 是 |
| popUpDialogConfig | TTabBarPopUpShapeConfig? | - | 弹窗UI配置 | 否 |

### TTabBarPopUpShapeConfig

弹窗UI配置

#### 构造方法

##### TTabBarPopUpShapeConfig

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| arrowHeight | double? | - | 箭头高度 默认8 | 否 |
| arrowWidth | double? | - | 箭头宽度 默认13.5 | 否 |
| backgroundColor | Color? | - | 弹窗背景颜色 | 否 |
| popUpItemHeight | double? | - | 单个选项高度；所有选项等高。未设置时至少 48，可随内置文字增长。 显式数值保持固定；构造后的默认公开值仍为 48。 | 否 |
| popUpWidth | double? | - | 弹窗宽度。 不设置时使用 `max(107, 标签项宽度 - 20)`；显式设置时覆盖该默认值。 | 否 |
| radius | double? | - | 弹层面板圆角。 不设置时使用当前 TDesign 主题的 `radiusDefault`（默认 6 逻辑像素）； 显式设置时覆盖主题默认值。 | 否 |

### TTabBarMenuItem

弹窗菜单item

#### 构造方法

##### TTabBarMenuItem

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| alignment | AlignmentGeometry | AlignmentDirectional.center | 对齐方式 | 否 |
| itemWidget | Widget? | - | 选项widget | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| value | String | - | 选项值 | 是 |

### TTabBarType

底部标签栏内容类型。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| text | TTabBarType | - | 纯文本标签栏。 | - |
| iconText | TTabBarType | - | 图标加文本标签栏。 | - |
| icon | TTabBarType | - | 纯图标标签栏。 | - |
| doubleLayer | TTabBarType | - | 带弹出菜单的双层级文本标签栏。 | - |

### TTabBarItemStyle

单个标签项的选中样式。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| normal | TTabBarItemStyle | - | 仅改变前景色。 | - |
| label | TTabBarItemStyle | - | 使用浅色胶囊背景强调选中项。 | - |

### TTabBarStyle

标签栏容器样式。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| filled | TTabBarStyle | - | 铺满父容器。 | - |
| capsule | TTabBarStyle | - | 带外边距、圆角和阴影的悬浮胶囊。 | - |

### TTabBarIconTextLayout

图文标签项中图标与文字的排列方式，仅对 `TTabBarType.iconText` 生效。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| stacked | TTabBarIconTextLayout | - | 图标在上、文字在下；默认布局。 | - |
| inline | TTabBarIconTextLayout | - | 图标在左、文字在右。 | - |

### TTabBarIndicatorAnimation

底部标签栏组件样式
指示器动画类型

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| none | TTabBarIndicatorAnimation | - | 无动画，瞬间切换 | - |
| linear | TTabBarIndicatorAnimation | - | 线性滑动：指示器匀速从一个 tab 滑到另一个 | - |
| elastic | TTabBarIndicatorAnimation | - | 弹性动画：指示器先拉伸后收缩 | - |

### TTabBarThemeData

底部标签栏 ThemeExtension

管理 TTabBar 的子树级视觉默认值（高度、颜色与分割线等）。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 默认背景颜色 | 否 |
| barHeight | double? | - | 默认高度 | 否 |
| dividerColor | Color? | - | 竖向分割线颜色；未设置时读取全局灰阶 3。 | 否 |
| dividerHeight | double? | - | 默认分割线高度 | 否 |
| dividerThickness | double? | - | 默认分割线厚度 | 否 |
| selectedBgColor | Color? | - | 默认选中时背景颜色 | 否 |
| unselectedBgColor | Color? | - | 默认未选中时背景颜色 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [推荐/慎用示例](#推荐-慎用示例)
4. [相似组件](#相似组件)

### 何时使用

目标模块/视图需要从应用的任何地方直接进行访问时使用。

### 组件搭配使用

##### 标签栏与[徽标](<../数据展示/Badge 徽标.md>)组合使用，用于告知用户该模块/视图的状态变化。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tab-bar/tab-bar-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tab-bar/tab-bar-2.png)

### 推荐/慎用示例

##### 建议标签栏数量在2-5个之间；若多与5个，建议重新审视应用的信息架构，对信息架构进行优化。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tab-bar/tab-bar-3.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tab-bar/tab-bar-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 避免在同个状态下有不同颜色的文本和图标。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tab-bar/tab-bar-5.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tab-bar/tab-bar-6.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 文本是对标签的简要说明，不建议将文本进行截断或换行，所以应避免使用长文本。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tab-bar/tab-bar-7.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

---

![](https://tdesign.gtimg.com/site/design/mobile-guide/tab-bar/tab-bar-8.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [选项卡](<Tabs 选项卡.md>) | 当内容/数据需要一定的分类纬度进行区分，便于用户快速作出选择并切换时可以使用。 |
| [侧边栏](<SideBar 侧边栏.md>) | 当内容项数量较多，需要用户根据品类快速选择到目标内容项时使用。 |
