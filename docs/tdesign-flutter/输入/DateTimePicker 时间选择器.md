# DateTimePicker 时间选择器

> 纯滚轮选择日期/时间，选中值通过 onChange 回调。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/date-time-picker)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 年月日选择器

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DateTimePickerDateExample extends StatefulWidget {
  const DateTimePickerDateExample({super.key});

  @override
  State<DateTimePickerDateExample> createState() =>
      _DateTimePickerDateExampleState();
}

class _DateTimePickerDateExampleState extends State<DateTimePickerDateExample> {
  Widget _buildDate(BuildContext context) => _cell(
    context,
    'date',
    DateTimePickerMode(dateMode: DateMode.date),
    value: _values['date']!,
    onConfirm: (value) => setState(() => _values['date'] = value),
  );

  /// 核心组合片段：调用方使用 [TCell] 作为触发器，用 [TPopup] 组合标题栏
  /// 与纯滚轮 [TDateTimePicker]。滚动只更新草稿，确认时再通过 [onConfirm]
  /// 写回调用方状态，取消不会提交。
  ///
  /// 核心片段省略应用壳；导入 flutter/material.dart 和
  /// package:tdesign_flutter/tdesign_flutter.dart，在 StatefulWidget 的 State
  /// 中放置本方法。父级持有已确认的值，例如：
  /// ```dart
  /// var selected = const TDateTimePickerValue(year: 2022, month: 8, day: 10);
  /// // 在 build 中调用；取消保持 selected，确认后 setState 更新触发器文案。
  /// _cell(context, 'date', DateTimePickerMode(dateMode: DateMode.date),
  ///   value: selected, onConfirm: (next) => setState(() => selected = next));
  /// ```
  ///
  /// 九个入口使用同一组合，按下列实际配置提供 id、mode 和初始 value：
  /// - date：dateMode: DateMode.date；year: 2022, month: 8, day: 10。
  /// - month：dateMode: DateMode.month；year: 2022, month: 8。
  /// - month-day：dateMode: DateMode.monthDay；month: 8, day: 10，不传 year。
  /// - second：timeMode: TimeMode.second；hour: 12, minute: 50, second: 23。
  /// - minute：timeMode: TimeMode.minute；hour: 12, minute: 50。
  /// - date-time：dateMode: DateMode.date, timeMode: TimeMode.second；
  ///   year: 2022, month: 8, day: 10, hour: 12, minute: 50, second: 23。
  /// - week：同 date，showWeek: true。
  /// - title：同 date，title: '带标题时间选择器'。
  /// - without-title：同 date，title: '无标题时间选择器', showTitle: false。
  /// value 均构造为 TDateTimePickerValue；每个入口由父级单独持有选择值。
  /// title 是触发器文案；弹层标题为“选择时间”，showTitle 控制其显示。
  /// 不传的 showWeek 为 false、showTitle 为 true，title 为“选择时间”。
  Widget _cell(
    BuildContext context,
    String id,
    DateTimePickerMode mode, {
    required TDateTimePickerValue value,
    required ValueChanged<TDateTimePickerValue> onConfirm,
    String title = '选择时间',
    bool showWeek = false,
    bool showTitle = true,
  }) {
    String _format(TDateTimePickerValue value, {bool showWeek = false}) {
      String two(int? part) => part?.toString().padLeft(2, '0') ?? '';
      final date = [
        if (value.year != null) '${value.year}',
        if (value.month != null) two(value.month),
        if (value.day != null) two(value.day),
      ].join('-');
      final time = [
        if (value.hour != null) two(value.hour),
        if (value.minute != null) two(value.minute),
        if (value.second != null) two(value.second),
      ].join(':');
      final result = [
        if (date.isNotEmpty) date,
        if (time.isNotEmpty) time,
      ].join(' ');
      if (!showWeek) {
        return result;
      }
      final weekday = DateTime(value.year!, value.month!, value.day!).weekday;
      return '$result 周${['一', '二', '三', '四', '五', '六', '日'][weekday - 1]}';
    }

    void showPicker() {
      var draft = value;
      TPickerPopup.show(
        context,
        headerBuilder: (_, close) => TPopupHeader(
          cancelButton: TToolbarPressable(
            onTap: close,
            child: TText(
              '取消',
              font: context.tTheme.fontBodyLarge,
              style: TextStyle(color: context.tTheme.textColorSecondary),
            ),
          ),
          title: showTitle
              ? TText('选择时间', font: context.tTheme.fontTitleLarge)
              : null,
          confirmButton: TToolbarPressable(
            onTap: () {
              onConfirm(draft);
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
          builder: (_, setPopupState) => TDateTimePicker(
            key: ValueKey('date-time-picker-$id-panel'),
            value: draft,
            mode: mode,
            showWeek: showWeek,
            // 六列并排时年份省略单位，避免 375px 窄屏省略年份数字。
            renderLabel: id == 'date-time'
                ? (column, value) =>
                      column == DateTimeColumn.year ? '$value' : null
                : null,
            onChanged: (next) => setPopupState(() => draft = next),
          ),
        ),
      );
    }

    return TCellGroup(
      cells: [
        TCell(
          key: ValueKey('date-time-picker-$id-trigger'),
          title: TText(title),
          note: TText(_format(value, showWeek: showWeek)),
          arrow: true,
          onTap: showPicker,
        ),
      ],
    );
  }

  final _values = <String, TDateTimePickerValue>{
    'date': _date,
    'month': const TDateTimePickerValue(year: 2022, month: 8),
    'month-day': const TDateTimePickerValue(month: 8, day: 10),
    'second': const TDateTimePickerValue(hour: 12, minute: 50, second: 23),
    'minute': const TDateTimePickerValue(hour: 12, minute: 50),
    'date-time': const TDateTimePickerValue(
      year: 2022,
      month: 8,
      day: 10,
      hour: 12,
      minute: 50,
      second: 23,
    ),
    'week': _date,
    'title': _date,
    'without-title': _date,
  };

  static const _date = TDateTimePickerValue(year: 2022, month: 8, day: 10);

  @override
  Widget build(BuildContext context) {
    return _buildDate(context);
  }
}
```

##### 年月选择器

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DateTimePickerMonthExample extends StatefulWidget {
  const DateTimePickerMonthExample({super.key});

  @override
  State<DateTimePickerMonthExample> createState() =>
      _DateTimePickerMonthExampleState();
}

class _DateTimePickerMonthExampleState
    extends State<DateTimePickerMonthExample> {
  Widget _buildMonth(BuildContext context) => _cell(
    context,
    'month',
    DateTimePickerMode(dateMode: DateMode.month),
    value: _values['month']!,
    onConfirm: (value) => setState(() => _values['month'] = value),
  );

  /// 核心组合片段：调用方使用 [TCell] 作为触发器，用 [TPopup] 组合标题栏
  /// 与纯滚轮 [TDateTimePicker]。滚动只更新草稿，确认时再通过 [onConfirm]
  /// 写回调用方状态，取消不会提交。
  ///
  /// 核心片段省略应用壳；导入 flutter/material.dart 和
  /// package:tdesign_flutter/tdesign_flutter.dart，在 StatefulWidget 的 State
  /// 中放置本方法。父级持有已确认的值，例如：
  /// ```dart
  /// var selected = const TDateTimePickerValue(year: 2022, month: 8, day: 10);
  /// // 在 build 中调用；取消保持 selected，确认后 setState 更新触发器文案。
  /// _cell(context, 'date', DateTimePickerMode(dateMode: DateMode.date),
  ///   value: selected, onConfirm: (next) => setState(() => selected = next));
  /// ```
  ///
  /// 九个入口使用同一组合，按下列实际配置提供 id、mode 和初始 value：
  /// - date：dateMode: DateMode.date；year: 2022, month: 8, day: 10。
  /// - month：dateMode: DateMode.month；year: 2022, month: 8。
  /// - month-day：dateMode: DateMode.monthDay；month: 8, day: 10，不传 year。
  /// - second：timeMode: TimeMode.second；hour: 12, minute: 50, second: 23。
  /// - minute：timeMode: TimeMode.minute；hour: 12, minute: 50。
  /// - date-time：dateMode: DateMode.date, timeMode: TimeMode.second；
  ///   year: 2022, month: 8, day: 10, hour: 12, minute: 50, second: 23。
  /// - week：同 date，showWeek: true。
  /// - title：同 date，title: '带标题时间选择器'。
  /// - without-title：同 date，title: '无标题时间选择器', showTitle: false。
  /// value 均构造为 TDateTimePickerValue；每个入口由父级单独持有选择值。
  /// title 是触发器文案；弹层标题为“选择时间”，showTitle 控制其显示。
  /// 不传的 showWeek 为 false、showTitle 为 true，title 为“选择时间”。
  Widget _cell(
    BuildContext context,
    String id,
    DateTimePickerMode mode, {
    required TDateTimePickerValue value,
    required ValueChanged<TDateTimePickerValue> onConfirm,
    String title = '选择时间',
    bool showWeek = false,
    bool showTitle = true,
  }) {
    String _format(TDateTimePickerValue value, {bool showWeek = false}) {
      String two(int? part) => part?.toString().padLeft(2, '0') ?? '';
      final date = [
        if (value.year != null) '${value.year}',
        if (value.month != null) two(value.month),
        if (value.day != null) two(value.day),
      ].join('-');
      final time = [
        if (value.hour != null) two(value.hour),
        if (value.minute != null) two(value.minute),
        if (value.second != null) two(value.second),
      ].join(':');
      final result = [
        if (date.isNotEmpty) date,
        if (time.isNotEmpty) time,
      ].join(' ');
      if (!showWeek) {
        return result;
      }
      final weekday = DateTime(value.year!, value.month!, value.day!).weekday;
      return '$result 周${['一', '二', '三', '四', '五', '六', '日'][weekday - 1]}';
    }

    void showPicker() {
      var draft = value;
      TPickerPopup.show(
        context,
        headerBuilder: (_, close) => TPopupHeader(
          cancelButton: TToolbarPressable(
            onTap: close,
            child: TText(
              '取消',
              font: context.tTheme.fontBodyLarge,
              style: TextStyle(color: context.tTheme.textColorSecondary),
            ),
          ),
          title: showTitle
              ? TText('选择时间', font: context.tTheme.fontTitleLarge)
              : null,
          confirmButton: TToolbarPressable(
            onTap: () {
              onConfirm(draft);
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
          builder: (_, setPopupState) => TDateTimePicker(
            key: ValueKey('date-time-picker-$id-panel'),
            value: draft,
            mode: mode,
            showWeek: showWeek,
            // 六列并排时年份省略单位，避免 375px 窄屏省略年份数字。
            renderLabel: id == 'date-time'
                ? (column, value) =>
                      column == DateTimeColumn.year ? '$value' : null
                : null,
            onChanged: (next) => setPopupState(() => draft = next),
          ),
        ),
      );
    }

    return TCellGroup(
      cells: [
        TCell(
          key: ValueKey('date-time-picker-$id-trigger'),
          title: TText(title),
          note: TText(_format(value, showWeek: showWeek)),
          arrow: true,
          onTap: showPicker,
        ),
      ],
    );
  }

  final _values = <String, TDateTimePickerValue>{
    'date': _date,
    'month': const TDateTimePickerValue(year: 2022, month: 8),
    'month-day': const TDateTimePickerValue(month: 8, day: 10),
    'second': const TDateTimePickerValue(hour: 12, minute: 50, second: 23),
    'minute': const TDateTimePickerValue(hour: 12, minute: 50),
    'date-time': const TDateTimePickerValue(
      year: 2022,
      month: 8,
      day: 10,
      hour: 12,
      minute: 50,
      second: 23,
    ),
    'week': _date,
    'title': _date,
    'without-title': _date,
  };

  static const _date = TDateTimePickerValue(year: 2022, month: 8, day: 10);

  @override
  Widget build(BuildContext context) {
    return _buildMonth(context);
  }
}
```

##### 月日选择器

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DateTimePickerMonthDayExample extends StatefulWidget {
  const DateTimePickerMonthDayExample({super.key});

  @override
  State<DateTimePickerMonthDayExample> createState() =>
      _DateTimePickerMonthDayExampleState();
}

class _DateTimePickerMonthDayExampleState
    extends State<DateTimePickerMonthDayExample> {
  Widget _buildMonthDay(BuildContext context) => _cell(
    context,
    'month-day',
    DateTimePickerMode(dateMode: DateMode.monthDay),
    value: _values['month-day']!,
    onConfirm: (value) => setState(() => _values['month-day'] = value),
  );

  /// 核心组合片段：调用方使用 [TCell] 作为触发器，用 [TPopup] 组合标题栏
  /// 与纯滚轮 [TDateTimePicker]。滚动只更新草稿，确认时再通过 [onConfirm]
  /// 写回调用方状态，取消不会提交。
  ///
  /// 核心片段省略应用壳；导入 flutter/material.dart 和
  /// package:tdesign_flutter/tdesign_flutter.dart，在 StatefulWidget 的 State
  /// 中放置本方法。父级持有已确认的值，例如：
  /// ```dart
  /// var selected = const TDateTimePickerValue(year: 2022, month: 8, day: 10);
  /// // 在 build 中调用；取消保持 selected，确认后 setState 更新触发器文案。
  /// _cell(context, 'date', DateTimePickerMode(dateMode: DateMode.date),
  ///   value: selected, onConfirm: (next) => setState(() => selected = next));
  /// ```
  ///
  /// 九个入口使用同一组合，按下列实际配置提供 id、mode 和初始 value：
  /// - date：dateMode: DateMode.date；year: 2022, month: 8, day: 10。
  /// - month：dateMode: DateMode.month；year: 2022, month: 8。
  /// - month-day：dateMode: DateMode.monthDay；month: 8, day: 10，不传 year。
  /// - second：timeMode: TimeMode.second；hour: 12, minute: 50, second: 23。
  /// - minute：timeMode: TimeMode.minute；hour: 12, minute: 50。
  /// - date-time：dateMode: DateMode.date, timeMode: TimeMode.second；
  ///   year: 2022, month: 8, day: 10, hour: 12, minute: 50, second: 23。
  /// - week：同 date，showWeek: true。
  /// - title：同 date，title: '带标题时间选择器'。
  /// - without-title：同 date，title: '无标题时间选择器', showTitle: false。
  /// value 均构造为 TDateTimePickerValue；每个入口由父级单独持有选择值。
  /// title 是触发器文案；弹层标题为“选择时间”，showTitle 控制其显示。
  /// 不传的 showWeek 为 false、showTitle 为 true，title 为“选择时间”。
  Widget _cell(
    BuildContext context,
    String id,
    DateTimePickerMode mode, {
    required TDateTimePickerValue value,
    required ValueChanged<TDateTimePickerValue> onConfirm,
    String title = '选择时间',
    bool showWeek = false,
    bool showTitle = true,
  }) {
    String _format(TDateTimePickerValue value, {bool showWeek = false}) {
      String two(int? part) => part?.toString().padLeft(2, '0') ?? '';
      final date = [
        if (value.year != null) '${value.year}',
        if (value.month != null) two(value.month),
        if (value.day != null) two(value.day),
      ].join('-');
      final time = [
        if (value.hour != null) two(value.hour),
        if (value.minute != null) two(value.minute),
        if (value.second != null) two(value.second),
      ].join(':');
      final result = [
        if (date.isNotEmpty) date,
        if (time.isNotEmpty) time,
      ].join(' ');
      if (!showWeek) {
        return result;
      }
      final weekday = DateTime(value.year!, value.month!, value.day!).weekday;
      return '$result 周${['一', '二', '三', '四', '五', '六', '日'][weekday - 1]}';
    }

    void showPicker() {
      var draft = value;
      TPickerPopup.show(
        context,
        headerBuilder: (_, close) => TPopupHeader(
          cancelButton: TToolbarPressable(
            onTap: close,
            child: TText(
              '取消',
              font: context.tTheme.fontBodyLarge,
              style: TextStyle(color: context.tTheme.textColorSecondary),
            ),
          ),
          title: showTitle
              ? TText('选择时间', font: context.tTheme.fontTitleLarge)
              : null,
          confirmButton: TToolbarPressable(
            onTap: () {
              onConfirm(draft);
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
          builder: (_, setPopupState) => TDateTimePicker(
            key: ValueKey('date-time-picker-$id-panel'),
            value: draft,
            mode: mode,
            showWeek: showWeek,
            // 六列并排时年份省略单位，避免 375px 窄屏省略年份数字。
            renderLabel: id == 'date-time'
                ? (column, value) =>
                      column == DateTimeColumn.year ? '$value' : null
                : null,
            onChanged: (next) => setPopupState(() => draft = next),
          ),
        ),
      );
    }

    return TCellGroup(
      cells: [
        TCell(
          key: ValueKey('date-time-picker-$id-trigger'),
          title: TText(title),
          note: TText(_format(value, showWeek: showWeek)),
          arrow: true,
          onTap: showPicker,
        ),
      ],
    );
  }

  final _values = <String, TDateTimePickerValue>{
    'date': _date,
    'month': const TDateTimePickerValue(year: 2022, month: 8),
    'month-day': const TDateTimePickerValue(month: 8, day: 10),
    'second': const TDateTimePickerValue(hour: 12, minute: 50, second: 23),
    'minute': const TDateTimePickerValue(hour: 12, minute: 50),
    'date-time': const TDateTimePickerValue(
      year: 2022,
      month: 8,
      day: 10,
      hour: 12,
      minute: 50,
      second: 23,
    ),
    'week': _date,
    'title': _date,
    'without-title': _date,
  };

  static const _date = TDateTimePickerValue(year: 2022, month: 8, day: 10);

  @override
  Widget build(BuildContext context) {
    return _buildMonthDay(context);
  }
}
```

##### 时分秒选择器

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DateTimePickerSecondExample extends StatefulWidget {
  const DateTimePickerSecondExample({super.key});

  @override
  State<DateTimePickerSecondExample> createState() =>
      _DateTimePickerSecondExampleState();
}

class _DateTimePickerSecondExampleState
    extends State<DateTimePickerSecondExample> {
  Widget _buildSecond(BuildContext context) => _cell(
    context,
    'second',
    DateTimePickerMode(timeMode: TimeMode.second),
    value: _values['second']!,
    onConfirm: (value) => setState(() => _values['second'] = value),
  );

  /// 核心组合片段：调用方使用 [TCell] 作为触发器，用 [TPopup] 组合标题栏
  /// 与纯滚轮 [TDateTimePicker]。滚动只更新草稿，确认时再通过 [onConfirm]
  /// 写回调用方状态，取消不会提交。
  ///
  /// 核心片段省略应用壳；导入 flutter/material.dart 和
  /// package:tdesign_flutter/tdesign_flutter.dart，在 StatefulWidget 的 State
  /// 中放置本方法。父级持有已确认的值，例如：
  /// ```dart
  /// var selected = const TDateTimePickerValue(year: 2022, month: 8, day: 10);
  /// // 在 build 中调用；取消保持 selected，确认后 setState 更新触发器文案。
  /// _cell(context, 'date', DateTimePickerMode(dateMode: DateMode.date),
  ///   value: selected, onConfirm: (next) => setState(() => selected = next));
  /// ```
  ///
  /// 九个入口使用同一组合，按下列实际配置提供 id、mode 和初始 value：
  /// - date：dateMode: DateMode.date；year: 2022, month: 8, day: 10。
  /// - month：dateMode: DateMode.month；year: 2022, month: 8。
  /// - month-day：dateMode: DateMode.monthDay；month: 8, day: 10，不传 year。
  /// - second：timeMode: TimeMode.second；hour: 12, minute: 50, second: 23。
  /// - minute：timeMode: TimeMode.minute；hour: 12, minute: 50。
  /// - date-time：dateMode: DateMode.date, timeMode: TimeMode.second；
  ///   year: 2022, month: 8, day: 10, hour: 12, minute: 50, second: 23。
  /// - week：同 date，showWeek: true。
  /// - title：同 date，title: '带标题时间选择器'。
  /// - without-title：同 date，title: '无标题时间选择器', showTitle: false。
  /// value 均构造为 TDateTimePickerValue；每个入口由父级单独持有选择值。
  /// title 是触发器文案；弹层标题为“选择时间”，showTitle 控制其显示。
  /// 不传的 showWeek 为 false、showTitle 为 true，title 为“选择时间”。
  Widget _cell(
    BuildContext context,
    String id,
    DateTimePickerMode mode, {
    required TDateTimePickerValue value,
    required ValueChanged<TDateTimePickerValue> onConfirm,
    String title = '选择时间',
    bool showWeek = false,
    bool showTitle = true,
  }) {
    String _format(TDateTimePickerValue value, {bool showWeek = false}) {
      String two(int? part) => part?.toString().padLeft(2, '0') ?? '';
      final date = [
        if (value.year != null) '${value.year}',
        if (value.month != null) two(value.month),
        if (value.day != null) two(value.day),
      ].join('-');
      final time = [
        if (value.hour != null) two(value.hour),
        if (value.minute != null) two(value.minute),
        if (value.second != null) two(value.second),
      ].join(':');
      final result = [
        if (date.isNotEmpty) date,
        if (time.isNotEmpty) time,
      ].join(' ');
      if (!showWeek) {
        return result;
      }
      final weekday = DateTime(value.year!, value.month!, value.day!).weekday;
      return '$result 周${['一', '二', '三', '四', '五', '六', '日'][weekday - 1]}';
    }

    void showPicker() {
      var draft = value;
      TPickerPopup.show(
        context,
        headerBuilder: (_, close) => TPopupHeader(
          cancelButton: TToolbarPressable(
            onTap: close,
            child: TText(
              '取消',
              font: context.tTheme.fontBodyLarge,
              style: TextStyle(color: context.tTheme.textColorSecondary),
            ),
          ),
          title: showTitle
              ? TText('选择时间', font: context.tTheme.fontTitleLarge)
              : null,
          confirmButton: TToolbarPressable(
            onTap: () {
              onConfirm(draft);
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
          builder: (_, setPopupState) => TDateTimePicker(
            key: ValueKey('date-time-picker-$id-panel'),
            value: draft,
            mode: mode,
            showWeek: showWeek,
            // 六列并排时年份省略单位，避免 375px 窄屏省略年份数字。
            renderLabel: id == 'date-time'
                ? (column, value) =>
                      column == DateTimeColumn.year ? '$value' : null
                : null,
            onChanged: (next) => setPopupState(() => draft = next),
          ),
        ),
      );
    }

    return TCellGroup(
      cells: [
        TCell(
          key: ValueKey('date-time-picker-$id-trigger'),
          title: TText(title),
          note: TText(_format(value, showWeek: showWeek)),
          arrow: true,
          onTap: showPicker,
        ),
      ],
    );
  }

  final _values = <String, TDateTimePickerValue>{
    'date': _date,
    'month': const TDateTimePickerValue(year: 2022, month: 8),
    'month-day': const TDateTimePickerValue(month: 8, day: 10),
    'second': const TDateTimePickerValue(hour: 12, minute: 50, second: 23),
    'minute': const TDateTimePickerValue(hour: 12, minute: 50),
    'date-time': const TDateTimePickerValue(
      year: 2022,
      month: 8,
      day: 10,
      hour: 12,
      minute: 50,
      second: 23,
    ),
    'week': _date,
    'title': _date,
    'without-title': _date,
  };

  static const _date = TDateTimePickerValue(year: 2022, month: 8, day: 10);

  @override
  Widget build(BuildContext context) {
    return _buildSecond(context);
  }
}
```

##### 时分选择器

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DateTimePickerMinuteExample extends StatefulWidget {
  const DateTimePickerMinuteExample({super.key});

  @override
  State<DateTimePickerMinuteExample> createState() =>
      _DateTimePickerMinuteExampleState();
}

class _DateTimePickerMinuteExampleState
    extends State<DateTimePickerMinuteExample> {
  Widget _buildMinute(BuildContext context) => _cell(
    context,
    'minute',
    DateTimePickerMode(timeMode: TimeMode.minute),
    value: _values['minute']!,
    onConfirm: (value) => setState(() => _values['minute'] = value),
  );

  /// 核心组合片段：调用方使用 [TCell] 作为触发器，用 [TPopup] 组合标题栏
  /// 与纯滚轮 [TDateTimePicker]。滚动只更新草稿，确认时再通过 [onConfirm]
  /// 写回调用方状态，取消不会提交。
  ///
  /// 核心片段省略应用壳；导入 flutter/material.dart 和
  /// package:tdesign_flutter/tdesign_flutter.dart，在 StatefulWidget 的 State
  /// 中放置本方法。父级持有已确认的值，例如：
  /// ```dart
  /// var selected = const TDateTimePickerValue(year: 2022, month: 8, day: 10);
  /// // 在 build 中调用；取消保持 selected，确认后 setState 更新触发器文案。
  /// _cell(context, 'date', DateTimePickerMode(dateMode: DateMode.date),
  ///   value: selected, onConfirm: (next) => setState(() => selected = next));
  /// ```
  ///
  /// 九个入口使用同一组合，按下列实际配置提供 id、mode 和初始 value：
  /// - date：dateMode: DateMode.date；year: 2022, month: 8, day: 10。
  /// - month：dateMode: DateMode.month；year: 2022, month: 8。
  /// - month-day：dateMode: DateMode.monthDay；month: 8, day: 10，不传 year。
  /// - second：timeMode: TimeMode.second；hour: 12, minute: 50, second: 23。
  /// - minute：timeMode: TimeMode.minute；hour: 12, minute: 50。
  /// - date-time：dateMode: DateMode.date, timeMode: TimeMode.second；
  ///   year: 2022, month: 8, day: 10, hour: 12, minute: 50, second: 23。
  /// - week：同 date，showWeek: true。
  /// - title：同 date，title: '带标题时间选择器'。
  /// - without-title：同 date，title: '无标题时间选择器', showTitle: false。
  /// value 均构造为 TDateTimePickerValue；每个入口由父级单独持有选择值。
  /// title 是触发器文案；弹层标题为“选择时间”，showTitle 控制其显示。
  /// 不传的 showWeek 为 false、showTitle 为 true，title 为“选择时间”。
  Widget _cell(
    BuildContext context,
    String id,
    DateTimePickerMode mode, {
    required TDateTimePickerValue value,
    required ValueChanged<TDateTimePickerValue> onConfirm,
    String title = '选择时间',
    bool showWeek = false,
    bool showTitle = true,
  }) {
    String _format(TDateTimePickerValue value, {bool showWeek = false}) {
      String two(int? part) => part?.toString().padLeft(2, '0') ?? '';
      final date = [
        if (value.year != null) '${value.year}',
        if (value.month != null) two(value.month),
        if (value.day != null) two(value.day),
      ].join('-');
      final time = [
        if (value.hour != null) two(value.hour),
        if (value.minute != null) two(value.minute),
        if (value.second != null) two(value.second),
      ].join(':');
      final result = [
        if (date.isNotEmpty) date,
        if (time.isNotEmpty) time,
      ].join(' ');
      if (!showWeek) {
        return result;
      }
      final weekday = DateTime(value.year!, value.month!, value.day!).weekday;
      return '$result 周${['一', '二', '三', '四', '五', '六', '日'][weekday - 1]}';
    }

    void showPicker() {
      var draft = value;
      TPickerPopup.show(
        context,
        headerBuilder: (_, close) => TPopupHeader(
          cancelButton: TToolbarPressable(
            onTap: close,
            child: TText(
              '取消',
              font: context.tTheme.fontBodyLarge,
              style: TextStyle(color: context.tTheme.textColorSecondary),
            ),
          ),
          title: showTitle
              ? TText('选择时间', font: context.tTheme.fontTitleLarge)
              : null,
          confirmButton: TToolbarPressable(
            onTap: () {
              onConfirm(draft);
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
          builder: (_, setPopupState) => TDateTimePicker(
            key: ValueKey('date-time-picker-$id-panel'),
            value: draft,
            mode: mode,
            showWeek: showWeek,
            // 六列并排时年份省略单位，避免 375px 窄屏省略年份数字。
            renderLabel: id == 'date-time'
                ? (column, value) =>
                      column == DateTimeColumn.year ? '$value' : null
                : null,
            onChanged: (next) => setPopupState(() => draft = next),
          ),
        ),
      );
    }

    return TCellGroup(
      cells: [
        TCell(
          key: ValueKey('date-time-picker-$id-trigger'),
          title: TText(title),
          note: TText(_format(value, showWeek: showWeek)),
          arrow: true,
          onTap: showPicker,
        ),
      ],
    );
  }

  final _values = <String, TDateTimePickerValue>{
    'date': _date,
    'month': const TDateTimePickerValue(year: 2022, month: 8),
    'month-day': const TDateTimePickerValue(month: 8, day: 10),
    'second': const TDateTimePickerValue(hour: 12, minute: 50, second: 23),
    'minute': const TDateTimePickerValue(hour: 12, minute: 50),
    'date-time': const TDateTimePickerValue(
      year: 2022,
      month: 8,
      day: 10,
      hour: 12,
      minute: 50,
      second: 23,
    ),
    'week': _date,
    'title': _date,
    'without-title': _date,
  };

  static const _date = TDateTimePickerValue(year: 2022, month: 8, day: 10);

  @override
  Widget build(BuildContext context) {
    return _buildMinute(context);
  }
}
```

##### 年月日时分秒选择器

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DateTimePickerDateTimeExample extends StatefulWidget {
  const DateTimePickerDateTimeExample({super.key});

  @override
  State<DateTimePickerDateTimeExample> createState() =>
      _DateTimePickerDateTimeExampleState();
}

class _DateTimePickerDateTimeExampleState
    extends State<DateTimePickerDateTimeExample> {
  Widget _buildDateTime(BuildContext context) => _cell(
    context,
    'date-time',
    DateTimePickerMode(dateMode: DateMode.date, timeMode: TimeMode.second),
    value: _values['date-time']!,
    onConfirm: (value) => setState(() => _values['date-time'] = value),
  );

  /// 核心组合片段：调用方使用 [TCell] 作为触发器，用 [TPopup] 组合标题栏
  /// 与纯滚轮 [TDateTimePicker]。滚动只更新草稿，确认时再通过 [onConfirm]
  /// 写回调用方状态，取消不会提交。
  ///
  /// 核心片段省略应用壳；导入 flutter/material.dart 和
  /// package:tdesign_flutter/tdesign_flutter.dart，在 StatefulWidget 的 State
  /// 中放置本方法。父级持有已确认的值，例如：
  /// ```dart
  /// var selected = const TDateTimePickerValue(year: 2022, month: 8, day: 10);
  /// // 在 build 中调用；取消保持 selected，确认后 setState 更新触发器文案。
  /// _cell(context, 'date', DateTimePickerMode(dateMode: DateMode.date),
  ///   value: selected, onConfirm: (next) => setState(() => selected = next));
  /// ```
  ///
  /// 九个入口使用同一组合，按下列实际配置提供 id、mode 和初始 value：
  /// - date：dateMode: DateMode.date；year: 2022, month: 8, day: 10。
  /// - month：dateMode: DateMode.month；year: 2022, month: 8。
  /// - month-day：dateMode: DateMode.monthDay；month: 8, day: 10，不传 year。
  /// - second：timeMode: TimeMode.second；hour: 12, minute: 50, second: 23。
  /// - minute：timeMode: TimeMode.minute；hour: 12, minute: 50。
  /// - date-time：dateMode: DateMode.date, timeMode: TimeMode.second；
  ///   year: 2022, month: 8, day: 10, hour: 12, minute: 50, second: 23。
  /// - week：同 date，showWeek: true。
  /// - title：同 date，title: '带标题时间选择器'。
  /// - without-title：同 date，title: '无标题时间选择器', showTitle: false。
  /// value 均构造为 TDateTimePickerValue；每个入口由父级单独持有选择值。
  /// title 是触发器文案；弹层标题为“选择时间”，showTitle 控制其显示。
  /// 不传的 showWeek 为 false、showTitle 为 true，title 为“选择时间”。
  Widget _cell(
    BuildContext context,
    String id,
    DateTimePickerMode mode, {
    required TDateTimePickerValue value,
    required ValueChanged<TDateTimePickerValue> onConfirm,
    String title = '选择时间',
    bool showWeek = false,
    bool showTitle = true,
  }) {
    String _format(TDateTimePickerValue value, {bool showWeek = false}) {
      String two(int? part) => part?.toString().padLeft(2, '0') ?? '';
      final date = [
        if (value.year != null) '${value.year}',
        if (value.month != null) two(value.month),
        if (value.day != null) two(value.day),
      ].join('-');
      final time = [
        if (value.hour != null) two(value.hour),
        if (value.minute != null) two(value.minute),
        if (value.second != null) two(value.second),
      ].join(':');
      final result = [
        if (date.isNotEmpty) date,
        if (time.isNotEmpty) time,
      ].join(' ');
      if (!showWeek) {
        return result;
      }
      final weekday = DateTime(value.year!, value.month!, value.day!).weekday;
      return '$result 周${['一', '二', '三', '四', '五', '六', '日'][weekday - 1]}';
    }

    void showPicker() {
      var draft = value;
      TPickerPopup.show(
        context,
        headerBuilder: (_, close) => TPopupHeader(
          cancelButton: TToolbarPressable(
            onTap: close,
            child: TText(
              '取消',
              font: context.tTheme.fontBodyLarge,
              style: TextStyle(color: context.tTheme.textColorSecondary),
            ),
          ),
          title: showTitle
              ? TText('选择时间', font: context.tTheme.fontTitleLarge)
              : null,
          confirmButton: TToolbarPressable(
            onTap: () {
              onConfirm(draft);
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
          builder: (_, setPopupState) => TDateTimePicker(
            key: ValueKey('date-time-picker-$id-panel'),
            value: draft,
            mode: mode,
            showWeek: showWeek,
            // 六列并排时年份省略单位，避免 375px 窄屏省略年份数字。
            renderLabel: id == 'date-time'
                ? (column, value) =>
                      column == DateTimeColumn.year ? '$value' : null
                : null,
            onChanged: (next) => setPopupState(() => draft = next),
          ),
        ),
      );
    }

    return TCellGroup(
      cells: [
        TCell(
          key: ValueKey('date-time-picker-$id-trigger'),
          title: TText(title),
          note: TText(_format(value, showWeek: showWeek)),
          arrow: true,
          onTap: showPicker,
        ),
      ],
    );
  }

  final _values = <String, TDateTimePickerValue>{
    'date': _date,
    'month': const TDateTimePickerValue(year: 2022, month: 8),
    'month-day': const TDateTimePickerValue(month: 8, day: 10),
    'second': const TDateTimePickerValue(hour: 12, minute: 50, second: 23),
    'minute': const TDateTimePickerValue(hour: 12, minute: 50),
    'date-time': const TDateTimePickerValue(
      year: 2022,
      month: 8,
      day: 10,
      hour: 12,
      minute: 50,
      second: 23,
    ),
    'week': _date,
    'title': _date,
    'without-title': _date,
  };

  static const _date = TDateTimePickerValue(year: 2022, month: 8, day: 10);

  @override
  Widget build(BuildContext context) {
    return _buildDateTime(context);
  }
}
```

##### 年月日带星期选择器

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DateTimePickerWeekExample extends StatefulWidget {
  const DateTimePickerWeekExample({super.key});

  @override
  State<DateTimePickerWeekExample> createState() =>
      _DateTimePickerWeekExampleState();
}

class _DateTimePickerWeekExampleState extends State<DateTimePickerWeekExample> {
  Widget _buildWeek(BuildContext context) => _cell(
    context,
    'week',
    DateTimePickerMode(dateMode: DateMode.date),
    value: _values['week']!,
    onConfirm: (value) => setState(() => _values['week'] = value),
    showWeek: true,
  );

  /// 核心组合片段：调用方使用 [TCell] 作为触发器，用 [TPopup] 组合标题栏
  /// 与纯滚轮 [TDateTimePicker]。滚动只更新草稿，确认时再通过 [onConfirm]
  /// 写回调用方状态，取消不会提交。
  ///
  /// 核心片段省略应用壳；导入 flutter/material.dart 和
  /// package:tdesign_flutter/tdesign_flutter.dart，在 StatefulWidget 的 State
  /// 中放置本方法。父级持有已确认的值，例如：
  /// ```dart
  /// var selected = const TDateTimePickerValue(year: 2022, month: 8, day: 10);
  /// // 在 build 中调用；取消保持 selected，确认后 setState 更新触发器文案。
  /// _cell(context, 'date', DateTimePickerMode(dateMode: DateMode.date),
  ///   value: selected, onConfirm: (next) => setState(() => selected = next));
  /// ```
  ///
  /// 九个入口使用同一组合，按下列实际配置提供 id、mode 和初始 value：
  /// - date：dateMode: DateMode.date；year: 2022, month: 8, day: 10。
  /// - month：dateMode: DateMode.month；year: 2022, month: 8。
  /// - month-day：dateMode: DateMode.monthDay；month: 8, day: 10，不传 year。
  /// - second：timeMode: TimeMode.second；hour: 12, minute: 50, second: 23。
  /// - minute：timeMode: TimeMode.minute；hour: 12, minute: 50。
  /// - date-time：dateMode: DateMode.date, timeMode: TimeMode.second；
  ///   year: 2022, month: 8, day: 10, hour: 12, minute: 50, second: 23。
  /// - week：同 date，showWeek: true。
  /// - title：同 date，title: '带标题时间选择器'。
  /// - without-title：同 date，title: '无标题时间选择器', showTitle: false。
  /// value 均构造为 TDateTimePickerValue；每个入口由父级单独持有选择值。
  /// title 是触发器文案；弹层标题为“选择时间”，showTitle 控制其显示。
  /// 不传的 showWeek 为 false、showTitle 为 true，title 为“选择时间”。
  Widget _cell(
    BuildContext context,
    String id,
    DateTimePickerMode mode, {
    required TDateTimePickerValue value,
    required ValueChanged<TDateTimePickerValue> onConfirm,
    String title = '选择时间',
    bool showWeek = false,
    bool showTitle = true,
  }) {
    String _format(TDateTimePickerValue value, {bool showWeek = false}) {
      String two(int? part) => part?.toString().padLeft(2, '0') ?? '';
      final date = [
        if (value.year != null) '${value.year}',
        if (value.month != null) two(value.month),
        if (value.day != null) two(value.day),
      ].join('-');
      final time = [
        if (value.hour != null) two(value.hour),
        if (value.minute != null) two(value.minute),
        if (value.second != null) two(value.second),
      ].join(':');
      final result = [
        if (date.isNotEmpty) date,
        if (time.isNotEmpty) time,
      ].join(' ');
      if (!showWeek) {
        return result;
      }
      final weekday = DateTime(value.year!, value.month!, value.day!).weekday;
      return '$result 周${['一', '二', '三', '四', '五', '六', '日'][weekday - 1]}';
    }

    void showPicker() {
      var draft = value;
      TPickerPopup.show(
        context,
        headerBuilder: (_, close) => TPopupHeader(
          cancelButton: TToolbarPressable(
            onTap: close,
            child: TText(
              '取消',
              font: context.tTheme.fontBodyLarge,
              style: TextStyle(color: context.tTheme.textColorSecondary),
            ),
          ),
          title: showTitle
              ? TText('选择时间', font: context.tTheme.fontTitleLarge)
              : null,
          confirmButton: TToolbarPressable(
            onTap: () {
              onConfirm(draft);
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
          builder: (_, setPopupState) => TDateTimePicker(
            key: ValueKey('date-time-picker-$id-panel'),
            value: draft,
            mode: mode,
            showWeek: showWeek,
            // 六列并排时年份省略单位，避免 375px 窄屏省略年份数字。
            renderLabel: id == 'date-time'
                ? (column, value) =>
                      column == DateTimeColumn.year ? '$value' : null
                : null,
            onChanged: (next) => setPopupState(() => draft = next),
          ),
        ),
      );
    }

    return TCellGroup(
      cells: [
        TCell(
          key: ValueKey('date-time-picker-$id-trigger'),
          title: TText(title),
          note: TText(_format(value, showWeek: showWeek)),
          arrow: true,
          onTap: showPicker,
        ),
      ],
    );
  }

  final _values = <String, TDateTimePickerValue>{
    'date': _date,
    'month': const TDateTimePickerValue(year: 2022, month: 8),
    'month-day': const TDateTimePickerValue(month: 8, day: 10),
    'second': const TDateTimePickerValue(hour: 12, minute: 50, second: 23),
    'minute': const TDateTimePickerValue(hour: 12, minute: 50),
    'date-time': const TDateTimePickerValue(
      year: 2022,
      month: 8,
      day: 10,
      hour: 12,
      minute: 50,
      second: 23,
    ),
    'week': _date,
    'title': _date,
    'without-title': _date,
  };

  static const _date = TDateTimePickerValue(year: 2022, month: 8, day: 10);

  @override
  Widget build(BuildContext context) {
    return _buildWeek(context);
  }
}
```

#### 组件样式

##### 是否带标题

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DateTimePickerTitleExample extends StatefulWidget {
  const DateTimePickerTitleExample({super.key});

  @override
  State<DateTimePickerTitleExample> createState() =>
      _DateTimePickerTitleExampleState();
}

class _DateTimePickerTitleExampleState
    extends State<DateTimePickerTitleExample> {
  Widget _buildTitle(BuildContext context) => _cell(
    context,
    'title',
    DateTimePickerMode(dateMode: DateMode.date),
    value: _values['title']!,
    onConfirm: (value) => setState(() => _values['title'] = value),
    title: '带标题时间选择器',
  );

  /// 核心组合片段：调用方使用 [TCell] 作为触发器，用 [TPopup] 组合标题栏
  /// 与纯滚轮 [TDateTimePicker]。滚动只更新草稿，确认时再通过 [onConfirm]
  /// 写回调用方状态，取消不会提交。
  ///
  /// 核心片段省略应用壳；导入 flutter/material.dart 和
  /// package:tdesign_flutter/tdesign_flutter.dart，在 StatefulWidget 的 State
  /// 中放置本方法。父级持有已确认的值，例如：
  /// ```dart
  /// var selected = const TDateTimePickerValue(year: 2022, month: 8, day: 10);
  /// // 在 build 中调用；取消保持 selected，确认后 setState 更新触发器文案。
  /// _cell(context, 'date', DateTimePickerMode(dateMode: DateMode.date),
  ///   value: selected, onConfirm: (next) => setState(() => selected = next));
  /// ```
  ///
  /// 九个入口使用同一组合，按下列实际配置提供 id、mode 和初始 value：
  /// - date：dateMode: DateMode.date；year: 2022, month: 8, day: 10。
  /// - month：dateMode: DateMode.month；year: 2022, month: 8。
  /// - month-day：dateMode: DateMode.monthDay；month: 8, day: 10，不传 year。
  /// - second：timeMode: TimeMode.second；hour: 12, minute: 50, second: 23。
  /// - minute：timeMode: TimeMode.minute；hour: 12, minute: 50。
  /// - date-time：dateMode: DateMode.date, timeMode: TimeMode.second；
  ///   year: 2022, month: 8, day: 10, hour: 12, minute: 50, second: 23。
  /// - week：同 date，showWeek: true。
  /// - title：同 date，title: '带标题时间选择器'。
  /// - without-title：同 date，title: '无标题时间选择器', showTitle: false。
  /// value 均构造为 TDateTimePickerValue；每个入口由父级单独持有选择值。
  /// title 是触发器文案；弹层标题为“选择时间”，showTitle 控制其显示。
  /// 不传的 showWeek 为 false、showTitle 为 true，title 为“选择时间”。
  Widget _cell(
    BuildContext context,
    String id,
    DateTimePickerMode mode, {
    required TDateTimePickerValue value,
    required ValueChanged<TDateTimePickerValue> onConfirm,
    String title = '选择时间',
    bool showWeek = false,
    bool showTitle = true,
  }) {
    String _format(TDateTimePickerValue value, {bool showWeek = false}) {
      String two(int? part) => part?.toString().padLeft(2, '0') ?? '';
      final date = [
        if (value.year != null) '${value.year}',
        if (value.month != null) two(value.month),
        if (value.day != null) two(value.day),
      ].join('-');
      final time = [
        if (value.hour != null) two(value.hour),
        if (value.minute != null) two(value.minute),
        if (value.second != null) two(value.second),
      ].join(':');
      final result = [
        if (date.isNotEmpty) date,
        if (time.isNotEmpty) time,
      ].join(' ');
      if (!showWeek) {
        return result;
      }
      final weekday = DateTime(value.year!, value.month!, value.day!).weekday;
      return '$result 周${['一', '二', '三', '四', '五', '六', '日'][weekday - 1]}';
    }

    void showPicker() {
      var draft = value;
      TPickerPopup.show(
        context,
        headerBuilder: (_, close) => TPopupHeader(
          cancelButton: TToolbarPressable(
            onTap: close,
            child: TText(
              '取消',
              font: context.tTheme.fontBodyLarge,
              style: TextStyle(color: context.tTheme.textColorSecondary),
            ),
          ),
          title: showTitle
              ? TText('选择时间', font: context.tTheme.fontTitleLarge)
              : null,
          confirmButton: TToolbarPressable(
            onTap: () {
              onConfirm(draft);
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
          builder: (_, setPopupState) => TDateTimePicker(
            key: ValueKey('date-time-picker-$id-panel'),
            value: draft,
            mode: mode,
            showWeek: showWeek,
            // 六列并排时年份省略单位，避免 375px 窄屏省略年份数字。
            renderLabel: id == 'date-time'
                ? (column, value) =>
                      column == DateTimeColumn.year ? '$value' : null
                : null,
            onChanged: (next) => setPopupState(() => draft = next),
          ),
        ),
      );
    }

    return TCellGroup(
      cells: [
        TCell(
          key: ValueKey('date-time-picker-$id-trigger'),
          title: TText(title),
          note: TText(_format(value, showWeek: showWeek)),
          arrow: true,
          onTap: showPicker,
        ),
      ],
    );
  }

  final _values = <String, TDateTimePickerValue>{
    'date': _date,
    'month': const TDateTimePickerValue(year: 2022, month: 8),
    'month-day': const TDateTimePickerValue(month: 8, day: 10),
    'second': const TDateTimePickerValue(hour: 12, minute: 50, second: 23),
    'minute': const TDateTimePickerValue(hour: 12, minute: 50),
    'date-time': const TDateTimePickerValue(
      year: 2022,
      month: 8,
      day: 10,
      hour: 12,
      minute: 50,
      second: 23,
    ),
    'week': _date,
    'title': _date,
    'without-title': _date,
  };

  static const _date = TDateTimePickerValue(year: 2022, month: 8, day: 10);

  @override
  Widget build(BuildContext context) {
    return _buildTitle(context);
  }
}
```

##### `DateTimePickerWithoutTitleExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DateTimePickerWithoutTitleExample extends StatefulWidget {
  const DateTimePickerWithoutTitleExample({super.key});

  @override
  State<DateTimePickerWithoutTitleExample> createState() =>
      _DateTimePickerWithoutTitleExampleState();
}

class _DateTimePickerWithoutTitleExampleState
    extends State<DateTimePickerWithoutTitleExample> {
  Widget _buildWithoutTitle(BuildContext context) => _cell(
    context,
    'without-title',
    DateTimePickerMode(dateMode: DateMode.date),
    value: _values['without-title']!,
    onConfirm: (value) => setState(() => _values['without-title'] = value),
    title: '无标题时间选择器',
    showTitle: false,
  );

  /// 核心组合片段：调用方使用 [TCell] 作为触发器，用 [TPopup] 组合标题栏
  /// 与纯滚轮 [TDateTimePicker]。滚动只更新草稿，确认时再通过 [onConfirm]
  /// 写回调用方状态，取消不会提交。
  ///
  /// 核心片段省略应用壳；导入 flutter/material.dart 和
  /// package:tdesign_flutter/tdesign_flutter.dart，在 StatefulWidget 的 State
  /// 中放置本方法。父级持有已确认的值，例如：
  /// ```dart
  /// var selected = const TDateTimePickerValue(year: 2022, month: 8, day: 10);
  /// // 在 build 中调用；取消保持 selected，确认后 setState 更新触发器文案。
  /// _cell(context, 'date', DateTimePickerMode(dateMode: DateMode.date),
  ///   value: selected, onConfirm: (next) => setState(() => selected = next));
  /// ```
  ///
  /// 九个入口使用同一组合，按下列实际配置提供 id、mode 和初始 value：
  /// - date：dateMode: DateMode.date；year: 2022, month: 8, day: 10。
  /// - month：dateMode: DateMode.month；year: 2022, month: 8。
  /// - month-day：dateMode: DateMode.monthDay；month: 8, day: 10，不传 year。
  /// - second：timeMode: TimeMode.second；hour: 12, minute: 50, second: 23。
  /// - minute：timeMode: TimeMode.minute；hour: 12, minute: 50。
  /// - date-time：dateMode: DateMode.date, timeMode: TimeMode.second；
  ///   year: 2022, month: 8, day: 10, hour: 12, minute: 50, second: 23。
  /// - week：同 date，showWeek: true。
  /// - title：同 date，title: '带标题时间选择器'。
  /// - without-title：同 date，title: '无标题时间选择器', showTitle: false。
  /// value 均构造为 TDateTimePickerValue；每个入口由父级单独持有选择值。
  /// title 是触发器文案；弹层标题为“选择时间”，showTitle 控制其显示。
  /// 不传的 showWeek 为 false、showTitle 为 true，title 为“选择时间”。
  Widget _cell(
    BuildContext context,
    String id,
    DateTimePickerMode mode, {
    required TDateTimePickerValue value,
    required ValueChanged<TDateTimePickerValue> onConfirm,
    String title = '选择时间',
    bool showWeek = false,
    bool showTitle = true,
  }) {
    String _format(TDateTimePickerValue value, {bool showWeek = false}) {
      String two(int? part) => part?.toString().padLeft(2, '0') ?? '';
      final date = [
        if (value.year != null) '${value.year}',
        if (value.month != null) two(value.month),
        if (value.day != null) two(value.day),
      ].join('-');
      final time = [
        if (value.hour != null) two(value.hour),
        if (value.minute != null) two(value.minute),
        if (value.second != null) two(value.second),
      ].join(':');
      final result = [
        if (date.isNotEmpty) date,
        if (time.isNotEmpty) time,
      ].join(' ');
      if (!showWeek) {
        return result;
      }
      final weekday = DateTime(value.year!, value.month!, value.day!).weekday;
      return '$result 周${['一', '二', '三', '四', '五', '六', '日'][weekday - 1]}';
    }

    void showPicker() {
      var draft = value;
      TPickerPopup.show(
        context,
        headerBuilder: (_, close) => TPopupHeader(
          cancelButton: TToolbarPressable(
            onTap: close,
            child: TText(
              '取消',
              font: context.tTheme.fontBodyLarge,
              style: TextStyle(color: context.tTheme.textColorSecondary),
            ),
          ),
          title: showTitle
              ? TText('选择时间', font: context.tTheme.fontTitleLarge)
              : null,
          confirmButton: TToolbarPressable(
            onTap: () {
              onConfirm(draft);
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
          builder: (_, setPopupState) => TDateTimePicker(
            key: ValueKey('date-time-picker-$id-panel'),
            value: draft,
            mode: mode,
            showWeek: showWeek,
            // 六列并排时年份省略单位，避免 375px 窄屏省略年份数字。
            renderLabel: id == 'date-time'
                ? (column, value) =>
                      column == DateTimeColumn.year ? '$value' : null
                : null,
            onChanged: (next) => setPopupState(() => draft = next),
          ),
        ),
      );
    }

    return TCellGroup(
      cells: [
        TCell(
          key: ValueKey('date-time-picker-$id-trigger'),
          title: TText(title),
          note: TText(_format(value, showWeek: showWeek)),
          arrow: true,
          onTap: showPicker,
        ),
      ],
    );
  }

  final _values = <String, TDateTimePickerValue>{
    'date': _date,
    'month': const TDateTimePickerValue(year: 2022, month: 8),
    'month-day': const TDateTimePickerValue(month: 8, day: 10),
    'second': const TDateTimePickerValue(hour: 12, minute: 50, second: 23),
    'minute': const TDateTimePickerValue(hour: 12, minute: 50),
    'date-time': const TDateTimePickerValue(
      year: 2022,
      month: 8,
      day: 10,
      hour: 12,
      minute: 50,
      second: 23,
    ),
    'week': _date,
    'title': _date,
    'without-title': _date,
  };

  static const _date = TDateTimePickerValue(year: 2022, month: 8, day: 10);

  @override
  Widget build(BuildContext context) {
    return _buildWithoutTitle(context);
  }
}
```

## API

1. [TDateTimePicker](#tdatetimepicker)
2. [DateTimePickerMode](#datetimepickermode)
3. [TDateTimePickerValue](#tdatetimepickervalue)
4. [DateTimePickerSteps](#datetimepickersteps)
5. [DateMode](#datemode)
6. [TimeMode](#timemode)
7. [DateTimeColumn](#datetimecolumn)
8. [DateTimePickerRenderLabel](#datetimepickerrenderlabel)

### TDateTimePicker

#### 构造方法

##### TDateTimePicker

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| end | TDateTimePickerValue? | - | 可选范围上限。未指定时，年列最大值为初始选中年份加 10。 start 不应晚于 end；debug 模式会断言，release 模式遇到逆序范围时忽略 end。 - **类型**：`TDateTimePickerValue`，仅传当前 mode 涉及的字段即可 - **语义**：超出范围的候选项会被裁剪；变更会触发列重建 - **月日模式**：未传 year 时使用 `value` 的计算年，value 也未传 year 时使用 2000 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| mode | DateTimePickerMode? | - | 滚轮列结构。 - **类型**：`DateTimePickerMode`，通过 `DateMode`、`TimeMode` 组合列 - **默认**：未传时等价于 `DateTimePickerMode(dateMode: DateMode.date)`（年月日） - **变更语义**：列结构变化会重建滚轮并清空上次通知值 | 否 |
| onChanged | void Function(TDateTimePickerValue result)? | - | 选中值变化回调（滚动时实时触发，不代表用户已确认选择） - **触发时机**：滚轮选中变化且结果与上次通知值不同时 - **返回值**：`TDateTimePickerValue`；不含的列字段为 null - **典型用法**：维护业务侧受控状态 | 否 |
| renderLabel | DateTimePickerRenderLabel? | - | 自定义列展示文案 - **回调参数**：`column` 为 `DateTimeColumn`，`value` 为列数值 - **回退**：返回 null 时使用内置默认文案（含国际化单位后缀） - **更新**：回调变化会刷新文案，保留当前滚动状态；可直接在 build 中传入匿名回调。 | 否 |
| showWeek | bool | false | 日列是否在 label 后附加星期，默认 false - **生效范围**：仅 `DateTimeColumn.day` 列 - **变更语义**：变更会触发列重建 | 否 |
| start | TDateTimePickerValue? | - | 可选范围下限。未指定时，年列最小值为初始选中年份减 10。 - **类型**：`TDateTimePickerValue`，仅传当前 mode 涉及的字段即可 - **语义**：超出范围的候选项会被裁剪；变更会触发列重建 - **月日模式**：未传 year 时使用 `value` 的计算年，value 也未传 year 时使用 2000 | 否 |
| steps | DateTimePickerSteps? | - | 各列选项步进 - **类型**：`DateTimePickerSteps`；未配置或小于等于 1 的列步进按 1 处理 - **变更语义**：变更会触发列重建，保留当前选中时刻（在合法范围内 clamp） | 否 |
| value | TDateTimePickerValue | - | 受控选中值。 父级接受 `onChanged` 的结果后重建并回传新值。滚动结束后父级未接受 的候选值自动恢复为按当前模式、边界和步进归一化后的值。 | 是 |

### DateTimePickerMode

滚轮列结构，由 `DateMode`、`TimeMode` 组合。

通过 `DateTimePickerMode(dateMode:, timeMode:)` 构造，至少传其一：

- `dateMode`：日期段粒度（年 / 年月 / 年月日 / 月日）；不传则不展示日期列
- `timeMode`：时间段粒度（时 / 时分 / 时分秒）；不传则不展示时间列

#### 构造方法

##### DateTimePickerMode

创建滚轮列结构；`dateMode`、`timeMode` 至少传其一。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| dateMode | DateMode? | - | 日期段粒度；为 null 时不展示日期列。 | 否 |
| timeMode | TimeMode? | - | 时间段粒度；为 null 时不展示时间列。 | 否 |

### TDateTimePickerValue

`TDateTimePicker.onChanged` 返回值；`null` 字段表示当前 mode 不含该列。

初始化 `TDateTimePicker.value`、`start`、`end` 时仅传相关字段即可；
提交后端时使用 `toDateTime`，partial 值须显式传入 `fallback`。

#### 构造方法

##### TDateTimePickerValue

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| day | int? | - | 日（1–31）；当前 mode 不含日列或未赋值时为 null。 | 否 |
| hour | int? | - | 时（0–23）；当前 mode 不含时列或未赋值时为 null。 | 否 |
| minute | int? | - | 分（0–59）；当前 mode 不含分列或未赋值时为 null。 | 否 |
| month | int? | - | 月（1–12）；当前 mode 不含月列或未赋值时为 null。 | 否 |
| second | int? | - | 秒（0–59）；当前 mode 不含秒列或未赋值时为 null。 | 否 |
| year | int? | - | 年（1–9999）；当前 mode 不含年列或未赋值时为 null。 | 否 |

#### 实例方法

##### TDateTimePickerValue.toDateTime

转为 `DateTime`

- **完整值**：六元组均有值时直接构造
- **partial 值**：缺字段用 `fallback` 补齐；未传 `fallback` 时抛出 `ArgumentError`
- **日期归一化**：按 Dart `DateTime` 构造规则组合字段；例如 2 月配合 31 日
  的 fallback 会跨月归一化，不会自动按 Picker 范围裁剪。
- **典型用法**：提交后端前调用；partial 值须传入能组成业务合法日期的 `fallback`

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| fallback | DateTime? | - | 补齐未指定日期时间字段的业务基准；partial 值未提供它时抛出 ArgumentError。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | DateTime | - | 以六个时间字段构造的本地 DateTime；缺失字段由 fallback 补齐，未提供所需 fallback 时抛出 ArgumentError， 日期字段按 Dart DateTime 规则归一化。 | - |

### DateTimePickerSteps

各列选项步进，未配置或小于等于 1 的列步进按 1 处理。

#### 构造方法

##### DateTimePickerSteps

创建步进配置。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| day | int? | - | 日列步进。 | 否 |
| hour | int? | - | 时列步进。 | 否 |
| minute | int? | - | 分列步进。 | 否 |
| month | int? | - | 月列步进。 | 否 |
| second | int? | - | 秒列步进。 | 否 |
| year | int? | - | 年列步进。 | 否 |

### DateMode

日期段粒度，用于 `DateTimePickerMode` 的 `DateMode` 参数。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| year | DateMode | - | 年。 | - |
| month | DateMode | - | 年 + 月。 | - |
| date | DateMode | - | 年 + 月 + 日。 | - |
| monthDay | DateMode | - | 月 + 日，不显示年份。缺省年份按 2000 年计算，允许选择 2 月 29 日。 可通过受控值的 year 指定计算年；回调的 year 仍为 null。 若业务绑定特定年份，接收回调后应继续在 value 中传入该年份。 | - |

### TimeMode

时间段粒度，用于 `DateTimePickerMode` 的 `TimeMode` 参数。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| hour | TimeMode | - | 时。 | - |
| minute | TimeMode | - | 时 + 分。 | - |
| second | TimeMode | - | 时 + 分 + 秒。 | - |

### DateTimeColumn

滚轮列标识，用于 `DateTimePickerRenderLabel` 回调与 `DateTimePickerMode` 列展开。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| year | DateTimeColumn | - | 年列。 | - |
| month | DateTimeColumn | - | 月列。 | - |
| day | DateTimeColumn | - | 日列。 | - |
| hour | DateTimeColumn | - | 时列。 | - |
| minute | DateTimeColumn | - | 分列。 | - |
| second | DateTimeColumn | - | 秒列。 | - |

### DateTimePickerRenderLabel

自定义滚轮列展示文案。

位置参数：`column, value`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| column | DateTimeColumn | - | 当前列，见 `DateTimeColumn`。 | 是 |
| value | int | - | 列数值。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | String? | - | 选项展示文案；返回 null 时使用该列默认文案。 | - |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)

### 何时使用

在表单中需要输入单个日期或时间时使用。

### 组件搭配使用

##### 通常和[单元格](<../数据展示/Cell 单元格.md>)搭配使用，点击后唤起时间选择器。

![](https://tdesign.gtimg.com/site/design/mobile-guide/date-time-picker/date-time-picker-1.png)

### 常见用法

##### 当需要输入时间区间时，通常使用两个时间选择器分别选择起、止时间。

![](https://tdesign.gtimg.com/site/design/mobile-guide/date-time-picker/date-time-picker-2.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/date-time-picker/date-time-picker-3.png)

### 推荐/慎用示例

##### 选择时间后，建议使用标准化格式在表单中书写日期和时间。

![](https://tdesign.gtimg.com/site/design/mobile-guide/date-time-picker/date-time-picker-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)
