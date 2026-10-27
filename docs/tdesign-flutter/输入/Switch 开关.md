# Switch 开关

> 用于控制某个功能的开启和关闭。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/switch)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 基础开关

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SwitchBasicExample extends StatelessWidget {
  const SwitchBasicExample({super.key});

  Widget _buildBasic(BuildContext context) => const TCell(
    title: Text('基础开关'),
    note: SwitchBasicExampleStatefulSwitch(initialValue: true),
  );

  @override
  Widget build(BuildContext context) {
    return _buildBasic(context);
  }
}

class SwitchBasicExampleStatefulSwitch extends StatefulWidget {
  const SwitchBasicExampleStatefulSwitch({
    super.key,
    this.initialValue = false,
    this.size,
    this.variant,
    this.openText,
    this.closeText,
  });

  final bool initialValue;
  final TSwitchSize? size;
  final TSwitchVariant? variant;
  final String? openText;
  final String? closeText;

  @override
  State<SwitchBasicExampleStatefulSwitch> createState() =>
      SwitchBasicExampleStatefulSwitchState();
}

class SwitchBasicExampleStatefulSwitchState
    extends State<SwitchBasicExampleStatefulSwitch> {
  late bool value = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    return TSwitch(
      value: value,
      size: widget.size,
      variant: widget.variant,
      openText: widget.openText,
      closeText: widget.closeText,
      onChanged: (next) => setState(() => value = next),
    );
  }
}
```

##### 带描述开关

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SwitchLabelExample extends StatelessWidget {
  const SwitchLabelExample({super.key});

  Widget _buildLabel(BuildContext context) => const TCellGroup(
    cells: [
      TCell(
        title: Text('带文字开关'),
        note: SwitchLabelExampleStatefulSwitch(
          initialValue: true,
          variant: TSwitchVariant.text,
          openText: '开',
          closeText: '关',
        ),
      ),
      TCell(
        title: Text('带图标开关'),
        note: SwitchLabelExampleStatefulSwitch(
          initialValue: true,
          variant: TSwitchVariant.icon,
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return _buildLabel(context);
  }
}

class SwitchLabelExampleStatefulSwitch extends StatefulWidget {
  const SwitchLabelExampleStatefulSwitch({
    super.key,
    this.initialValue = false,
    this.size,
    this.variant,
    this.openText,
    this.closeText,
  });

  final bool initialValue;
  final TSwitchSize? size;
  final TSwitchVariant? variant;
  final String? openText;
  final String? closeText;

  @override
  State<SwitchLabelExampleStatefulSwitch> createState() =>
      SwitchLabelExampleStatefulSwitchState();
}

class SwitchLabelExampleStatefulSwitchState
    extends State<SwitchLabelExampleStatefulSwitch> {
  late bool value = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    return TSwitch(
      value: value,
      size: widget.size,
      variant: widget.variant,
      openText: widget.openText,
      closeText: widget.closeText,
      onChanged: (next) => setState(() => value = next),
    );
  }
}
```

##### 自定义颜色开关

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SwitchColorExample extends StatelessWidget {
  const SwitchColorExample({super.key});

  Widget _buildColor(BuildContext context) => Theme(
    data: Theme.of(
      context,
    ).mergeExtension(const TSwitchThemeData(trackOnColor: Color(0xFF00A870))),
    child: const TCell(
      title: Text('自定义颜色开关'),
      note: SwitchColorExampleStatefulSwitch(initialValue: true),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _buildColor(context);
  }
}

class SwitchColorExampleStatefulSwitch extends StatefulWidget {
  const SwitchColorExampleStatefulSwitch({
    super.key,
    this.initialValue = false,
    this.size,
    this.variant,
    this.openText,
    this.closeText,
  });

  final bool initialValue;
  final TSwitchSize? size;
  final TSwitchVariant? variant;
  final String? openText;
  final String? closeText;

  @override
  State<SwitchColorExampleStatefulSwitch> createState() =>
      SwitchColorExampleStatefulSwitchState();
}

class SwitchColorExampleStatefulSwitchState
    extends State<SwitchColorExampleStatefulSwitch> {
  late bool value = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    return TSwitch(
      value: value,
      size: widget.size,
      variant: widget.variant,
      openText: widget.openText,
      closeText: widget.closeText,
      onChanged: (next) => setState(() => value = next),
    );
  }
}
```

#### 组件状态

##### `SwitchStatusExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SwitchStatusExample extends StatelessWidget {
  const SwitchStatusExample({super.key});

  Widget _buildStatus(BuildContext context) => const Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SwitchStatusExampleSwitchGroupLabel('加载状态'),
      TCellGroup(
        cells: [
          TCell(
            title: Text('加载状态'),
            note: TSwitch(value: false, loading: true),
          ),
          TCell(title: Text('加载状态'), note: TSwitch(value: true, loading: true)),
        ],
      ),
      SwitchStatusExampleSwitchGroupLabel('禁用状态', top: 24),
      TCellGroup(
        cells: [
          TCell(title: Text('禁用状态'), note: TSwitch(value: false)),
          TCell(title: Text('禁用状态'), note: TSwitch(value: true)),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return _buildStatus(context);
  }
}

class SwitchStatusExampleSwitchGroupLabel extends StatelessWidget {
  const SwitchStatusExampleSwitchGroupLabel(
    this.text, {
    super.key,
    this.top = 8,
  });

  final String text;
  final double top;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, top, 16, 16),
      child: TText(
        text,
        font: context.tTheme.fontBodyMedium,
        style: TextStyle(color: context.tTheme.textColorSecondary),
      ),
    );
  }
}
```

#### 组件样式

##### 开关尺寸

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SwitchSizesExample extends StatelessWidget {
  const SwitchSizesExample({super.key});

  Widget _buildSizes(BuildContext context) => const TCellGroup(
    cells: [
      TCell(
        title: Text('大尺寸 32'),
        note: SwitchSizesExampleStatefulSwitch(
          initialValue: true,
          size: TSwitchSize.large,
        ),
      ),
      TCell(
        title: Text('中尺寸 28'),
        note: SwitchSizesExampleStatefulSwitch(initialValue: true),
      ),
      TCell(
        title: Text('小尺寸 24'),
        note: SwitchSizesExampleStatefulSwitch(
          initialValue: true,
          size: TSwitchSize.small,
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return _buildSizes(context);
  }
}

class SwitchSizesExampleStatefulSwitch extends StatefulWidget {
  const SwitchSizesExampleStatefulSwitch({
    super.key,
    this.initialValue = false,
    this.size,
    this.variant,
    this.openText,
    this.closeText,
  });

  final bool initialValue;
  final TSwitchSize? size;
  final TSwitchVariant? variant;
  final String? openText;
  final String? closeText;

  @override
  State<SwitchSizesExampleStatefulSwitch> createState() =>
      SwitchSizesExampleStatefulSwitchState();
}

class SwitchSizesExampleStatefulSwitchState
    extends State<SwitchSizesExampleStatefulSwitch> {
  late bool value = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    return TSwitch(
      value: value,
      size: widget.size,
      variant: widget.variant,
      openText: widget.openText,
      closeText: widget.closeText,
      onChanged: (next) => setState(() => value = next),
    );
  }
}
```

## API

1. [TSwitch](#tswitch)
2. [TSwitchSize](#tswitchsize)
3. [TSwitchVariant](#tswitchvariant)
4. [TSwitchThemeData](#tswitchthemedata)

### TSwitch

#### 构造方法

##### TSwitch

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| closeText | String? | - | text 形态的关闭文案。 null 时显示“关”；仅关闭态文本内容形态使用。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| loading | bool | false | 是否处于加载状态；加载时显示指示器并禁用交互。 | 否 |
| onChanged | ValueChanged<bool>? | - | 开关状态变更回调；为 null 时禁用。 | 否 |
| openText | String? | - | text 形态的开启文案。 null 时显示“开”；仅开启态文本内容形态使用。 | 否 |
| size | TSwitchSize? | - | 开关尺寸；未传时以 `TSwitchSize.medium` 为最小尺寸，文字形态可随内容增长。 显式预设尺寸保持固定，滑块文字适配其内容槽。 | 否 |
| value | bool | - | 受控开关状态。 | 是 |
| variant | TSwitchVariant? | - | 开关内容形态；未传时为 `TSwitchVariant.filled`。 | 否 |

### TSwitchSize

开关尺寸。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| large | TSwitchSize | - | 大尺寸。 | - |
| medium | TSwitchSize | - | 中尺寸。 | - |
| small | TSwitchSize | - | 小尺寸。 | - |

### TSwitchVariant

开关内容形态。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| filled | TSwitchVariant | - | 无滑块内容的填充开关。 | - |
| text | TSwitchVariant | - | 滑块内显示开关文案。 | - |
| icon | TSwitchVariant | - | 滑块内显示开关图标。 | - |

### TSwitchThemeData

TSwitch 组件级 ThemeExtension

通过 Theme 子树注入，控制子树默认样式。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| disabledThumbColor | Color? | - | 禁用或加载时滑块填充色；未设置时随明暗模式取白色层级。 | 否 |
| disabledTrackOffColor | Color? | - | 禁用时关闭态轨道颜色；未设置时使用全局禁用组件背景色。 | 否 |
| disabledTrackOnColor | Color? | - | 禁用时开启态轨道颜色；未设置时使用全局禁用品牌色。 | 否 |
| loadingColor | Color? | - | 加载指示器颜色；未设置时浅色为品牌色、深色为最高层级白色。 | 否 |
| thumbColor | Color? | - | 可交互时滑块填充色；未设置时使用全局反色文字 Token。 与滑块内图标或文字的颜色无关。 | 否 |
| thumbContentOffColor | Color? | - | 关闭态滑块内容颜色。 未配置时使用 textColorDisabled Token。 | 否 |
| thumbContentOffFont | TextStyle? | - | 关闭态滑块内容文本样式。 未配置时使用 fontBodyMedium 字号 Token，Token 为空时回退为 14 逻辑像素。 | 否 |
| thumbContentOnColor | Color? | - | 开启态滑块内容颜色。 未配置时使用 brandColor Token。 | 否 |
| thumbContentOnFont | TextStyle? | - | 开启态滑块内容文本样式。 未配置时使用 fontBodyMedium 字号 Token，Token 为空时回退为 14 逻辑像素。 | 否 |
| trackOffColor | Color? | - | 关闭态轨道颜色。 未配置时使用 bgColorSecondaryContainerActive Token。 | 否 |
| trackOnColor | Color? | - | 开启态轨道颜色。 未配置时使用 brandColor Token。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [推荐/慎用示例](#推荐-慎用示例)

### 何时使用

当需要切换某个功能的开启、关闭时使用。

### 推荐/慎用示例

##### 开关状态的颜色使用建议符合颜色语义，尽量避免让开启、关闭状态的颜色产生混淆。

![](https://tdesign.gtimg.com/site/design/mobile-guide/switch/switch-1.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/switch/switch-2.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 若需结合文本描述开关状态，建议文案和开关状态保持一致，确保表意清晰。

![](https://tdesign.gtimg.com/site/design/mobile-guide/switch/switch-3.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)
