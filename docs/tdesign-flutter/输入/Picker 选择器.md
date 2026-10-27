# Picker 选择器

> 纯滚轮选择器组件，支持多列独立和联动两种模式

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/picker)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 基础选择器

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PickerBaseExample extends StatefulWidget {
  const PickerBaseExample({super.key});

  @override
  State<PickerBaseExample> createState() => _PickerBaseExampleState();
}

class _PickerBaseExampleState extends State<PickerBaseExample> {
  Widget _buildBase(BuildContext context) => TCellGroup(
    cells: [
      _cell(
        this.context,
        'city',
        '选择地区',
        _cities,
        value: _values['city']!,
        onConfirm: (value) => setState(() => _values['city'] = value),
        popupTitle: '选择地区',
      ),
    ],
  );

  /// 核心组合片段：放入调用方 Widget，导入 flutter/material.dart 和
  /// tdesign_flutter/tdesign_flutter.dart。数据与状态由调用方提供：
  /// value 是 State 持有的不可变列表，onConfirm 用 setState 保存新列表；
  /// 取消不调用 onConfirm，弹层内 onChanged 只更新草稿。
  ///
  /// 本页城市为 TPickerColumns，初始值 ['shenzhen']；时间为两列，
  /// 初始值 [2020, 'autumn']；地区为 TPickerLinked，初始值
  /// ['guangdong', 'shenzhen', 'futian']。带标题与无标题共用城市数据，
  /// popupTitle 分别传 '选择地区' 与 null。id 仅用于示例定位 Key。
  TCell _cell(
    BuildContext context,
    String id,
    String title,
    TPickerItems items, {
    required List<Object?> value,
    required ValueChanged<List<Object?>> onConfirm,
    String? popupTitle,
  }) {
    String _label(TPickerItems items, List<Object?> values) {
      if (items is TPickerColumns) {
        final labels = <String>[];
        for (var index = 0; index < items.columns.length; index++) {
          if (index >= values.length) {
            break;
          }
          final matches = items.columns[index].where(
            (option) => option.value == values[index],
          );
          if (matches.isNotEmpty) {
            labels.add(matches.first.label.replaceAll('年', ''));
          }
        }
        return labels.join(' ');
      }
      var options = (items as TPickerLinked).options;
      final labels = <String>[];
      for (final value in values) {
        final matches = options.where((option) => option.value == value);
        if (matches.isEmpty) {
          break;
        }
        labels.add(matches.first.label);
        options = matches.first.children;
      }
      return labels
          .map((label) => label.replaceAll('省', '').replaceAll('市', ''))
          .join(' ');
    }

    void _showPicker({
      required BuildContext context,
      required TPickerItems items,
      required List<Object?> value,
      required ValueChanged<List<Object?>> onConfirm,
      Key? pickerKey,
      String? title,
    }) {
      var draft = List<Object?>.of(value);
      TPickerPopup.show(
        Navigator.of(context).context,
        headerBuilder: (_, close) => TPopupHeader(
          cancelButton: TToolbarPressable(
            onTap: close,
            child: TText(
              '取消',
              font: context.tTheme.fontBodyLarge,
              style: TextStyle(color: context.tTheme.textColorSecondary),
            ),
          ),
          title: title == null
              ? null
              : TText(title, font: context.tTheme.fontTitleLarge),
          confirmButton: TToolbarPressable(
            onTap: () {
              onConfirm(List<Object?>.of(draft));
              close();
            },
            child: TText(
              '确定',
              font: context.tTheme.fontBodyLarge,
              style: TextStyle(color: context.tTheme.brandColor),
            ),
          ),
        ),
        child: StatefulBuilder(
          builder: (_, setPopupState) => TPicker(
            key: pickerKey,
            items: items,
            value: draft,
            onChanged: (value) => setPopupState(() => draft = value.values),
          ),
        ),
      );
    }

    return TCell(
      key: ValueKey('picker-$id-trigger'),
      title: TText(title),
      note: TText(_label(items, value)),
      arrow: true,
      onTap: () => _showPicker(
        context: context,
        items: items,
        value: value,
        onConfirm: onConfirm,
        pickerKey: ValueKey('picker-$id-panel'),
        title: popupTitle,
      ),
    );
  }

  static const _cities = TPickerColumns([
    [
      TPickerOption(label: '北京市', value: 'beijing'),
      TPickerOption(label: '上海市', value: 'shanghai'),
      TPickerOption(label: '广州市', value: 'guangzhou'),
      TPickerOption(label: '深圳市', value: 'shenzhen'),
      TPickerOption(label: '成都市', value: 'chengdu'),
      TPickerOption(label: '杭州市', value: 'hangzhou'),
    ],
  ]);

  final Map<String, List<Object?>> _values = {
    'city': const ['shenzhen'],
    'time': const [2020, 'autumn'],
    'area': const ['guangdong', 'shenzhen', 'futian'],
    'title': const ['shenzhen'],
    'without-title': const ['shenzhen'],
  };

  @override
  Widget build(BuildContext context) {
    return _buildBase(context);
  }
}
```

##### `PickerTimeExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PickerTimeExample extends StatefulWidget {
  const PickerTimeExample({super.key});

  @override
  State<PickerTimeExample> createState() => _PickerTimeExampleState();
}

class _PickerTimeExampleState extends State<PickerTimeExample> {
  Widget _buildTime(BuildContext context) => TCellGroup(
    cells: [
      _cell(
        this.context,
        'time',
        '选择时间',
        _time,
        value: _values['time']!,
        onConfirm: (value) => setState(() => _values['time'] = value),
        popupTitle: '选择时间',
      ),
    ],
  );

  /// 核心组合片段：放入调用方 Widget，导入 flutter/material.dart 和
  /// tdesign_flutter/tdesign_flutter.dart。数据与状态由调用方提供：
  /// value 是 State 持有的不可变列表，onConfirm 用 setState 保存新列表；
  /// 取消不调用 onConfirm，弹层内 onChanged 只更新草稿。
  ///
  /// 本页城市为 TPickerColumns，初始值 ['shenzhen']；时间为两列，
  /// 初始值 [2020, 'autumn']；地区为 TPickerLinked，初始值
  /// ['guangdong', 'shenzhen', 'futian']。带标题与无标题共用城市数据，
  /// popupTitle 分别传 '选择地区' 与 null。id 仅用于示例定位 Key。
  TCell _cell(
    BuildContext context,
    String id,
    String title,
    TPickerItems items, {
    required List<Object?> value,
    required ValueChanged<List<Object?>> onConfirm,
    String? popupTitle,
  }) {
    String _label(TPickerItems items, List<Object?> values) {
      if (items is TPickerColumns) {
        final labels = <String>[];
        for (var index = 0; index < items.columns.length; index++) {
          if (index >= values.length) {
            break;
          }
          final matches = items.columns[index].where(
            (option) => option.value == values[index],
          );
          if (matches.isNotEmpty) {
            labels.add(matches.first.label.replaceAll('年', ''));
          }
        }
        return labels.join(' ');
      }
      var options = (items as TPickerLinked).options;
      final labels = <String>[];
      for (final value in values) {
        final matches = options.where((option) => option.value == value);
        if (matches.isEmpty) {
          break;
        }
        labels.add(matches.first.label);
        options = matches.first.children;
      }
      return labels
          .map((label) => label.replaceAll('省', '').replaceAll('市', ''))
          .join(' ');
    }

    void _showPicker({
      required BuildContext context,
      required TPickerItems items,
      required List<Object?> value,
      required ValueChanged<List<Object?>> onConfirm,
      Key? pickerKey,
      String? title,
    }) {
      var draft = List<Object?>.of(value);
      TPickerPopup.show(
        Navigator.of(context).context,
        headerBuilder: (_, close) => TPopupHeader(
          cancelButton: TToolbarPressable(
            onTap: close,
            child: TText(
              '取消',
              font: context.tTheme.fontBodyLarge,
              style: TextStyle(color: context.tTheme.textColorSecondary),
            ),
          ),
          title: title == null
              ? null
              : TText(title, font: context.tTheme.fontTitleLarge),
          confirmButton: TToolbarPressable(
            onTap: () {
              onConfirm(List<Object?>.of(draft));
              close();
            },
            child: TText(
              '确定',
              font: context.tTheme.fontBodyLarge,
              style: TextStyle(color: context.tTheme.brandColor),
            ),
          ),
        ),
        child: StatefulBuilder(
          builder: (_, setPopupState) => TPicker(
            key: pickerKey,
            items: items,
            value: draft,
            onChanged: (value) => setPopupState(() => draft = value.values),
          ),
        ),
      );
    }

    return TCell(
      key: ValueKey('picker-$id-trigger'),
      title: TText(title),
      note: TText(_label(items, value)),
      arrow: true,
      onTap: () => _showPicker(
        context: context,
        items: items,
        value: value,
        onConfirm: onConfirm,
        pickerKey: ValueKey('picker-$id-panel'),
        title: popupTitle,
      ),
    );
  }

  static const _time = TPickerColumns([
    [
      TPickerOption(label: '2018年', value: 2018),
      TPickerOption(label: '2019年', value: 2019),
      TPickerOption(label: '2020年', value: 2020),
      TPickerOption(label: '2021年', value: 2021),
      TPickerOption(label: '2022年', value: 2022),
    ],
    [
      TPickerOption(label: '春', value: 'spring'),
      TPickerOption(label: '夏', value: 'summer'),
      TPickerOption(label: '秋', value: 'autumn'),
      TPickerOption(label: '冬', value: 'winter'),
    ],
  ]);

  final Map<String, List<Object?>> _values = {
    'city': const ['shenzhen'],
    'time': const [2020, 'autumn'],
    'area': const ['guangdong', 'shenzhen', 'futian'],
    'title': const ['shenzhen'],
    'without-title': const ['shenzhen'],
  };

  @override
  Widget build(BuildContext context) {
    return _buildTime(context);
  }
}
```

##### `PickerAreaExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PickerAreaExample extends StatefulWidget {
  const PickerAreaExample({super.key});

  @override
  State<PickerAreaExample> createState() => _PickerAreaExampleState();
}

class _PickerAreaExampleState extends State<PickerAreaExample> {
  Widget _buildArea(BuildContext context) => TCellGroup(
    cells: [
      _cell(
        this.context,
        'area',
        '选择地区',
        _area,
        value: _values['area']!,
        onConfirm: (value) => setState(() => _values['area'] = value),
        popupTitle: '选择地区',
      ),
    ],
  );

  /// 核心组合片段：放入调用方 Widget，导入 flutter/material.dart 和
  /// tdesign_flutter/tdesign_flutter.dart。数据与状态由调用方提供：
  /// value 是 State 持有的不可变列表，onConfirm 用 setState 保存新列表；
  /// 取消不调用 onConfirm，弹层内 onChanged 只更新草稿。
  ///
  /// 本页城市为 TPickerColumns，初始值 ['shenzhen']；时间为两列，
  /// 初始值 [2020, 'autumn']；地区为 TPickerLinked，初始值
  /// ['guangdong', 'shenzhen', 'futian']。带标题与无标题共用城市数据，
  /// popupTitle 分别传 '选择地区' 与 null。id 仅用于示例定位 Key。
  TCell _cell(
    BuildContext context,
    String id,
    String title,
    TPickerItems items, {
    required List<Object?> value,
    required ValueChanged<List<Object?>> onConfirm,
    String? popupTitle,
  }) {
    String _label(TPickerItems items, List<Object?> values) {
      if (items is TPickerColumns) {
        final labels = <String>[];
        for (var index = 0; index < items.columns.length; index++) {
          if (index >= values.length) {
            break;
          }
          final matches = items.columns[index].where(
            (option) => option.value == values[index],
          );
          if (matches.isNotEmpty) {
            labels.add(matches.first.label.replaceAll('年', ''));
          }
        }
        return labels.join(' ');
      }
      var options = (items as TPickerLinked).options;
      final labels = <String>[];
      for (final value in values) {
        final matches = options.where((option) => option.value == value);
        if (matches.isEmpty) {
          break;
        }
        labels.add(matches.first.label);
        options = matches.first.children;
      }
      return labels
          .map((label) => label.replaceAll('省', '').replaceAll('市', ''))
          .join(' ');
    }

    void _showPicker({
      required BuildContext context,
      required TPickerItems items,
      required List<Object?> value,
      required ValueChanged<List<Object?>> onConfirm,
      Key? pickerKey,
      String? title,
    }) {
      var draft = List<Object?>.of(value);
      TPickerPopup.show(
        Navigator.of(context).context,
        headerBuilder: (_, close) => TPopupHeader(
          cancelButton: TToolbarPressable(
            onTap: close,
            child: TText(
              '取消',
              font: context.tTheme.fontBodyLarge,
              style: TextStyle(color: context.tTheme.textColorSecondary),
            ),
          ),
          title: title == null
              ? null
              : TText(title, font: context.tTheme.fontTitleLarge),
          confirmButton: TToolbarPressable(
            onTap: () {
              onConfirm(List<Object?>.of(draft));
              close();
            },
            child: TText(
              '确定',
              font: context.tTheme.fontBodyLarge,
              style: TextStyle(color: context.tTheme.brandColor),
            ),
          ),
        ),
        child: StatefulBuilder(
          builder: (_, setPopupState) => TPicker(
            key: pickerKey,
            items: items,
            value: draft,
            onChanged: (value) => setPopupState(() => draft = value.values),
          ),
        ),
      );
    }

    return TCell(
      key: ValueKey('picker-$id-trigger'),
      title: TText(title),
      note: TText(_label(items, value)),
      arrow: true,
      onTap: () => _showPicker(
        context: context,
        items: items,
        value: value,
        onConfirm: onConfirm,
        pickerKey: ValueKey('picker-$id-panel'),
        title: popupTitle,
      ),
    );
  }

  static const _area = TPickerLinked([
    TPickerOption(
      label: '天津',
      value: 'tianjin',
      children: [
        TPickerOption(
          label: '天津',
          value: 'tianjin',
          children: [TPickerOption(label: '和平区', value: 'heping')],
        ),
      ],
    ),
    TPickerOption(
      label: '北京',
      value: 'beijing',
      children: [
        TPickerOption(
          label: '北京',
          value: 'beijing',
          children: [TPickerOption(label: '东城区', value: 'dongcheng')],
        ),
      ],
    ),
    TPickerOption(
      label: '广东',
      value: 'guangdong',
      children: [
        TPickerOption(
          label: '广州',
          value: 'guangzhou',
          children: [TPickerOption(label: '天河区', value: 'tianhe')],
        ),
        TPickerOption(
          label: '韶关',
          value: 'shaoguan',
          children: [TPickerOption(label: '浈江区', value: 'zhenjiang')],
        ),
        TPickerOption(
          label: '深圳',
          value: 'shenzhen',
          children: [
            TPickerOption(label: '宝安区', value: 'baoan'),
            TPickerOption(label: '南山区', value: 'nanshan'),
            TPickerOption(label: '福田区', value: 'futian'),
            TPickerOption(label: '罗湖区', value: 'luohu'),
            TPickerOption(label: '光明区', value: 'guangming'),
          ],
        ),
        TPickerOption(
          label: '珠海',
          value: 'zhuhai',
          children: [TPickerOption(label: '香洲区', value: 'xiangzhou')],
        ),
        TPickerOption(
          label: '汕头',
          value: 'shantou',
          children: [TPickerOption(label: '金平区', value: 'jinping')],
        ),
      ],
    ),
    TPickerOption(
      label: '湖南',
      value: 'hunan',
      children: [
        TPickerOption(
          label: '长沙',
          value: 'changsha',
          children: [TPickerOption(label: '岳麓区', value: 'yuelu')],
        ),
      ],
    ),
    TPickerOption(
      label: '湖北',
      value: 'hubei',
      children: [
        TPickerOption(
          label: '武汉',
          value: 'wuhan',
          children: [TPickerOption(label: '武昌区', value: 'wuchang')],
        ),
      ],
    ),
  ]);

  final Map<String, List<Object?>> _values = {
    'city': const ['shenzhen'],
    'time': const [2020, 'autumn'],
    'area': const ['guangdong', 'shenzhen', 'futian'],
    'title': const ['shenzhen'],
    'without-title': const ['shenzhen'],
  };

  @override
  Widget build(BuildContext context) {
    return _buildArea(context);
  }
}
```

#### 组件样式

##### 是否带标题

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PickerTitleExample extends StatefulWidget {
  const PickerTitleExample({super.key});

  @override
  State<PickerTitleExample> createState() => _PickerTitleExampleState();
}

class _PickerTitleExampleState extends State<PickerTitleExample> {
  Widget _buildTitle(BuildContext context) => Column(
    children: [
      TCellGroup(
        cells: [
          _cell(
            this.context,
            'title',
            '带标题选择器',
            _cities,
            value: _values['title']!,
            onConfirm: (value) => setState(() => _values['title'] = value),
            popupTitle: '选择地区',
          ),
        ],
      ),
      SizedBox(height: context.tTheme.spacer2),
      TCellGroup(
        cells: [
          _cell(
            this.context,
            'without-title',
            '无标题选择器',
            _cities,
            value: _values['without-title']!,
            onConfirm: (value) =>
                setState(() => _values['without-title'] = value),
          ),
        ],
      ),
    ],
  );

  /// 核心组合片段：放入调用方 Widget，导入 flutter/material.dart 和
  /// tdesign_flutter/tdesign_flutter.dart。数据与状态由调用方提供：
  /// value 是 State 持有的不可变列表，onConfirm 用 setState 保存新列表；
  /// 取消不调用 onConfirm，弹层内 onChanged 只更新草稿。
  ///
  /// 本页城市为 TPickerColumns，初始值 ['shenzhen']；时间为两列，
  /// 初始值 [2020, 'autumn']；地区为 TPickerLinked，初始值
  /// ['guangdong', 'shenzhen', 'futian']。带标题与无标题共用城市数据，
  /// popupTitle 分别传 '选择地区' 与 null。id 仅用于示例定位 Key。
  TCell _cell(
    BuildContext context,
    String id,
    String title,
    TPickerItems items, {
    required List<Object?> value,
    required ValueChanged<List<Object?>> onConfirm,
    String? popupTitle,
  }) {
    String _label(TPickerItems items, List<Object?> values) {
      if (items is TPickerColumns) {
        final labels = <String>[];
        for (var index = 0; index < items.columns.length; index++) {
          if (index >= values.length) {
            break;
          }
          final matches = items.columns[index].where(
            (option) => option.value == values[index],
          );
          if (matches.isNotEmpty) {
            labels.add(matches.first.label.replaceAll('年', ''));
          }
        }
        return labels.join(' ');
      }
      var options = (items as TPickerLinked).options;
      final labels = <String>[];
      for (final value in values) {
        final matches = options.where((option) => option.value == value);
        if (matches.isEmpty) {
          break;
        }
        labels.add(matches.first.label);
        options = matches.first.children;
      }
      return labels
          .map((label) => label.replaceAll('省', '').replaceAll('市', ''))
          .join(' ');
    }

    void _showPicker({
      required BuildContext context,
      required TPickerItems items,
      required List<Object?> value,
      required ValueChanged<List<Object?>> onConfirm,
      Key? pickerKey,
      String? title,
    }) {
      var draft = List<Object?>.of(value);
      TPickerPopup.show(
        Navigator.of(context).context,
        headerBuilder: (_, close) => TPopupHeader(
          cancelButton: TToolbarPressable(
            onTap: close,
            child: TText(
              '取消',
              font: context.tTheme.fontBodyLarge,
              style: TextStyle(color: context.tTheme.textColorSecondary),
            ),
          ),
          title: title == null
              ? null
              : TText(title, font: context.tTheme.fontTitleLarge),
          confirmButton: TToolbarPressable(
            onTap: () {
              onConfirm(List<Object?>.of(draft));
              close();
            },
            child: TText(
              '确定',
              font: context.tTheme.fontBodyLarge,
              style: TextStyle(color: context.tTheme.brandColor),
            ),
          ),
        ),
        child: StatefulBuilder(
          builder: (_, setPopupState) => TPicker(
            key: pickerKey,
            items: items,
            value: draft,
            onChanged: (value) => setPopupState(() => draft = value.values),
          ),
        ),
      );
    }

    return TCell(
      key: ValueKey('picker-$id-trigger'),
      title: TText(title),
      note: TText(_label(items, value)),
      arrow: true,
      onTap: () => _showPicker(
        context: context,
        items: items,
        value: value,
        onConfirm: onConfirm,
        pickerKey: ValueKey('picker-$id-panel'),
        title: popupTitle,
      ),
    );
  }

  static const _cities = TPickerColumns([
    [
      TPickerOption(label: '北京市', value: 'beijing'),
      TPickerOption(label: '上海市', value: 'shanghai'),
      TPickerOption(label: '广州市', value: 'guangzhou'),
      TPickerOption(label: '深圳市', value: 'shenzhen'),
      TPickerOption(label: '成都市', value: 'chengdu'),
      TPickerOption(label: '杭州市', value: 'hangzhou'),
    ],
  ]);

  final Map<String, List<Object?>> _values = {
    'city': const ['shenzhen'],
    'time': const [2020, 'autumn'],
    'area': const ['guangdong', 'shenzhen', 'futian'],
    'title': const ['shenzhen'],
    'without-title': const ['shenzhen'],
  };

  @override
  Widget build(BuildContext context) {
    return _buildTitle(context);
  }
}
```

## API

1. [TPicker](#tpicker)
2. [TPickerPopup](#tpickerpopup)
3. [TPickerOption](#tpickeroption)
4. [TPickerValue](#tpickervalue)
5. [TPickerColumns](#tpickercolumns)
6. [TPickerLinked](#tpickerlinked)
7. [TPickerItems](#tpickeritems)
8. [TPickerPopupHeaderBuilder](#tpickerpopupheaderbuilder)
9. [TPickerItemBuilder](#tpickeritembuilder)
10. [TPickerThemeData](#tpickerthemedata)

### TPicker

#### 构造方法

##### TPicker

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| itemBuilder | TPickerItemBuilder? | - | 自定义选项构建器。 | 否 |
| items | TPickerItems | - | 不可变数据源；更新选项时创建新的数据源与列表，不原地修改。 | 是 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| onChanged | ValueChanged<TPickerValue>? | - | 值变化回调；为 null 时禁用。 | 否 |
| onColumnScrollEnd | void Function(int columnIndex, TPickerValue value)? | - | 某列滚动结束时的候选快照，不表示父级已接受该值。 | 否 |
| value | List<Object?> | - | 各列受控值。使用不可变列表，更新时提供新列表。 拖动期间可显示候选值；滚动结束后父级未接受 `onChanged` 的值时， 恢复到此值。父级接受变化时，应通过重建回传新的值。 | 是 |

### TPickerPopup

Picker 专用弹层入口。

`TPicker` 与 `TDateTimePicker` 的滚轮仍是可独立组合的纯面板；需要设计稿中的
底部弹层时使用 `show`。该入口统一为标准 `TPopupHeader` 和完整滚轮视窗预留
高度，避免调用方按通用 Popup 默认高度拼装后压缩或裁切滚轮。弹层高度在每次 `show`
时读取主题；复用已有句柄重新打开不会重新计算高度。

#### 静态方法

##### TPickerPopup.show

位置参数：`context`

打开包含标准头部和 Picker 滚轮的底部弹层。

弹层总高为当前 `TPickerThemeData.height`（默认至少 200，随内置文字增长）加
`TPopupHeader.headerHeight`（58）。`child` 通常为 `TPicker` 或
`TDateTimePicker`，其受控值、确认和取消状态仍由调用方管理。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 当前构建上下文，用于读取祖先配置。 | 是 |
| child | Widget | - | Picker 滚轮面板。 | 是 |
| headerBuilder | TPickerPopupHeaderBuilder | - | 标准 58px 头部构建器。 | 是 |
| inset | TPopupBottomInset? | - | 底部弹层的边缘缩进。 | 否 |
| radius | double? | - | 顶部圆角；null 时使用 Popup 主题或 TDesign 默认值。 | 否 |
| backgroundColor | Color? | - | 面板背景色；null 时使用 Popup 主题或容器色。 | 否 |
| overlay | TPopupOverlayConfig? | - | 蒙层行为；null 时沿用 Popup 默认值。 | 否 |
| destroyOnClose | bool | false | 默认 false；为 true 时路由被其他不透明路由覆盖可释放内容 State。 关闭路由后内容始终释放，再次打开会创建新 State。 | 否 |
| animationDuration | Duration? | - | 打开和关闭动画时长。 | 否 |
| onOpened | VoidCallback? | - | 打开动画完成回调。 | 否 |
| onClosed | VoidCallback? | - | 关闭动画完成回调。 | 否 |
| onVisibleChange | TPopupVisibleChangeCallback? | - | 弹层显隐变化回调。 | 否 |
| useSafeArea | bool | false | 是否避让底部安全区，默认 false。 | 否 |
| navigatorContext | BuildContext? | - | 可选的 Navigator 上下文；默认使用 `context`。 | 否 |
| useRootNavigator | bool | false | 是否使用根 Navigator，默认 false。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | TPopupHandle | - | 已经发起打开的 Popup 控制句柄，可用于查询状态和关闭弹层。 | - |

### TPickerOption

选择器选项。

选项及 `children` 按不可变数据使用；更新时创建新选项和新列表。

#### 构造方法

##### TPickerOption

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| children | List<TPickerOption> | const [] | 联动模式下的子选项。 | 否 |
| disabled | bool | false | 是否禁用。 | 否 |
| label | String | - | 展示文案。 | 是 |
| value | Object? | - | 业务值。 | 是 |

### TPickerValue

各列当前选中项的只读快照。

组件回调产生的列表不可修改。手工构造时，调用方须提供不可变列表；
const 构造不会复制或冻结传入的 `selectedOptions` 和 `indexes`。

#### 构造方法

##### TPickerValue

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| indexes | List<int> | - | 各列选中索引。 | 是 |
| selectedOptions | List<TPickerOption> | - | 各列选中的完整选项。 | 是 |

#### 属性

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| labels | List<String> | - | 各列展示文案。 | - |
| values | List<Object?> | - | 各列业务值。 | - |

### TPickerColumns

互不联动的多列数据源。

`columns` 及每列列表不得原地修改；变更时传入新的数据源和列表。

#### 构造方法

##### TPickerColumns

位置参数：`columns`

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| columns | List<List<TPickerOption>> | - | 各列选项。 | 是 |

### TPickerLinked

由 `TPickerOption.children` 描述层级关系的联动数据源。

`options` 及所有子选项列表不得原地修改；变更时创建新的数据源。

#### 构造方法

##### TPickerLinked

位置参数：`options`

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| options | List<TPickerOption> | - | 根选项。 | 是 |

### TPickerItems

选择器数据源。

#### 构造方法

##### TPickerItems

无参数。

### TPickerPopupHeaderBuilder

构建 Picker 标准弹层头部。

返回类型限定为 `TPopupHeader`，使弹层尺寸计算与实际头部的
`TPopupHeader.headerHeight` 保持一致。

位置参数：`context, close`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 弹层头部的构建上下文。 | 是 |
| close | VoidCallback | - | 请求关闭当前 Picker 弹层的回调。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | TPopupHeader | - | 标准弹层头部；其 headerHeight 参与弹层总高度计算。 | - |

### TPickerItemBuilder

选择器子项构建器。

位置参数：`context, option, columnIndex, itemIndex, distance`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 滚轮选项的构建上下文。 | 是 |
| option | TPickerOption | - | 当前选项数据。 | 是 |
| columnIndex | int | - | 当前列索引，从 0 开始。 | 是 |
| itemIndex | int | - | 当前选项在列中的索引，从 0 开始。 | 是 |
| distance | double | - | 当前选项距滚轮中心的绝对距离，以选项高度为单位。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Widget? | - | 当前选项内容；返回 null 时使用默认文字渲染。 | - |

### TPickerThemeData

TPicker 组件级 ThemeExtension

被 TPicker 和 TDateTimePicker 共用。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| height | double? | - | 滚轮视窗高度，单位为逻辑像素；null 时至少为 200，并随内置文字的自然行高增长。 必须为有限正数，行高由此高度除以 `itemCount`（默认 5）得到。 | 否 |
| itemCount | int? | - | 每屏显示项数，null 时使用默认值 5；必须大于零。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [推荐/慎用示例](#推荐-慎用示例)
3. [相似组件](#相似组件)

### 何时使用

当需要在有限的空间展示大量选项供用户选择，或者一组选项由递进层级构成需要用户逐级选择时使用。

### 推荐/慎用示例

##### 选择器若为一组有层级关系的选项时，选项层级不宜超过4层，层级过多时应调整数据结构或改用其他交互方式。

![](https://tdesign.gtimg.com/site/design/mobile-guide/picker/picker-1.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 选择器若为一组有层级关系的选项时，各层级选项的归属关系应具备逻辑相关性，数据层级由大到小，避免归属关系混乱。

![](https://tdesign.gtimg.com/site/design/mobile-guide/picker/picker-2.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/picker/picker-3.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [时间选择器](<DateTimePicker 时间选择器.md>) | 在表单中需要输入单个日期或时间时使用。 |
