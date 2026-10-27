# Slider 滑动选择器

> 用于选择横轴上的数值、区间、档位。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/slider)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 单游标滑块

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SliderSingleExample extends StatefulWidget {
  const SliderSingleExample({super.key});

  @override
  State<SliderSingleExample> createState() => _SliderSingleExampleState();
}

class _SliderSingleExampleState extends State<SliderSingleExample> {
  Widget _buildSingle(BuildContext context) => ColoredBox(
    color: context.tTheme.bgColorContainer,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TSlider(
        key: const ValueKey('slider-single'),
        value: _single,
        min: 0,
        max: 100,
        onChanged: (value) => setState(() => _single = value),
      ),
    ),
  );

  double _single = 25;

  @override
  Widget build(BuildContext context) {
    return _buildSingle(context);
  }
}
```

##### 双游标滑块

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SliderRangeExample extends StatefulWidget {
  const SliderRangeExample({super.key});

  @override
  State<SliderRangeExample> createState() => _SliderRangeExampleState();
}

class _SliderRangeExampleState extends State<SliderRangeExample> {
  Widget _buildRange(BuildContext context) => ColoredBox(
    color: context.tTheme.bgColorContainer,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TRangeSlider(
        key: const ValueKey('slider-range'),
        value: _range,
        min: 0,
        max: 100,
        onChanged: (value) => setState(() => _range = value),
      ),
    ),
  );

  RangeValues _range = const RangeValues(40, 60);

  @override
  Widget build(BuildContext context) {
    return _buildRange(context);
  }
}
```

##### 带数值单游标滑块

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SliderLabeledExample extends StatefulWidget {
  const SliderLabeledExample({super.key});

  @override
  State<SliderLabeledExample> createState() => _SliderLabeledExampleState();
}

class _SliderLabeledExampleState extends State<SliderLabeledExample> {
  Widget _buildLabeled(BuildContext context) {
    return ColoredBox(
      color: context.tTheme.bgColorContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: TSlider(
          key: const ValueKey('slider-labeled'),
          value: _labeled,
          min: 0,
          max: 100,
          showThumbValue: true,
          thumbFormatter: _integer,
          onChanged: (value) => setState(() => _labeled = value),
        ),
      ),
    );
  }

  double _labeled = 35;

  static String _integer(double value) => value.round().toString();

  @override
  Widget build(BuildContext context) {
    return _buildLabeled(context);
  }
}
```

##### 带数值双游标滑块

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SliderLabeledRangeExample extends StatefulWidget {
  const SliderLabeledRangeExample({super.key});

  @override
  State<SliderLabeledRangeExample> createState() =>
      _SliderLabeledRangeExampleState();
}

class _SliderLabeledRangeExampleState extends State<SliderLabeledRangeExample> {
  RangeValues _value = const RangeValues(40, 60);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.tTheme.bgColorContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Row(
          children: [
            const TText('0'),
            Expanded(
              child: TRangeSlider(
                key: const ValueKey('slider-labeled-range'),
                value: _value,
                min: 0,
                max: 100,
                showThumbValue: true,
                thumbFormatter: _integer,
                onChanged: (value) => setState(() => _value = value),
              ),
            ),
            const TText('100'),
          ],
        ),
      ),
    );
  }

  static String _integer(double value) => value.round().toString();
}
```

##### 带刻度单游标滑块

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SliderScaleExample extends StatefulWidget {
  const SliderScaleExample({super.key});

  @override
  State<SliderScaleExample> createState() => _SliderScaleExampleState();
}

class _SliderScaleExampleState extends State<SliderScaleExample> {
  Widget _buildScale(BuildContext context) {
    return ColoredBox(
      color: context.tTheme.bgColorContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: TSlider(
          key: const ValueKey('slider-scale'),
          value: _scale,
          min: 0,
          max: 100,
          divisions: 5,
          showScaleValue: true,
          scaleFormatter: _integer,
          onChanged: (value) => setState(() => _scale = value),
        ),
      ),
    );
  }

  double _scale = 60;

  static String _integer(double value) => value.round().toString();

  @override
  Widget build(BuildContext context) {
    return _buildScale(context);
  }
}
```

##### 带刻度双游标滑块

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SliderScaleRangeExample extends StatefulWidget {
  const SliderScaleRangeExample({super.key});

  @override
  State<SliderScaleRangeExample> createState() =>
      _SliderScaleRangeExampleState();
}

class _SliderScaleRangeExampleState extends State<SliderScaleRangeExample> {
  RangeValues _value = const RangeValues(20, 60);

  static String _integer(double value) => value.round().toString();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.tTheme.bgColorContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: TRangeSlider(
          key: const ValueKey('slider-scale-range'),
          value: _value,
          min: 0,
          max: 100,
          divisions: 5,
          showScaleValue: true,
          scaleFormatter: _integer,
          onChanged: (value) => setState(() => _value = value),
        ),
      ),
    );
  }
}
```

#### 组件状态

##### 滑块禁用状态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SliderDisabledExample extends StatelessWidget {
  const SliderDisabledExample({
    super.key,
    this.type = SliderDisabledExampleType.single,
  });

  final SliderDisabledExampleType type;

  Widget _buildDisabled(BuildContext context) => switch (type) {
    SliderDisabledExampleType.single => const Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: TSlider(
        key: ValueKey('slider-disabled'),
        value: 35,
        min: 0,
        max: 100,
      ),
    ),
    SliderDisabledExampleType.labeledRange => const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Row(
        children: [
          TText('0'),
          Expanded(
            child: TRangeSlider(
              key: ValueKey('slider-disabled-labeled-range'),
              value: RangeValues(40, 60),
              min: 0,
              max: 100,
              showThumbValue: true,
              thumbFormatter: _integer,
            ),
          ),
          TText('100'),
        ],
      ),
    ),
    SliderDisabledExampleType.scaleRange => const Padding(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: TRangeSlider(
        key: ValueKey('slider-disabled-scale-range'),
        value: RangeValues(20, 60),
        min: 0,
        max: 100,
        divisions: 5,
        showScaleValue: true,
        scaleFormatter: _integer,
      ),
    ),
  };

  static String _integer(double value) => value.round().toString();

  @override
  Widget build(BuildContext context) {
    return _buildDisabled(context);
  }
}

enum SliderDisabledExampleType { single, labeledRange, scaleRange }
```

#### 特殊样式

##### 胶囊型滑块

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SliderCapsuleExample extends StatefulWidget {
  const SliderCapsuleExample({
    super.key,
    this.type = SliderCapsuleExampleType.single,
  });

  final SliderCapsuleExampleType type;

  @override
  State<SliderCapsuleExample> createState() => _SliderCapsuleExampleState();
}

class _SliderCapsuleExampleState extends State<SliderCapsuleExample> {
  Widget _buildCapsule(BuildContext context) {
    return switch (widget.type) {
      SliderCapsuleExampleType.single => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: TSlider(
          key: const ValueKey('slider-capsule'),
          value: _capsule,
          min: 0,
          max: 100,
          variant: TSliderVariant.capsule,
          onChanged: (value) => setState(() => _capsule = value),
        ),
      ),
      SliderCapsuleExampleType.range => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: TRangeSlider(
          key: const ValueKey('slider-capsule-range'),
          value: _capsuleRange,
          min: 0,
          max: 100,
          variant: TSliderVariant.capsule,
          onChanged: (value) => setState(() => _capsuleRange = value),
        ),
      ),
      SliderCapsuleExampleType.labeledRange => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          children: [
            const TText('0'),
            Expanded(
              child: TRangeSlider(
                key: const ValueKey('slider-capsule-labeled-range'),
                value: _capsuleLabeledRange,
                min: 0,
                max: 100,
                variant: TSliderVariant.capsule,
                showThumbValue: true,
                thumbFormatter: _integer,
                onChanged: (value) =>
                    setState(() => _capsuleLabeledRange = value),
              ),
            ),
            const TText('100'),
          ],
        ),
      ),
      SliderCapsuleExampleType.scale => Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: TSlider(
          key: const ValueKey('slider-capsule-scale'),
          value: _capsuleScale,
          min: 0,
          max: 100,
          divisions: 5,
          variant: TSliderVariant.capsule,
          showScaleValue: true,
          scaleFormatter: _integer,
          onChanged: (value) => setState(() => _capsuleScale = value),
        ),
      ),
      SliderCapsuleExampleType.scaleRange => Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: TRangeSlider(
          key: const ValueKey('slider-capsule-scale-range'),
          value: _capsuleScaleRange,
          min: 0,
          max: 100,
          divisions: 5,
          variant: TSliderVariant.capsule,
          showScaleValue: true,
          scaleFormatter: _integer,
          onChanged: (value) => setState(() => _capsuleScaleRange = value),
        ),
      ),
    };
  }

  double _capsule = 25;

  RangeValues _capsuleRange = const RangeValues(40, 60);

  RangeValues _capsuleLabeledRange = const RangeValues(40, 60);

  double _capsuleScale = 60;

  static String _integer(double value) => value.round().toString();

  RangeValues _capsuleScaleRange = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return _buildCapsule(context);
  }
}

enum SliderCapsuleExampleType { single, range, labeledRange, scale, scaleRange }
```

#### 垂直型滑块

##### `SliderVerticalExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SliderVerticalExample extends StatefulWidget {
  const SliderVerticalExample({
    super.key,
    this.type = SliderVerticalExampleType.single,
  });

  final SliderVerticalExampleType type;

  @override
  State<SliderVerticalExample> createState() => _SliderVerticalExampleState();
}

class _SliderVerticalExampleState extends State<SliderVerticalExample> {
  Widget _buildVertical(BuildContext context) {
    final trackInset = context.tTheme.spacer2;
    final trackLength = 200 - 2 * trackInset;

    Widget verticalSlider({
      required Widget slider,
      String? thumbLabel,
      double? normalizedValue,
      bool showMarks = false,
      Key? labelKey,
      Key? marksKey,
      double height = 202,
    }) {
      return SizedBox(
        height: height,
        child: Center(
          child: SizedBox(
            width: 100,
            height: 200,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 8,
                  top: 0,
                  child: SizedBox(
                    width: 48,
                    height: 200,
                    child: RotatedBox(quarterTurns: 1, child: slider),
                  ),
                ),
                if (showMarks)
                  Positioned(
                    left: 58,
                    width: 42,
                    top: 0,
                    bottom: 0,
                    child: Stack(
                      key: marksKey,
                      clipBehavior: Clip.none,
                      children: List.generate(6, (index) {
                        return Positioned(
                          top: trackInset + index * trackLength / 5,
                          child: FractionalTranslation(
                            translation: const Offset(0, -0.5),
                            child: TText('${index * 20}'),
                          ),
                        );
                      }),
                    ),
                  ),
                if (thumbLabel != null && normalizedValue != null)
                  Positioned(
                    left: 58,
                    top: trackInset + normalizedValue * trackLength,
                    child: FractionalTranslation(
                      translation: const Offset(0, -0.5),
                      child: TText(thumbLabel, key: labelKey),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    }

    return switch (widget.type) {
      SliderVerticalExampleType.single => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _subsection(context, '单游标垂直滑块'),
          verticalSlider(
            slider: TSlider(
              key: const ValueKey('slider-vertical'),
              value: _vertical,
              min: 0,
              max: 100,
              onChanged: (value) => setState(() => _vertical = value),
            ),
            thumbLabel: _integer(_vertical),
            normalizedValue: _vertical / 100,
            labelKey: const ValueKey('slider-vertical-label'),
          ),
        ],
      ),
      SliderVerticalExampleType.scaleRange => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _subsection(context, '带刻度的双游标垂直滑块'),
          verticalSlider(
            slider: TRangeSlider(
              key: const ValueKey('slider-vertical-scale-range'),
              value: _verticalScaleRange,
              min: 0,
              max: 100,
              divisions: 5,
              onChanged: (value) => setState(() => _verticalScaleRange = value),
            ),
            showMarks: true,
            marksKey: const ValueKey('slider-vertical-scale-labels'),
          ),
        ],
      ),
      SliderVerticalExampleType.capsule => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _subsection(context, '胶囊型垂直滑块'),
          verticalSlider(
            slider: TSlider(
              key: const ValueKey('slider-vertical-capsule'),
              value: _verticalCapsule,
              min: 0,
              max: 100,
              variant: TSliderVariant.capsule,
              onChanged: (value) => setState(() => _verticalCapsule = value),
            ),
            thumbLabel: _integer(_verticalCapsule),
            normalizedValue: _verticalCapsule / 100,
            labelKey: const ValueKey('slider-vertical-capsule-label'),
          ),
        ],
      ),
      SliderVerticalExampleType.capsuleScaleRange => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _subsection(context, '带刻度的胶囊型垂直滑块'),
          verticalSlider(
            slider: TRangeSlider(
              key: const ValueKey('slider-vertical-capsule-scale-range'),
              value: _verticalCapsuleScaleRange,
              min: 0,
              max: 100,
              divisions: 5,
              variant: TSliderVariant.capsule,
              onChanged: (value) =>
                  setState(() => _verticalCapsuleScaleRange = value),
            ),
            showMarks: true,
            marksKey: const ValueKey('slider-vertical-capsule-scale-labels'),
            height: 218,
          ),
        ],
      ),
    };
  }

  Widget _subsection(BuildContext context, String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: TText(text, font: context.tTheme.fontBodyMedium),
  );

  double _vertical = 35;

  static String _integer(double value) => value.round().toString();

  RangeValues _verticalScaleRange = const RangeValues(20, 60);

  double _verticalCapsule = 35;

  RangeValues _verticalCapsuleScaleRange = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return _buildVertical(context);
  }
}

enum SliderVerticalExampleType {
  single,
  scaleRange,
  capsule,
  capsuleScaleRange,
}
```

## API

1. [TSlider](#tslider)
2. [TRangeSlider](#trangeslider)
3. [TSliderVariant](#tslidervariant)
4. [TSliderThumbFormatter](#tsliderthumbformatter)
5. [TSliderThemeData](#tsliderthemedata)

### TSlider

#### 构造方法

##### TSlider

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| divisions | int? | - | 离散刻度数；null 表示连续。 非 null 时必须大于 0。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| max | double | 1 | 最大值。 必须大于 min。 | 否 |
| min | double | 0 | 最小值。 max 必须大于 min。 | 否 |
| onChanged | ValueChanged<double>? | - | 值变更回调；为 null 时禁用。 | 否 |
| onChangeEnd | ValueChanged<double>? | - | 结束拖动时触发。 | 否 |
| onChangeStart | ValueChanged<double>? | - | 开始拖动时触发。 | 否 |
| scaleFormatter | TSliderThumbFormatter? | - | 刻度值格式化回调。 | 否 |
| showScaleValue | bool | false | 是否显示刻度值；开启时必须提供 `divisions`。 | 否 |
| showThumbValue | bool | false | 是否持续显示拇指上方数值。 | 否 |
| thumbFormatter | TSliderThumbFormatter? | - | 拇指上方数值格式化回调。 | 否 |
| value | double | - | 受控滑块值；应处于 min 与 max 指定的范围内，父组件需回传新值。 | 是 |
| variant | TSliderVariant | TSliderVariant.normal | 滑块视觉结构，默认使用标准细轨道。 | 否 |

### TRangeSlider

基于 Material `RangeSlider` 的严格受控范围滑块。

#### 构造方法

##### TRangeSlider

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| divisions | int? | - | 离散刻度数；null 表示连续。 非 null 时必须大于 0。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| max | double | 1 | 最大值。 必须大于 min。 | 否 |
| min | double | 0 | 最小值。 max 必须大于 min。 | 否 |
| onChanged | ValueChanged<RangeValues>? | - | 范围变更回调；为 null 时禁用。 | 否 |
| onChangeEnd | ValueChanged<RangeValues>? | - | 结束拖动时触发。 | 否 |
| onChangeStart | ValueChanged<RangeValues>? | - | 开始拖动时触发。 | 否 |
| scaleFormatter | TSliderThumbFormatter? | - | 刻度值格式化回调。 | 否 |
| showScaleValue | bool | false | 是否显示刻度值；开启时必须提供 `divisions`。 | 否 |
| showThumbValue | bool | false | 是否持续显示拇指上方数值。 | 否 |
| thumbFormatter | TSliderThumbFormatter? | - | 拇指上方数值格式化回调。 | 否 |
| value | RangeValues | - | 受控范围值；两端值应处于 min 与 max 指定的范围内，父组件需回传新值。 | 是 |
| variant | TSliderVariant | TSliderVariant.normal | 滑块视觉结构，默认使用标准细轨道。 | 否 |

### TSliderVariant

Slider visual structure.

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| normal | TSliderVariant | - | Standard thin track. | - |
| capsule | TSliderVariant | - | Capsule track with a 3px inset active segment and 20px thumbs. | - |

### TSliderThumbFormatter

格式化滑块提示文案。

位置参数：`value`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| value | double | - | 当前滑块数值。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | String | - | 显示在滑块提示中的格式化文案。 | - |

### TSliderThemeData

TSlider 与 TRangeSlider 共用的组件级 ThemeExtension。

轨道、滑块和提示标签由组件 Theme 控制，不读取 Material SliderTheme。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| activeTrackColor | Color? | - | 选中轨道颜色；为空时使用全局品牌色。 | 否 |
| decoration | Decoration? | - | 滑块外层装饰。 | 否 |
| disabledThumbBorderColor | Color? | - | 禁用滑块描边颜色；为空时浅色使用 componentBorder Token， 暗色使用 bgColorComponentDisabled Token。 | 否 |
| disabledThumbColor | Color? | - | 禁用滑块填充颜色；为空时使用全局反色文字色。 | 否 |
| inactiveTrackColor | Color? | - | 未选中轨道颜色；为空时使用全局组件边框色。 | 否 |
| overlayColor | Color? | - | 交互反馈颜色；为空时使用品牌色的透明层。 | 否 |
| thumbBorderColor | Color? | - | 滑块描边颜色；为空时使用全局灰阶色。 | 否 |
| thumbColor | Color? | - | 滑块填充颜色；为空时使用全局反色文字色。 | 否 |
| trackHeight | double? | - | 普通轨道粗细；胶囊形态仍使用其内置规格。 null 时为 4 逻辑像素。 | 否 |
| valueIndicatorColor | Color? | - | 数值提示背景颜色；为空时使用全局品牌色。 | 否 |
| valueIndicatorTextColor | Color? | - | 数值提示文字颜色；为空时使用全局主要文字色。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

### 何时使用

当用户需要快捷地进行数值/程度选择时使用。

### 组件搭配使用

##### 滑动选择器与[单元格](<../数据展示/Cell 单元格.md>)组合使用，单元格作为承载滑动选择器的容器。

![](https://tdesign.gtimg.com/site/design/mobile-guide/slider/slider-1.png)

### 常见用法

##### 用于可量化的数值选择，需要精确到具体某个数值/区间。

![](https://tdesign.gtimg.com/site/design/mobile-guide/slider/slider-2.png)

---

##### 用于难以量化的对立数据，以此表示程度。

![](https://tdesign.gtimg.com/site/design/mobile-guide/slider/slider-3.png)

### 推荐/慎用示例

##### 当有多个刻度区间时，避免区间数值不一致，造成滑动调整不准确。

![](https://tdesign.gtimg.com/site/design/mobile-guide/slider/slider-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/slider/slider-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [步进器](<Stepper 步进器.md>) | 需要进行数量选择时使用。 |
