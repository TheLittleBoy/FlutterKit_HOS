# Steps 步骤条

> 用于任务步骤展示或任务进度展示。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/steps)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### Horizontal Default Steps 水平默认步骤条

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class StepsHorizontalDefaultExample extends StatelessWidget {
  const StepsHorizontalDefaultExample({super.key});

  /// Horizontal Default Steps 水平默认步骤条
  Widget _buildHorizontalDefault(BuildContext context) {
    return const TSteps.progress(
      steps: [
        TStepsItemData(title: 'Finish', content: 'Content'),
        TStepsItemData(title: 'Process', content: 'Content'),
        TStepsItemData(title: 'Default', content: 'Content'),
        TStepsItemData(title: 'Default', content: 'Content'),
      ],
      value: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildHorizontalDefault(context);
  }
}
```

##### Horizontal Icon Steps 水平图标步骤条

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class StepsHorizontalIconExample extends StatelessWidget {
  const StepsHorizontalIconExample({super.key});

  /// Horizontal Icon Steps 水平图标步骤条
  Widget _buildHorizontalIcon(BuildContext context) {
    return const TSteps.progress(
      steps: [
        TStepsItemData(title: 'Finish', content: 'Content', icon: TIcons.cart),
        TStepsItemData(title: 'Process', content: 'Content', icon: TIcons.cart),
        TStepsItemData(title: 'Default', content: 'Content', icon: TIcons.cart),
        TStepsItemData(title: 'Default', content: 'Content', icon: TIcons.cart),
      ],
      value: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildHorizontalIcon(context);
  }
}
```

##### Horizontal Dot Steps 水平简略步骤条

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class StepsHorizontalDotExample extends StatelessWidget {
  const StepsHorizontalDotExample({super.key});

  /// Horizontal Dot Steps 水平简略步骤条
  Widget _buildHorizontalDot(BuildContext context) {
    return const TSteps.progress(
      steps: [
        TStepsItemData(title: 'Finish', content: 'Content'),
        TStepsItemData(title: 'Process', content: 'Content'),
        TStepsItemData(title: 'Default', content: 'Content'),
        TStepsItemData(title: 'Default', content: 'Content'),
      ],
      value: 1,
      indicator: TStepsIndicator.dot,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildHorizontalDot(context);
  }
}
```

##### Vertical Default Steps 垂直默认步骤条

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class StepsVerticalDefaultExample extends StatelessWidget {
  const StepsVerticalDefaultExample({super.key});

  /// Vertical Default Steps 垂直默认步骤条
  Widget _buildVerticalDefault(BuildContext context) {
    return const TSteps.progress(
      steps: [
        TStepsItemData(title: 'Finish', content: 'Content'),
        TStepsItemData(title: 'Process', content: 'Content'),
        TStepsItemData(title: 'Default', content: 'Content'),
        TStepsItemData(title: 'Default', content: 'Content'),
      ],
      value: 1,
      direction: TStepsDirection.vertical,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildVerticalDefault(context);
  }
}
```

##### Vertical Icon Steps 垂直图标步骤条

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class StepsVerticalIconExample extends StatelessWidget {
  const StepsVerticalIconExample({super.key});

  /// Vertical Icon Steps 垂直图标步骤条
  Widget _buildVerticalIcon(BuildContext context) {
    return const TSteps.progress(
      steps: [
        TStepsItemData(title: 'Finish', content: 'Content', icon: TIcons.cart),
        TStepsItemData(title: 'Process', content: 'Content', icon: TIcons.cart),
        TStepsItemData(title: 'Default', content: 'Content', icon: TIcons.cart),
        TStepsItemData(title: 'Default', content: 'Content', icon: TIcons.cart),
      ],
      value: 1,
      direction: TStepsDirection.vertical,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildVerticalIcon(context);
  }
}
```

##### Vertical Dot Steps 垂直简略步骤条

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class StepsVerticalDotExample extends StatelessWidget {
  const StepsVerticalDotExample({super.key});

  /// Vertical Dot Steps 垂直简略步骤条
  Widget _buildVerticalDot(BuildContext context) {
    return const TSteps.progress(
      steps: [
        TStepsItemData(title: 'Finish', content: 'Content'),
        TStepsItemData(title: 'Process', content: 'Content'),
        TStepsItemData(title: 'Default', content: 'Content'),
        TStepsItemData(title: 'Default', content: 'Content'),
      ],
      value: 1,
      direction: TStepsDirection.vertical,
      indicator: TStepsIndicator.dot,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildVerticalDot(context);
  }
}
```

##### Customize Steps Content 自定义步骤条内容

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class StepsCustomContentExample extends StatelessWidget {
  const StepsCustomContentExample({super.key});

  /// Customize Steps Content 自定义步骤条内容
  Widget _buildCustomContent(BuildContext context) {
    return const TSteps.progress(
      steps: [
        TStepsItemData(title: 'Finish', content: 'Customize content'),
        TStepsItemData(
          title: 'Process',
          customContent: Padding(
            padding: EdgeInsets.only(top: 4, bottom: 16),
            child: TImage(
              src: 'assets/img/image.png',
              width: 280,
              height: 100,
              fit: BoxFit.cover,
              shape: TImageShape.roundedSquare,
            ),
          ),
        ),
        TStepsItemData(title: 'Default', content: 'Customize content'),
      ],
      value: 1,
      direction: TStepsDirection.vertical,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCustomContent(context);
  }
}
```

#### 组件状态

##### Error 错误状态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class StepsErrorStatesExample extends StatelessWidget {
  const StepsErrorStatesExample({super.key});

  /// Error 错误状态
  Widget _buildErrorStates(BuildContext context) {
    return const Column(
      children: [
        TSteps.progress(
          steps: [
            TStepsItemData(title: 'Finish', content: 'Content'),
            TStepsItemData(title: 'Error', content: 'Content'),
            TStepsItemData(title: 'Default', content: 'Content'),
            TStepsItemData(title: 'Default', content: 'Content'),
          ],
          value: 1,
          status: TStepsStatus.error,
        ),
        SizedBox(height: 32),
        TSteps.progress(
          steps: [
            TStepsItemData(
              title: 'Finish',
              content: 'Content',
              icon: TIcons.cart,
            ),
            TStepsItemData(
              title: 'Error',
              content: 'Content',
              icon: TIcons.cart,
              errorIcon: TIcons.close_circle,
            ),
            TStepsItemData(
              title: 'Default',
              content: 'Content',
              icon: TIcons.cart,
            ),
            TStepsItemData(
              title: 'Default',
              content: 'Content',
              icon: TIcons.cart,
            ),
          ],
          value: 1,
          status: TStepsStatus.error,
        ),
        SizedBox(height: 32),
        TSteps.progress(
          steps: [
            TStepsItemData(title: 'Finish', content: 'Content'),
            TStepsItemData(title: 'Error', content: 'Content'),
            TStepsItemData(title: 'Default', content: 'Content'),
            TStepsItemData(title: 'Default', content: 'Content'),
          ],
          value: 1,
          status: TStepsStatus.error,
          indicator: TStepsIndicator.dot,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildErrorStates(context);
  }
}
```

#### 特殊类型

##### Vertical Customize Steps 垂直自定义步骤条

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class StepsVerticalSelectableExample extends StatefulWidget {
  const StepsVerticalSelectableExample({super.key});

  @override
  State<StepsVerticalSelectableExample> createState() =>
      _StepsVerticalSelectableExampleState();
}

class _StepsVerticalSelectableExampleState
    extends State<StepsVerticalSelectableExample> {
  /// Vertical Customize Steps 垂直自定义步骤条
  ///
  /// 核心片段：导入 Flutter material.dart 和 tdesign_flutter.dart，
  /// 将此方法放在 StatefulWidget 的 State 中，由 build 调用。
  /// State 声明 `int _selectedStep = 3;` 保存当前步骤；
  /// 不在 build 中重新初始化，回调通过 setState 更新受控值。
  Widget _buildVerticalSelectable(BuildContext context) {
    return TSteps.selectable(
      steps: List.generate(
        4,
        (index) => TStepsItemData(
          title: index < _selectedStep
              ? '已完成步骤'
              : index == _selectedStep
              ? '当前步骤'
              : '未完成步骤',
        ),
      ),
      value: _selectedStep,
      onChange: (index) {
        setState(() => _selectedStep = index);
        TToast.showText('选择了步骤 ${index + 1}', context: context);
      },
    );
  }

  int _selectedStep = 3;

  @override
  Widget build(BuildContext context) {
    return _buildVerticalSelectable(context);
  }
}
```

##### Read-only Steps 纯展示步骤条

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DisplayStepsExample extends StatelessWidget {
  const DisplayStepsExample({super.key});

  /// Read-only Steps 纯展示步骤条
  Widget _buildDisplaySteps(BuildContext context) {
    return const TSteps.display(
      steps: [
        TStepsItemData(title: '步骤展示', content: '可自定义此处内容'),
        TStepsItemData(title: '步骤展示', content: '可自定义此处内容'),
        TStepsItemData(title: '步骤展示', content: '可自定义此处内容'),
        TStepsItemData(title: '步骤展示', content: '可自定义此处内容'),
      ],
      direction: TStepsDirection.vertical,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDisplaySteps(context);
  }
}
```

## API

1. [TSteps](#tsteps)
2. [TStepsItemData](#tstepsitemdata)
3. [TStepsDirection](#tstepsdirection)
4. [TStepsIndicator](#tstepsindicator)
5. [TStepsStatus](#tstepsstatus)

### TSteps

#### 构造方法

##### TSteps.display

纯展示步骤条。

所有节点和连线均使用完成态，不接收进度、状态或交互参数。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| steps | List<TStepsItemData> | - | 步骤条数据 | 是 |
| direction | TStepsDirection | TStepsDirection.vertical | 步骤条方向 | 否 |

##### TSteps.progress

普通进度步骤条。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| steps | List<TStepsItemData> | - | 步骤条数据 | 是 |
| value | int | 0 | 进度或可选择步骤条当前激活的索引；越界值会收敛到有效范围。 | 否 |
| direction | TStepsDirection | TStepsDirection.horizontal | 步骤条方向 | 否 |
| status | TStepsStatus | TStepsStatus.process | 进度步骤条当前 `value` 对应步骤的状态。 | 否 |
| indicator | TStepsIndicator | TStepsIndicator.standard | 进度步骤条的指示器样式。 | 否 |
| onChange | ValueChanged<int>? | - | 为空时只读；非空时只报告用户点击的索引；当前进度仍由调用方更新 `value` 控制。 | 否 |

##### TSteps.selectable

垂直可选择步骤条。

固定使用点状指示器并显示右侧箭头：已完成节点实心，
当前与未完成节点空心。`onChange` 只报告用户选择的索引，
调用方需要更新 `value` 完成受控重建。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| steps | List<TStepsItemData> | - | 步骤条数据 | 是 |
| value | int | - | 进度或可选择步骤条当前激活的索引；越界值会收敛到有效范围。 | 是 |
| onChange | ValueChanged<int> | - | 用户选择步骤时触发；调用方通过更新 `value` 实现受控模式。 `TSteps.progress` 中为空时只读，非空时不改变指示器视觉； `TSteps.selectable` 中必填。`TSteps.display` 不接收此参数。 | 是 |

#### 属性

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| direction | TStepsDirection | - | 步骤条方向 | - |
| indicator | TStepsIndicator | - | 进度步骤条的指示器样式。 | - |
| onChange | ValueChanged<int>? | - | 用户选择步骤时触发；调用方通过更新 `value` 实现受控模式。 `TSteps.progress` 中为空时只读，非空时不改变指示器视觉； `TSteps.selectable` 中必填。`TSteps.display` 不接收此参数。 | - |
| status | TStepsStatus | - | 进度步骤条当前 `value` 对应步骤的状态。 | - |
| steps | List<TStepsItemData> | - | 步骤条数据 | - |
| value | int | - | 进度或可选择步骤条当前激活的索引；越界值会收敛到有效范围。 | - |

### TStepsItemData

步骤条的数据模型。

#### 构造方法

##### TStepsItemData

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| content | String? | - | 内容 | 否 |
| customContent | Widget? | - | 自定义内容 | 否 |
| customTitle | Widget? | - | 自定义标题 | 否 |
| errorIcon | IconData? | - | 失败图标 | 否 |
| icon | IconData? | - | 步骤图标；未设置时使用数字或状态图标。 | 否 |
| title | String? | - | 标题 | 否 |

### TStepsDirection

Steps步骤条方向

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| horizontal | TStepsDirection | - | 水平方向 | - |
| vertical | TStepsDirection | - | 垂直方向 | - |

### TStepsIndicator

步骤条指示器样式。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| standard | TStepsIndicator | - | 标准的数字或图标步骤条。 | - |
| dot | TStepsIndicator | - | 点状进度指示器；横向与纵向均以当前节点实心表达进度。 在 `TSteps.progress` 中是否传入 `TSteps.onChange` 不改变该视觉语义。 | - |

### TStepsStatus

steps步骤条状态

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| process | TStepsStatus | - | 当前步骤进行中。 | - |
| error | TStepsStatus | - | 错误状态 | - |

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [推荐/慎用示例](#推荐-慎用示例)
4. [相似组件](#相似组件)

### 何时使用

当需要展示较为复杂的线性流程时使用。

### 与页面布局相关

##### 位于页面或模块的顶部，统领下方内容的切换，通常设置吸顶，方便用户快速切换。

![](https://tdesign.gtimg.com/site/design/mobile-guide/steps/steps-1.png)

### 推荐/慎用示例

##### 步骤不宜过多，过长的步骤建议优化流程或使用其它交互方式。

![](https://tdesign.gtimg.com/site/design/mobile-guide/steps/steps-2.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/steps/steps-3.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 每个小步骤建议尽量简洁清晰，以降低用户的理解和操作成本；若小步骤本身已经具有较高的复杂度，建议使用其它方式呈现。

![](https://tdesign.gtimg.com/site/design/mobile-guide/steps/steps-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/steps/steps-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 建议用简明的语言对步骤进行描述，描述文案不宜过长。

![](https://tdesign.gtimg.com/site/design/mobile-guide/steps/steps-6.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 尽量避免嵌套步骤条。

![](https://tdesign.gtimg.com/site/design/mobile-guide/steps/steps-7.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [进度条](<../数据展示/Progress 进度条.md>) | 当有一项系统任务正在进行，需要向用户展示该任务的当前进度时使用。 |
| [选项卡](<Tabs 选项卡.md>) | 当内容/数据需要一定的分类纬度进行区分，便于用户快速作出选择并切换时可以使用。 |
