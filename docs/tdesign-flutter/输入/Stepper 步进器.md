# Stepper 步进器

> 用于数量的增减。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/stepper)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 基础步进器

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// 在已配置 TDesign 主题的应用中使用 `StepperBaseExample()`。
class StepperBaseExample extends StatefulWidget {
  const StepperBaseExample({super.key});

  @override
  State<StepperBaseExample> createState() => _StepperBaseExampleState();
}

class _StepperBaseExampleState extends State<StepperBaseExample> {
  num _base = 3;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.tTheme.bgColorContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TStepper(
              key: const ValueKey('stepper-base'),
              value: _base,
              variant: TStepperVariant.filled,
              onChanged: (value) => setState(() => _base = value),
            ),
          ],
        ),
      ),
    );
  }
}
```

#### 组件状态

##### 最大最小状态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// 在已配置 TDesign 主题的应用中使用 `StepperBoundsExample()`。
class StepperBoundsExample extends StatefulWidget {
  const StepperBoundsExample({super.key});

  @override
  State<StepperBoundsExample> createState() => _StepperBoundsExampleState();
}

class _StepperBoundsExampleState extends State<StepperBoundsExample> {
  num _minimum = 0;
  num _maximum = 999;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.tTheme.bgColorContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TStepper(
              key: const ValueKey('stepper-minimum'),
              value: _minimum,
              variant: TStepperVariant.filled,
              onChanged: (value) => setState(() => _minimum = value),
            ),
            const SizedBox(width: 32),
            TStepper(
              key: const ValueKey('stepper-maximum'),
              value: _maximum,
              max: 999,
              variant: TStepperVariant.filled,
              onChanged: (value) => setState(() => _maximum = value),
            ),
          ],
        ),
      ),
    );
  }
}
```

##### 禁用状态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// 在已配置 TDesign 主题的应用中使用 `StepperDisabledExample()`。
class StepperDisabledExample extends StatelessWidget {
  const StepperDisabledExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.tTheme.bgColorContainer,
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TStepper(
              key: ValueKey('stepper-disabled'),
              value: 0,
              variant: TStepperVariant.filled,
            ),
          ],
        ),
      ),
    );
  }
}
```

#### 组件样式

##### 步进器样式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// 在已配置 TDesign 主题的应用中使用 `StepperVariantsExample()`。
class StepperVariantsExample extends StatefulWidget {
  const StepperVariantsExample({super.key});

  @override
  State<StepperVariantsExample> createState() => _StepperVariantsExampleState();
}

class _StepperVariantsExampleState extends State<StepperVariantsExample> {
  num _filled = 3;
  num _outline = 3;
  num _normal = 3;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.tTheme.bgColorContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TStepper(
              key: const ValueKey('stepper-variants'),
              value: _filled,
              variant: TStepperVariant.filled,
              onChanged: (value) => setState(() => _filled = value),
            ),
            TStepper(
              key: const ValueKey('stepper-outline'),
              value: _outline,
              variant: TStepperVariant.outline,
              onChanged: (value) => setState(() => _outline = value),
            ),
            TStepper(
              key: const ValueKey('stepper-normal'),
              value: _normal,
              variant: TStepperVariant.normal,
              onChanged: (value) => setState(() => _normal = value),
            ),
          ],
        ),
      ),
    );
  }
}
```

##### 步进器尺寸

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// 在已配置 TDesign 主题的应用中使用 `StepperSizesExample()`。
class StepperSizesExample extends StatefulWidget {
  const StepperSizesExample({super.key});

  @override
  State<StepperSizesExample> createState() => _StepperSizesExampleState();
}

class _StepperSizesExampleState extends State<StepperSizesExample> {
  num _large = 3;
  num _medium = 3;
  num _small = 3;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.tTheme.bgColorContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TStepper(
              key: const ValueKey('stepper-sizes'),
              value: _large,
              size: TStepperSize.large,
              variant: TStepperVariant.filled,
              onChanged: (value) => setState(() => _large = value),
            ),
            TStepper(
              key: const ValueKey('stepper-medium'),
              value: _medium,
              size: TStepperSize.medium,
              variant: TStepperVariant.filled,
              onChanged: (value) => setState(() => _medium = value),
            ),
            TStepper(
              key: const ValueKey('stepper-small'),
              value: _small,
              size: TStepperSize.small,
              variant: TStepperVariant.filled,
              onChanged: (value) => setState(() => _small = value),
            ),
          ],
        ),
      ),
    );
  }
}
```

## API

1. [TStepper](#tstepper)
2. [TStepperSize](#tsteppersize)
3. [TStepperVariant](#tsteppervariant)
4. [TStepperThemeData](#tstepperthemedata)

### TStepper

#### 构造方法

##### TStepper

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| max | num | 100 | 最大值，必须大于或等于 `min`。 | 否 |
| min | num | 0 | 最小值，必须小于或等于 `max`。 | 否 |
| onChanged | ValueChanged<num>? | - | 数值变化请求。 点击按钮、提交有效输入或输入框失焦时触发；一次操作最多触发一次。 为 null 时加减按钮禁用、编辑器只读；不发出数值变化请求。 | 否 |
| size | TStepperSize? | - | 组件尺寸。 为空时以 `TStepperSize.medium` 为最小尺寸，内置文字放大时可增长；显式 size 保持固定。 | 否 |
| step | num | 1 | 加减按钮使用的步长，必须大于 0。 输入提交不要求是步长的整数倍，但会限制在 `min` 与 `max` 之间。 编辑时以合法输入草稿作为步进起点，并据此判断按钮是否达到边界。 | 否 |
| value | num | - | 唯一受控数值，必须位于 `min` 与 `max` 之间。 父组件需要在 `onChanged` 后以新值重建组件，否则输入内容会恢复。 | 是 |
| variant | TStepperVariant? | - | 组件形态。 为空时使用 `TStepperVariant.normal`。 | 否 |

### TStepperSize

步进器尺寸。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| small | TStepperSize | - | 小尺寸：控件高度 20，输入段宽度 34，图标尺寸 12。 | - |
| medium | TStepperSize | - | 中尺寸：控件高度 24，输入段宽度 38，图标尺寸 16。 这是默认尺寸。 | - |
| large | TStepperSize | - | 大尺寸：控件高度 26，输入段宽度 45，图标尺寸 20。 | - |

### TStepperVariant

步进器形态。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| normal | TStepperVariant | - | 透明分段形态，段间默认保留 4px 间距。 这是默认形态。 | - |
| filled | TStepperVariant | - | 填充分段形态，三段使用背景色并保留默认 4px 间距。 | - |
| outline | TStepperVariant | - | 连续描边形态，三段之间不保留间距。 | - |

### TStepperThemeData

`TStepper` 的组件级主题。

通过 `ThemeData.extensions` 或 `ThemeData.mergeExtension` 注入。实例参数
优先于此主题；未设置的文字字段使用全局 TDesign Token，图标及输入装饰
仍按各自 Flutter 主题解析。

主题过渡保留未指定字段的继承语义，由组件结合当前实例尺寸与主题解析；
两端均未指定的字段仍为 null，端点返回原始配置。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | filled 形态各段的背景色。 null 时使用 bgColorSecondaryContainer Token。 | 否 |
| borderColor | Color? | - | outline 形态的描边颜色。 null 时使用 componentBorder Token。 | 否 |
| borderRadius | BorderRadius? | - | 分段圆角，默认使用 TDesign `radiusSmall`。 normal 和 filled 应用于每一段；outline 仅保留整组外侧圆角。 | 否 |
| borderWidth | double? | - | outline 形态的描边宽度，默认 1。 | 否 |
| controlSize | double? | - | 控件高度及单个按钮宽度。 为空时 small、medium、large 分别以 20、24、26 为基础； 未指定实例 size 时可随内置文字增长，显式控制尺寸保持固定。 | 否 |
| disabledBackgroundColor | Color? | - | 整组禁用时 filled 和 outline 形态各段的背景色。 null 时使用 bgColorComponentDisabled Token。 | 否 |
| disabledForegroundColor | Color? | - | 边界不可操作按钮及整组禁用时的前景色。 | 否 |
| foregroundColor | Color? | - | 输入文字和加减图标的默认前景色。 | 否 |
| iconSize | double? | - | 加减图标尺寸。 为空时 small、medium、large 分别使用 12、16、20。 | 否 |
| inputWidth | double? | - | 输入段宽度。 为空时 small、medium、large 分别使用 34、38、45。 | 否 |
| spacing | double? | - | normal 和 filled 形态的分段间距；未配置时使用全局 size2，默认 4。 outline 始终连续排列，不使用该值。 | 否 |
| textStyle | TextStyle? | - | 输入文字样式。 在继承全局 TDesign Token 后合并；非空字段可覆盖 默认字号、行高及 `foregroundColor`。仅覆盖字号时会按最终字号重新计算 默认行高倍数；显式设置的 `TextStyle.height` 始终优先。最终字号或显式 物理行盒超过控件高度属于无效配置，并会在调试模式触发断言。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [常见用法](#常见用法)
3. [推荐/慎用示例](#推荐-慎用示例)
4. [相似组件](#相似组件)

### 何时使用

需要进行数量选择时使用

### 常见用法

##### 通常用于数量选择，如选择人数、天数、商品数量等

![](https://tdesign.gtimg.com/site/design/mobile-guide/stepper/stepper-1.png)

---

##### 用户可通过“+”“-”按钮调整数值，或点击数字输入框来输入具体的数值

![](https://tdesign.gtimg.com/site/design/mobile-guide/stepper/stepper-2.png)

### 推荐/慎用示例

##### 点击“+”“-”按钮时，数值增减的步长相同，不建议进行不同步长的变化

![](https://tdesign.gtimg.com/site/design/mobile-guide/stepper/stepper-3.gif)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/stepper/stepper-4.gif)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [滑动选择器](<Slider 滑动选择器.md>) | 当用户需要快捷地进行数值/程度选择时使用。 |
| [输入框](<Input 输入框.md>) | 需要进行文字输入，且需填写的字数较少时使用。 |
