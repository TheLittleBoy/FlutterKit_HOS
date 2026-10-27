# Tag 标签

> 用于表明主体的类目，属性或状态

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/tag)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 基础标签

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SimpleFillTagExample extends StatelessWidget {
  const SimpleFillTagExample({super.key});

  Widget _buildSimpleFillTag(BuildContext context) {
    // 基础填充标签（默认 defaultTheme 语义色）
    return const TTag('标签文字', variant: TTagVariant.light);
  }

  Widget _buildSimpleOutlineTag(BuildContext context) {
    return const TTag('标签文字', variant: TTagVariant.outline);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Builder(builder: _buildSimpleFillTag),
        const SizedBox(width: 16),
        Builder(builder: _buildSimpleOutlineTag),
      ],
    );
  }
}
```

##### 圆弧标签

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CircleFillTagExample extends StatelessWidget {
  const CircleFillTagExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(width: 16),
        TTag('标签文字', shape: TTagShape.round, variant: TTagVariant.light),
        SizedBox(width: 16),
        TTag('标签文字', shape: TTagShape.round, variant: TTagVariant.outline),
        SizedBox(width: 16),
        TTag('标签文字', shape: TTagShape.mark, variant: TTagVariant.outline),
      ],
    );
  }
}
```

##### 带图标的标签

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class IconFillTagExample extends StatelessWidget {
  const IconFillTagExample({super.key});

  Widget _buildIconFillTag(BuildContext context) {
    // 带图标的标签：通过构造器 icon 参数传入 IconData
    return const TTag(
      '标签文字',
      icon: TIcons.discount,
      variant: TTagVariant.light,
    );
  }

  Widget _buildIconOutlineTag(BuildContext context) {
    return const TTag(
      '标签文字',
      icon: TIcons.discount,
      variant: TTagVariant.outline,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Builder(builder: _buildIconFillTag),
        const SizedBox(width: 16),
        Builder(builder: _buildIconOutlineTag),
      ],
    );
  }
}
```

##### 超长省略文本标签

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class LongTextTagExample extends StatelessWidget {
  const LongTextTagExample({super.key});

  Widget _buildLongTextTag(BuildContext context) {
    return Theme(
      data: Theme.of(
        context,
      ).mergeExtension(const TTagThemeData(fixedWidth: 130)),
      child: const TTag('超长省略文本标签超长省略文本标签', variant: TTagVariant.light),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: context.tTheme.spacer2),
        Builder(builder: _buildLongTextTag),
      ],
    );
  }
}
```

##### 可关闭的标签

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CloseFillTagExample extends StatefulWidget {
  const CloseFillTagExample({super.key});

  @override
  State<CloseFillTagExample> createState() => _CloseFillTagExampleState();
}

class _CloseFillTagExampleState extends State<CloseFillTagExample> {
  Widget _buildCloseFillTag(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: _closableTags
          .map(
            (text) => TTag(
              text,
              variant: TTagVariant.light,
              needCloseIcon: true,
              onCloseTap: () => setState(() => _closableTags.remove(text)),
            ),
          )
          .toList(),
    );
  }

  Widget _buildCloseOutlineTag(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: _closableOutlineTags
          .map(
            (text) => TTag(
              text,
              variant: TTagVariant.outline,
              needCloseIcon: true,
              onCloseTap: () =>
                  setState(() => _closableOutlineTags.remove(text)),
            ),
          )
          .toList(),
    );
  }

  final List<String> _closableOutlineTags = ['标签文字'];

  final List<String> _closableTags = ['标签文字'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Builder(builder: _buildCloseFillTag),
        const SizedBox(width: 16),
        Builder(builder: _buildCloseOutlineTag),
      ],
    );
  }
}
```

##### 可选中的标签

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TagSelectVariantsExample extends StatefulWidget {
  const TagSelectVariantsExample({super.key});

  @override
  State<TagSelectVariantsExample> createState() =>
      _TagSelectVariantsExampleState();
}

class _TagSelectVariantsExampleState extends State<TagSelectVariantsExample> {
  final _values = <TTagVariant, List<bool>>{
    TTagVariant.light: [false, true],
    TTagVariant.dark: [false, true],
    TTagVariant.outline: [false, true],
    TTagVariant.lightOutline: [false, true],
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _row('light', TTagVariant.light),
          _row('dark', TTagVariant.dark),
          _row('outline', TTagVariant.outline),
          _row('light-outline', TTagVariant.lightOutline),
        ],
      ),
    );
  }

  Widget _row(String label, TTagVariant variant) {
    final values = _values[variant]!;
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        children: [
          SizedBox(width: 96, child: TText(label)),
          TSelectTag(
            '未选中态',
            value: values[0],
            variant: variant,
            onChanged: (value) => setState(() => values[0] = value),
          ),
          const SizedBox(width: 8),
          TSelectTag(
            '已选中态',
            value: values[1],
            variant: variant,
            onChanged: (value) => setState(() => values[1] = value),
          ),
        ],
      ),
    );
  }
}
```

#### 组件状态

##### 展示型标签

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DarkShowTagsExample extends StatelessWidget {
  const DarkShowTagsExample({super.key});

  Widget _buildDarkShowTags(BuildContext context) {
    // 非浅色填充各主题
    return const Wrap(
      spacing: 8,
      children: [
        TTag('默认', colorPreset: TTagColorPreset.defaultTheme),
        TTag('主要', colorPreset: TTagColorPreset.primary),
        TTag('警告', colorPreset: TTagColorPreset.warning),
        TTag('危险', colorPreset: TTagColorPreset.danger),
        TTag('成功', colorPreset: TTagColorPreset.success),
      ],
    );
  }

  Widget _buildLightShowTags(BuildContext context) {
    // 浅色填充各主题
    return const Wrap(
      spacing: 8,
      children: [
        TTag(
          '默认',
          colorPreset: TTagColorPreset.defaultTheme,
          variant: TTagVariant.light,
        ),
        TTag(
          '主要',
          colorPreset: TTagColorPreset.primary,
          variant: TTagVariant.light,
        ),
        TTag(
          '警告',
          colorPreset: TTagColorPreset.warning,
          variant: TTagVariant.light,
        ),
        TTag(
          '危险',
          colorPreset: TTagColorPreset.danger,
          variant: TTagVariant.light,
        ),
        TTag(
          '成功',
          colorPreset: TTagColorPreset.success,
          variant: TTagVariant.light,
        ),
      ],
    );
  }

  Widget _buildOutlineShowTags(BuildContext context) {
    return const Wrap(
      spacing: 8,
      children: [
        TTag(
          '默认',
          colorPreset: TTagColorPreset.defaultTheme,
          variant: TTagVariant.outline,
        ),
        TTag(
          '主要',
          colorPreset: TTagColorPreset.primary,
          variant: TTagVariant.outline,
        ),
        TTag(
          '警告',
          colorPreset: TTagColorPreset.warning,
          variant: TTagVariant.outline,
        ),
        TTag(
          '危险',
          colorPreset: TTagColorPreset.danger,
          variant: TTagVariant.outline,
        ),
        TTag(
          '成功',
          colorPreset: TTagColorPreset.success,
          variant: TTagVariant.outline,
        ),
      ],
    );
  }

  Widget _buildLightOutlineShowTags(BuildContext context) {
    return const Wrap(
      spacing: 8,
      children: [
        TTag(
          '默认',
          colorPreset: TTagColorPreset.defaultTheme,
          variant: TTagVariant.lightOutline,
        ),
        TTag(
          '主要',
          colorPreset: TTagColorPreset.primary,
          variant: TTagVariant.lightOutline,
        ),
        TTag(
          '警告',
          colorPreset: TTagColorPreset.warning,
          variant: TTagVariant.lightOutline,
        ),
        TTag(
          '危险',
          colorPreset: TTagColorPreset.danger,
          variant: TTagVariant.lightOutline,
        ),
        TTag(
          '成功',
          colorPreset: TTagColorPreset.success,
          variant: TTagVariant.lightOutline,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 16),
      child: Wrap(
        spacing: 24,
        runSpacing: 8,
        direction: Axis.vertical,
        children: [
          Builder(builder: _buildLightShowTags),
          Builder(builder: _buildDarkShowTags),
          Builder(builder: _buildOutlineShowTags),
          Builder(builder: _buildLightOutlineShowTags),
        ],
      ),
    );
  }
}
```

#### 组件尺寸

##### `AllSizeTagsExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class AllSizeTagsExample extends StatelessWidget {
  const AllSizeTagsExample({super.key});

  Widget _buildAllSizeTags(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          children: [
            TTag('加大尺寸', size: TTagSize.extraLarge, variant: TTagVariant.light),
            TTag('大尺寸', size: TTagSize.large, variant: TTagVariant.light),
            TTag('中尺寸', size: TTagSize.medium, variant: TTagVariant.light),
            TTag('小尺寸', size: TTagSize.small, variant: TTagVariant.light),
          ],
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 8,
          children: [
            TTag(
              '加大尺寸',
              size: TTagSize.extraLarge,
              variant: TTagVariant.light,
              needCloseIcon: true,
            ),
            TTag(
              '大尺寸',
              size: TTagSize.large,
              variant: TTagVariant.light,
              needCloseIcon: true,
            ),
            TTag(
              '中尺寸',
              size: TTagSize.medium,
              variant: TTagVariant.light,
              needCloseIcon: true,
            ),
            TTag(
              '小尺寸',
              size: TTagSize.small,
              variant: TTagVariant.light,
              needCloseIcon: true,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 16),
      child: Builder(builder: _buildAllSizeTags),
    );
  }
}
```

## API

1. [TTag](#ttag)
2. [TSelectTag](#tselecttag)
3. [TTagColorPreset](#ttagcolorpreset)
4. [TTagSize](#ttagsize)
5. [TTagShape](#ttagshape)
6. [TTagVariant](#ttagvariant)
7. [TTagThemeData](#ttagthemedata)

### TTag

#### 构造方法

##### TTag

位置参数：`text`

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| text | String | - | 标签内容 | 是 |
| colorPreset | TTagColorPreset | TTagColorPreset.defaultTheme | 标签预设配色。 | 否 |
| enabled | bool | true | 是否启用标签；false 时使用禁用样式并阻止标签点击与关闭图标回调。 | 否 |
| icon | IconData? | - | 前置图标，颜色与正文共用解析后的前景色；关闭图标使用独立颜色。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| needCloseIcon | bool | false | 是否显示关闭图标。 | 否 |
| onCloseTap | GestureTapCallback? | - | 关闭图标点击事件。 标签本身不持有列表状态；需要移除标签时，请在此回调中更新父组件的 数据源并触发重建。 | 否 |
| onTap | GestureTapCallback? | - | 标签点击回调；为空时不创建标签点击行为。 | 否 |
| shape | TTagShape | TTagShape.square | 标签外形；仅选择形状，具体圆角值由组件 Theme 或全局 Token 决定。 | 否 |
| size | TTagSize | TTagSize.medium | 标签大小 | 否 |
| variant | TTagVariant | TTagVariant.dark | 绘制形态。 | 否 |

### TSelectTag

严格受控的可选标签。

#### 构造方法

##### TSelectTag

位置参数：`text`

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| text | String | - | 标签内容。 | 是 |
| colorPreset | TTagColorPreset | TTagColorPreset.primary | 选中态预设配色。 | 否 |
| icon | IconData? | - | 标签图标。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| onChanged | ValueChanged<bool>? | - | 选中状态变更回调；为空时禁用交互。 | 否 |
| shape | TTagShape | TTagShape.square | 标签外形；具体圆角值由组件 Theme 或全局 Token 决定。 | 否 |
| size | TTagSize | TTagSize.medium | 标签尺寸。 | 否 |
| value | bool | - | 当前选中状态。 | 是 |
| variant | TTagVariant | TTagVariant.dark | 标签绘制形态。 | 否 |

### TTagColorPreset

标签内置配色预设；绘制形态由 `TTagVariant` 单独选择。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| defaultTheme | TTagColorPreset | - | 默认中性色。 | - |
| primary | TTagColorPreset | - | 品牌主色。 | - |
| warning | TTagColorPreset | - | 警告色。 | - |
| danger | TTagColorPreset | - | 危险色。 | - |
| success | TTagColorPreset | - | 成功色。 | - |

### TTagSize

标签尺寸。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| extraLarge | TTagSize | - | 超大尺寸。 | - |
| large | TTagSize | - | 大尺寸。 | - |
| medium | TTagSize | - | 中等尺寸。 | - |
| small | TTagSize | - | 小尺寸。 | - |
| custom | TTagSize | - | 由 Theme padding 和字体决定尺寸。 | - |

### TTagShape

标签形状。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| square | TTagShape | - | 小圆角矩形。 | - |
| round | TTagShape | - | 胶囊形。 | - |
| mark | TTagShape | - | 右侧胶囊标记形。 | - |

### TTagVariant

标签绘制形态。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| dark | TTagVariant | - | 深色填充。 | - |
| light | TTagVariant | - | 浅色填充。 | - |
| outline | TTagVariant | - | 描边。 | - |
| lightOutline | TTagVariant | - | 浅色描边。 | - |

### TTagThemeData

标签组件级 ThemeExtension

通过 Theme 子树注入，控制子树的默认样式。
具体视觉值由组件 Theme 控制，未指定时回退全局 Token 或文档化的组件规格。

分档间距示例（统一 padding 配置优先）：

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 所有启用 Tag 的统一背景色；优先于各配色预设的填充色。 | 否 |
| dangerColor | Color? | - | danger 预设的基础色；未设置时回退全局 errorColor。 | 否 |
| extraLargePadding | EdgeInsets? | - | 超大尺寸标签的边框以内间距；统一 padding 配置优先。 未设置时保持当前默认：横向 max(16 - 实际边框宽, 0)dp， 纵向 max(9 - 实际边框宽, 0)dp。显式值不会再次扣减边框。 | 否 |
| fixedWidth | double? | - | 标签固定宽度 | 否 |
| font | Font? | - | 字体尺寸和行高；未设置时随标签尺寸使用对应的全局字体 Token。 | 否 |
| largePadding | EdgeInsets? | - | 大尺寸标签的边框以内间距；统一 padding 配置优先。 未设置时保持当前默认：横向 max(8 - 实际边框宽, 0)dp， 纵向 max(3 - 实际边框宽, 0)dp。显式值不会再次扣减边框。 | 否 |
| maxLines | int? | - | 文字最大行数。 未设置时组件默认按紧凑标签语义使用单行。 | 否 |
| mediumPadding | EdgeInsets? | - | 中尺寸标签的边框以内间距；统一 padding 配置优先。 未设置时保持当前默认：横向 max(8 - 实际边框宽, 0)dp， 纵向 max(2 - 实际边框宽, 0)dp。显式值不会再次扣减边框。 | 否 |
| overflow | TextOverflow? | - | 文字溢出处理 | 否 |
| padding | EdgeInsets? | - | 所有尺寸统一的边框以内间距，优先于分档 padding；不会再次扣减边框。 未设置时使用当前尺寸的分档配置或内置默认值。 | 否 |
| smallPadding | EdgeInsets? | - | 小尺寸标签的边框以内间距；统一 padding 配置优先。 未设置时保持当前默认：横向 max(6 - 实际边框宽, 0)dp， 纵向 max(2 - 实际边框宽, 0)dp。显式值不会再次扣减边框。 | 否 |
| squareBorderRadius | double? | - | 方形标签圆角，单位为逻辑像素；未设置时所有尺寸均读取全局 `radiusSmall`（当前默认 3dp）。 | 否 |
| successColor | Color? | - | success 预设的基础色；未设置时回退全局 successColor。 | 否 |
| successLightColor | Color? | - | success 预设的浅色填充；未设置时回退全局 successColor1。 | 否 |
| textColor | Color? | - | 所有启用 Tag 的正文和前置图标颜色；优先于配色预设的全局 Token。 禁用态不受此字段影响，关闭图标继续使用独立的占位色 Token。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

### 何时使用

当需要展示内容本身的属性、状态、类别、营销情况时作为纯展示使用；或者当大量的内容数据需要根据类型进行选择筛选时使用。

### 组件搭配使用

##### 与[图片](<Image 图片.md>)组合使用，图片作为内容、商品等对象的详情入口时，可通过添加标签来展示该对象的属性、状态、类别、营销情况等。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tag/tag-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tag/tag-2.png)

---

##### 与[下拉菜单](<../反馈/DropdownMenu 下拉菜单.md>)组合使用，作为菜单面板下拉后的选项，供用户进行选择。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tag/tag-3.png)

### 常见用法

##### 常用于展示对象本身的属性、状态、类别、营销情况等信息，且仅作为展示使用。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tag/tag-4.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tag/tag-5.png)

---

##### 常用于内容数据基于某个维度或某些维度的检索、筛选。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tag/tag-6.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tag/tag-7.png)

### 推荐/慎用示例

##### 标签颜色和字体颜色在明度、色相上要避免难以区分，保证标签的可读性。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tag/tag-8.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 标签文案需要经过概括和提炼，不建议过长。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tag/tag-9.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [徽标](<Badge 徽标.md>) | 当需要展示特定对象的状态变化或承载运营性质提示时使用。 |
