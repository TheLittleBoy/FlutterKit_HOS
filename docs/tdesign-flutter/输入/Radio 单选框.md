# Radio 单选框

> 用于从一组选项中选择一个选项，并呈现选择结果。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/radio)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 纵向单选框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class VerticalRadiosExample extends StatefulWidget {
  const VerticalRadiosExample({super.key});

  @override
  State<VerticalRadiosExample> createState() => _VerticalRadiosExampleState();
}

class _VerticalRadiosExampleState extends State<VerticalRadiosExample> {
  Widget _verticalRadios(BuildContext context) {
    return TRadioGroup<int>.options(
      value: _verticalValue,
      options: _options,
      onChanged: (value) {
        setState(() => _verticalValue = _verticalValue == value ? null : value);
      },
      showDivider: true,
    );
  }

  int? _verticalValue = 1;

  static const _options = [
    TRadioOption(value: 0, label: '单选'),
    TRadioOption(value: 1, label: '单选'),
    TRadioOption(value: 2, label: '单选单选单选单选单选单选单选单选单选单选单选单选单选单选'),
    TRadioOption(
      value: 3,
      label: '单选',
      subTitle: '描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _verticalRadios(context);
  }
}
```

##### 横向单选框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class HorizontalRadiosExample extends StatefulWidget {
  const HorizontalRadiosExample({super.key});

  @override
  State<HorizontalRadiosExample> createState() =>
      _HorizontalRadiosExampleState();
}

class _HorizontalRadiosExampleState extends State<HorizontalRadiosExample> {
  Widget _horizontalRadios(BuildContext context) {
    return Container(
      key: const ValueKey('radio-horizontal-layout'),
      color: context.tTheme.bgColorContainer,
      padding: EdgeInsets.all(context.tTheme.spacer2),
      child: TRadioGroup<int>.options(
        value: _horizontalValue,
        options: _horizontalOptions,
        direction: Axis.horizontal,
        columns: 3,
        variant: TRadioVariant.inline,
        onChanged: (value) => setState(() => _horizontalValue = value),
      ),
    );
  }

  int? _horizontalValue = 0;

  static const _horizontalOptions = [
    TRadioOption(value: 0, label: '单选标题'),
    TRadioOption(value: 1, label: '单选标题'),
    TRadioOption(value: 2, label: '上限四字'),
  ];

  @override
  Widget build(BuildContext context) {
    return _horizontalRadios(context);
  }
}
```

#### 组件状态

##### 单选框状态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DisabledRadiosExample extends StatelessWidget {
  const DisabledRadiosExample({super.key});

  Widget _disabledRadios(BuildContext context) {
    return const TRadioGroup<int>.options(
      value: 0,
      options: [
        TRadioOption(value: 0, label: '单选-已选'),
        TRadioOption(value: 1, label: '单选-未选'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _disabledRadios(context);
  }
}
```

#### 组件样式

##### 勾选样式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class RadioThemesExample extends StatefulWidget {
  const RadioThemesExample({super.key});

  @override
  State<RadioThemesExample> createState() => _RadioThemesExampleState();
}

class _RadioThemesExampleState extends State<RadioThemesExample> {
  Widget _themes(BuildContext context) {
    return Column(
      children: [
        TRadioGroup<bool>(
          value: _lineSelected,
          onChanged: (_) => setState(() => _lineSelected = !_lineSelected),
          child: const TRadio<bool>(
            value: true,
            title: '单选',
            iconType: TRadioIconType.check,
          ),
        ),
        SizedBox(height: context.tTheme.spacer2),
        TRadioGroup<bool>(
          value: _dotSelected,
          onChanged: (_) => setState(() => _dotSelected = !_dotSelected),
          child: const TRadio<bool>(
            value: true,
            title: '单选',
            iconType: TRadioIconType.dot,
          ),
        ),
      ],
    );
  }

  bool _lineSelected = true;

  bool _dotSelected = true;

  @override
  Widget build(BuildContext context) {
    return _themes(context);
  }
}
```

##### 勾选显示位置

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class RadioPositionsExample extends StatefulWidget {
  const RadioPositionsExample({super.key});

  @override
  State<RadioPositionsExample> createState() => _RadioPositionsExampleState();
}

class _RadioPositionsExampleState extends State<RadioPositionsExample> {
  Widget _positions(BuildContext context) {
    return Column(
      children: [
        TRadioGroup<bool>(
          value: _leftSelected,
          onChanged: (_) => setState(() => _leftSelected = !_leftSelected),
          child: const TRadio<bool>(value: true, title: '单选'),
        ),
        SizedBox(height: context.tTheme.spacer2),
        TRadioGroup<bool>(
          value: _rightSelected,
          onChanged: (_) => setState(() => _rightSelected = !_rightSelected),
          child: const TRadio<bool>(
            value: true,
            title: '单选',
            contentDirection: TContentDirection.left,
          ),
        ),
      ],
    );
  }

  bool _leftSelected = true;

  bool _rightSelected = true;

  @override
  Widget build(BuildContext context) {
    return _positions(context);
  }
}
```

##### 非通栏单选样式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class VerticalCardRadiosExample extends StatefulWidget {
  const VerticalCardRadiosExample({super.key});

  @override
  State<VerticalCardRadiosExample> createState() =>
      _VerticalCardRadiosExampleState();
}

class _VerticalCardRadiosExampleState extends State<VerticalCardRadiosExample> {
  Widget _verticalCardRadios(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.tTheme.spacer2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(context.tTheme.radiusExtraLarge),
        child: TRadioGroup<int>.options(
          value: _verticalCardValue,
          options: _cardOptions,
          titleMaxLines: 2,
          onChanged: (value) => setState(() => _verticalCardValue = value),
        ),
      ),
    );
  }

  int? _verticalCardValue = 0;

  static const _cardOptions = [
    TRadioOption(value: 0, label: '单选'),
    TRadioOption(value: 1, label: '单选'),
    TRadioOption(value: 2, label: '单选标题多行单选标题多行单选标题多行单选标题多行单选标题多行'),
  ];

  @override
  Widget build(BuildContext context) {
    return _verticalCardRadios(context);
  }
}
```

#### 特殊样式

##### 纵向卡片单选框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SpecialRadiosExample extends StatefulWidget {
  const SpecialRadiosExample({super.key});

  @override
  State<SpecialRadiosExample> createState() => _SpecialRadiosExampleState();
}

class _SpecialRadiosExampleState extends State<SpecialRadiosExample> {
  Widget _specialRadios(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TRadioGroup<int>.options(
          key: const ValueKey('radio-vertical-card-layout'),
          value: _verticalSpecialCardValue,
          options: _specialVerticalOptions,
          variant: TRadioVariant.card,
          subTitleMaxLines: 1,
          onChanged: (value) =>
              setState(() => _verticalSpecialCardValue = value),
        ),
        SizedBox(height: context.tTheme.spacer3),
        Padding(
          padding: EdgeInsets.fromLTRB(
            context.tTheme.spacer2,
            0,
            context.tTheme.spacer2,
            context.tTheme.spacer2,
          ),
          child: TText(
            '横向卡片单选框',
            style: TextStyle(color: context.tTheme.textColorSecondary),
          ),
        ),
        TRadioGroup<int>.options(
          key: const ValueKey('radio-horizontal-card-layout'),
          value: _horizontalCardValue,
          options: _specialHorizontalOptions,
          direction: Axis.horizontal,
          columns: 3,
          variant: TRadioVariant.card,
          onChanged: (value) => setState(() => _horizontalCardValue = value),
        ),
      ],
    );
  }

  int? _verticalSpecialCardValue = 0;

  static const _specialVerticalOptions = [
    TRadioOption(value: 0, label: '单选', subTitle: '描述信息描述信息描述信息描述信息描述信息'),
    TRadioOption(value: 1, label: '单选', subTitle: '描述信息描述信息描述信息描述信息描述信息'),
    TRadioOption(value: 2, label: '单选', subTitle: '描述信息描述信息描述信息描述信息描述信息'),
  ];

  int? _horizontalCardValue = 0;

  static const _specialHorizontalOptions = [
    TRadioOption(value: 0, label: '单选'),
    TRadioOption(value: 1, label: '单选'),
    TRadioOption(value: 2, label: '单选'),
  ];

  @override
  Widget build(BuildContext context) {
    return _specialRadios(context);
  }
}
```

## API

1. [TRadio](#tradio)
2. [TRadioGroup](#tradiogroup)
3. [TRadioOption](#tradiooption)
4. [TRadioSize](#tradiosize)
5. [TRadioIconType](#tradioicontype)
6. [TRadioVariant](#tradiovariant)
7. [TRadioIconBuilder](#tradioiconbuilder)
8. [TRadioThemeData](#tradiothemedata)

### TRadio

类型参数：`T`

#### 构造方法

##### TRadio

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| contentDirection | TContentDirection | TContentDirection.right | 控件与文案排列方向。 | 否 |
| customIconBuilder | TRadioIconBuilder? | - | 自定义单选框指示器。 | 否 |
| disabled | bool | false | 是否禁用当前选项。 | 否 |
| iconType | TRadioIconType | TRadioIconType.fill | 内置指示器样式；`customIconBuilder` 非空时以自定义指示器为准。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| size | TRadioSize | TRadioSize.medium | 单选框尺寸。 | 否 |
| subTitle | String? | - | 副标题文案。 | 否 |
| subTitleMaxLines | int | 5 | 副标题最大行数，默认 5 行。 | 否 |
| title | String? | - | 主标题文案。 | 否 |
| titleMaxLines | int | 3 | 主标题最大行数，默认 3 行。 | 否 |
| value | T | - | 当前选项值；必须作为同类型 `TRadioGroup` 的后代，选中状态由最近的组控制。 | 是 |
| variant | TRadioVariant | TRadioVariant.block | 完整视觉结构，默认使用通栏结构。 | 否 |

### TRadioGroup

类型参数：`T`

严格受控的单选组。

默认构造通过 `child` 接收调用方布局；标准数据列表使用
`TRadioGroup.options`。组内的 `TRadio` 从该组件读取选中值和变更回调。

#### 构造方法

##### TRadioGroup

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| child | Widget | - | 包含 `TRadio` 的自定义布局。 | 是 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| onChanged | ValueChanged<T>? | - | 启用项被点选时通知其值；重复点选已选项也会通知，不自动去重。 为 null 时整组禁用；父组件须回传新 value 才能改变选中状态。 | 否 |
| value | T? | - | 受控选中值。 | 是 |

##### TRadioGroup.options

使用数据项生成标准布局的单选框组。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| value | T? | - | 受控选中值。 | 是 |
| options | List<TRadioOption<T>> | - | 单选框数据项。 | 是 |
| onChanged | ValueChanged<T>? | - | 启用项被点选时通知其值；重复点选已选项也会通知，不自动去重。 为 null 时整组禁用；父组件须回传新 value 才能改变选中状态。 | 否 |
| direction | Axis | Axis.vertical | 排列方向，默认纵向。 | 否 |
| columns | int | 1 | 每行列数，默认 1，必须大于 0。 横向 `TRadioVariant.inline` 按内容自然收缩并在行内两端对齐， 不使用该列数等分宽度。 | 否 |
| variant | TRadioVariant | TRadioVariant.block | 生成项的完整视觉结构，默认 `TRadioVariant.block`。 | 否 |
| showDivider | bool? | - | 是否显示项间分割线。 为空时仅 `TRadioVariant.block` 默认显示；非 block 结构不能设为 true。 | 否 |
| contentDirection | TContentDirection | TContentDirection.right | 控件与文案排列方向，默认文案在指示器右侧。 | 否 |
| size | TRadioSize | TRadioSize.medium | 单选框尺寸，默认 `TRadioSize.medium`。 | 否 |
| iconType | TRadioIconType | TRadioIconType.fill | 内置指示器样式，默认 `TRadioIconType.fill`。 | 否 |
| titleMaxLines | int | 3 | 主标题最大行数，默认 3 行。 | 否 |
| subTitleMaxLines | int | 5 | 副标题最大行数，默认 5 行。 | 否 |

### TRadioOption

类型参数：`T`

单选框组的数据项。

#### 构造方法

##### TRadioOption

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| disabled | bool | false | 是否禁用该项。 | 否 |
| label | String | - | 主文案。 | 是 |
| subTitle | String? | - | 副文案。 | 否 |
| value | T | - | 选项值。 | 是 |

### TRadioSize

单选框指示器尺寸。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| small | TRadioSize | - | 小尺寸。 | - |
| medium | TRadioSize | - | 中尺寸。 | - |
| large | TRadioSize | - | 大尺寸。 | - |

### TRadioIconType

单选框内置指示器样式。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| dot | TRadioIconType | - | 圆环内显示实心圆点。 | - |
| check | TRadioIconType | - | 选中时显示勾选标记。 | - |
| fill | TRadioIconType | - | 选中时显示带反色勾选标记的实心圆。 | - |

### TRadioVariant

单选框的完整视觉结构。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| inline | TRadioVariant | - | 行内结构，不绘制通栏背景、外围内边距或标准块高。 | - |
| block | TRadioVariant | - | 通栏结构，使用标准块高、容器背景和外围内边距。 | - |
| card | TRadioVariant | - | 卡片结构。 | - |

### TRadioIconBuilder

自定义单选框指示器构建器。

位置参数：`context, selected, disabled`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 单选框指示器的构建上下文。 | 是 |
| selected | bool | - | 当前选项是否选中。 | 是 |
| disabled | bool | - | 当前选项是否禁用。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Widget | - | 替换内置单选指示器的组件。 | - |

### TRadioThemeData

TRadio 组件级 ThemeExtension

通过 Theme 子树注入，控制子树默认样式。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 卡片背景颜色。 卡片模式下生效；null 时使用 bgColorContainer Token。 | 否 |
| disableColor | Color? | - | 禁用态颜色。 null 时选中禁用态使用 brandColorDisabled，未选中禁用态描边使用 componentBorder Token。 | 否 |
| insetSpacing | double? | - | 文案与非指示器侧的内边距。 null 时使用 spacer2 Token。 | 否 |
| selectColor | Color? | - | 选中态颜色。 null 时使用 brandColor Token。 | 否 |
| spacing | double? | - | 指示器与文案间距。 null 时使用 spacer Token。 | 否 |
| subTitleColor | Color? | - | 副标题颜色。 启用态 null 时使用 textColorSecondary Token；禁用态始终使用 textColorDisabled。 | 否 |
| titleColor | Color? | - | 主标题颜色。 启用态 null 时使用 textColorPrimary Token；禁用态始终使用 textColorDisabled。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [推荐/慎用示例](#推荐-慎用示例)
4. [相似组件](#相似组件)

### 何时使用

当用户需要从一组数据选择一个选项时使用。

### 组件搭配使用

##### 单选框与[索引](<../导航/Indexes 索引.md>)、[搜索框](<Search 搜索框.md>)组合使用，便于用户从大量的选项中，快速地找到目标选项。

![](https://tdesign.gtimg.com/site/design/mobile-guide/radio/radio-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/radio/radio-2.png)

### 推荐/慎用示例

##### 带有详情信息的选项，建议就近展开相关内容，不太建议用单选框触发一个弹窗。

![](https://tdesign.gtimg.com/site/design/mobile-guide/radio/radio-3.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/radio/radio-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 不建议用单选框开启/关闭一个功能，建议使用开关组件。

![](https://tdesign.gtimg.com/site/design/mobile-guide/radio/radio-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/radio/radio-6.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [多选框](<CheckBox 多选框.md>) | 当用户需要从一组数据选择多个选项时使用。 |
