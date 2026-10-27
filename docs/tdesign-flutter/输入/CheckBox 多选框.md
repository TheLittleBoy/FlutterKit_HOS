# CheckBox 多选框

> 用于预设的一组选项中执行多项选择，并呈现选择结果。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/checkbox)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 纵向多选框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class VerticalCheckboxExample extends StatefulWidget {
  const VerticalCheckboxExample({super.key});

  @override
  State<VerticalCheckboxExample> createState() =>
      _VerticalCheckboxExampleState();
}

class _VerticalCheckboxExampleState extends State<VerticalCheckboxExample> {
  Widget _verticalCheckbox(BuildContext context) {
    return Theme(
      data: Theme.of(context).mergeExtension(
        const TCheckboxThemeData(variant: TCheckboxVariant.circle),
      ),
      child: Column(
        children: [
          for (var index = 0; index < _verticalOptions.length; index++)
            TCheckbox(
              value: _verticalValue.contains(_verticalOptions[index].value),
              title: _verticalOptions[index].label,
              subTitle: _verticalOptions[index].subTitle,
              titleMaxLines: index == 2 ? 2 : 1,
              subTitleMaxLines: index == 3 ? 2 : 1,
              showDivider: index < _verticalOptions.length - 1,
              onChanged: (_) => _toggleVertical(_verticalOptions[index].value),
            ),
        ],
      ),
    );
  }

  static const _verticalOptions = [
    TCheckboxOption(value: 'a', label: '多选'),
    TCheckboxOption(value: 'b', label: '多选'),
    TCheckboxOption(value: 'c', label: '多选标题多行多选标题多行多选标题多行多选标题多行多选标题多行多选标题多行'),
    TCheckboxOption(
      value: 'd',
      label: '多选',
      subTitle: '描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息描述信息',
    ),
  ];

  List<String> _verticalValue = ['a', 'b'];

  void _toggleVertical(String value) {
    setState(() {
      _verticalValue = _verticalValue.contains(value)
          ? _verticalValue.where((item) => item != value).toList()
          : [..._verticalValue, value];
    });
  }

  @override
  Widget build(BuildContext context) {
    return _verticalCheckbox(context);
  }
}
```

##### 横向多选框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class HorizontalCheckboxExample extends StatefulWidget {
  const HorizontalCheckboxExample({super.key});

  @override
  State<HorizontalCheckboxExample> createState() =>
      _HorizontalCheckboxExampleState();
}

class _HorizontalCheckboxExampleState extends State<HorizontalCheckboxExample> {
  Widget _horizontalCheckbox(BuildContext context) {
    return Theme(
      data: Theme.of(context).mergeExtension(
        const TCheckboxThemeData(
          variant: TCheckboxVariant.circle,
          customSpace: EdgeInsets.symmetric(vertical: 8),
        ),
      ),
      child: ColoredBox(
        color: context.tTheme.bgColorContainer,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (final option in _horizontalOptions)
                TCheckbox(
                  value: _horizontalValue.contains(option.value),
                  title: option.label,
                  showDivider: false,
                  onChanged: (_) => _toggleHorizontal(option.value),
                ),
            ],
          ),
        ),
      ),
    );
  }

  static const _horizontalOptions = [
    TCheckboxOption(value: 'a', label: '多选标题'),
    TCheckboxOption(value: 'b', label: '多选标题'),
    TCheckboxOption(value: 'c', label: '上限四字'),
  ];

  List<String> _horizontalValue = ['a', 'b'];

  void _toggleHorizontal(String value) {
    setState(() {
      _horizontalValue = _horizontalValue.contains(value)
          ? _horizontalValue.where((item) => item != value).toList()
          : [..._horizontalValue, value];
    });
  }

  @override
  Widget build(BuildContext context) {
    return _horizontalCheckbox(context);
  }
}
```

##### 带全选多选框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CheckboxCheckAllExample extends StatefulWidget {
  const CheckboxCheckAllExample({super.key});

  @override
  State<CheckboxCheckAllExample> createState() =>
      _CheckboxCheckAllExampleState();
}

class _CheckboxCheckAllExampleState extends State<CheckboxCheckAllExample> {
  Widget _checkAll(BuildContext context) {
    final enabledValues = _checkAllOptions
        .map((option) => option.value)
        .toList();
    final allSelected = _checkAllValue.length == enabledValues.length;
    return Theme(
      data: Theme.of(context).mergeExtension(
        const TCheckboxThemeData(variant: TCheckboxVariant.circle),
      ),
      child: Column(
        children: [
          TCheckbox(
            value: allSelected
                ? true
                : _checkAllValue.isEmpty
                ? false
                : null,
            title: '全选',
            onChanged: (checked) {
              setState(() {
                _checkAllValue = checked == true ? enabledValues : [];
              });
            },
            showDivider: true,
          ),
          TCheckboxGroup<String>(
            value: _checkAllValue,
            options: _checkAllOptions,
            showDivider: true,
            onChanged: (value) => setState(() => _checkAllValue = value),
          ),
        ],
      ),
    );
  }

  static const _checkAllOptions = [
    TCheckboxOption(value: 'a', label: '多选'),
    TCheckboxOption(value: 'b', label: '多选'),
    TCheckboxOption(
      value: 'c',
      label: '多选',
      subTitle: '单选描述信息单选描述信息单选描述信息单选描述信息单选描述信息单选描述信息单选描述信息',
    ),
  ];

  List<String> _checkAllValue = ['a', 'b', 'c'];

  @override
  Widget build(BuildContext context) {
    return _checkAll(context);
  }
}
```

#### 组件状态

##### 多选框状态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DisabledCheckboxExample extends StatelessWidget {
  const DisabledCheckboxExample({super.key});

  Widget _disabledCheckbox(BuildContext context) {
    return Theme(
      data: Theme.of(context).mergeExtension(
        const TCheckboxThemeData(variant: TCheckboxVariant.circle),
      ),
      child: const Column(
        children: [
          TCheckbox(value: true, title: '选项禁用-已选'),
          TCheckbox(value: false, title: '选项禁用-默认', showDivider: false),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _disabledCheckbox(context);
  }
}
```

#### 组件样式

##### 勾选样式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CheckboxVariantsExample extends StatefulWidget {
  const CheckboxVariantsExample({super.key});

  @override
  State<CheckboxVariantsExample> createState() =>
      _CheckboxVariantsExampleState();
}

class _CheckboxVariantsExampleState extends State<CheckboxVariantsExample> {
  Widget _variants(BuildContext context) {
    return Column(
      children: [
        for (final (index, entry) in const [
          (TCheckboxVariant.check, '多选'),
          (TCheckboxVariant.square, '多选'),
        ].indexed) ...[
          Theme(
            data: Theme.of(
              context,
            ).mergeExtension(TCheckboxThemeData(variant: entry.$1)),
            child: TCheckbox(
              value: _variantValues[entry.$1],
              title: entry.$2,
              onChanged: (value) {
                setState(() => _variantValues[entry.$1] = value == true);
              },
            ),
          ),
          if (index == 0) const SizedBox(height: 16),
        ],
      ],
    );
  }

  final Map<TCheckboxVariant, bool> _variantValues = {
    TCheckboxVariant.square: true,
    TCheckboxVariant.check: true,
  };

  @override
  Widget build(BuildContext context) {
    return _variants(context);
  }
}
```

##### 勾选显示位置

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CheckboxPositionsExample extends StatefulWidget {
  const CheckboxPositionsExample({super.key});

  @override
  State<CheckboxPositionsExample> createState() =>
      _CheckboxPositionsExampleState();
}

class _CheckboxPositionsExampleState extends State<CheckboxPositionsExample> {
  Widget _positions(BuildContext context) {
    return Theme(
      data: Theme.of(context).mergeExtension(
        const TCheckboxThemeData(variant: TCheckboxVariant.circle),
      ),
      child: Column(
        children: [
          TCheckbox(
            value: _leftPositionValue,
            title: '多选',
            onChanged: (value) {
              setState(() => _leftPositionValue = value == true);
            },
          ),
          const SizedBox(height: 16),
          TCheckbox(
            value: _rightPositionValue,
            title: '多选',
            contentDirection: TContentDirection.left,
            onChanged: (value) {
              setState(() => _rightPositionValue = value == true);
            },
          ),
        ],
      ),
    );
  }

  bool _leftPositionValue = true;

  bool _rightPositionValue = true;

  @override
  Widget build(BuildContext context) {
    return _positions(context);
  }
}
```

##### 非通栏多选样式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class NonFullWidthCheckboxExample extends StatefulWidget {
  const NonFullWidthCheckboxExample({super.key});

  @override
  State<NonFullWidthCheckboxExample> createState() =>
      _NonFullWidthCheckboxExampleState();
}

class _NonFullWidthCheckboxExampleState
    extends State<NonFullWidthCheckboxExample> {
  Widget _nonFullWidthCheckbox(BuildContext context) {
    return Theme(
      data: Theme.of(context).mergeExtension(
        const TCheckboxThemeData(variant: TCheckboxVariant.circle),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(context.tTheme.radiusExtraLarge),
          child: TCheckboxGroup<String>(
            value: _nonFullWidthValue,
            options: _nonFullWidthOptions,
            showDivider: true,
            onChanged: (value) => setState(() => _nonFullWidthValue = value),
          ),
        ),
      ),
    );
  }

  List<String> _nonFullWidthValue = ['a', 'b'];

  static const _nonFullWidthOptions = [
    TCheckboxOption(value: 'a', label: '多选'),
    TCheckboxOption(value: 'b', label: '多选'),
    TCheckboxOption(value: 'c', label: '多选标题多行多选标题多行多选标题多行多选标题多行多选标题多行多选标题'),
  ];

  @override
  Widget build(BuildContext context) {
    return _nonFullWidthCheckbox(context);
  }
}
```

#### 特殊样式

##### 纵向卡片多选框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CardCheckboxesExample extends StatefulWidget {
  const CardCheckboxesExample({super.key});

  @override
  State<CardCheckboxesExample> createState() => _CardCheckboxesExampleState();
}

class _CardCheckboxesExampleState extends State<CardCheckboxesExample> {
  Widget _cardCheckboxes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TCheckboxGroup<String>(
          value: _verticalCardValue,
          options: _verticalCardOptions,
          cardMode: true,
          onChanged: (value) => setState(() => _verticalCardValue = value),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: TText(
            '横向卡片多选框',
            font: context.tTheme.fontBodyMedium,
            style: TextStyle(color: context.tTheme.textColorSecondary),
          ),
        ),
        TCheckboxGroup<String>(
          value: _horizontalCardValue,
          options: _horizontalCardOptions,
          direction: Axis.horizontal,
          columns: 3,
          cardMode: true,
          onChanged: (value) => setState(() => _horizontalCardValue = value),
        ),
      ],
    );
  }

  List<String> _verticalCardValue = ['a', 'b'];

  static const _verticalCardOptions = [
    TCheckboxOption(value: 'a', label: '多选', subTitle: '描述信息描述信息描述信息描述信息描述信息'),
    TCheckboxOption(value: 'b', label: '多选', subTitle: '描述信息描述信息描述信息描述信息描述信息'),
    TCheckboxOption(value: 'c', label: '多选', subTitle: '描述信息描述信息描述信息描述信息描述信息'),
  ];

  List<String> _horizontalCardValue = ['a', 'b'];

  static const _horizontalCardOptions = [
    TCheckboxOption(value: 'a', label: '多选'),
    TCheckboxOption(value: 'b', label: '多选'),
    TCheckboxOption(value: 'c', label: '多选'),
  ];

  @override
  Widget build(BuildContext context) {
    return _cardCheckboxes(context);
  }
}
```

## API

1. [TCheckbox](#tcheckbox)
2. [TCheckboxGroup](#tcheckboxgroup)
3. [TCheckboxOption](#tcheckboxoption)
4. [TContentDirection](#tcontentdirection)
5. [TCheckboxSize](#tcheckboxsize)
6. [TCheckboxVariant](#tcheckboxvariant)
7. [TCheckboxIconBuilder](#tcheckboxiconbuilder)
8. [TCheckboxOptionBuilder](#tcheckboxoptionbuilder)
9. [TCheckboxThemeData](#tcheckboxthemedata)

### TCheckbox

#### 构造方法

##### TCheckbox

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| cardMode | bool | false | 是否使用卡片模式。 | 否 |
| contentDirection | TContentDirection | TContentDirection.right | 控件与文案排列方向。 | 否 |
| customIconBuilder | TCheckboxIconBuilder? | - | 自定义复选框指示器。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| onChanged | ValueChanged<bool?>? | - | 选中态变更回调；为 null 时禁用。 | 否 |
| showDivider | bool | true | 普通模式是否显示底部分割线，默认显示；卡片模式不显示。 | 否 |
| size | TCheckboxSize | TCheckboxSize.medium | 复选框尺寸。 | 否 |
| subTitle | String? | - | 副标题文案。 | 否 |
| subTitleMaxLines | int | 5 | 副标题最大行数，默认 5 行。 | 否 |
| title | String? | - | 主标题文案。 | 否 |
| titleMaxLines | int | 3 | 主标题最大行数，默认 3 行。 | 否 |
| value | bool? | - | 受控选中态；null 表示半选。 | 是 |

### TCheckboxGroup

类型参数：`T`

数据驱动且严格受控的复选框组。

#### 构造方法

##### TCheckboxGroup

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| cardMode | bool | false | 是否使用卡片模式。 | 否 |
| columns | int | 1 | 每行列数，必须大于 0。 | 否 |
| contentDirection | TContentDirection | TContentDirection.right | 控件与文案排列方向。 | 否 |
| direction | Axis | Axis.vertical | 排列方向。 | 否 |
| itemBuilder | TCheckboxOptionBuilder<T>? | - | 自定义数据项视觉；交互仍由组接管。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| maxSelected | int? | - | 最多可选数量。 null 时不限制；达到上限后阻止新增选择，但仍允许取消。设为 0 时不能新增选择。 | 否 |
| onChanged | ValueChanged<List<T>>? | - | 选中项列表变更回调；为 null 时整组禁用。 回调提供完整选中列表，按 options 的顺序排列；父组件需回传新的 value。 | 否 |
| onMaxSelected | VoidCallback? | - | 超过最多可选数量时触发。 | 否 |
| options | List<TCheckboxOption<T>> | - | 复选框数据项。 | 是 |
| showDivider | bool | true | 普通模式是否显示项间分割线，默认显示；卡片模式不显示。 | 否 |
| size | TCheckboxSize | TCheckboxSize.medium | 复选框尺寸。 | 否 |
| value | List<T> | - | 受控选中项列表。 | 是 |

### TCheckboxOption

类型参数：`T`

复选框组的数据项。

#### 构造方法

##### TCheckboxOption

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| disabled | bool | false | 是否禁用该项。 | 否 |
| label | String | - | 主文案。 | 是 |
| subTitle | String? | - | 副文案。 | 否 |
| value | T | - | 选项值。 | 是 |

### TContentDirection

选择控件相对于文案的排列方向。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| left | TContentDirection | - | 控件位于文案右侧。 | - |
| right | TContentDirection | - | 控件位于文案左侧。 | - |

### TCheckboxSize

复选框指示器尺寸。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| small | TCheckboxSize | - | 小尺寸。 | - |
| medium | TCheckboxSize | - | 中尺寸。 | - |
| large | TCheckboxSize | - | 大尺寸。 | - |

### TCheckboxVariant

复选框指示器的视觉变体。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| circle | TCheckboxVariant | - | 圆形指示器。 | - |
| square | TCheckboxVariant | - | 方形指示器。 | - |
| check | TCheckboxVariant | - | 仅显示勾选或半选图标。 | - |

### TCheckboxIconBuilder

自定义复选框指示器构建器。

位置参数：`context, value, disabled`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 复选框指示器的构建上下文。 | 是 |
| value | bool? | - | 当前选中状态；null 表示半选。 | 是 |
| disabled | bool | - | 当前复选框是否禁用。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Widget | - | 替换内置指示器的组件。 | - |

### TCheckboxOptionBuilder

类型参数：`T`

自定义复选框组数据项构建器。

位置参数：`context, option, selected, disabled`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 复选框组选项的构建上下文。 | 是 |
| option | TCheckboxOption<T> | - | 当前数据项。 | 是 |
| selected | bool | - | 当前数据项是否选中。 | 是 |
| disabled | bool | - | 当前数据项是否禁用。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Widget | - | 当前数据项的自定义内容。 | - |

### TCheckboxThemeData

TCheckbox 组件级 ThemeExtension

通过 Theme 子树注入，控制子树默认样式。
被 TCheckbox 和 TCheckboxGroup 共用。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 卡片背景颜色。 卡片模式下生效；null 时使用 bgColorContainer Token。 | 否 |
| customSpace | EdgeInsetsGeometry? | - | 内容区域内边距。 null 时按是否有文案、卡片模式及当前字号计算内边距；纯指示器不增加文案内边距。 | 否 |
| disableColor | Color? | - | 禁用态指示器的前景色；未选时用于描边色。 | 否 |
| insetSpacing | double? | - | 文案与非指示器侧的内边距。 null 时使用 spacer2 Token。 | 否 |
| selectColor | Color? | - | 选中态颜色。 null 时使用 brandColor Token。 | 否 |
| spacing | double? | - | 指示器与文案间距。 null 时使用 spacer Token。 | 否 |
| subTitleColor | Color? | - | 副标题颜色。 启用态 null 时使用 textColorSecondary Token；禁用态始终使用 textColorDisabled。 | 否 |
| titleColor | Color? | - | 主标题颜色。 启用态 null 时使用 textColorPrimary Token；禁用态始终使用 textColorDisabled。 | 否 |
| variant | TCheckboxVariant? | - | 复选框指示器的默认视觉变体；未设置时使用圆形。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [推荐/慎用示例](#推荐-慎用示例)
4. [相似组件](#相似组件)

### 何时使用

当用户需要从一组数据选择多个选项时使用。

### 组件搭配使用

##### 多选框与[索引](<../导航/Indexes 索引.md>)、[搜索框](<Search 搜索框.md>)组合使用，便于用户从大量的选项中，快速地找到目标选项。

![](https://tdesign.gtimg.com/site/design/mobile-guide/check-box/check-box-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/check-box/check-box-2.png)

### 推荐/慎用示例

##### 带有详情信息的选项，建议就近展开相关内容，不建议在触发一个弹窗。

![](https://tdesign.gtimg.com/site/design/mobile-guide/check-box/check-box-3.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/check-box/check-box-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 在选项较多的场景下执行多选时，建议展示用户已选数量。

![](https://tdesign.gtimg.com/site/design/mobile-guide/check-box/check-box-5.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [单选框](<Radio 单选框.md>) | 当用户需要从一组数据选择一个选项时使用。 |
