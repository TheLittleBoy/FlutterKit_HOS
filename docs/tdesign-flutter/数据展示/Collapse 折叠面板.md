# Collapse 折叠面板

> 可以折叠/展开的内容区域。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/collapse)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 基础折叠面板

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class BasicCollapseExample extends StatefulWidget {
  const BasicCollapseExample({super.key});

  @override
  State<BasicCollapseExample> createState() => _BasicCollapseExampleState();
}

class _BasicCollapseExampleState extends State<BasicCollapseExample> {
  /// 核心片段：导入 material.dart 和 tdesign_flutter.dart，并放入
  /// StatefulWidget 的 State。`_basicValue` 是由 State 持有的展开值列表，
  /// 初始包含唯一面板值；`onChanged` 通过 `setState` 写回完整列表。
  /// `randomString` 是页面级常量，仅作为面板正文示例。
  Widget _buildBasicCollapse(BuildContext context) {
    return TCollapse<String>(
      value: _basicValue,
      onChanged: (value) => setState(() => _basicValue = value),
      children: [
        TCollapsePanel<String>(
          value: 'basic',
          headerBuilder: (context, isExpanded) => const Text('折叠面板标题'),
          body: const Text(randomString),
        ),
      ],
    );
  }

  List<String> _basicValue = const ['basic'];

  @override
  Widget build(BuildContext context) {
    return _buildBasicCollapse(context);
  }
}

const String randomString =
    '此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容';
```

##### 带操作说明

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CollapseWithOperationTextExample extends StatefulWidget {
  const CollapseWithOperationTextExample({super.key});

  @override
  State<CollapseWithOperationTextExample> createState() =>
      _CollapseWithOperationTextExampleState();
}

class _CollapseWithOperationTextExampleState
    extends State<CollapseWithOperationTextExample> {
  /// 核心片段：导入 material.dart 和 tdesign_flutter.dart，并放入
  /// StatefulWidget 的 State。`_operationValue` 是由 State 持有的展开值列表，
  /// 初始包含唯一面板值；`onChanged` 通过 `setState` 写回完整列表，
  /// `trailingBuilder` 根据展开状态显示操作文案。`randomString` 是页面级常量，
  /// 仅作为面板正文示例。
  Widget _buildCollapseWithOperationText(BuildContext context) {
    return TCollapse<String>(
      value: _operationValue,
      onChanged: (value) => setState(() => _operationValue = value),
      children: [
        TCollapsePanel<String>(
          value: 'operation',
          headerBuilder: (context, isExpanded) => const Text('折叠面板标题'),
          trailingBuilder: (context, isExpanded) =>
              Text(isExpanded ? '收起' : '展开'),
          body: const Text(randomString),
        ),
      ],
    );
  }

  List<String> _operationValue = const ['operation'];

  @override
  Widget build(BuildContext context) {
    return _buildCollapseWithOperationText(context);
  }
}

const String randomString =
    '此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容';
```

##### 手风琴式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class AccordionCollapseExample extends StatefulWidget {
  const AccordionCollapseExample({super.key});

  @override
  State<AccordionCollapseExample> createState() =>
      _AccordionCollapseExampleState();
}

class _AccordionCollapseExampleState extends State<AccordionCollapseExample> {
  /// 核心片段：导入 material.dart 和 tdesign_flutter.dart，并放入
  /// StatefulWidget 的 State。`_accordionValue` 由页面 State 持有，
  /// `onChanged` 回写完整列表，避免其他示例重建时重置展开项。
  /// `randomString` 是页面级常量，仅作为面板正文示例。
  Widget _buildAccordionCollapse(BuildContext context) {
    final values = List.generate(3, (index) => '$index');
    return TCollapse<String>(
      mode: TCollapseMode.accordion,
      value: _accordionValue,
      onChanged: (value) => setState(() => _accordionValue = value),
      children: values.map((panelValue) {
        return TCollapsePanel(
          value: panelValue,
          headerBuilder: (context, isExpanded) {
            return const Text('折叠面板标题');
          },
          body: const Text(randomString),
        );
      }).toList(),
    );
  }

  List<String> _accordionValue = const ['0'];

  @override
  Widget build(BuildContext context) {
    return _buildAccordionCollapse(context);
  }
}

const String randomString =
    '此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容';
```

#### 组件样式

##### 卡片折叠面板

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CardCollapseExample extends StatefulWidget {
  const CardCollapseExample({super.key});

  @override
  State<CardCollapseExample> createState() => _CardCollapseExampleState();
}

class _CardCollapseExampleState extends State<CardCollapseExample> {
  /// 核心片段：导入 material.dart 和 tdesign_flutter.dart，并放入
  /// StatefulWidget 的 State。`_cardValue` 是由 State 持有的展开值列表，
  /// 初始仅包含三项中的首项；`onChanged` 通过 `setState` 写回完整列表。
  /// `randomString` 是页面级常量，仅作为面板正文示例。
  Widget _buildCardCollapse(BuildContext context) {
    return TCollapse<String>(
      variant: TCollapseVariant.card,
      value: _cardValue,
      onChanged: (value) => setState(() => _cardValue = value),
      children: List.generate(3, (index) {
        return TCollapsePanel<String>(
          value: 'card-$index',
          headerBuilder: (context, isExpanded) => const Text('折叠面板标题'),
          body: const Text(randomString),
        );
      }).toList(),
    );
  }

  List<String> _cardValue = const ['card-0'];

  @override
  Widget build(BuildContext context) {
    return _buildCardCollapse(context);
  }
}

const String randomString =
    '此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容此处可自定义内容';
```

## API

1. [TCollapse](#tcollapse)
2. [TCollapsePanel](#tcollapsepanel)
3. [TCollapseMode](#tcollapsemode)
4. [TCollapseVariant](#tcollapsevariant)
5. [TCollapsePlacement](#tcollapseplacement)
6. [TCollapsePanelBuilder](#tcollapsepanelbuilder)
7. [TCollapseThemeData](#tcollapsethemedata)

### TCollapse

类型参数：`T extends Object`

#### 构造方法

##### TCollapse

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| animationDuration | Duration? | - | 折叠面板展开和收起的动画时长；未设置时使用 Flutter 主题动画默认值。 | 否 |
| children | List<TCollapsePanel<T>> | - | 折叠面板列表的子组件 | 是 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| mode | TCollapseMode | TCollapseMode.multiple | 折叠面板模式 | 否 |
| onChanged | ValueChanged<List<T>>? | - | 展开值列表变更回调。 回调返回点击后的完整、不可修改列表。为 null 时整组不可交互，并使用禁用 视觉和语义；单项仍可通过 `TCollapsePanel.disabled` 禁用。 | 否 |
| value | List<T> | - | 当前展开面板的值列表，是所有模式唯一的展开状态源。 列表中的值必须唯一，并与唯一的 `TCollapsePanel.value` 匹配。 `TCollapseMode.accordion` 模式最多允许一个值。 | 是 |
| variant | TCollapseVariant? | - | 折叠面板视觉形态；未设置时为 `TCollapseVariant.block`。 | 否 |

### TCollapsePanel

类型参数：`T extends Object`

折叠面板配置。

#### 构造方法

##### TCollapsePanel

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 折叠面板的背景色。 | 否 |
| body | Widget | - | 折叠面板的内容组件。 | 是 |
| bodyHeight | double? | - | 展开内容区域的固定高度（包含内容内边距）。 适用于 `ListView` 等需要有界高度的内容；为空时由内容自然决定高度。 非空时必须是有限且大于 0 的值。 | 否 |
| disabled | bool | false | 是否禁用面板交互。 | 否 |
| expandIconBuilder | TCollapsePanelBuilder? | _defaultExpandIconBuilder | 构建展开图标。 省略时使用 TDesign 默认箭头；显式传入 null 时隐藏箭头；传入 builder 时以其返回的 Widget 替换默认箭头。Widget 会继承组件解析出的图标主题。 | 否 |
| headerBuilder | ExpansionPanelHeaderBuilder | - | 折叠面板的头部组件构造函数。 | 是 |
| key | Key? | - | 面板标识，用于列表插入、删除和重排时保留内容状态。 | 否 |
| leadingBuilder | TCollapsePanelBuilder? | - | 构建标题左侧区域。 返回的 Widget 会继承组件解析出的文字和图标主题。 | 否 |
| placement | TCollapsePlacement | TCollapsePlacement.bottom | 内容相对标题的展开方向。 | 否 |
| semanticsLabel | String? | - | 面板标题的无障碍标签；复杂自定义标题无法自动提取文本时使用。 | 否 |
| trailingBuilder | TCollapsePanelBuilder? | - | 构建标题右侧、展开图标之前的操作区域。 可根据 builder 收到的 `isExpanded` 显示“展开/收起”等文案或任意 Widget。 | 否 |
| value | T | - | 面板唯一标识，用于匹配父级 `TCollapse.value` 中的展开值。 | 是 |

### TCollapseMode

折叠面板展开模式。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| multiple | TCollapseMode | - | 多个面板可同时展开。 | - |
| accordion | TCollapseMode | - | 最多展开一个面板。 | - |

### TCollapseVariant

折叠面板视觉形态。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| block | TCollapseVariant | - | 通栏形态。 | - |
| card | TCollapseVariant | - | 卡片形态。 | - |

### TCollapsePlacement

折叠内容相对标题的展开方向。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| bottom | TCollapsePlacement | - | 内容在标题下方展开。 | - |
| top | TCollapsePlacement | - | 内容在标题上方展开。 | - |

### TCollapsePanelBuilder

根据折叠状态构建面板头部区域内容的回调。

位置参数：`context, isExpanded`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 折叠面板头部的构建上下文。 | 是 |
| isExpanded | bool | - | 当前面板是否展开。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Widget | - | 面板头部内容。 | - |

### TCollapseThemeData

折叠面板组件级 ThemeExtension

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 默认面板背景色 未配置时使用 bgColorContainer Token；单个面板的 backgroundColor 优先。 | 否 |
| cardBorderRadius | BorderRadius? | - | 卡片圆角。 仅卡片形态生效，未配置时使用 radiusLarge Token。 | 否 |
| cardMargin | EdgeInsetsGeometry? | - | 卡片外边距。 仅卡片形态生效，未配置时左右均使用 spacer2 Token。 | 否 |
| contentPadding | EdgeInsetsGeometry? | - | 内容内边距。 未配置时四边均使用 spacer2 Token。 | 否 |
| contentTextStyle | TextStyle? | - | 内容文字样式。 | 否 |
| disabledHeaderTextStyle | TextStyle? | - | 禁用状态标题文字样式。 | 否 |
| disabledIconColor | Color? | - | 禁用状态展开图标颜色。 未配置时使用 textColorDisabled Token。 | 否 |
| dividerColor | Color? | - | 分隔线颜色。 未配置时使用 componentStroke Token。 | 否 |
| elevation | double? | - | 阴影 未配置时为 0。 | 否 |
| headerTextStyle | TextStyle? | - | 标题文字样式。 | 否 |
| iconColor | Color? | - | 展开图标颜色。 未配置时使用 textColorPlaceholder Token。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [常见用法](#常见用法)
3. [推荐/慎用示例](#推荐-慎用示例)
4. [相似组件](#相似组件)

### 何时使用

当信息较多，需要进行收纳时使用。

### 常见用法

##### 经常用于信息种类较多的页面，将相对次要的信息收纳起来，让用户能够关注到页面中的主要信息或流程。

![](https://tdesign.gtimg.com/site/design/mobile-guide/collapse/collapse-1.png)

---

##### 在展示多条内容较长的同类型信息时，通常从中抽取出关键信息作为标题，收纳在手风琴式折叠面板中，便于用户检索和查看。

![](https://tdesign.gtimg.com/site/design/mobile-guide/collapse/collapse-2.png)

---

##### 在网站中，经常使用折叠面板作为分类导航，将页面进行归类、收纳在折叠面板中，展开后可点击跳转。

![](https://tdesign.gtimg.com/site/design/mobile-guide/collapse/collapse-3.png)

### 推荐/慎用示例

##### 当信息层级较多时，不建议嵌套折叠面板，层级过多时建议审视信息结构或使用其它交互方式展示。

![](https://tdesign.gtimg.com/site/design/mobile-guide/collapse/collapse-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 不建议使用右箭头作为折叠面板的展开图标，用户可能会误把它认作跳转二级页面的入口。

![](https://tdesign.gtimg.com/site/design/mobile-guide/collapse/collapse-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [下拉菜单](<../反馈/DropdownMenu 下拉菜单.md>) | 当内容较多时，需要通过筛选快速定位某一类内容时使用。 |
