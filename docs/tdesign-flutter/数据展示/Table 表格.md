# Table 表格

> 用于展示同类结构化数据，支持受控排序、选择、固定列、表体滚动和加载状态。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/table)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 基础表格

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TableBasicExample extends StatelessWidget {
  const TableBasicExample({super.key});

  static final _rows = List<List<String>>.generate(
    10,
    (index) => [index == 9 ? '内容内容内容内容' : '内容', '内容', '内容', '内容'],
  );

  @override
  Widget build(BuildContext context) {
    final columns = List<TTableColumn<List<String>>>.generate(
      4,
      (index) => TTableColumn<List<String>>(
        id: 'title${index + 1}',
        header: const Text('标题'),
        cellBuilder: (_, row, __) => Text(row[index]),
      ),
    );
    return TTable(columns: columns, data: _rows);
  }
}
```

##### 可排序表格

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TableSortableExample extends StatefulWidget {
  const TableSortableExample({super.key});

  @override
  State<TableSortableExample> createState() => _TableSortableExampleState();
}

class _TableSortableExampleState extends State<TableSortableExample> {
  static final _rows = List<List<String>>.generate(
    10,
    (index) => [index == 9 ? '内容内容内容内容' : '内容', '内容', '内容', '内容'],
  );

  TTableSort? _sort;

  List<TTableColumn<List<String>>> get _columns =>
      List<TTableColumn<List<String>>>.generate(
        4,
        (index) => TTableColumn<List<String>>(
          id: 'title${index + 1}',
          header: const Text('标题'),
          comparator: (first, second) => first[index].compareTo(second[index]),
          cellBuilder: (_, row, __) => Text(row[index]),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return TTable(
      key: const ValueKey('table-sortable'),
      columns: _columns,
      data: _rows,
      sort: _sort,
      onSortChanged: (value) => setState(() => _sort = value),
    );
  }
}
```

##### 带操作或按钮表格

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TableOperationTextExample extends StatelessWidget {
  const TableOperationTextExample({super.key});

  static final _rows = List<List<String>>.generate(
    10,
    (index) => [index == 9 ? '内容内容内容内容' : '内容', '内容', '内容'],
  );

  @override
  Widget build(BuildContext context) {
    return TTable(
      columns: [
        for (var index = 0; index < 3; index++)
          TTableColumn<List<String>>(
            id: 'title${index + 1}',
            header: const Text('标题'),
            cellBuilder: (_, row, __) => Text(row[index]),
          ),
        TTableColumn<List<String>>(
          id: 'actions',
          header: const Text('标题'),
          cellBuilder: (context, _, __) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  '修改',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: context.tTheme.brandColor),
                ),
              ),
              Flexible(
                child: Text(
                  '通过',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: context.tTheme.brandColor),
                ),
              ),
            ],
          ),
        ),
      ],
      data: _rows,
    );
  }
}
```

##### `TableOperationIconExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TableOperationIconExample extends StatelessWidget {
  const TableOperationIconExample({super.key});

  static final _rows = List<List<String>>.generate(
    10,
    (index) => [index == 9 ? '内容内容内容内容' : '内容', '内容', '内容'],
  );

  @override
  Widget build(BuildContext context) {
    return TTable(
      columns: [
        for (var index = 0; index < 3; index++)
          TTableColumn<List<String>>(
            id: 'title${index + 1}',
            header: const Text('标题'),
            cellBuilder: (_, row, __) => Text(row[index]),
          ),
        TTableColumn<List<String>>(
          id: 'action-icons',
          header: const Text('标题'),
          cellBuilder: (context, _, __) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TIcon(TIcons.upload, size: 16, color: context.tTheme.brandColor),
              TIcon(TIcons.delete, size: 16, color: context.tTheme.brandColor),
            ],
          ),
        ),
      ],
      data: _rows,
    );
  }
}
```

##### 可固定首列表格

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TableFixedFirstExample extends StatelessWidget {
  const TableFixedFirstExample({super.key});

  static final _rows = List<List<String>>.generate(
    10,
    (index) => [index == 9 ? '内容内容内容内容' : '内容'],
  );

  @override
  Widget build(BuildContext context) {
    return TTable(
      key: const ValueKey('table-fixed-first'),
      columns: [
        TTableColumn<List<String>>(
          id: 'title1',
          header: const Text('标题'),
          width: 94,
          fixed: TTableColumnFixed.left,
          cellBuilder: (_, row, __) => Text(row.first),
        ),
        for (var index = 2; index <= 6; index++)
          TTableColumn<List<String>>(
            id: 'title$index',
            header: const Text('标题'),
            width: 120,
            cellBuilder: (_, __, ___) => const Text('内容'),
          ),
      ],
      data: _rows,
    );
  }
}
```

##### 可固定尾列表格

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TableFixedLastExample extends StatelessWidget {
  const TableFixedLastExample({super.key});

  static final _rows = List<List<String>>.generate(
    10,
    (index) => [index == 9 ? '内容内容内容内容' : '内容'],
  );

  @override
  Widget build(BuildContext context) {
    return TTable(
      key: const ValueKey('table-fixed-last'),
      columns: [
        for (var index = 1; index <= 5; index++)
          TTableColumn<List<String>>(
            id: 'title$index',
            header: const Text('标题'),
            width: 120,
            cellBuilder: (_, __, ___) => const Text('内容'),
          ),
        TTableColumn<List<String>>(
          id: 'actions',
          header: const Text('标题'),
          width: 116,
          fixed: TTableColumnFixed.right,
          cellBuilder: (context, _, __) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  '修改',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: context.tTheme.brandColor),
                ),
              ),
              const SizedBox(width: 24),
              Flexible(
                child: Text(
                  '通过',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: context.tTheme.brandColor),
                ),
              ),
            ],
          ),
        ),
      ],
      data: _rows,
    );
  }
}
```

##### 横向平铺可滚动表格

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TableHorizontalScrollExample extends StatelessWidget {
  const TableHorizontalScrollExample({super.key});

  static final _rows = List<List<String>>.generate(
    10,
    (index) => index == 0
        ? ['横向平铺内容不省略', '横向平铺内容不省略', '横向平铺内容不省略']
        : ['内容', '内容', '内容'],
  );

  @override
  Widget build(BuildContext context) {
    return TTable(
      key: const ValueKey('table-horizontal-scroll'),
      columns: [
        for (var index = 0; index < 3; index++)
          TTableColumn<List<String>>(
            id: 'title${index + 1}',
            header: const Text('标题'),
            width: 160,
            cellBuilder: (_, row, __) => Text(row[index]),
          ),
      ],
      data: _rows,
    );
  }
}
```

#### 组件样式

##### 带斑马纹表格样式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TableStripeExample extends StatelessWidget {
  const TableStripeExample({super.key});

  static final _rows = List<List<String>>.generate(
    10,
    (index) => [index == 9 ? '内容内容内容内容' : '内容', '内容', '内容', '内容'],
  );

  @override
  Widget build(BuildContext context) {
    final columns = List<TTableColumn<List<String>>>.generate(
      4,
      (index) => TTableColumn<List<String>>(
        id: 'title${index + 1}',
        header: const Text('标题'),
        cellBuilder: (_, row, __) => Text(row[index]),
      ),
    );
    return TTable(columns: columns, data: _rows, stripe: true);
  }
}
```

##### 带边框表格样式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TableBorderedExample extends StatelessWidget {
  const TableBorderedExample({super.key});

  static final _rows = List<List<String>>.generate(
    10,
    (index) => [index == 9 ? '内容内容内容内容' : '内容', '内容', '内容', '内容'],
  );

  @override
  Widget build(BuildContext context) {
    final columns = List<TTableColumn<List<String>>>.generate(
      4,
      (index) => TTableColumn<List<String>>(
        id: 'title${index + 1}',
        header: const Text('标题'),
        cellBuilder: (_, row, __) => Text(row[index]),
      ),
    );
    return TTable(columns: columns, data: _rows, bordered: true);
  }
}
```

## API

1. [TTable](#ttable)
2. [TTableColumn](#ttablecolumn)
3. [TTableSort](#ttablesort)
4. [TTableCellContext](#ttablecellcontext)
5. [TTableCellSpan](#ttablecellspan)
6. [TTableSelectionMode](#ttableselectionmode)
7. [TTableSortDirection](#ttablesortdirection)
8. [TTableColumnFixed](#ttablecolumnfixed)
9. [TTableColumnAlign](#ttablecolumnalign)
10. [TTableCellSpanBuilder](#ttablecellspanbuilder)
11. [TTableCellTap](#ttablecelltap)
12. [TTableRowKey](#ttablerowkey)
13. [TTableRowTap](#ttablerowtap)
14. [TTableCellBuilder](#ttablecellbuilder)
15. [TTableThemeData](#ttablethemedata)

### TTable

类型参数：`T`

#### 构造方法

##### TTable

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| bordered | bool? | - | 是否显示完整单元格边框。 未设置时为 `false`。 | 否 |
| cellSpanBuilder | TTableCellSpanBuilder<T>? | - | 返回逻辑单元格的行列跨度。 为空时所有单元格跨度均为 `1 × 1`。该回调仅为尚未被其他合并区域覆盖的 坐标调用；返回 `null` 等同于 `TTableCellSpan` 的默认值。跨度不得越界、重叠， 也不得跨越左固定区、水平滚动区和右固定区。 | 否 |
| columns | List<TTableColumn<T>> | - | 列配置。 | 是 |
| data | List<T> | - | 行数据。 | 是 |
| empty | Widget? | - | 空数据内容。 | 否 |
| footer | Widget? | - | 表格底部内容。 | 否 |
| height | double? | - | 表格固定高度。 表头和 `footer` 占用空间后，剩余高度作为表体的垂直滚动视口。与 `maxHeight` 互斥；为空时表格随内容自然增长。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| loading | bool | false | 是否在表体上显示加载遮罩。 | 否 |
| loadingWidget | Widget? | - | 自定义加载内容。 | 否 |
| maxHeight | double? | - | 表体的最大可视高度；内容超过此高度时在表体内滚动。 | 否 |
| onCellTap | TTableCellTap<T>? | - | 单元格点击回调，context 同时提供行列索引、行数据和列配置。 | 否 |
| onRowTap | TTableRowTap<T>? | - | 行点击回调。 点击普通单元格时，会在 `onCellTap` 之后调用该回调；点击选择控件时不触发。 | 否 |
| onScroll | ValueChanged<ScrollNotification>? | - | 垂直滚动通知。 | 否 |
| onSelectionChanged | ValueChanged<Set<T>>? | - | 请求更新选中行集合。 启用 selectionMode 时必须提供本回调；父组件需回传 selectedRows。 | 否 |
| onSortChanged | ValueChanged<TTableSort?>? | - | 请求更新排序值。 为 null 时表头不产生排序请求，仍按外部传入的 sort 渲染；父组件需回传新 sort。 | 否 |
| rowKey | TTableRowKey<T>? | - | 返回行数据的稳定唯一标识。 为空时直接使用行对象及其 `==`、`hashCode` 语义。提供后，受控选择会按 key 匹配、替换和移除行，并稳定标识单元格子树，使数据刷新或排序后新建的 行对象仍能命中同一业务行。同一份 `data` 中的 key 必须唯一；未提供时单元格 子树按可见行位置标识。 | 否 |
| rowSelectable | bool Function(T row, int index)? | - | 判断指定行是否可选。 | 否 |
| selectedRows | Set<T> | const {} | 当前受控选中行。 | 否 |
| selectionMode | TTableSelectionMode | TTableSelectionMode.none | 行选择模式。 | 否 |
| showHeader | bool | true | 是否显示表头。 | 否 |
| sort | TTableSort? | - | 当前受控排序值。 | 否 |
| stripe | bool? | - | 是否为奇数数据行显示斑马纹背景。 未设置时为 `false`。 | 否 |

### TTableColumn

类型参数：`T`

强类型表格列配置。

#### 构造方法

##### TTableColumn

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| align | TTableColumnAlign | TTableColumnAlign.left | 内容对齐方式。 | 否 |
| cellBuilder | TTableCellBuilder<T> | - | 单元格构建器。 | 是 |
| comparator | Comparator<T>? | - | 排序比较器；为空时该列不可排序。 | 否 |
| fixed | TTableColumnFixed | TTableColumnFixed.none | 固定位置。 | 否 |
| header | Widget | - | 表头内容。 | 是 |
| id | String | - | 列唯一标识，用于受控排序。 | 是 |
| minWidth | double? | - | 列宽下限。 指定 `width` 时实际宽度不小于该值；`width` 为空时，自动均分会先满足 每列的最小宽度。所有列宽之和超出表格时，中间非固定列可横向滚动。 | 否 |
| width | double? | - | 列宽。 为空时与其他未指定宽度的列均分表格剩余宽度；显式宽度超出可用区域时， 中间非固定列可横向滚动。 | 否 |

### TTableSort

受控排序值。

#### 构造方法

##### TTableSort

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| columnId | String | - | 排序列标识。 | 是 |
| direction | TTableSortDirection | - | 排序方向。 | 是 |

### TTableCellContext

类型参数：`T`

表格逻辑单元格上下文。

#### 构造方法

##### TTableCellContext

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| column | TTableColumn<T> | - | 当前列配置。 | 是 |
| columnIndex | int | - | 当前列在 `TTable.columns` 中的索引。 | 是 |
| row | T | - | 当前行数据。 | 是 |
| rowIndex | int | - | 当前行在排序后可见数据中的索引。 | 是 |

### TTableCellSpan

单元格跨越的逻辑行列数。

#### 构造方法

##### TTableCellSpan

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| columnSpan | int | 1 | 跨越的逻辑列数，默认为 `1`。 | 否 |
| rowSpan | int | 1 | 跨越的逻辑行数，默认为 `1`。 | 否 |

### TTableSelectionMode

表格选择模式。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| none | TTableSelectionMode | - | 不显示选择列。 | - |
| multiple | TTableSelectionMode | - | 支持多行选择。 | - |

### TTableSortDirection

排序方向。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| ascending | TTableSortDirection | - | 升序。 | - |
| descending | TTableSortDirection | - | 降序。 | - |

### TTableColumnFixed

固定列位置。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| left | TTableColumnFixed | - | 固定在左侧。 | - |
| right | TTableColumnFixed | - | 固定在右侧。 | - |
| none | TTableColumnFixed | - | 跟随中间区域水平滚动。 | - |

### TTableColumnAlign

列内容对齐方式。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| left | TTableColumnAlign | - | 左对齐。 | - |
| center | TTableColumnAlign | - | 居中对齐。 | - |
| right | TTableColumnAlign | - | 右对齐。 | - |

### TTableCellSpanBuilder

类型参数：`T`

单元格跨度构建器。

仅为未被其他合并区域覆盖的逻辑单元格调用。该回调会在组件构建期间执行，
应保持同步且无副作用。

位置参数：`context`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | TTableCellContext<T> | - | 当前逻辑单元格的行列数据与索引。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | TTableCellSpan? | - | 单元格跨越的行列数；返回 null 时按一行一列布局。 | - |

### TTableCellTap

类型参数：`T`

单元格点击回调。

位置参数：`context`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | TTableCellContext<T> | - | 被点击的逻辑单元格行列数据与索引。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | void | - | 无返回值。 | - |

### TTableRowKey

类型参数：`T`

行唯一标识构建器。

位置参数：`row`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| row | T | - | 待获取标识的行数据。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Object | - | 当前行的稳定唯一标识，用于跨排序或重建保持行身份。 | - |

### TTableRowTap

类型参数：`T`

行点击回调。

位置参数：`rowIndex, row`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| rowIndex | int | - | 当前行在排序后可见数据中的索引，从 0 开始。 | 是 |
| row | T | - | 当前行的原始数据。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | void | - | 无返回值。 | - |

### TTableCellBuilder

类型参数：`T`

单元格构建器。

位置参数：`context, row, rowIndex`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 单元格的构建上下文。 | 是 |
| row | T | - | 当前行数据。 | 是 |
| rowIndex | int | - | 当前行在排序后可见数据中的索引，从 0 开始。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Widget | - | 当前单元格内容。 | - |

### TTableThemeData

表格组件级 ThemeExtension。

仅保存表格的视觉默认值。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 默认行背景色。 | 否 |
| borderColor | Color? | - | 边框颜色。 null 时使用 componentStroke Token。 | 否 |
| cellPadding | EdgeInsetsGeometry? | - | 单元格内边距。 null 时左右使用 spacer1 Token（默认各 12 逻辑像素），上下为 0。 | 否 |
| headerColor | Color? | - | 表头背景色。 null 时使用 bgColorContainer Token。 | 否 |
| headerHeight | double? | - | 表头高度。 null 时为 38 逻辑像素。 | 否 |
| rowHeight | double? | - | 数据行高度。 null 时为 38 逻辑像素。 | 否 |
| stripeColor | Color? | - | 斑马纹背景色。 启用 stripe 时生效；null 时使用 bgColorSecondaryContainer Token。 | 否 |
| width | double? | - | 表格宽度。 null 时有界布局使用可用宽度，无界布局使用列配置计算的自然宽度。 | 否 |
