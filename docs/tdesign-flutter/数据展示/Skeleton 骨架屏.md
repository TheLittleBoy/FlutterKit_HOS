# Skeleton 骨架屏

> 当网络较慢时，在页面真实数据加载之前，给用户展示出页面的大致结构。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/skeleton)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 骨架屏类型

##### 头像骨架屏

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class AvatarSkeletonExample extends StatelessWidget {
  const AvatarSkeletonExample({super.key});

  Widget Function(BuildContext) _wrapper(
    Function(BuildContext) builder, {
    bool isFlexible = false,
  }) =>
      (context) => Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.fromLTRB(
          context.tTheme.spacer2,
          0,
          context.tTheme.spacer2,
          0,
        ),
        child: isFlexible
            ? Row(children: [Expanded(child: builder(context))])
            : builder(context),
      );

  Widget _buildAvatarSkeleton(BuildContext context) {
    return const TSkeleton(variant: TSkeletonVariant.avatar);
  }

  @override
  Widget build(BuildContext context) {
    return (_wrapper(_buildAvatarSkeleton))(context);
  }
}
```

##### 图片骨架屏

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ImageSkeletonExample extends StatelessWidget {
  const ImageSkeletonExample({super.key});

  Widget Function(BuildContext) _wrapper(
    Function(BuildContext) builder, {
    bool isFlexible = false,
  }) =>
      (context) => Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.fromLTRB(
          context.tTheme.spacer2,
          0,
          context.tTheme.spacer2,
          0,
        ),
        child: isFlexible
            ? Row(children: [Expanded(child: builder(context))])
            : builder(context),
      );

  Widget _buildImageSkeleton(BuildContext context) {
    return const TSkeleton(variant: TSkeletonVariant.image);
  }

  @override
  Widget build(BuildContext context) {
    return (_wrapper(_buildImageSkeleton))(context);
  }
}
```

##### 文本骨架屏

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextSkeletonExample extends StatelessWidget {
  const TextSkeletonExample({super.key});

  Widget Function(BuildContext) _wrapper(
    Function(BuildContext) builder, {
    bool isFlexible = false,
  }) =>
      (context) => Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.fromLTRB(
          context.tTheme.spacer2,
          0,
          context.tTheme.spacer2,
          0,
        ),
        child: isFlexible
            ? Row(children: [Expanded(child: builder(context))])
            : builder(context),
      );

  Widget _buildTextSkeleton(BuildContext context) {
    return const TSkeleton(variant: TSkeletonVariant.text);
  }

  @override
  Widget build(BuildContext context) {
    return (_wrapper(_buildTextSkeleton, isFlexible: true))(context);
  }
}
```

##### 段落骨架屏

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ParagraphSkeletonExample extends StatelessWidget {
  const ParagraphSkeletonExample({super.key});

  Widget Function(BuildContext) _wrapper(
    Function(BuildContext) builder, {
    bool isFlexible = false,
  }) =>
      (context) => Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.fromLTRB(
          context.tTheme.spacer2,
          0,
          context.tTheme.spacer2,
          0,
        ),
        child: isFlexible
            ? Row(children: [Expanded(child: builder(context))])
            : builder(context),
      );

  Widget _buildParagraphSkeleton(BuildContext context) {
    return const TSkeleton(variant: TSkeletonVariant.paragraph);
  }

  @override
  Widget build(BuildContext context) {
    return (_wrapper(_buildParagraphSkeleton, isFlexible: true))(context);
  }
}
```

##### 单元格骨架屏

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CellSkeletonExample extends StatelessWidget {
  const CellSkeletonExample({super.key});

  Widget Function(BuildContext) _wrapper(
    Function(BuildContext) builder, {
    bool isFlexible = false,
  }) =>
      (context) => Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.fromLTRB(
          context.tTheme.spacer2,
          0,
          context.tTheme.spacer2,
          0,
        ),
        child: isFlexible
            ? Row(children: [Expanded(child: builder(context))])
            : builder(context),
      );

  Widget _buildCellSkeleton(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            const TSkeleton(variant: TSkeletonVariant.avatar),
            SizedBox(width: context.tTheme.spacer1),
            const Expanded(
              child: TSkeleton.custom(
                layout: TSkeletonLayout(
                  rows: [
                    [TSkeletonBlock.line(), TSkeletonBlock.spacer(flex: 1)],
                    [TSkeletonBlock.line()],
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: context.tTheme.spacer2),
        Row(
          children: <Widget>[
            TSkeleton.custom(
              layout: TSkeletonLayout(
                rows: [
                  [
                    TSkeletonBlock(
                      width: 48,
                      height: 48,
                      style: TSkeletonBlockStyle(
                        borderRadius: context.tTheme.radiusDefault,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(width: context.tTheme.spacer1),
            const Expanded(
              child: TSkeleton.custom(
                layout: TSkeletonLayout(
                  rows: [
                    [TSkeletonBlock.line(), TSkeletonBlock.spacer(flex: 1)],
                    [TSkeletonBlock.line()],
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return (_wrapper(_buildCellSkeleton))(context);
  }
}
```

##### 宫格骨架屏

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class GridSkeletonExample extends StatelessWidget {
  const GridSkeletonExample({super.key});

  Widget Function(BuildContext) _wrapper(
    Function(BuildContext) builder, {
    bool isFlexible = false,
  }) =>
      (context) => Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.fromLTRB(
          context.tTheme.spacer2,
          0,
          context.tTheme.spacer2,
          0,
        ),
        child: isFlexible
            ? Row(children: [Expanded(child: builder(context))])
            : builder(context),
      );

  Widget _buildGridSkeleton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (index) {
        return TSkeleton.custom(
          layout: TSkeletonLayout(
            rows: [
              [
                TSkeletonBlock(
                  width: 48,
                  height: 48,
                  flex: null,
                  style: TSkeletonBlockStyle(
                    borderRadius: context.tTheme.radiusDefault,
                  ),
                ),
              ],
              const [TSkeletonBlock.line(width: 48, flex: null)],
            ],
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (_wrapper(_buildGridSkeleton))(context);
  }
}
```

##### 图文组合骨架屏

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CombineSkeletonExample extends StatelessWidget {
  const CombineSkeletonExample({super.key});

  Widget Function(BuildContext) _wrapper(
    Function(BuildContext) builder, {
    bool isFlexible = false,
  }) =>
      (context) => Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.fromLTRB(
          context.tTheme.spacer2,
          0,
          context.tTheme.spacer2,
          0,
        ),
        child: isFlexible
            ? Row(children: [Expanded(child: builder(context))])
            : builder(context),
      );

  Widget _buildCombineSkeleton(BuildContext context) {
    Widget buildRowCols() {
      return Expanded(
        child: LayoutBuilder(
          builder: (context, constraints) => TSkeleton.custom(
            layout: TSkeletonLayout(
              rows: [
                [
                  TSkeletonBlock(
                    width: constraints.maxWidth,
                    height: constraints.maxWidth,
                    flex: null,
                    style: TSkeletonBlockStyle(
                      borderRadius: context.tTheme.radiusExtraLarge,
                    ),
                  ),
                ],
                [TSkeletonBlock.line(width: constraints.maxWidth)],
                const [TSkeletonBlock.line(), TSkeletonBlock.spacer(flex: 1)],
              ],
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        buildRowCols(),
        SizedBox(width: context.tTheme.spacer2),
        buildRowCols(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return (_wrapper(_buildCombineSkeleton))(context);
  }
}
```

#### 组件动效

##### 渐变加载效果

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class GradientSkeletonExample extends StatelessWidget {
  const GradientSkeletonExample({super.key});

  Widget Function(BuildContext) _wrapper(
    Function(BuildContext) builder, {
    bool isFlexible = false,
  }) =>
      (context) => Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.fromLTRB(
          context.tTheme.spacer2,
          0,
          context.tTheme.spacer2,
          0,
        ),
        child: isFlexible
            ? Row(children: [Expanded(child: builder(context))])
            : builder(context),
      );

  Widget _buildGradientSkeleton(BuildContext context) {
    return const TSkeleton(
      animation: TSkeletonAnimation.gradient,
      variant: TSkeletonVariant.paragraph,
    );
  }

  @override
  Widget build(BuildContext context) {
    return (_wrapper(_buildGradientSkeleton, isFlexible: true))(context);
  }
}
```

##### 闪烁加载效果

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class FlashedSkeletonExample extends StatelessWidget {
  const FlashedSkeletonExample({super.key});

  Widget Function(BuildContext) _wrapper(
    Function(BuildContext) builder, {
    bool isFlexible = false,
  }) =>
      (context) => Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.fromLTRB(
          context.tTheme.spacer2,
          0,
          context.tTheme.spacer2,
          0,
        ),
        child: isFlexible
            ? Row(children: [Expanded(child: builder(context))])
            : builder(context),
      );

  Widget _buildFlashedSkeleton(BuildContext context) {
    return const TSkeleton(
      animation: TSkeletonAnimation.flashed,
      variant: TSkeletonVariant.paragraph,
    );
  }

  @override
  Widget build(BuildContext context) {
    return (_wrapper(_buildFlashedSkeleton, isFlexible: true))(context);
  }
}
```

## API

1. [TSkeleton](#tskeleton)
2. [TSkeletonLayout](#tskeletonlayout)
3. [TSkeletonBlockStyle](#tskeletonblockstyle)
4. [TSkeletonBlock](#tskeletonblock)
5. [TSkeletonAnimation](#tskeletonanimation)
6. [TSkeletonVariant](#tskeletonvariant)
7. [TSkeletonBlockShape](#tskeletonblockshape)
8. [TSkeletonThemeData](#tskeletonthemedata)

### TSkeleton

#### 构造方法

##### TSkeleton

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| animation | TSkeletonAnimation? | - | 动画效果；为 null 时保持静态。 | 否 |
| delay | Duration | Duration.zero | 骨架屏的延迟显示时间，用于避免短请求产生闪烁。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| variant | TSkeletonVariant | TSkeletonVariant.text | 预设形态；自定义布局时为空。 | 否 |

##### TSkeleton.custom

使用自定义行列布局创建骨架屏。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| layout | TSkeletonLayout | - | 自定义布局；预设形态时为空。 | 是 |
| animation | TSkeletonAnimation? | - | 动画效果；为 null 时保持静态。 | 否 |
| delay | Duration | Duration.zero | 骨架屏的延迟显示时间，用于避免短请求产生闪烁。 | 否 |

#### 属性

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| layout | TSkeletonLayout? | - | 自定义布局；预设形态时为空。 | - |

### TSkeletonLayout

骨架屏的行列布局。

#### 构造方法

##### TSkeletonLayout

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| rows | List<List<TSkeletonBlock>> | - | 每个内层列表表示一行骨架块。 | 是 |
| rowSpacing | double? | - | 行间距；未设置时读取组件主题和 TDesign token。 | 否 |

### TSkeletonBlockStyle

单个骨架块的视觉样式。

#### 构造方法

##### TSkeletonBlockStyle

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| borderRadius | double? | - | 骨架块圆角；优先于 `shape` 和组件主题。 | 否 |
| color | Color? | - | 骨架块颜色；优先于组件主题。 | 否 |
| shape | TSkeletonBlockShape | TSkeletonBlockShape.rounded | 骨架块形状。 | 否 |

### TSkeletonBlock

骨架屏中的一个占位块。

#### 构造方法

##### TSkeletonBlock

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| flex | int? | 1 | 同一行内的弹性因子；为 null 时按固定宽度布局。 | 否 |
| height | double? | 16 | 高度。 | 否 |
| margin | EdgeInsets | EdgeInsets.zero | 外边距。 | 否 |
| style | TSkeletonBlockStyle | const TSkeletonBlockStyle() | 视觉样式。 | 否 |
| width | double? | - | 宽度。 | 否 |

##### TSkeletonBlock.circle

圆形占位块。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| width | double? | 48 | 宽度。 | 否 |
| height | double? | 48 | 高度。 | 否 |
| flex | int? | - | 同一行内的弹性因子；为 null 时按固定宽度布局。 | 否 |
| margin | EdgeInsets | EdgeInsets.zero | 外边距。 | 否 |
| style | TSkeletonBlockStyle | const TSkeletonBlockStyle(shape: TSkeletonBlockShape.circle) | 视觉样式。 | 否 |

##### TSkeletonBlock.line

文本行占位块。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| width | double? | - | 宽度。 | 否 |
| height | double? | 16 | 高度。 | 否 |
| flex | int? | 1 | 同一行内的弹性因子；为 null 时按固定宽度布局。 | 否 |
| margin | EdgeInsets | EdgeInsets.zero | 外边距。 | 否 |
| style | TSkeletonBlockStyle | const TSkeletonBlockStyle() | 视觉样式。 | 否 |

##### TSkeletonBlock.rectangle

无圆角矩形占位块。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| width | double? | - | 宽度。 | 否 |
| height | double? | 16 | 高度。 | 否 |
| flex | int? | 1 | 同一行内的弹性因子；为 null 时按固定宽度布局。 | 否 |
| margin | EdgeInsets | EdgeInsets.zero | 外边距。 | 否 |
| style | TSkeletonBlockStyle | const TSkeletonBlockStyle(shape: TSkeletonBlockShape.rectangle) | 视觉样式。 | 否 |

##### TSkeletonBlock.spacer

透明间隔块。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| width | double? | - | 宽度。 | 否 |
| height | double? | - | 高度。 | 否 |
| flex | int? | - | 同一行内的弹性因子；为 null 时按固定宽度布局。 | 否 |
| margin | EdgeInsets | EdgeInsets.zero | 外边距。 | 否 |

#### 属性

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| isSpacer | bool | - | 是否是透明间隔块。 | - |

### TSkeletonAnimation

骨架屏动画。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| gradient | TSkeletonAnimation | - | 高亮渐变扫过骨架块。 | - |
| flashed | TSkeletonAnimation | - | 骨架块透明度闪烁。 | - |

### TSkeletonVariant

骨架屏预设形态。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| avatar | TSkeletonVariant | - | 头像占位。 | - |
| image | TSkeletonVariant | - | 图片占位。 | - |
| text | TSkeletonVariant | - | 双行文本占位。 | - |
| paragraph | TSkeletonVariant | - | 四行段落占位。 | - |

### TSkeletonBlockShape

骨架块形状。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| rounded | TSkeletonBlockShape | - | 使用组件主题或 TDesign token 提供的圆角。 | - |
| circle | TSkeletonBlockShape | - | 圆形或胶囊形。 | - |
| rectangle | TSkeletonBlockShape | - | 无圆角矩形。 | - |

### TSkeletonThemeData

骨架屏组件级 ThemeExtension。

仅保存占位块的视觉和布局默认值；动画、延迟与具体布局由实例决定。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| blockColor | Color? | - | 占位块背景色。 未配置时使用 bgColorSecondaryContainer Token。 | 否 |
| borderRadius | double? | - | 普通占位块圆角。 未配置时使用 radiusSmall Token，必须大于或等于 0。 | 否 |
| highlightColor | Color? | - | 渐变动画高亮色。 未配置时使用 bgColorSecondaryContainerActive Token。 | 否 |
| rowSpacing | double? | - | 多行布局的默认行间距。 未配置时使用 spacer2 Token，必须大于或等于 0。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [推荐/慎用示例](#推荐-慎用示例)
3. [相似组件](#相似组件)

### 何时使用

当整个页面需要加载时使用

### 推荐/慎用示例

##### 建议骨架屏的元素构成和排布方式与页面自身保持一致

![](https://tdesign.gtimg.com/site/design/mobile-guide/skeleton/skeleton-1.gif)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/skeleton/skeleton-2.gif)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [加载](<../反馈/Loading 加载.md>) | 当打开新页面或操作完成后，等待加载时使用。 |
