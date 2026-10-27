# Cell 单元格

> 一行内容/功能的垂直排列方式。一行项目左侧为主要内容展示区域，右侧可增加更多操作内容。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/cell)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 单行单元格

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CellSingleLineExample extends StatefulWidget {
  const CellSingleLineExample({super.key});

  @override
  State<CellSingleLineExample> createState() => _CellSingleLineExampleState();
}

class _CellSingleLineExampleState extends State<CellSingleLineExample> {
  var _switchValue = true;

  Widget _buildSingleLine(BuildContext context) {
    final cells = [
      TCell(title: const Text('单行标题'), arrow: true, onTap: () {}),
      TCell(
        title: const Text('单行标题'),
        required: true,
        arrow: true,
        onTap: () {},
      ),
      TCell(
        title: const Text('单行标题', semanticsLabel: '单行标题，有16条消息'),
        note: const TBadge(label: '16'),
        arrow: true,
        onTap: () {},
      ),
      TCell(
        title: const Text('单行标题'),
        note: TSwitch(
          value: _switchValue,
          onChanged: (value) => setState(() => _switchValue = value),
        ),
        onTap: () {},
      ),
      TCell(
        title: const Text('单行标题'),
        note: const Text('辅助信息'),
        arrow: true,
        onTap: () {},
      ),
      TCell(
        prefix: Icon(TIcons.app, size: 24, color: context.tTheme.brandColor),
        title: const Text('单行标题'),
        arrow: true,
        onTap: () {},
      ),
    ];
    return Column(
      children: [
        for (var index = 0; index < cells.length; index++) ...[
          cells[index],
          if (index < cells.length - 1)
            Divider(
              height: 0.5,
              thickness: 0.5,
              indent: 16,
              color: context.tTheme.componentStroke,
            ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSingleLine(context);
  }
}
```

##### 多行单元格

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CellMultipleLineExample extends StatefulWidget {
  const CellMultipleLineExample({super.key});

  @override
  State<CellMultipleLineExample> createState() =>
      _CellMultipleLineExampleState();
}

class _CellMultipleLineExampleState extends State<CellMultipleLineExample> {
  var _switchValue = true;

  Widget _buildMultipleLine(BuildContext context) {
    const description = '一段很长很长的内容文字';
    final cells = [
      TCell(
        title: const Text('单行标题'),
        subtitle: const Text(description),
        arrow: true,
        onTap: () {},
      ),
      TCell(
        title: const Text('单行标题'),
        subtitle: const Text(description),
        required: true,
        arrow: true,
        onTap: () {},
      ),
      TCell(
        title: const Text('单行标题'),
        subtitle: const Text(description),
        note: const TBadge(label: '16'),
        arrow: true,
        onTap: () {},
      ),
      TCell(
        title: const Text('单行标题'),
        subtitle: const Text(description),
        note: TSwitch(
          value: _switchValue,
          onChanged: (value) => setState(() => _switchValue = value),
        ),
        onTap: () {},
      ),
      TCell(
        title: const Text('单行标题'),
        subtitle: const Text(description),
        note: const Text('辅助信息'),
        arrow: true,
        onTap: () {},
      ),
      TCell(
        prefix: Icon(TIcons.app, size: 24, color: context.tTheme.brandColor),
        title: const Text('单行标题'),
        subtitle: const Text(description),
        arrow: true,
        onTap: () {},
      ),
      TCell(
        title: const Text('单行标题'),
        subtitle: const Text('一段很长很长的内容文字，长文本自动换行，该选项的描述是一段很长的内容'),
        onTap: () {},
      ),
      TCell(
        image: const TImage(
          src: 'assets/img/t_avatar_1.png',
          shape: TImageShape.circle,
          fit: BoxFit.cover,
          width: 48,
          height: 48,
        ),
        title: const Text('单行标题'),
        subtitle: const Text('一段很长很长很长的内容文字'),
        arrow: true,
        onTap: () {},
      ),
      TCell(
        image: const TImage(
          src: 'assets/img/t_avatar_1.png',
          shape: TImageShape.circle,
          fit: BoxFit.cover,
          width: 48,
          height: 48,
        ),
        title: const Text('单行标题'),
        subtitle: const Text(description),
        align: TCellAlign.top,
        onTap: () {},
      ),
    ];
    return Column(
      children: [
        for (var index = 0; index < cells.length; index++) ...[
          cells[index],
          if (index < cells.length - 1)
            Divider(
              height: 0.5,
              thickness: 0.5,
              indent: 16,
              color: context.tTheme.componentStroke,
            ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildMultipleLine(context);
  }
}
```

#### 组件样式

##### 卡片单元格

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CellCardGroupExample extends StatelessWidget {
  const CellCardGroupExample({super.key});

  Widget _buildCardGroup(BuildContext context) {
    return TCellGroup(
      variant: TCellGroupVariant.card,
      cells: [
        TCell(
          prefix: Icon(
            TIcons.service,
            size: 24,
            color: context.tTheme.brandColor,
          ),
          title: const Text('单行标题'),
          arrow: true,
          onTap: () {},
        ),
        TCell(
          prefix: Icon(
            TIcons.internet,
            size: 24,
            color: context.tTheme.brandColor,
          ),
          title: const Text('单行标题'),
          arrow: true,
          onTap: () {},
        ),
        TCell(
          prefix: Icon(
            TIcons.lock_on,
            size: 24,
            color: context.tTheme.brandColor,
          ),
          title: const Text('单行标题'),
          arrow: true,
          onTap: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCardGroup(context);
  }
}
```

## API

1. [TCell](#tcell)
2. [TCellGroup](#tcellgroup)
3. [TCellAlign](#tcellalign)
4. [TCellGroupVariant](#tcellgroupvariant)
5. [TCellGroupBuilder](#tcellgroupbuilder)
6. [TCellThemeData](#tcellthemedata)

### TCell

#### 构造方法

##### TCell

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| align | TCellAlign? | - | 内容垂直对齐方式；未设置时为 `TCellAlign.center`。 | 否 |
| arrow | bool | false | 是否显示右箭头。 | 否 |
| enableFeedback | bool | true | 点击时是否显示背景反馈。 | 否 |
| image | Widget? | - | 单元格左侧图片区。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| note | Widget? | - | 右侧说明内容。 | 否 |
| onLongPress | GestureLongPressCallback? | - | 长按回调。 | 否 |
| onTap | GestureTapCallback? | - | 点击回调；为空时不创建点击行为。 | 否 |
| prefix | Widget? | - | 标题左侧内容。 | 否 |
| required | bool | false | 是否显示必填标记。 | 否 |
| subtitle | Widget? | - | 副标题区。 | 否 |
| title | Widget? | - | 标题区。 | 否 |
| trailing | Widget? | - | 最右侧内容。 | 否 |

### TCellGroup

单元格组。

#### 构造方法

##### TCellGroup

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| builder | TCellGroupBuilder? | - | 自定义单元格外层构建器。 | 否 |
| cells | List<TCell> | - | 单元格列表。 | 是 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| scrollable | bool | false | 是否使用可滚动列表。 | 否 |
| title | Widget? | - | 组标题。 | 否 |
| variant | TCellGroupVariant? | - | 组视觉形态；未设置时为 `TCellGroupVariant.standard`。 | 否 |

### TCellAlign

单元格内容垂直对齐方式。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| top | TCellAlign | - | 顶部对齐。 | - |
| center | TCellAlign | - | 居中对齐。 | - |
| bottom | TCellAlign | - | 底部对齐。 | - |

### TCellGroupVariant

单元格组视觉形态。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| standard | TCellGroupVariant | - | 通栏形态。 | - |
| card | TCellGroupVariant | - | 卡片形态。 | - |

### TCellGroupBuilder

单元格包装构建器。

位置参数：`context, cell, index`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 单元格组的构建上下文。 | 是 |
| cell | TCell | - | 当前待包装的单元格。 | 是 |
| index | int | - | 单元格在组内的索引，从 0 开始。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Widget | - | 包装后的单元格内容。 | - |

### TCellThemeData

Cell 与 CellGroup 的组件级 ThemeExtension。

仅保存视觉和布局默认值，不保存内容、回调或列表数据。
文字样式按字段覆盖全局 Token 派生的组件默认值；未配置字段保持默认。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| arrowColor | Color? | - | 箭头颜色。 未配置时使用 textColorPlaceholder Token。 | 否 |
| backgroundColor | Color? | - | 默认背景色。 未配置时使用 bgColorContainer Token。 | 否 |
| borderColor | Color? | - | 分隔线颜色。 未配置时使用 componentStroke Token。 | 否 |
| cardBorderRadius | BorderRadius? | - | 卡片组圆角。 仅卡片形态生效，未配置时使用 radiusLarge Token，默认 9 逻辑像素。 | 否 |
| cardPadding | EdgeInsetsGeometry? | - | 卡片组内边距。 仅卡片形态生效，未配置时为左右 16 逻辑像素。 | 否 |
| groupBorderColor | Color? | - | 单元格组边框颜色。 未配置时使用 componentStroke Token。 | 否 |
| groupBordered | bool? | - | 是否显示组外边框。 未配置时为 false。 | 否 |
| groupTitleStyle | TextStyle? | - | 单元格组标题样式。 默认使用 fontBodyMedium / textColorPrimary Token，按字段合并本样式。 | 否 |
| height | double? | - | Cell 固定高度。 未配置时由内容和内边距自然决定高度。 | 否 |
| noteStyle | TextStyle? | - | 右侧说明文字样式。 默认使用 fontBodyLarge / textColorPlaceholder Token，按字段合并本样式。 | 否 |
| padding | EdgeInsetsGeometry? | - | 单元格内边距。 未配置时四边均使用 spacer2 Token。 | 否 |
| pressedColor | Color? | - | 按压背景色。 未配置时使用 bgColorSecondaryContainer Token；交互反馈由实例 enableFeedback 控制。 | 否 |
| requiredStyle | TextStyle? | - | 必填标记样式。 | 否 |
| showBottomBorder | bool? | - | 是否显示 Cell 底部分隔线。 未配置时为 false，组内分隔线由 CellGroup 独立绘制。 | 否 |
| showLastDivider | bool? | - | 是否显示最后一个 Cell 后的分隔线。 未配置时为 false。 | 否 |
| subtitleStyle | TextStyle? | - | 副标题文字样式。 默认使用 fontBodyMedium / textColorSecondary Token，按字段合并本样式。 | 否 |
| titlePadding | EdgeInsetsGeometry? | - | 组标题内边距。 未配置时四边均为 16 逻辑像素。 | 否 |
| titleStyle | TextStyle? | - | 标题文字样式。 默认使用 fontBodyLarge / textColorPrimary Token，按字段合并本样式。 | 否 |

## 设计指南

1. [常见用法](#常见用法)
2. [推荐/慎用示例](#推荐-慎用示例)
3. [相似组件](#相似组件)

### 常见用法

##### 常用作内容详情入口或功能入口的平铺陈列。

![](https://tdesign.gtimg.com/site/design/mobile-guide/cell/cell-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/cell/cell-2.png)

---

##### 常用作同类型同格式信息项平铺陈列。

![](https://tdesign.gtimg.com/site/design/mobile-guide/cell/cell-3.png)

### 推荐/慎用示例

##### 作为入口时，不建议承载过多过复杂的内容。

![](https://tdesign.gtimg.com/site/design/mobile-guide/cell/cell-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 作为入口时，不建议在一个单元格内承载其他操作。

![](https://tdesign.gtimg.com/site/design/mobile-guide/cell/cell-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [宫格](https://tdesign.tencent.com/flutter/components/grid) | 当需要展示多个功能或信息入口，且这些入口没有明显的优先级时使用。 |
