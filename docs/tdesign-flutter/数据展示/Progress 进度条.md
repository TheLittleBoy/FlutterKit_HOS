# Progress 进度条

> 用于展示任务当前的进度。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/progress)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 线性进度条

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ProgressLinearExample extends StatelessWidget {
  const ProgressLinearExample({super.key});

  Widget _buildLinear(BuildContext context) {
    return TProgress.linear(value: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return _buildLinear(context);
  }
}
```

##### 百分比内显

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ProgressPlumpExample extends StatelessWidget {
  const ProgressPlumpExample({super.key});

  Widget _buildPlump(BuildContext context) {
    return TProgress.plump(value: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return _buildPlump(context);
  }
}
```

##### 环形进度条

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ProgressCircleExample extends StatelessWidget {
  const ProgressCircleExample({super.key});

  Widget _buildCircle(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TProgress.circular(value: 0.3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCircle(context);
  }
}
```

##### 微型环形进度条

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ProgressMicroCircleExample extends StatelessWidget {
  const ProgressMicroCircleExample({super.key});

  Widget _buildMicroCircle(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TProgress.microCircular(value: 0.75),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildMicroCircle(context);
  }
}
```

##### 按钮进度条

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ProgressButtonExample extends StatefulWidget {
  const ProgressButtonExample({super.key});

  @override
  State<ProgressButtonExample> createState() => _ProgressButtonExampleState();
}

class _ProgressButtonExampleState extends State<ProgressButtonExample> {
  static const _target = 0.8;
  static const _step = 0.01;
  static const _stepDuration = Duration(milliseconds: 30);

  double _value = 0;
  Timer? _timer;

  bool get _advancing => _timer?.isActive ?? false;

  void _advance() {
    if (_advancing || _value >= _target) {
      return;
    }
    _increaseValue();
    _timer = Timer.periodic(_stepDuration, (_) => _increaseValue());
  }

  void _increaseValue() {
    setState(() => _value = (_value + _step).clamp(0, _target));
    if (_value >= _target) {
      _timer?.cancel();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TProgress.button(
      key: const Key('progress-button'),
      value: _value,
      label: Text(_value == 0 ? '开始' : '${(_value * 100).round()}%'),
      semanticsLabel: '上传进度',
      onTap: _advance,
    );
  }
}
```

##### 微型按钮进度条

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ProgressMicroButtonExample extends StatefulWidget {
  const ProgressMicroButtonExample({super.key});

  @override
  State<ProgressMicroButtonExample> createState() =>
      _ProgressMicroButtonExampleState();
}

class _ProgressMicroButtonExampleState
    extends State<ProgressMicroButtonExample> {
  var _playing = false;
  var _value = 0.75;

  void _togglePlaying() {
    setState(() {
      _playing = !_playing;
      _value = _playing ? 1 : 0.75;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TProgress.microButton(
        key: const Key('progress-micro-button'),
        value: _value,
        label: Icon(_playing ? TIcons.pause : TIcons.play),
        semanticsLabel: '播放进度',
        onTap: _togglePlaying,
      ),
    );
  }
}
```

#### 组件状态

##### 线性进度条

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ProgressLinearStatusExample extends StatelessWidget {
  const ProgressLinearStatusExample({super.key});

  Widget _buildLinearStatus(BuildContext context) {
    return Column(
      children: [
        TProgress.linear(value: 0.8),
        const SizedBox(height: 18),
        TProgress.linear(value: 0.8, status: TProgressStatus.warning),
        const SizedBox(height: 18),
        TProgress.linear(value: 0.8, status: TProgressStatus.error),
        const SizedBox(height: 18),
        TProgress.linear(value: 0.8, status: TProgressStatus.success),
        const SizedBox(height: 18),
        TProgress.linear(
          value: 0.8,
          gradient: LinearGradient(
            colors: [context.tTheme.brandColor, context.tTheme.successColor],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildLinearStatus(context);
  }
}
```

##### 百分比内显进度条

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ProgressPlumpStatusExample extends StatelessWidget {
  const ProgressPlumpStatusExample({super.key});

  Widget _buildPlumpStatus(BuildContext context) {
    return Column(
      children: [
        TProgress.plump(value: 0.8),
        const SizedBox(height: 17),
        TProgress.plump(value: 1, status: TProgressStatus.success),
        const SizedBox(height: 17),
        TProgress.plump(value: 0.8, status: TProgressStatus.warning),
        const SizedBox(height: 17),
        TProgress.plump(value: 0.8, status: TProgressStatus.error),
        const SizedBox(height: 17),
        TProgress.plump(
          value: 0.8,
          gradient: LinearGradient(
            colors: [context.tTheme.brandColor, context.tTheme.successColor],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPlumpStatus(context);
  }
}
```

##### 环形进度条

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ProgressCircleStatusExample extends StatelessWidget {
  const ProgressCircleStatusExample({super.key});

  Widget _buildCircleStatus(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TProgress.circular(value: 0.3),
          const SizedBox(height: 24),
          TProgress.circular(value: 0.3, status: TProgressStatus.warning),
          const SizedBox(height: 24),
          TProgress.circular(value: 0.3, status: TProgressStatus.error),
          const SizedBox(height: 24),
          TProgress.circular(value: 1, status: TProgressStatus.success),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCircleStatus(context);
  }
}
```

## API

1. [TProgress](#tprogress)
2. [TProgressVariant](#tprogressvariant)
3. [TProgressStatus](#tprogressstatus)
4. [TProgressThemeData](#tprogressthemedata)

### TProgress

#### 构造方法

##### TProgress.button

创建按钮外观的线性进度条。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| value | double? | - | 进度值；确定模式限制在 0 到 1，null 表示不确定进度。 | 否 |
| status | TProgressStatus | TProgressStatus.normal | 当前任务状态，决定默认颜色和状态标签，默认为 `TProgressStatus.normal`。 显式的 TProgressThemeData.color 可以覆盖状态默认色，线性渐变优先于两者。 不从 Flutter ProgressIndicatorTheme 读取颜色。 | 否 |
| label | Widget? | - | 进度条标签。 未指定时，常规状态显示百分比；warning、error、success 在线性与 环形形态只显示状态图标，plump 形态保留内部百分比并在外侧显示图标； `TProgressVariant.microCircular` 默认不显示标签。 | 否 |
| gradient | LinearGradient? | - | 线性填充渐变。 仅用于 `TProgressVariant.linear`、`TProgressVariant.plump` 和 `TProgressVariant.button`，并优先于 Theme 和 `status` 的默认颜色。 | 否 |
| semanticsLabel | String? | - | 辅助技术播报的进度条名称。 | 否 |
| semanticsValue | String? | - | 辅助技术播报的进度值；未指定时由 `value` 格式化为百分比。 | 否 |
| onTap | VoidCallback? | - | 点击 `button` 或 `microButton` 进度条时触发。 其他只读形态不会响应点击。 | 否 |
| onLongPress | VoidCallback? | - | 长按 `button` 或 `microButton` 进度条时触发。 可以独立于 `onTap` 使用；长按不会同时触发 `onTap`。其他只读形态 不会响应长按。 | 否 |

##### TProgress.circular

创建环形进度条。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| value | double? | - | 进度值；确定模式限制在 0 到 1，null 表示不确定进度。 | 否 |
| status | TProgressStatus | TProgressStatus.normal | 当前任务状态，决定默认颜色和状态标签，默认为 `TProgressStatus.normal`。 显式的 TProgressThemeData.color 可以覆盖状态默认色，线性渐变优先于两者。 不从 Flutter ProgressIndicatorTheme 读取颜色。 | 否 |
| label | Widget? | - | 进度条标签。 未指定时，常规状态显示百分比；warning、error、success 在线性与 环形形态只显示状态图标，plump 形态保留内部百分比并在外侧显示图标； `TProgressVariant.microCircular` 默认不显示标签。 | 否 |
| semanticsLabel | String? | - | 辅助技术播报的进度条名称。 | 否 |
| semanticsValue | String? | - | 辅助技术播报的进度值；未指定时由 `value` 格式化为百分比。 | 否 |

##### TProgress.linear

创建线性进度条。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| value | double? | - | 进度值；确定模式限制在 0 到 1，null 表示不确定进度。 | 否 |
| status | TProgressStatus | TProgressStatus.normal | 当前任务状态，决定默认颜色和状态标签，默认为 `TProgressStatus.normal`。 显式的 TProgressThemeData.color 可以覆盖状态默认色，线性渐变优先于两者。 不从 Flutter ProgressIndicatorTheme 读取颜色。 | 否 |
| label | Widget? | - | 进度条标签。 未指定时，常规状态显示百分比；warning、error、success 在线性与 环形形态只显示状态图标，plump 形态保留内部百分比并在外侧显示图标； `TProgressVariant.microCircular` 默认不显示标签。 | 否 |
| gradient | LinearGradient? | - | 线性填充渐变。 仅用于 `TProgressVariant.linear`、`TProgressVariant.plump` 和 `TProgressVariant.button`，并优先于 Theme 和 `status` 的默认颜色。 | 否 |
| semanticsLabel | String? | - | 辅助技术播报的进度条名称。 | 否 |
| semanticsValue | String? | - | 辅助技术播报的进度值；未指定时由 `value` 格式化为百分比。 | 否 |

##### TProgress.microButton

创建带按钮语义和紧凑圆环外观的进度操作。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| value | double? | - | 进度值；确定模式限制在 0 到 1，null 表示不确定进度。 | 否 |
| status | TProgressStatus | TProgressStatus.normal | 当前任务状态，决定默认颜色和状态标签，默认为 `TProgressStatus.normal`。 显式的 TProgressThemeData.color 可以覆盖状态默认色，线性渐变优先于两者。 不从 Flutter ProgressIndicatorTheme 读取颜色。 | 否 |
| label | Widget? | - | 进度条标签。 未指定时，常规状态显示百分比；warning、error、success 在线性与 环形形态只显示状态图标，plump 形态保留内部百分比并在外侧显示图标； `TProgressVariant.microCircular` 默认不显示标签。 | 否 |
| semanticsLabel | String? | - | 辅助技术播报的进度条名称。 | 否 |
| semanticsValue | String? | - | 辅助技术播报的进度值；未指定时由 `value` 格式化为百分比。 | 否 |
| onTap | VoidCallback? | - | 点击 `button` 或 `microButton` 进度条时触发。 其他只读形态不会响应点击。 | 否 |
| onLongPress | VoidCallback? | - | 长按 `button` 或 `microButton` 进度条时触发。 可以独立于 `onTap` 使用；长按不会同时触发 `onTap`。其他只读形态 不会响应长按。 | 否 |

##### TProgress.microCircular

创建紧凑、只读的环形进度条。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| value | double? | - | 进度值；确定模式限制在 0 到 1，null 表示不确定进度。 | 否 |
| status | TProgressStatus | TProgressStatus.normal | 当前任务状态，决定默认颜色和状态标签，默认为 `TProgressStatus.normal`。 显式的 TProgressThemeData.color 可以覆盖状态默认色，线性渐变优先于两者。 不从 Flutter ProgressIndicatorTheme 读取颜色。 | 否 |
| label | Widget? | - | 进度条标签。 未指定时，常规状态显示百分比；warning、error、success 在线性与 环形形态只显示状态图标，plump 形态保留内部百分比并在外侧显示图标； `TProgressVariant.microCircular` 默认不显示标签。 | 否 |
| semanticsLabel | String? | - | 辅助技术播报的进度条名称。 | 否 |
| semanticsValue | String? | - | 辅助技术播报的进度值；未指定时由 `value` 格式化为百分比。 | 否 |

##### TProgress.plump

创建百分比显示在进度条内部的胶囊形进度条。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| value | double? | - | 进度值；确定模式限制在 0 到 1，null 表示不确定进度。 | 否 |
| status | TProgressStatus | TProgressStatus.normal | 当前任务状态，决定默认颜色和状态标签，默认为 `TProgressStatus.normal`。 显式的 TProgressThemeData.color 可以覆盖状态默认色，线性渐变优先于两者。 不从 Flutter ProgressIndicatorTheme 读取颜色。 | 否 |
| label | Widget? | - | 进度条标签。 未指定时，常规状态显示百分比；warning、error、success 在线性与 环形形态只显示状态图标，plump 形态保留内部百分比并在外侧显示图标； `TProgressVariant.microCircular` 默认不显示标签。 | 否 |
| gradient | LinearGradient? | - | 线性填充渐变。 仅用于 `TProgressVariant.linear`、`TProgressVariant.plump` 和 `TProgressVariant.button`，并优先于 Theme 和 `status` 的默认颜色。 | 否 |
| semanticsLabel | String? | - | 辅助技术播报的进度条名称。 | 否 |
| semanticsValue | String? | - | 辅助技术播报的进度值；未指定时由 `value` 格式化为百分比。 | 否 |

#### 属性

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| gradient | LinearGradient? | - | 线性填充渐变。 仅用于 `TProgressVariant.linear`、`TProgressVariant.plump` 和 `TProgressVariant.button`，并优先于 Theme 和 `status` 的默认颜色。 | - |
| label | Widget? | - | 进度条标签。 未指定时，常规状态显示百分比；warning、error、success 在线性与 环形形态只显示状态图标，plump 形态保留内部百分比并在外侧显示图标； `TProgressVariant.microCircular` 默认不显示标签。 | - |
| onLongPress | VoidCallback? | - | 长按 `button` 或 `microButton` 进度条时触发。 可以独立于 `onTap` 使用；长按不会同时触发 `onTap`。其他只读形态 不会响应长按。 | - |
| onTap | VoidCallback? | - | 点击 `button` 或 `microButton` 进度条时触发。 其他只读形态不会响应点击。 | - |
| semanticsLabel | String? | - | 辅助技术播报的进度条名称。 | - |
| semanticsValue | String? | - | 辅助技术播报的进度值；未指定时由 `value` 格式化为百分比。 | - |
| status | TProgressStatus | - | 当前任务状态，决定默认颜色和状态标签，默认为 `TProgressStatus.normal`。 显式的 TProgressThemeData.color 可以覆盖状态默认色，线性渐变优先于两者。 不从 Flutter ProgressIndicatorTheme 读取颜色。 | - |
| value | double? | - | 进度值；确定模式限制在 0 到 1，null 表示不确定进度。 | - |
| variant | TProgressVariant | - | 进度条形态 | - |

### TProgressVariant

进度条形态

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| linear | TProgressVariant | - | 线性进度条。 | - |
| plump | TProgressVariant | - | 百分比显示在进度条内部的胶囊形进度条。 | - |
| circular | TProgressVariant | - | 环形进度条。 | - |
| microCircular | TProgressVariant | - | 紧凑、只读的环形进度条。 | - |
| button | TProgressVariant | - | 按钮外观的线性进度条。 | - |
| microButton | TProgressVariant | - | 带按钮语义和紧凑圆环外观的进度操作。 | - |

### TProgressStatus

进度条所表达的任务状态。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| normal | TProgressStatus | - | 常规进行中状态。 | - |
| warning | TProgressStatus | - | 警告状态。 | - |
| error | TProgressStatus | - | 错误状态。 | - |
| success | TProgressStatus | - | 成功状态。 | - |

### TProgressThemeData

进度条组件级 ThemeExtension

通过 Theme 子树注入，控制子树的默认视觉值。
除进度值、状态与线性渐变等实例语义外，具体绘制值优先读取组件 Theme。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| animationDuration | Duration? | - | 动画持续时间 未配置时为 300 毫秒。 | 否 |
| backgroundColor | Color? | - | 进度条背景色 | 否 |
| circleInnerBgColor | Color? | - | 环形进度条内圆背景色。默认浅色读取容器色、暗色透明； 宿主如需定义暗色内圆，可在组件 Theme 中显式配置。 | 否 |
| circleSize | double? | - | 环形进度条的正方形边长；未设置时由环形规格决定。 未配置时 circular 为 112、microCircular / microButton 为 24 逻辑像素。 显式值固定；常规环形默认尺寸可随内置百分比的自然文字大小增长。 | 否 |
| color | Color? | - | 进度条颜色 | 否 |
| indeterminateAnimationDuration | Duration? | - | 不确定进度完成一次循环的时长。 未配置时为 1200 毫秒；必须大于 Duration.zero，否则抛出 FlutterError。 | 否 |
| indeterminateCircularValue | double? | - | 不确定环形进度弧占整圈的比例。 未配置时为 0.25；必须大于 0 且小于 1。 | 否 |
| indeterminateLinearSegmentFraction | double? | - | 不确定线性进度段占轨道宽度的比例。 未配置时为 0.32；必须大于 0 且不大于 1。 | 否 |
| linearBorderRadius | BorderRadiusGeometry? | - | 条形进度条末端圆角 | 否 |
| strokeWidth | double? | - | 进度条粗细；显式值保持固定。 未设置时，内置百分比的 plump/button 默认高度可随文字自然行高增长。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

### 何时使用

当有一项系统任务正在进行，需要向用户展示该任务的当前进度时使用。

### 与页面布局相关

##### 当展示页面、模块的加载进度时，通常进度条放置在页面、模块的正中间。

![](https://tdesign.gtimg.com/site/design/mobile-guide/progress/progress-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/progress/progress-2.png)

### 常见用法

##### 通常用于任务周期较长的场景中，配有文字或图标显示进度和状态。

![](https://tdesign.gtimg.com/site/design/mobile-guide/progress/progress-3.png)

---

##### 当任务时间较短、或难以预估剩余时间时，通常弱化进度的百分比信息，如使用隐藏数值进度条、或微型的环形进度条。

![](https://tdesign.gtimg.com/site/design/mobile-guide/progress/progress-4.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/progress/progress-5.png)

### 推荐/慎用示例

##### 若任务需要等待的时间很长，可以提供大概的时间估计，让用户更有预期。

![](https://tdesign.gtimg.com/site/design/mobile-guide/progress/progress-6.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [加载](<../反馈/Loading 加载.md>) | 当打开新页面或操作完成后，等待加载时使用。 |
