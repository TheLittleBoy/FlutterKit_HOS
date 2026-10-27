# Button 按钮

> 用于开启一个闭环的操作任务，如“删除”对象、“购买”商品等。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/button)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 基础按钮

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PrimaryFillButtonExample extends StatelessWidget {
  const PrimaryFillButtonExample({super.key});
  TButton _buildPrimaryFillButton(BuildContext context) {
    return TButton(
      child: const Text('填充按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.primary,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildLightFillButton(BuildContext context) {
    return TButton(
      child: const Text('填充按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.light,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildDefaultFillButton(BuildContext context) {
    return TButton(
      child: const Text('填充按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.defaultTheme,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildPrimaryStrokeButton(BuildContext context) {
    return TButton(
      child: const Text('描边按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.outline,
      colorPreset: TButtonColorPreset.primary,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildPrimaryTextButton(BuildContext context) {
    return TButton(
      child: const Text('文字按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.text,
      colorPreset: TButtonColorPreset.primary,
      onPressed: () => _onTap(context),
    );
  }

  void _onTap(BuildContext context) {
    TToast.showText('点击了按钮', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 16),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          Builder(builder: _buildPrimaryFillButton),
          Builder(builder: _buildLightFillButton),
          Builder(builder: _buildDefaultFillButton),
          Builder(builder: _buildPrimaryStrokeButton),
          Builder(builder: _buildPrimaryTextButton),
        ],
      ),
    );
  }
}
```

##### 图标按钮

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class RectangleIconButtonExample extends StatelessWidget {
  const RectangleIconButtonExample({super.key});
  TButton _buildRectangleIconButton(BuildContext context) {
    return TButton(
      child: const Text('填充按钮'),
      icon: const Icon(TIcons.app),
      size: TButtonSize.large,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.primary,
      onPressed: () => _onTap(context),
    );
  }

  Widget _buildSquareIconButton(BuildContext context) {
    return TButton(
      shape: TButtonShape.square,
      icon: const Icon(TIcons.app),
      size: TButtonSize.large,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.primary,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildLoadingIconButton(BuildContext context) {
    return TButton(
      child: const Text('加载中'),
      icon: const TLoading(size: 24, icon: TLoadingIcon.circle),
      size: TButtonSize.large,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.primary,
      onPressed: () => _onTap(context),
    );
  }

  void _onTap(BuildContext context) {
    TToast.showText('点击了按钮', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          Builder(builder: _buildRectangleIconButton),
          Builder(builder: _buildSquareIconButton),
          Builder(builder: _buildLoadingIconButton),
        ],
      ),
    );
  }
}
```

##### 幽灵按钮

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PrimaryGhostButtonExample extends StatelessWidget {
  const PrimaryGhostButtonExample({super.key});
  TButton _buildPrimaryGhostButton(BuildContext context) {
    return TButton(
      child: const Text('幽灵按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.ghost,
      colorPreset: TButtonColorPreset.primary,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildDangerGhostButton(BuildContext context) {
    return TButton(
      child: const Text('幽灵按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.ghost,
      colorPreset: TButtonColorPreset.danger,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildDefaultGhostButton(BuildContext context) {
    return TButton(
      child: const Text('幽灵按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.ghost,
      colorPreset: TButtonColorPreset.defaultTheme,
      onPressed: () => _onTap(context),
    );
  }

  void _onTap(BuildContext context) {
    TToast.showText('点击了按钮', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.center,
      color: context.tTheme.grayColor14,
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          Builder(builder: _buildPrimaryGhostButton),
          Builder(builder: _buildDangerGhostButton),
          Builder(builder: _buildDefaultGhostButton),
        ],
      ),
    );
  }
}
```

##### 组合按钮

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CombinationButtonsExample extends StatelessWidget {
  const CombinationButtonsExample({super.key});
  Widget _buildCombinationButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: TButton(
              child: const Text('填充按钮'),
              size: TButtonSize.large,
              variant: TButtonVariant.fill,
              colorPreset: TButtonColorPreset.light,
              onPressed: () => _onTap(context),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TButton(
              child: const Text('填充按钮'),
              size: TButtonSize.large,
              variant: TButtonVariant.fill,
              colorPreset: TButtonColorPreset.primary,
              onPressed: () => _onTap(context),
            ),
          ),
        ],
      ),
    );
  }

  void _onTap(BuildContext context) {
    TToast.showText('点击了按钮', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: _buildCombinationButtons);
  }
}
```

##### 通栏按钮

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class BlockFillButtonExample extends StatelessWidget {
  const BlockFillButtonExample({super.key});
  Widget _buildBlockFillButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: TButton(
          child: const Text('填充按钮'),
          size: TButtonSize.large,
          variant: TButtonVariant.fill,
          colorPreset: TButtonColorPreset.primary,
          onPressed: () => _onTap(context),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    TToast.showText('点击了按钮', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBlockFillButton(context);
  }
}
```

#### 组件状态

##### 按钮禁用态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DisablePrimaryFillButtonExample extends StatelessWidget {
  const DisablePrimaryFillButtonExample({super.key});

  TButton _buildDisablePrimaryFillButton(BuildContext context) {
    return const TButton(
      child: Text('填充按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.primary,
      onPressed: null,
    );
  }

  TButton _buildDisableLightFillButton(BuildContext context) {
    return const TButton(
      child: Text('填充按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.light,
      onPressed: null,
    );
  }

  TButton _buildDisableDefaultFillButton(BuildContext context) {
    return const TButton(
      child: Text('填充按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.defaultTheme,
      onPressed: null,
    );
  }

  TButton _buildDisablePrimaryStrokeButton(BuildContext context) {
    return const TButton(
      child: Text('描边按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.outline,
      colorPreset: TButtonColorPreset.primary,
      onPressed: null,
    );
  }

  TButton _buildDisablePrimaryTextButton(BuildContext context) {
    return const TButton(
      child: Text('文字按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.text,
      colorPreset: TButtonColorPreset.primary,
      onPressed: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          Builder(builder: _buildDisablePrimaryFillButton),
          Builder(builder: _buildDisableLightFillButton),
          Builder(builder: _buildDisableDefaultFillButton),
          Builder(builder: _buildDisablePrimaryStrokeButton),
          Builder(builder: _buildDisablePrimaryTextButton),
        ],
      ),
    );
  }
}
```

#### 组件样式

##### 按钮尺寸

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class LargeButtonExample extends StatelessWidget {
  const LargeButtonExample({super.key});
  TButton _buildLargeButton(BuildContext context) {
    return TButton(
      child: const Text('按钮48'),
      size: TButtonSize.large,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.primary,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildMediumButton(BuildContext context) {
    return TButton(
      child: const Text('按钮40'),
      size: TButtonSize.medium,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.primary,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildSmallButton(BuildContext context) {
    return TButton(
      child: const Text('按钮32'),
      size: TButtonSize.small,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.primary,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildExtraSmallButton(BuildContext context) {
    return TButton(
      child: const Text('按钮28'),
      size: TButtonSize.extraSmall,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.primary,
      onPressed: () => _onTap(context),
    );
  }

  void _onTap(BuildContext context) {
    TToast.showText('点击了按钮', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 12,
        runSpacing: 16,
        children: [
          Builder(builder: _buildLargeButton),
          Builder(builder: _buildMediumButton),
          Builder(builder: _buildSmallButton),
          Builder(builder: _buildExtraSmallButton),
        ],
      ),
    );
  }
}
```

##### 按钮形状

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class RectangleShapeButtonExample extends StatelessWidget {
  const RectangleShapeButtonExample({super.key});
  Widget _buildRectangleShapeButton(BuildContext context) {
    return TButton(
      shape: TButtonShape.rectangle,
      child: const Text('填充按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.primary,
      onPressed: () => _onTap(context),
    );
  }

  Widget _buildSquareIconButton(BuildContext context) {
    return TButton(
      shape: TButtonShape.square,
      icon: const Icon(TIcons.app),
      size: TButtonSize.large,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.primary,
      onPressed: () => _onTap(context),
    );
  }

  Widget _buildRoundButton(BuildContext context) {
    return TButton(
      shape: TButtonShape.round,
      child: const Text('填充按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.primary,
      onPressed: () => _onTap(context),
    );
  }

  Widget _buildCircleButton(BuildContext context) {
    return TButton(
      shape: TButtonShape.circle,
      icon: const Icon(TIcons.app),
      size: TButtonSize.large,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.primary,
      onPressed: () => _onTap(context),
    );
  }

  Widget _buildBlockShapeButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: const Text('填充按钮'),
        size: TButtonSize.large,
        variant: TButtonVariant.fill,
        colorPreset: TButtonColorPreset.primary,
        style: const ButtonStyle(
          shape: WidgetStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
        ),
        onPressed: () => _onTap(context),
      ),
    );
  }

  void _onTap(BuildContext context) {
    TToast.showText('点击了按钮', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            spacing: 12,
            runSpacing: 16,
            children: [
              Builder(builder: _buildRectangleShapeButton),
              Builder(builder: _buildSquareIconButton),
              Builder(builder: _buildRoundButton),
              Builder(builder: _buildCircleButton),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Builder(builder: _buildBlockShapeButton),
      ],
    );
  }
}
```

##### 按钮主题

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DefaultFillButtonExample extends StatelessWidget {
  const DefaultFillButtonExample({super.key});
  TButton _buildDefaultFillButton(BuildContext context) {
    return TButton(
      child: const Text('填充按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.defaultTheme,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildDefaultStrokeButton(BuildContext context) {
    return TButton(
      child: const Text('描边按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.outline,
      colorPreset: TButtonColorPreset.defaultTheme,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildDefaultTextButton(BuildContext context) {
    return TButton(
      child: const Text('文字按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.text,
      colorPreset: TButtonColorPreset.defaultTheme,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildPrimaryFillButton(BuildContext context) {
    return TButton(
      child: const Text('填充按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.primary,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildPrimaryStrokeButton(BuildContext context) {
    return TButton(
      child: const Text('描边按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.outline,
      colorPreset: TButtonColorPreset.primary,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildPrimaryTextButton(BuildContext context) {
    return TButton(
      child: const Text('文字按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.text,
      colorPreset: TButtonColorPreset.primary,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildDangerFillButton(BuildContext context) {
    return TButton(
      child: const Text('填充按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.danger,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildDangerStrokeButton(BuildContext context) {
    return TButton(
      child: const Text('描边按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.outline,
      colorPreset: TButtonColorPreset.danger,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildDangerTextButton(BuildContext context) {
    return TButton(
      child: const Text('文字按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.text,
      colorPreset: TButtonColorPreset.danger,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildLightFillButton(BuildContext context) {
    return TButton(
      child: const Text('填充按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.fill,
      colorPreset: TButtonColorPreset.light,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildLightStrokeButton(BuildContext context) {
    return TButton(
      child: const Text('描边按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.outline,
      colorPreset: TButtonColorPreset.light,
      onPressed: () => _onTap(context),
    );
  }

  TButton _buildLightTextButton(BuildContext context) {
    return TButton(
      child: const Text('文字按钮'),
      size: TButtonSize.large,
      variant: TButtonVariant.text,
      colorPreset: TButtonColorPreset.light,
      onPressed: () => _onTap(context),
    );
  }

  void _onTap(BuildContext context) {
    TToast.showText('点击了按钮', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16,
      runSpacing: 16,
      children: [
        Builder(builder: _buildDefaultFillButton),
        Builder(builder: _buildDefaultStrokeButton),
        Builder(builder: _buildDefaultTextButton),
        Builder(builder: _buildPrimaryFillButton),
        Builder(builder: _buildPrimaryStrokeButton),
        Builder(builder: _buildPrimaryTextButton),
        Builder(builder: _buildDangerFillButton),
        Builder(builder: _buildDangerStrokeButton),
        Builder(builder: _buildDangerTextButton),
        Builder(builder: _buildLightFillButton),
        Builder(builder: _buildLightStrokeButton),
        Builder(builder: _buildLightTextButton),
      ],
    );
  }
}
```

## API

1. [TButton](#tbutton)
2. [TButtonColorPreset](#tbuttoncolorpreset)
3. [TButtonSize](#tbuttonsize)
4. [TButtonVariant](#tbuttonvariant)
5. [TButtonIconPosition](#tbuttoniconposition)
6. [TButtonShape](#tbuttonshape)
7. [TButtonThemeData](#tbuttonthemedata)

### TButton

#### 构造方法

##### TButton

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| child | Widget? | - | 内容（纯文案用 `Text('...')`） | 否 |
| colorPreset | TButtonColorPreset? | - | 内置配色预设；未传时使用 `TButtonColorPreset.defaultTheme`。 不改变 `variant` 的绘制方式，仅选择 TD 默认色板； 当前按钮的具体颜色、边框和文字样式通过 `style` 配置。 | 否 |
| icon | Widget? | - | 图标（Widget 类型，IconData 需包裹为 `Icon(...)`） | 否 |
| iconPosition | TButtonIconPosition | TButtonIconPosition.left | 图标位置 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| onLongPress | VoidCallback? | - | 长按回调。 仅在 `onPressed` 非空时生效；当 `onPressed` 为空时按钮保持禁用态， 不会触发点击或长按回调。 | 否 |
| onPressed | VoidCallback? | - | 点击回调，`null` 表示禁用 | 否 |
| shape | TButtonShape | TButtonShape.rectangle | 按钮结构形状；纯图标的 square/circle 同时决定等宽高布局。 具体边框及圆角仍可通过 `style` 配置。 | 否 |
| size | TButtonSize? | - | 尺寸，未传时使用 `TButtonSize.medium`。 默认按 48、40、32、28dp 的 TDesign 视觉高度参与布局。 | 否 |
| style | ButtonStyle? | - | 当前按钮的完整 `ButtonStyle` 视觉配置入口，不影响其他按钮。 外部 Material 按钮主题不控制内置样式；请通过此实例 style 或 TD Theme 定制。 `ButtonStyle.visualDensity` 不生效；内置布局始终使用标准密度， 尺寸由 `size` 规格、全局尺寸刻度与显式内边距、宽高配置决定。 反馈和鼠标指针仅由实例 style、TD Theme 或内置默认值控制。 状态属性返回 null 时回退该状态的 TD 默认值；不读取 Material 按钮主题。 调用方内容仍继承原主题。 组件默认使用 `MaterialTapTargetSize.shrinkWrap` 保持 TDesign 精确尺寸； 需要至少 48dp 点击区时可将 `ButtonStyle.tapTargetSize` 设为 `MaterialTapTargetSize.padded`。 | 否 |
| variant | TButtonVariant? | - | 变体（fill / outline / text / ghost），未传时使用 `TButtonVariant.fill`。 | 否 |

### TButtonColorPreset

按钮内置配色预设，不是 Material ColorScheme。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| defaultTheme | TButtonColorPreset | - | 默认配色 | - |
| primary | TButtonColorPreset | - | 品牌主色 | - |
| danger | TButtonColorPreset | - | 危险操作配色 | - |
| light | TButtonColorPreset | - | 浅色品牌配色；不改变填充/描边等 `TButtonVariant` 绘制方式。 | - |

### TButtonSize

按钮尺寸

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| large | TButtonSize | - | 大尺寸按钮 | - |
| medium | TButtonSize | - | 中尺寸按钮 | - |
| small | TButtonSize | - | 小尺寸按钮 | - |
| extraSmall | TButtonSize | - | 超小尺寸按钮 | - |

### TButtonVariant

按钮变体（fill / outline / text / ghost）

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| fill | TButtonVariant | - | 填充按钮 | - |
| outline | TButtonVariant | - | 描边按钮 | - |
| text | TButtonVariant | - | 文字按钮 | - |
| ghost | TButtonVariant | - | 幽灵按钮 | - |

### TButtonIconPosition

图标位置

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| left | TButtonIconPosition | - | 图标在文本左侧 | - |
| right | TButtonIconPosition | - | 图标在文本右侧 | - |

### TButtonShape

按钮形状

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| rectangle | TButtonShape | - | 矩形按钮 | - |
| round | TButtonShape | - | 圆角按钮 | - |
| square | TButtonShape | - | 纯图标场景保持等宽高和默认圆角；图文内容不会被裁剪。 | - |
| circle | TButtonShape | - | 圆形按钮 | - |

### TButtonThemeData

TButton 组件级 ThemeExtension

承载按钮子树的分档图标默认值、图文间距与渐变。
实例 ButtonStyle 的显式字段优先于对应组件默认值。

分档默认值示例（实例 style 仍可覆盖）：

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| extraSmallIconSize | double? | - | 超小尺寸按钮的图标大小，单位为逻辑像素。 未设置时使用独立默认 18dp；实例 ButtonStyle.iconSize 优先。 必须是有限非负数；仅改变内置图标及纯图标按钮的默认居中间距，不改变按钮高度。 | 否 |
| gradient | Gradient? | - | 渐变背景色（装饰层，非 ButtonStyle 字段） | 否 |
| iconTextSpacing | double? | - | 图标与文案之间的间距，单位为逻辑像素。 仅在按钮同时提供 icon 和 child 时生效；该值控制两者 之间的实际间隔，不会改变按钮整体内边距。为空时使用组件内置 默认值 4dp；全局 `spacer4` 对应 32dp，不用于此间距。 | 否 |
| largeIconSize | double? | - | 大尺寸按钮的图标大小，单位为逻辑像素。 未设置时使用 size8（默认 24dp）；实例 ButtonStyle.iconSize 优先。 必须是有限非负数；仅改变内置图标及纯图标按钮的默认居中间距，不改变按钮高度。 | 否 |
| mediumIconSize | double? | - | 中尺寸按钮的图标大小，单位为逻辑像素。 未设置时使用 size7（默认 20dp）；实例 ButtonStyle.iconSize 优先。 必须是有限非负数；仅改变内置图标及纯图标按钮的默认居中间距，不改变按钮高度。 | 否 |
| smallIconSize | double? | - | 小尺寸按钮的图标大小，单位为逻辑像素。 未设置时使用独立默认 18dp；实例 ButtonStyle.iconSize 优先。 必须是有限非负数；仅改变内置图标及纯图标按钮的默认居中间距，不改变按钮高度。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

### 何时使用

当前流程的结束或新流程的开启需要用户点击触发时使用。

### 组件搭配使用

##### 图标按钮与[输入框](<../输入/Input 输入框.md>)组合使用，放置于输入单元格最右侧，用于触发拉起一个新的支流任务，辅助用户填入正确内容。

![](https://tdesign.gtimg.com/site/design/mobile-guide/button/button-1.png)

---

##### 不同类型的主次按钮与文字按钮组合使用，可以表达不同强调级别。

![](https://tdesign.gtimg.com/site/design/mobile-guide/button/button-2.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/button/button-3.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/button/button-4.png)

### 常见用法

##### 当在填写场景，按钮通常作为当前流程的结束操作，在表单过长时通常需要吸顶或吸底处理。

![](https://tdesign.gtimg.com/site/design/mobile-guide/button/button-5.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/button/button-6.png)

### 推荐/慎用示例

##### 用户在使用主、次按钮时，需要表达主次关系，突出强调的最主要操作，其他操作使用次按钮，不建议同时使用多个主按钮。

![](https://tdesign.gtimg.com/site/design/mobile-guide/button/button-7.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/button/button-8.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [链接](<Link 链接.md>) | 当需要外链跳转或页面底部footer链接跳转时使用。 |
