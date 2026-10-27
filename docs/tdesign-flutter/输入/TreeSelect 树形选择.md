# TreeSelect 树形选择

> 适用于选择树形的数据结构

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/tree-select)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 基础树形选择器

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// 在已配置 TDesign 主题的应用中使用 `TreeSelectSingleExample()`。
class TreeSelectSingleExample extends StatefulWidget {
  const TreeSelectSingleExample({super.key});

  @override
  State<TreeSelectSingleExample> createState() =>
      _TreeSelectSingleExampleState();
}

class _TreeSelectSingleExampleState extends State<TreeSelectSingleExample> {
  static const _options = [
    TTreeSelectOption(
      label: '甘肃省',
      value: 'gansu',
      children: [TTreeSelectOption(label: '兰州市', value: 'lanzhou')],
    ),
    TTreeSelectOption(
      label: '广东省',
      value: 'guangdong',
      children: [
        TTreeSelectOption(label: '汕头市', value: 'shantou'),
        TTreeSelectOption(label: '汕尾市', value: 'shanwei'),
        TTreeSelectOption(label: '韶关市', value: 'shaoguan'),
        TTreeSelectOption(label: '深圳市', value: 'shenzhen'),
        TTreeSelectOption(label: '阳江市', value: 'yangjiang'),
        TTreeSelectOption(label: '云浮市', value: 'yunfu'),
      ],
    ),
    TTreeSelectOption(
      label: '贵州省',
      value: 'guizhou',
      children: [TTreeSelectOption(label: '贵阳市', value: 'guiyang')],
    ),
    TTreeSelectOption(
      label: '海南省',
      value: 'hainan',
      children: [TTreeSelectOption(label: '海口市', value: 'haikou')],
    ),
    TTreeSelectOption(
      label: '河北省',
      value: 'hebei',
      children: [TTreeSelectOption(label: '石家庄市', value: 'shijiazhuang')],
    ),
    TTreeSelectOption(
      label: '黑龙江省',
      value: 'heilongjiang',
      children: [TTreeSelectOption(label: '哈尔滨市', value: 'haerbin')],
    ),
  ];

  List<List<Object?>> _value = const [
    ['guangdong', 'shanwei'],
  ];

  @override
  Widget build(BuildContext context) => TTreeSelect(
    key: const ValueKey('tree-select-single'),
    options: _options,
    value: _value,
    onChanged: (value) => setState(() => _value = value),
  );
}
```

##### 多选树形选择器

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// 在已配置 TDesign 主题的应用中使用 `TreeSelectMultipleExample()`。
class TreeSelectMultipleExample extends StatefulWidget {
  const TreeSelectMultipleExample({super.key});

  @override
  State<TreeSelectMultipleExample> createState() =>
      _TreeSelectMultipleExampleState();
}

class _TreeSelectMultipleExampleState extends State<TreeSelectMultipleExample> {
  static const _options = [
    TTreeSelectOption(
      label: '甘肃省',
      value: 'gansu',
      children: [TTreeSelectOption(label: '兰州市', value: 'lanzhou')],
    ),
    TTreeSelectOption(
      label: '广东省',
      value: 'guangdong',
      children: [
        TTreeSelectOption(label: '汕头市', value: 'shantou'),
        TTreeSelectOption(label: '汕尾市', value: 'shanwei'),
        TTreeSelectOption(label: '韶关市', value: 'shaoguan'),
        TTreeSelectOption(label: '深圳市', value: 'shenzhen'),
        TTreeSelectOption(label: '阳江市', value: 'yangjiang'),
        TTreeSelectOption(label: '云浮市', value: 'yunfu'),
      ],
    ),
    TTreeSelectOption(
      label: '贵州省',
      value: 'guizhou',
      children: [TTreeSelectOption(label: '贵阳市', value: 'guiyang')],
    ),
    TTreeSelectOption(
      label: '海南省',
      value: 'hainan',
      children: [TTreeSelectOption(label: '海口市', value: 'haikou')],
    ),
    TTreeSelectOption(
      label: '河北省',
      value: 'hebei',
      children: [TTreeSelectOption(label: '石家庄市', value: 'shijiazhuang')],
    ),
    TTreeSelectOption(
      label: '黑龙江省',
      value: 'heilongjiang',
      children: [TTreeSelectOption(label: '哈尔滨市', value: 'haerbin')],
    ),
  ];

  List<List<Object?>> _value = const [
    ['guangdong', 'shanwei'],
  ];

  @override
  Widget build(BuildContext context) => TTreeSelect(
    key: const ValueKey('tree-select-multiple'),
    options: _options,
    value: _value,
    multiple: true,
    onChanged: (value) => setState(() => _value = value),
  );
}
```

#### 组件状态

##### 树形选择器-三列

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// 在已配置 TDesign 主题的应用中使用 `TreeSelectThreeColumnsExample()`。
class TreeSelectThreeColumnsExample extends StatefulWidget {
  const TreeSelectThreeColumnsExample({super.key});

  @override
  State<TreeSelectThreeColumnsExample> createState() =>
      _TreeSelectThreeColumnsExampleState();
}

class _TreeSelectThreeColumnsExampleState
    extends State<TreeSelectThreeColumnsExample> {
  static const _options = [
    TTreeSelectOption(
      label: '甘肃省',
      value: 'gansu',
      children: [
        TTreeSelectOption(
          label: '兰州市',
          value: 'lanzhou',
          children: [TTreeSelectOption(label: '城关区', value: 'chengguan')],
        ),
      ],
    ),
    TTreeSelectOption(
      label: '广东省',
      value: 'guangdong',
      children: [
        TTreeSelectOption(
          label: '汕头市',
          value: 'shantou',
          children: [TTreeSelectOption(label: '金平区', value: 'jinping')],
        ),
        TTreeSelectOption(
          label: '汕尾市',
          value: 'shanwei',
          children: [TTreeSelectOption(label: '城区', value: 'chengqu')],
        ),
        TTreeSelectOption(
          label: '韶关市',
          value: 'shaoguan',
          children: [TTreeSelectOption(label: '浈江区', value: 'zhenjiang')],
        ),
        TTreeSelectOption(
          label: '深圳市',
          value: 'shenzhen',
          children: [
            TTreeSelectOption(label: '龙华区', value: 'longhua'),
            TTreeSelectOption(label: '罗湖区', value: 'luohu'),
            TTreeSelectOption(label: '南山区', value: 'nanshan'),
            TTreeSelectOption(label: '坪山区', value: 'pingshan'),
            TTreeSelectOption(label: '其它区', value: 'other'),
            TTreeSelectOption(label: '盐田区', value: 'yantian'),
          ],
        ),
        TTreeSelectOption(
          label: '阳江市',
          value: 'yangjiang',
          children: [TTreeSelectOption(label: '江城区', value: 'jiangcheng')],
        ),
        TTreeSelectOption(
          label: '云浮市',
          value: 'yunfu',
          children: [TTreeSelectOption(label: '云城区', value: 'yuncheng')],
        ),
      ],
    ),
    TTreeSelectOption(
      label: '贵州省',
      value: 'guizhou',
      children: [
        TTreeSelectOption(
          label: '贵阳市',
          value: 'guiyang',
          children: [TTreeSelectOption(label: '南明区', value: 'nanming')],
        ),
      ],
    ),
    TTreeSelectOption(
      label: '海南省',
      value: 'hainan',
      children: [
        TTreeSelectOption(
          label: '海口市',
          value: 'haikou',
          children: [TTreeSelectOption(label: '秀英区', value: 'xiuying')],
        ),
      ],
    ),
    TTreeSelectOption(
      label: '河北省',
      value: 'hebei',
      children: [
        TTreeSelectOption(
          label: '石家庄市',
          value: 'shijiazhuang',
          children: [TTreeSelectOption(label: '长安区', value: 'changan')],
        ),
      ],
    ),
    TTreeSelectOption(
      label: '黑龙江省',
      value: 'heilongjiang',
      children: [
        TTreeSelectOption(
          label: '哈尔滨市',
          value: 'haerbin',
          children: [TTreeSelectOption(label: '道里区', value: 'daoli')],
        ),
      ],
    ),
  ];

  List<List<Object?>> _value = const [
    ['guangdong', 'shenzhen', 'nanshan'],
  ];

  @override
  Widget build(BuildContext context) => TTreeSelect(
    key: const ValueKey('tree-select-three-columns'),
    options: _options,
    value: _value,
    onChanged: (value) => setState(() => _value = value),
  );
}
```

## API

1. [TTreeSelect](#ttreeselect)
2. [TTreeSelectOption](#ttreeselectoption)
3. [TTreeSelectThemeData](#ttreeselectthemedata)

### TTreeSelect

#### 构造方法

##### TTreeSelect

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| multiple | bool | false | 是否允许选择多个叶子节点。 为 false 时，`value` 最多包含一条路径。 | 否 |
| onChanged | ValueChanged<List<List<Object?>>>? | - | 选中路径变化回调；为 null 时禁用。 | 否 |
| options | List<TTreeSelectOption> | - | 根选项。 | 是 |
| value | List<List<Object?>> | - | 受控选中路径。 每一项应为从根到叶子的完整 `TTreeSelectOption.value` 路径。 暂时无法在 `options` 中解析到叶子的路径不会显示选中态。 组件会回退到首个可用分支。单选模式最多传入一条，多选模式可传入多条且不得重复。 | 是 |

### TTreeSelectOption

不可变的树形选择选项。

#### 构造方法

##### TTreeSelectOption

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| children | List<TTreeSelectOption> | const [] | 子选项。 | 否 |
| disabled | bool | false | 是否禁用。 | 否 |
| label | String | - | 展示文案。 | 是 |
| value | Object? | - | 业务值；同一层级的选项必须保持唯一。 值可为 null，但同一层级最多只能有一个 null 值。 | 是 |

### TTreeSelectThemeData

TTreeSelect 组件级 ThemeExtension。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 面板背景色。 null 时使用 bgColorContainer Token。 | 否 |
| columnWidth | double? | - | 所有非根列的固定宽度；为 null 时由组件按可用宽度自动布局。 设置后每个非根列均使用该宽度，面板总宽度超过可用宽度时可横向滚动。 | 否 |
| disabledTextStyle | TextStyle? | - | 禁用文案样式。 null 时沿用默认文字样式并使用 textColorDisabled Token。 | 否 |
| height | double? | - | 面板高度。 未配置时为 336 逻辑像素。 | 否 |
| indicatorColor | Color? | - | 选中图标颜色。 null 时使用 brandColor Token。 | 否 |
| itemHeight | double? | - | 单项最小高度。 未配置时为 56 逻辑像素。 | 否 |
| rootBackgroundColor | Color? | - | 根列背景色。 null 时使用 bgColorSecondaryContainer Token。 | 否 |
| rootColumnWidth | double? | - | 根列宽度。 未配置时为 103 逻辑像素。 | 否 |
| selectedBackgroundColor | Color? | - | 选中项背景色。 null 时使用 bgColorContainer Token。 | 否 |
| selectedTextStyle | TextStyle? | - | 选中文案样式。 | 否 |
| textStyle | TextStyle? | - | 普通文案样式。 null 时使用当前全局 Token 解析的文字样式。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [推荐/慎用示例](#推荐-慎用示例)
3. [相似组件](#相似组件)

### 何时使用

当一组选项由2-3个层级构成，且每个层级有大量的选项需要用户逐级选择时使用。

### 推荐/慎用示例

##### 级联选择器的层级不宜超过3层，层级过多时应调整数据结构或改用级联选择器。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tree-select/tree-select-1.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [选择器](<Picker 选择器.md>) | 当需要在有限的空间展示大量选项供用户选择时，或一组选项由递进层级构成，需要用户逐级选择使用时。 |
| [级联选择器](<Cascader 级联选择器.md>) | 当一组选项由递进层级构成，且有每个层级有大量的选项需要用户逐级选择使用时。 |
