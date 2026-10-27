# BackTop 返回顶部

> 用于当页面过长往下滑动时，帮助用户快速回到页面顶部。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/back-top)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 圆形返回顶部

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class BacktopCircleTriggerExample extends StatelessWidget {
  const BacktopCircleTriggerExample({super.key, required this.onSelected});

  final ValueChanged<TBackTopShape> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        key: const Key('backtop-demo-circle-trigger'),
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        size: TButtonSize.large,
        onPressed: () => onSelected(TBackTopShape.circle),
        child: const TText('圆形返回顶部'),
      ),
    );
  }
}
```

##### 半圆形返回顶部

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class BacktopHalfRoundTriggerExample extends StatelessWidget {
  const BacktopHalfRoundTriggerExample({super.key, required this.onSelected});

  final ValueChanged<TBackTopShape> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        key: const Key('backtop-demo-half-round-trigger'),
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        size: TButtonSize.large,
        onPressed: () => onSelected(TBackTopShape.halfCircle),
        child: const TText('半圆形返回顶部'),
      ),
    );
  }
}
```

##### `BacktopSkeletonContentExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class BacktopSkeletonContentExample extends StatelessWidget {
  const BacktopSkeletonContentExample({super.key});

  Widget _buildSkeletonContent(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final itemWidth = (constraints.maxWidth - 16) / 2;
      return Wrap(
        spacing: 16,
        runSpacing: 24,
        children: List.generate(
          8,
          (_) => SizedBox(
            width: itemWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: itemWidth,
                  height: itemWidth,
                  decoration: BoxDecoration(
                    color: context.tTheme.bgColorComponent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(height: 10),
                _buildSkeletonLine(context, itemWidth),
                const SizedBox(height: 10),
                _buildSkeletonLine(context, itemWidth * 0.61),
              ],
            ),
          ),
        ),
      );
    },
  );

  Widget _buildSkeletonLine(BuildContext context, double width) => Container(
    width: width,
    height: 16,
    decoration: BoxDecoration(
      color: context.tTheme.bgColorComponent,
      borderRadius: BorderRadius.circular(context.tTheme.radiusSmall),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _buildSkeletonContent(context);
  }
}
```

## API

1. [TBackTop](#tbacktop)
2. [TBackTopShape](#tbacktopshape)
3. [TBackTopColorPreset](#tbacktopcolorpreset)
4. [TBackTopThemeData](#tbacktopthemedata)

### TBackTop

#### 构造方法

##### TBackTop

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| colorPreset | TBackTopColorPreset | TBackTopColorPreset.light | 局部配色预设，默认 `TBackTopColorPreset.light`；不切换全局明暗主题。 | 否 |
| controller | ScrollController? | - | 页面滚动控制器。 未传时组件始终可见，点击只触发 `onPressed`；传入后组件监听滚动偏移并 在点击时以 500 毫秒、Curves.easeIn 动画回到该滚动位置的最小边界。 控制器由调用方创建和释放，组件只管理自己的滚动监听。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| onPressed | VoidCallback? | - | 回顶动画完成后的通知。 `null` 不表示禁用；只要提供 `controller`，组件仍可点击并执行回顶。 | 否 |
| shape | TBackTopShape | TBackTopShape.circle | 结构形态，默认 `TBackTopShape.circle`。 | 否 |
| showText | bool | false | 是否显示设计内置文案。 圆形显示“顶部”，半圆形显示“返回/顶部”，文案来自当前资源代理。 | 否 |
| tooltip | String? | - | 读屏和 Tooltip 提示；未传时使用当前资源代理的“返回顶部”。 | 否 |
| visibilityOffset | double | 200 | 绑定 `controller` 时的显示阈值，默认 200；必须大于或等于 0。 滚动偏移大于或等于该值时显示；未绑定 `controller` 时不参与显隐。 | 否 |

### TBackTopShape

返回顶部结构形态。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| circle | TBackTopShape | - | 48 × 48 的圆形返回顶部。 | - |
| halfCircle | TBackTopShape | - | 贴靠屏幕右侧的半圆形返回顶部。 | - |

### TBackTopColorPreset

返回顶部预设配色。

只选择一组协调的背景、边框和内容颜色，不改变组件结构或交互。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| light | TBackTopColorPreset | - | 浅色容器配色。 | - |
| dark | TBackTopColorPreset | - | 深色容器配色。 | - |

### TBackTopThemeData

返回顶部组件 ThemeExtension。

只承载子树级具体视觉默认值；结构形态、配色选择和滚动显隐行为由
`TBackTop` 实例唯一拥有。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 背景色；未设置时根据实例配色读取 TDesign 语义 Token。 | 否 |
| borderColor | Color? | - | 边框色；未设置时根据实例配色读取 TDesign 语义 Token。 | 否 |
| borderWidth | double? | - | 边框宽度，默认 0.5。 | 否 |
| contentColor | Color? | - | 图标和文字颜色；未设置时根据实例配色读取 TDesign 语义 Token。 | 否 |
| contentGap | double? | - | 半圆形图标与文字间距，默认 2。 | 否 |
| halfCircleHeight | double? | - | 半圆形高度，默认 40。 | 否 |
| halfCircleHorizontalPadding | double? | - | 半圆形水平内边距，默认 8。 | 否 |
| halfCircleMinWidth | double? | - | 半圆形无文字时的最小宽度，默认 38。 | 否 |
| iconSize | double? | - | 图标尺寸，默认 22；显式值优先。 | 否 |
| roundSize | double? | - | 圆形宽高，默认 48。 | 否 |
| textStyle | TextStyle? | - | 文案字体样式；未设置字段回退 Mark Extra Small 字体。 文字颜色与图标颜色统一由 `contentColor` 控制，传入样式中的 `color` 不参与解析，避免同一内容色存在两个 Theme 状态源。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [页面布局相关](#页面布局相关)
3. [常见用法](#常见用法)
4. [相似组件](#相似组件)

### 何时使用

当页面内容过长，用户有快速返回到页面顶部的诉求时使用

### 页面布局相关

##### 常驻于页面的右下角，方便用户随时点击返回

![](https://tdesign.gtimg.com/site/design/mobile-guide/back-top/back-top-1.png)

---

### 常见用法

##### 当用户滚动页面时，为了不影响到用户对内容的浏览体验，建议可将返回顶部按钮最小化或像右侧收起，当用户停止滚动时，再完全显示按钮

![](https://tdesign.gtimg.com/site/design/mobile-guide/back-top/back-top-2.gif)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [悬浮按钮](<../基础/Fab 悬浮按钮.md>) | 当某个操作为全局操作，且为用户高频/业务强推的操作时可使用。 |
