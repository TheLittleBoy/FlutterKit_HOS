# Calendar 日历

> 按照日历形式展示数据或日期的容器。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/calendar)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 基础日历

```dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CalendarSingleExample extends StatefulWidget {
  const CalendarSingleExample({super.key});

  @override
  State<CalendarSingleExample> createState() => _CalendarSingleExampleState();
}

class _CalendarSingleExampleState extends State<CalendarSingleExample> {
  Widget _buildSingle(BuildContext context) => TCellGroup(
    cells: [
      TCell(
        key: const ValueKey('calendar-single-trigger'),
        title: const TText('单个选择日历'),
        note: _dateNote(_singleValue),
        arrow: true,
        onTap: () => _showCalendar(
          variant: TCalendarVariant.single,
          value: _singleValue,
          onConfirm: (value) => setState(() => _singleValue = value),
        ),
      ),
    ],
  );

  Widget _dateNote(List<DateTime> dates) => ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 170),
    child: TText(
      _formatDates(dates),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
  );

  List<DateTime> _singleValue = [DateTime(2022, 2, 18)];

  void _showCalendar({
    required TCalendarVariant variant,
    required List<DateTime> value,
    required ValueChanged<List<DateTime>> onConfirm,
    DateTime? minDate,
    DateTime? maxDate,
    TCalendarSubtitleBuilder? subtitleBuilder,
    TCalendarCellBuilder? cellBuilder,
    bool showMonthSwitcher = false,
    bool localized = false,
  }) {
    var draft = List<DateTime>.of(value);
    final start = minDate ?? DateTime(2021, 3);
    final end = maxDate ?? DateTime(2030, 3, 2);
    var anchor = draft.isEmpty ? start : draft.first;
    late TPopupHandle popup;
    popup = TPopup.show(
      Navigator.of(context).context,
      options: TPopupOptions.bottom(
        height: MediaQuery.sizeOf(context).height * 0.85,
        headerBuilder: (_, close) => SizedBox(
          height: TPopupHeader.headerHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              TText(
                localized ? 'Select Date' : '请选择日期',
                font: context.tTheme.fontTitleLarge,
              ),
              Positioned(
                right: context.tTheme.spacer,
                child: IconButton(
                  tooltip: localized ? 'Close' : '关闭',
                  onPressed: close,
                  icon: const TIcon(TIcons.close),
                ),
              ),
            ],
          ),
        ),
        child: StatefulBuilder(
          builder: (context, setPopupState) {
            final first = DateTime(anchor.year, anchor.month);
            final last = DateTime(anchor.year, anchor.month + 1, 0);
            final calendar = TCalendar(
              key: const ValueKey('calendar-popup-panel'),
              value: draft,
              variant: variant,
              minDate: showMonthSwitcher && first.isAfter(start)
                  ? first
                  : start,
              maxDate: showMonthSwitcher && last.isBefore(end) ? last : end,
              anchorDate: anchor,
              subtitleBuilder: subtitleBuilder,
              cellBuilder: cellBuilder,
              monthTitleBuilder: showMonthSwitcher
                  ? (_, __) => const SizedBox.shrink()
                  : localized
                  ? (_, month) => TText(
                      '${_englishMonths[month.month - 1]} ${month.year}',
                    )
                  : null,
              onChanged: (next) => setPopupState(() => draft = next),
            );
            final body = Material(
              color: context.tTheme.bgColorContainer,
              child: Column(
                children: [
                  if (showMonthSwitcher)
                    CalendarSingleExampleCalendarMonthSwitcher(
                      month: anchor,
                      minDate: start,
                      maxDate: end,
                      onChanged: (month) => setPopupState(() => anchor = month),
                    ),
                  Expanded(
                    child: showMonthSwitcher
                        ? Theme(
                            data: Theme.of(context).mergeExtension(
                              (Theme.of(
                                        context,
                                      ).extension<TCalendarThemeData>() ??
                                      const TCalendarThemeData())
                                  .copyWith(monthTitleHeight: 0),
                            ),
                            child: calendar,
                          )
                        : calendar,
                  ),
                  Padding(
                    padding: EdgeInsets.all(context.tTheme.spacer2),
                    child: SizedBox(
                      width: double.infinity,
                      child: TButton(
                        colorPreset: TButtonColorPreset.primary,
                        size: TButtonSize.large,
                        onPressed:
                            draft.isEmpty ||
                                (variant == TCalendarVariant.range &&
                                    draft.length != 2)
                            ? null
                            : () {
                                onConfirm(List<DateTime>.of(draft));
                                popup.close();
                              },
                        child: Text(localized ? 'Confirm' : '确定'),
                      ),
                    ),
                  ),
                ],
              ),
            );
            return localized
                ? Localizations.override(
                    context: context,
                    locale: const Locale('en'),
                    delegates: GlobalMaterialLocalizations.delegates,
                    child: body,
                  )
                : body;
          },
        ),
      ),
    );
  }

  String _formatDates(List<DateTime> dates) => dates.map(_formatDate).join('、');

  String _formatDate(DateTime? date) {
    if (date == null) {
      return '';
    }
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }

  @override
  Widget build(BuildContext context) {
    return _buildSingle(context);
  }
}

const _englishMonths = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

class CalendarSingleExampleCalendarMonthSwitcher extends StatelessWidget {
  const CalendarSingleExampleCalendarMonthSwitcher({
    super.key,
    required this.month,
    required this.minDate,
    required this.maxDate,
    required this.onChanged,
  });

  final DateTime minDate;
  final DateTime maxDate;

  final DateTime month;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          tooltip: '上个月',
          onPressed:
              DateTime(
                month.year,
                month.month,
              ).isAfter(DateTime(minDate.year, minDate.month))
              ? () => onChanged(DateTime(month.year, month.month - 1))
              : null,
          icon: const TIcon(TIcons.chevron_left),
        ),
        Expanded(
          child: TText(
            '${month.year} 年 ${month.month} 月',
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          tooltip: '下个月',
          onPressed:
              DateTime(
                month.year,
                month.month,
              ).isBefore(DateTime(maxDate.year, maxDate.month))
              ? () => onChanged(DateTime(month.year, month.month + 1))
              : null,
          icon: const TIcon(TIcons.chevron_right),
        ),
      ],
    );
  }
}
```

##### `CalendarMultipleExample`

```dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CalendarMultipleExample extends StatefulWidget {
  const CalendarMultipleExample({super.key});

  @override
  State<CalendarMultipleExample> createState() =>
      _CalendarMultipleExampleState();
}

class _CalendarMultipleExampleState extends State<CalendarMultipleExample> {
  Widget _buildMultiple(BuildContext context) => TCellGroup(
    cells: [
      TCell(
        key: const ValueKey('calendar-multiple-trigger'),
        title: const TText('多个选择日历'),
        note: _dateNote(_multipleValue),
        arrow: true,
        onTap: () => _showCalendar(
          variant: TCalendarVariant.multiple,
          value: _multipleValue,
          onConfirm: (value) => setState(() => _multipleValue = value),
        ),
      ),
    ],
  );

  Widget _dateNote(List<DateTime> dates) => ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 170),
    child: TText(
      _formatDates(dates),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
  );

  List<DateTime> _multipleValue = [
    DateTime(2022, 2, 18),
    DateTime(2022, 2, 20),
    DateTime(2022, 2, 22),
  ];

  void _showCalendar({
    required TCalendarVariant variant,
    required List<DateTime> value,
    required ValueChanged<List<DateTime>> onConfirm,
    DateTime? minDate,
    DateTime? maxDate,
    TCalendarSubtitleBuilder? subtitleBuilder,
    TCalendarCellBuilder? cellBuilder,
    bool showMonthSwitcher = false,
    bool localized = false,
  }) {
    var draft = List<DateTime>.of(value);
    final start = minDate ?? DateTime(2021, 3);
    final end = maxDate ?? DateTime(2030, 3, 2);
    var anchor = draft.isEmpty ? start : draft.first;
    late TPopupHandle popup;
    popup = TPopup.show(
      Navigator.of(context).context,
      options: TPopupOptions.bottom(
        height: MediaQuery.sizeOf(context).height * 0.85,
        headerBuilder: (_, close) => SizedBox(
          height: TPopupHeader.headerHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              TText(
                localized ? 'Select Date' : '请选择日期',
                font: context.tTheme.fontTitleLarge,
              ),
              Positioned(
                right: context.tTheme.spacer,
                child: IconButton(
                  tooltip: localized ? 'Close' : '关闭',
                  onPressed: close,
                  icon: const TIcon(TIcons.close),
                ),
              ),
            ],
          ),
        ),
        child: StatefulBuilder(
          builder: (context, setPopupState) {
            final first = DateTime(anchor.year, anchor.month);
            final last = DateTime(anchor.year, anchor.month + 1, 0);
            final calendar = TCalendar(
              key: const ValueKey('calendar-popup-panel'),
              value: draft,
              variant: variant,
              minDate: showMonthSwitcher && first.isAfter(start)
                  ? first
                  : start,
              maxDate: showMonthSwitcher && last.isBefore(end) ? last : end,
              anchorDate: anchor,
              subtitleBuilder: subtitleBuilder,
              cellBuilder: cellBuilder,
              monthTitleBuilder: showMonthSwitcher
                  ? (_, __) => const SizedBox.shrink()
                  : localized
                  ? (_, month) => TText(
                      '${_englishMonths[month.month - 1]} ${month.year}',
                    )
                  : null,
              onChanged: (next) => setPopupState(() => draft = next),
            );
            final body = Material(
              color: context.tTheme.bgColorContainer,
              child: Column(
                children: [
                  if (showMonthSwitcher)
                    CalendarMultipleExampleCalendarMonthSwitcher(
                      month: anchor,
                      minDate: start,
                      maxDate: end,
                      onChanged: (month) => setPopupState(() => anchor = month),
                    ),
                  Expanded(
                    child: showMonthSwitcher
                        ? Theme(
                            data: Theme.of(context).mergeExtension(
                              (Theme.of(
                                        context,
                                      ).extension<TCalendarThemeData>() ??
                                      const TCalendarThemeData())
                                  .copyWith(monthTitleHeight: 0),
                            ),
                            child: calendar,
                          )
                        : calendar,
                  ),
                  Padding(
                    padding: EdgeInsets.all(context.tTheme.spacer2),
                    child: SizedBox(
                      width: double.infinity,
                      child: TButton(
                        colorPreset: TButtonColorPreset.primary,
                        size: TButtonSize.large,
                        onPressed:
                            draft.isEmpty ||
                                (variant == TCalendarVariant.range &&
                                    draft.length != 2)
                            ? null
                            : () {
                                onConfirm(List<DateTime>.of(draft));
                                popup.close();
                              },
                        child: Text(localized ? 'Confirm' : '确定'),
                      ),
                    ),
                  ),
                ],
              ),
            );
            return localized
                ? Localizations.override(
                    context: context,
                    locale: const Locale('en'),
                    delegates: GlobalMaterialLocalizations.delegates,
                    child: body,
                  )
                : body;
          },
        ),
      ),
    );
  }

  String _formatDates(List<DateTime> dates) => dates.map(_formatDate).join('、');

  String _formatDate(DateTime? date) {
    if (date == null) {
      return '';
    }
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }

  @override
  Widget build(BuildContext context) {
    return _buildMultiple(context);
  }
}

const _englishMonths = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

class CalendarMultipleExampleCalendarMonthSwitcher extends StatelessWidget {
  const CalendarMultipleExampleCalendarMonthSwitcher({
    super.key,
    required this.month,
    required this.minDate,
    required this.maxDate,
    required this.onChanged,
  });

  final DateTime minDate;
  final DateTime maxDate;

  final DateTime month;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          tooltip: '上个月',
          onPressed:
              DateTime(
                month.year,
                month.month,
              ).isAfter(DateTime(minDate.year, minDate.month))
              ? () => onChanged(DateTime(month.year, month.month - 1))
              : null,
          icon: const TIcon(TIcons.chevron_left),
        ),
        Expanded(
          child: TText(
            '${month.year} 年 ${month.month} 月',
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          tooltip: '下个月',
          onPressed:
              DateTime(
                month.year,
                month.month,
              ).isBefore(DateTime(maxDate.year, maxDate.month))
              ? () => onChanged(DateTime(month.year, month.month + 1))
              : null,
          icon: const TIcon(TIcons.chevron_right),
        ),
      ],
    );
  }
}
```

##### 带单行描述的日历

```dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CalendarDescribedExample extends StatefulWidget {
  const CalendarDescribedExample({super.key});

  @override
  State<CalendarDescribedExample> createState() =>
      _CalendarDescribedExampleState();
}

class _CalendarDescribedExampleState extends State<CalendarDescribedExample> {
  Widget _buildDescribed(BuildContext context) => TCellGroup(
    cells: [
      TCell(
        key: const ValueKey('calendar-single-description-trigger'),
        title: const TText('带单行描述的日历'),
        note: _dateNote(_describedSingleValue),
        arrow: true,
        onTap: () => _showCalendar(
          variant: TCalendarVariant.single,
          value: _describedSingleValue,
          minDate: DateTime(2021, 3),
          maxDate: DateTime(2030, 3, 2),
          subtitleBuilder: (_, __) => const Text('¥60'),
          onConfirm: (value) => setState(() => _describedSingleValue = value),
        ),
      ),
    ],
  );

  Widget _dateNote(List<DateTime> dates) => ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 170),
    child: TText(
      _formatDates(dates),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
  );

  List<DateTime> _describedSingleValue = [DateTime(2022, 2, 18)];

  void _showCalendar({
    required TCalendarVariant variant,
    required List<DateTime> value,
    required ValueChanged<List<DateTime>> onConfirm,
    DateTime? minDate,
    DateTime? maxDate,
    TCalendarSubtitleBuilder? subtitleBuilder,
    TCalendarCellBuilder? cellBuilder,
    bool showMonthSwitcher = false,
    bool localized = false,
  }) {
    var draft = List<DateTime>.of(value);
    final start = minDate ?? DateTime(2021, 3);
    final end = maxDate ?? DateTime(2030, 3, 2);
    var anchor = draft.isEmpty ? start : draft.first;
    late TPopupHandle popup;
    popup = TPopup.show(
      Navigator.of(context).context,
      options: TPopupOptions.bottom(
        height: MediaQuery.sizeOf(context).height * 0.85,
        headerBuilder: (_, close) => SizedBox(
          height: TPopupHeader.headerHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              TText(
                localized ? 'Select Date' : '请选择日期',
                font: context.tTheme.fontTitleLarge,
              ),
              Positioned(
                right: context.tTheme.spacer,
                child: IconButton(
                  tooltip: localized ? 'Close' : '关闭',
                  onPressed: close,
                  icon: const TIcon(TIcons.close),
                ),
              ),
            ],
          ),
        ),
        child: StatefulBuilder(
          builder: (context, setPopupState) {
            final first = DateTime(anchor.year, anchor.month);
            final last = DateTime(anchor.year, anchor.month + 1, 0);
            final calendar = TCalendar(
              key: const ValueKey('calendar-popup-panel'),
              value: draft,
              variant: variant,
              minDate: showMonthSwitcher && first.isAfter(start)
                  ? first
                  : start,
              maxDate: showMonthSwitcher && last.isBefore(end) ? last : end,
              anchorDate: anchor,
              subtitleBuilder: subtitleBuilder,
              cellBuilder: cellBuilder,
              monthTitleBuilder: showMonthSwitcher
                  ? (_, __) => const SizedBox.shrink()
                  : localized
                  ? (_, month) => TText(
                      '${_englishMonths[month.month - 1]} ${month.year}',
                    )
                  : null,
              onChanged: (next) => setPopupState(() => draft = next),
            );
            final body = Material(
              color: context.tTheme.bgColorContainer,
              child: Column(
                children: [
                  if (showMonthSwitcher)
                    CalendarDescribedExampleCalendarMonthSwitcher(
                      month: anchor,
                      minDate: start,
                      maxDate: end,
                      onChanged: (month) => setPopupState(() => anchor = month),
                    ),
                  Expanded(
                    child: showMonthSwitcher
                        ? Theme(
                            data: Theme.of(context).mergeExtension(
                              (Theme.of(
                                        context,
                                      ).extension<TCalendarThemeData>() ??
                                      const TCalendarThemeData())
                                  .copyWith(monthTitleHeight: 0),
                            ),
                            child: calendar,
                          )
                        : calendar,
                  ),
                  Padding(
                    padding: EdgeInsets.all(context.tTheme.spacer2),
                    child: SizedBox(
                      width: double.infinity,
                      child: TButton(
                        colorPreset: TButtonColorPreset.primary,
                        size: TButtonSize.large,
                        onPressed:
                            draft.isEmpty ||
                                (variant == TCalendarVariant.range &&
                                    draft.length != 2)
                            ? null
                            : () {
                                onConfirm(List<DateTime>.of(draft));
                                popup.close();
                              },
                        child: Text(localized ? 'Confirm' : '确定'),
                      ),
                    ),
                  ),
                ],
              ),
            );
            return localized
                ? Localizations.override(
                    context: context,
                    locale: const Locale('en'),
                    delegates: GlobalMaterialLocalizations.delegates,
                    child: body,
                  )
                : body;
          },
        ),
      ),
    );
  }

  String _formatDates(List<DateTime> dates) => dates.map(_formatDate).join('、');

  String _formatDate(DateTime? date) {
    if (date == null) {
      return '';
    }
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }

  @override
  Widget build(BuildContext context) {
    return _buildDescribed(context);
  }
}

const _englishMonths = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

class CalendarDescribedExampleCalendarMonthSwitcher extends StatelessWidget {
  const CalendarDescribedExampleCalendarMonthSwitcher({
    super.key,
    required this.month,
    required this.minDate,
    required this.maxDate,
    required this.onChanged,
  });

  final DateTime minDate;
  final DateTime maxDate;

  final DateTime month;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          tooltip: '上个月',
          onPressed:
              DateTime(
                month.year,
                month.month,
              ).isAfter(DateTime(minDate.year, minDate.month))
              ? () => onChanged(DateTime(month.year, month.month - 1))
              : null,
          icon: const TIcon(TIcons.chevron_left),
        ),
        Expanded(
          child: TText(
            '${month.year} 年 ${month.month} 月',
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          tooltip: '下个月',
          onPressed:
              DateTime(
                month.year,
                month.month,
              ).isBefore(DateTime(maxDate.year, maxDate.month))
              ? () => onChanged(DateTime(month.year, month.month + 1))
              : null,
          icon: const TIcon(TIcons.chevron_right),
        ),
      ],
    );
  }
}
```

##### 带双行描述的日历

```dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CalendarDoubleDescribedExample extends StatefulWidget {
  const CalendarDoubleDescribedExample({super.key});

  @override
  State<CalendarDoubleDescribedExample> createState() =>
      _CalendarDoubleDescribedExampleState();
}

class _CalendarDoubleDescribedExampleState
    extends State<CalendarDoubleDescribedExample> {
  Widget _buildDoubleDescribed(BuildContext context) => TCellGroup(
    cells: [
      TCell(
        key: const ValueKey('calendar-double-description-trigger'),
        title: const TText('带双行描述的日历'),
        note: _dateNote(_describedMultipleValue),
        arrow: true,
        onTap: () => _showCalendar(
          variant: TCalendarVariant.multiple,
          value: _describedMultipleValue,
          minDate: DateTime(2021, 3),
          maxDate: DateTime(2030, 3, 2),
          cellBuilder: (context, model) {
            const holidays = {
              8: "Women's",
              12: 'Arbor',
              16: 'Holiday',
              17: 'Holiday',
              18: 'Holiday',
              20: 'Postal',
            };
            final selected = model.selectType == DateSelectType.selected;
            final disabled = model.selectType == DateSelectType.disabled;
            final holidayLabel =
                model.date.year == 2023 && model.date.month == 3
                ? holidays[model.date.day]
                : null;
            final holiday = holidayLabel != null;
            final dayColor = disabled
                ? context.tTheme.textColorDisabled
                : selected
                ? context.tTheme.textColorAnti
                : holiday
                ? context.tTheme.errorColor
                : context.tTheme.textColorPrimary;
            final priceColor = disabled
                ? context.tTheme.textColorDisabled
                : selected
                ? context.tTheme.textColorAnti
                : context.tTheme.textColorPlaceholder;
            return Stack(
              alignment: Alignment.center,
              children: [
                TText(
                  '${model.date.day}',
                  font: context.tTheme.fontTitleMedium,
                  style: TextStyle(color: dayColor),
                ),
                Positioned(
                  top: 4.0,
                  child: TText(
                    holidayLabel ?? '',
                    font: context.tTheme.fontBodyExtraSmall,
                    style: TextStyle(color: dayColor),
                  ),
                ),
                Positioned(
                  bottom: 4.0,
                  child: TText(
                    '¥60',
                    font: context.tTheme.fontBodyExtraSmall,
                    style: TextStyle(color: priceColor),
                  ),
                ),
              ],
            );
          },
          onConfirm: (value) => setState(() => _describedMultipleValue = value),
        ),
      ),
    ],
  );

  Widget _dateNote(List<DateTime> dates) => ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 170),
    child: TText(
      _formatDates(dates),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
  );

  List<DateTime> _describedMultipleValue = [DateTime(2023, 3, 10)];

  void _showCalendar({
    required TCalendarVariant variant,
    required List<DateTime> value,
    required ValueChanged<List<DateTime>> onConfirm,
    DateTime? minDate,
    DateTime? maxDate,
    TCalendarSubtitleBuilder? subtitleBuilder,
    TCalendarCellBuilder? cellBuilder,
    bool showMonthSwitcher = false,
    bool localized = false,
  }) {
    var draft = List<DateTime>.of(value);
    final start = minDate ?? DateTime(2021, 3);
    final end = maxDate ?? DateTime(2030, 3, 2);
    var anchor = draft.isEmpty ? start : draft.first;
    late TPopupHandle popup;
    popup = TPopup.show(
      Navigator.of(context).context,
      options: TPopupOptions.bottom(
        height: MediaQuery.sizeOf(context).height * 0.85,
        headerBuilder: (_, close) => SizedBox(
          height: TPopupHeader.headerHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              TText(
                localized ? 'Select Date' : '请选择日期',
                font: context.tTheme.fontTitleLarge,
              ),
              Positioned(
                right: context.tTheme.spacer,
                child: IconButton(
                  tooltip: localized ? 'Close' : '关闭',
                  onPressed: close,
                  icon: const TIcon(TIcons.close),
                ),
              ),
            ],
          ),
        ),
        child: StatefulBuilder(
          builder: (context, setPopupState) {
            final first = DateTime(anchor.year, anchor.month);
            final last = DateTime(anchor.year, anchor.month + 1, 0);
            final calendar = TCalendar(
              key: const ValueKey('calendar-popup-panel'),
              value: draft,
              variant: variant,
              minDate: showMonthSwitcher && first.isAfter(start)
                  ? first
                  : start,
              maxDate: showMonthSwitcher && last.isBefore(end) ? last : end,
              anchorDate: anchor,
              subtitleBuilder: subtitleBuilder,
              cellBuilder: cellBuilder,
              monthTitleBuilder: showMonthSwitcher
                  ? (_, __) => const SizedBox.shrink()
                  : localized
                  ? (_, month) => TText(
                      '${_englishMonths[month.month - 1]} ${month.year}',
                    )
                  : null,
              onChanged: (next) => setPopupState(() => draft = next),
            );
            final body = Material(
              color: context.tTheme.bgColorContainer,
              child: Column(
                children: [
                  if (showMonthSwitcher)
                    CalendarDoubleDescribedExampleCalendarMonthSwitcher(
                      month: anchor,
                      minDate: start,
                      maxDate: end,
                      onChanged: (month) => setPopupState(() => anchor = month),
                    ),
                  Expanded(
                    child: showMonthSwitcher
                        ? Theme(
                            data: Theme.of(context).mergeExtension(
                              (Theme.of(
                                        context,
                                      ).extension<TCalendarThemeData>() ??
                                      const TCalendarThemeData())
                                  .copyWith(monthTitleHeight: 0),
                            ),
                            child: calendar,
                          )
                        : calendar,
                  ),
                  Padding(
                    padding: EdgeInsets.all(context.tTheme.spacer2),
                    child: SizedBox(
                      width: double.infinity,
                      child: TButton(
                        colorPreset: TButtonColorPreset.primary,
                        size: TButtonSize.large,
                        onPressed:
                            draft.isEmpty ||
                                (variant == TCalendarVariant.range &&
                                    draft.length != 2)
                            ? null
                            : () {
                                onConfirm(List<DateTime>.of(draft));
                                popup.close();
                              },
                        child: Text(localized ? 'Confirm' : '确定'),
                      ),
                    ),
                  ),
                ],
              ),
            );
            return localized
                ? Localizations.override(
                    context: context,
                    locale: const Locale('en'),
                    delegates: GlobalMaterialLocalizations.delegates,
                    child: body,
                  )
                : body;
          },
        ),
      ),
    );
  }

  String _formatDates(List<DateTime> dates) => dates.map(_formatDate).join('、');

  String _formatDate(DateTime? date) {
    if (date == null) {
      return '';
    }
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }

  @override
  Widget build(BuildContext context) {
    return _buildDoubleDescribed(context);
  }
}

const _englishMonths = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

class CalendarDoubleDescribedExampleCalendarMonthSwitcher
    extends StatelessWidget {
  const CalendarDoubleDescribedExampleCalendarMonthSwitcher({
    super.key,
    required this.month,
    required this.minDate,
    required this.maxDate,
    required this.onChanged,
  });

  final DateTime minDate;
  final DateTime maxDate;

  final DateTime month;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          tooltip: '上个月',
          onPressed:
              DateTime(
                month.year,
                month.month,
              ).isAfter(DateTime(minDate.year, minDate.month))
              ? () => onChanged(DateTime(month.year, month.month - 1))
              : null,
          icon: const TIcon(TIcons.chevron_left),
        ),
        Expanded(
          child: TText(
            '${month.year} 年 ${month.month} 月',
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          tooltip: '下个月',
          onPressed:
              DateTime(
                month.year,
                month.month,
              ).isBefore(DateTime(maxDate.year, maxDate.month))
              ? () => onChanged(DateTime(month.year, month.month + 1))
              : null,
          icon: const TIcon(TIcons.chevron_right),
        ),
      ],
    );
  }
}
```

##### 带翻页功能的日历

```dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CalendarSwitchModeExample extends StatefulWidget {
  const CalendarSwitchModeExample({super.key});

  @override
  State<CalendarSwitchModeExample> createState() =>
      _CalendarSwitchModeExampleState();
}

class _CalendarSwitchModeExampleState extends State<CalendarSwitchModeExample> {
  Widget _buildSwitchMode(BuildContext context) => TCellGroup(
    cells: [
      TCell(
        key: const ValueKey('calendar-switch-trigger'),
        title: const TText('带翻页功能的日历'),
        note: _dateNote(_switchValue),
        arrow: true,
        onTap: () => _showCalendar(
          variant: TCalendarVariant.single,
          value: _switchValue,
          minDate: DateTime(2021, 3),
          maxDate: DateTime(2030, 3, 2),
          showMonthSwitcher: true,
          onConfirm: (value) => setState(() => _switchValue = value),
        ),
      ),
    ],
  );

  Widget _dateNote(List<DateTime> dates) => ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 170),
    child: TText(
      _formatDates(dates),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
  );

  List<DateTime> _switchValue = [DateTime(2022, 2, 18)];

  void _showCalendar({
    required TCalendarVariant variant,
    required List<DateTime> value,
    required ValueChanged<List<DateTime>> onConfirm,
    DateTime? minDate,
    DateTime? maxDate,
    TCalendarSubtitleBuilder? subtitleBuilder,
    TCalendarCellBuilder? cellBuilder,
    bool showMonthSwitcher = false,
    bool localized = false,
  }) {
    var draft = List<DateTime>.of(value);
    final start = minDate ?? DateTime(2021, 3);
    final end = maxDate ?? DateTime(2030, 3, 2);
    var anchor = draft.isEmpty ? start : draft.first;
    late TPopupHandle popup;
    popup = TPopup.show(
      Navigator.of(context).context,
      options: TPopupOptions.bottom(
        height: MediaQuery.sizeOf(context).height * 0.85,
        headerBuilder: (_, close) => SizedBox(
          height: TPopupHeader.headerHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              TText(
                localized ? 'Select Date' : '请选择日期',
                font: context.tTheme.fontTitleLarge,
              ),
              Positioned(
                right: context.tTheme.spacer,
                child: IconButton(
                  tooltip: localized ? 'Close' : '关闭',
                  onPressed: close,
                  icon: const TIcon(TIcons.close),
                ),
              ),
            ],
          ),
        ),
        child: StatefulBuilder(
          builder: (context, setPopupState) {
            final first = DateTime(anchor.year, anchor.month);
            final last = DateTime(anchor.year, anchor.month + 1, 0);
            final calendar = TCalendar(
              key: const ValueKey('calendar-popup-panel'),
              value: draft,
              variant: variant,
              minDate: showMonthSwitcher && first.isAfter(start)
                  ? first
                  : start,
              maxDate: showMonthSwitcher && last.isBefore(end) ? last : end,
              anchorDate: anchor,
              subtitleBuilder: subtitleBuilder,
              cellBuilder: cellBuilder,
              monthTitleBuilder: showMonthSwitcher
                  ? (_, __) => const SizedBox.shrink()
                  : localized
                  ? (_, month) => TText(
                      '${_englishMonths[month.month - 1]} ${month.year}',
                    )
                  : null,
              onChanged: (next) => setPopupState(() => draft = next),
            );
            final body = Material(
              color: context.tTheme.bgColorContainer,
              child: Column(
                children: [
                  if (showMonthSwitcher)
                    CalendarSwitchModeExampleCalendarMonthSwitcher(
                      month: anchor,
                      minDate: start,
                      maxDate: end,
                      onChanged: (month) => setPopupState(() => anchor = month),
                    ),
                  Expanded(
                    child: showMonthSwitcher
                        ? Theme(
                            data: Theme.of(context).mergeExtension(
                              (Theme.of(
                                        context,
                                      ).extension<TCalendarThemeData>() ??
                                      const TCalendarThemeData())
                                  .copyWith(monthTitleHeight: 0),
                            ),
                            child: calendar,
                          )
                        : calendar,
                  ),
                  Padding(
                    padding: EdgeInsets.all(context.tTheme.spacer2),
                    child: SizedBox(
                      width: double.infinity,
                      child: TButton(
                        colorPreset: TButtonColorPreset.primary,
                        size: TButtonSize.large,
                        onPressed:
                            draft.isEmpty ||
                                (variant == TCalendarVariant.range &&
                                    draft.length != 2)
                            ? null
                            : () {
                                onConfirm(List<DateTime>.of(draft));
                                popup.close();
                              },
                        child: Text(localized ? 'Confirm' : '确定'),
                      ),
                    ),
                  ),
                ],
              ),
            );
            return localized
                ? Localizations.override(
                    context: context,
                    locale: const Locale('en'),
                    delegates: GlobalMaterialLocalizations.delegates,
                    child: body,
                  )
                : body;
          },
        ),
      ),
    );
  }

  String _formatDates(List<DateTime> dates) => dates.map(_formatDate).join('、');

  String _formatDate(DateTime? date) {
    if (date == null) {
      return '';
    }
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }

  @override
  Widget build(BuildContext context) {
    return _buildSwitchMode(context);
  }
}

const _englishMonths = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

class CalendarSwitchModeExampleCalendarMonthSwitcher extends StatelessWidget {
  const CalendarSwitchModeExampleCalendarMonthSwitcher({
    super.key,
    required this.month,
    required this.minDate,
    required this.maxDate,
    required this.onChanged,
  });

  final DateTime minDate;
  final DateTime maxDate;

  final DateTime month;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          tooltip: '上个月',
          onPressed:
              DateTime(
                month.year,
                month.month,
              ).isAfter(DateTime(minDate.year, minDate.month))
              ? () => onChanged(DateTime(month.year, month.month - 1))
              : null,
          icon: const TIcon(TIcons.chevron_left),
        ),
        Expanded(
          child: TText(
            '${month.year} 年 ${month.month} 月',
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          tooltip: '下个月',
          onPressed:
              DateTime(
                month.year,
                month.month,
              ).isBefore(DateTime(maxDate.year, maxDate.month))
              ? () => onChanged(DateTime(month.year, month.month + 1))
              : null,
          icon: const TIcon(TIcons.chevron_right),
        ),
      ],
    );
  }
}
```

##### 可选择区间日期的日历

```dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CalendarRangeExample extends StatefulWidget {
  const CalendarRangeExample({super.key});

  @override
  State<CalendarRangeExample> createState() => _CalendarRangeExampleState();
}

class _CalendarRangeExampleState extends State<CalendarRangeExample> {
  Widget _buildRange(BuildContext context) => InkWell(
    key: const ValueKey('calendar-range-trigger'),
    onTap: () => _showCalendar(
      variant: TCalendarVariant.range,
      value: _rangeValue,
      minDate: DateTime(2021, 3),
      maxDate: DateTime(2030, 3, 2),
      onConfirm: (value) => setState(() => _rangeValue = value),
    ),
    child: Container(
      color: context.tTheme.bgColorContainer,
      padding: EdgeInsets.all(context.tTheme.spacer2),
      child: Row(
        children: [
          Expanded(
            child: TText(
              _formatDate(_rangeValue.isEmpty ? null : _rangeValue.first),
              font: context.tTheme.fontTitleMedium,
            ),
          ),
          TIcon(TIcons.swap_right, color: context.tTheme.textColorPlaceholder),
          Expanded(
            child: TText(
              _formatDate(_rangeValue.length > 1 ? _rangeValue.last : null),
              textAlign: TextAlign.end,
              font: context.tTheme.fontTitleMedium,
            ),
          ),
        ],
      ),
    ),
  );

  void _showCalendar({
    required TCalendarVariant variant,
    required List<DateTime> value,
    required ValueChanged<List<DateTime>> onConfirm,
    DateTime? minDate,
    DateTime? maxDate,
    TCalendarSubtitleBuilder? subtitleBuilder,
    TCalendarCellBuilder? cellBuilder,
    bool showMonthSwitcher = false,
    bool localized = false,
  }) {
    var draft = List<DateTime>.of(value);
    final start = minDate ?? DateTime(2021, 3);
    final end = maxDate ?? DateTime(2030, 3, 2);
    var anchor = draft.isEmpty ? start : draft.first;
    late TPopupHandle popup;
    popup = TPopup.show(
      Navigator.of(context).context,
      options: TPopupOptions.bottom(
        height: MediaQuery.sizeOf(context).height * 0.85,
        headerBuilder: (_, close) => SizedBox(
          height: TPopupHeader.headerHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              TText(
                localized ? 'Select Date' : '请选择日期',
                font: context.tTheme.fontTitleLarge,
              ),
              Positioned(
                right: context.tTheme.spacer,
                child: IconButton(
                  tooltip: localized ? 'Close' : '关闭',
                  onPressed: close,
                  icon: const TIcon(TIcons.close),
                ),
              ),
            ],
          ),
        ),
        child: StatefulBuilder(
          builder: (context, setPopupState) {
            final first = DateTime(anchor.year, anchor.month);
            final last = DateTime(anchor.year, anchor.month + 1, 0);
            final calendar = TCalendar(
              key: const ValueKey('calendar-popup-panel'),
              value: draft,
              variant: variant,
              minDate: showMonthSwitcher && first.isAfter(start)
                  ? first
                  : start,
              maxDate: showMonthSwitcher && last.isBefore(end) ? last : end,
              anchorDate: anchor,
              subtitleBuilder: subtitleBuilder,
              cellBuilder: cellBuilder,
              monthTitleBuilder: showMonthSwitcher
                  ? (_, __) => const SizedBox.shrink()
                  : localized
                  ? (_, month) => TText(
                      '${_englishMonths[month.month - 1]} ${month.year}',
                    )
                  : null,
              onChanged: (next) => setPopupState(() => draft = next),
            );
            final body = Material(
              color: context.tTheme.bgColorContainer,
              child: Column(
                children: [
                  if (showMonthSwitcher)
                    CalendarRangeExampleCalendarMonthSwitcher(
                      month: anchor,
                      minDate: start,
                      maxDate: end,
                      onChanged: (month) => setPopupState(() => anchor = month),
                    ),
                  Expanded(
                    child: showMonthSwitcher
                        ? Theme(
                            data: Theme.of(context).mergeExtension(
                              (Theme.of(
                                        context,
                                      ).extension<TCalendarThemeData>() ??
                                      const TCalendarThemeData())
                                  .copyWith(monthTitleHeight: 0),
                            ),
                            child: calendar,
                          )
                        : calendar,
                  ),
                  Padding(
                    padding: EdgeInsets.all(context.tTheme.spacer2),
                    child: SizedBox(
                      width: double.infinity,
                      child: TButton(
                        colorPreset: TButtonColorPreset.primary,
                        size: TButtonSize.large,
                        onPressed:
                            draft.isEmpty ||
                                (variant == TCalendarVariant.range &&
                                    draft.length != 2)
                            ? null
                            : () {
                                onConfirm(List<DateTime>.of(draft));
                                popup.close();
                              },
                        child: Text(localized ? 'Confirm' : '确定'),
                      ),
                    ),
                  ),
                ],
              ),
            );
            return localized
                ? Localizations.override(
                    context: context,
                    locale: const Locale('en'),
                    delegates: GlobalMaterialLocalizations.delegates,
                    child: body,
                  )
                : body;
          },
        ),
      ),
    );
  }

  List<DateTime> _rangeValue = [DateTime(2022, 2, 19), DateTime(2022, 2, 21)];

  String _formatDate(DateTime? date) {
    if (date == null) {
      return '';
    }
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }

  @override
  Widget build(BuildContext context) {
    return _buildRange(context);
  }
}

const _englishMonths = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

class CalendarRangeExampleCalendarMonthSwitcher extends StatelessWidget {
  const CalendarRangeExampleCalendarMonthSwitcher({
    super.key,
    required this.month,
    required this.minDate,
    required this.maxDate,
    required this.onChanged,
  });

  final DateTime minDate;
  final DateTime maxDate;

  final DateTime month;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          tooltip: '上个月',
          onPressed:
              DateTime(
                month.year,
                month.month,
              ).isAfter(DateTime(minDate.year, minDate.month))
              ? () => onChanged(DateTime(month.year, month.month - 1))
              : null,
          icon: const TIcon(TIcons.chevron_left),
        ),
        Expanded(
          child: TText(
            '${month.year} 年 ${month.month} 月',
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          tooltip: '下个月',
          onPressed:
              DateTime(
                month.year,
                month.month,
              ).isBefore(DateTime(maxDate.year, maxDate.month))
              ? () => onChanged(DateTime(month.year, month.month + 1))
              : null,
          icon: const TIcon(TIcons.chevron_right),
        ),
      ],
    );
  }
}
```

#### 组件样式

##### 国际化

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CalendarLocalizedExample extends StatefulWidget {
  const CalendarLocalizedExample({super.key});

  @override
  State<CalendarLocalizedExample> createState() =>
      _CalendarLocalizedExampleState();
}

class _CalendarLocalizedExampleState extends State<CalendarLocalizedExample> {
  Widget _buildLocalized(BuildContext context) => TCellGroup(
    cells: [
      TCell(
        key: const ValueKey('calendar-localized-trigger'),
        title: const TText('国际化'),
        note: _dateNote(_localizedValue),
        arrow: true,
        onTap: () => _showCalendar(
          variant: TCalendarVariant.single,
          value: _localizedValue,
          minDate: DateTime(2021, 3),
          maxDate: DateTime(2030, 3, 2),
          localized: true,
          onConfirm: (value) => setState(() => _localizedValue = value),
        ),
      ),
    ],
  );

  Widget _dateNote(List<DateTime> dates) => ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 170),
    child: TText(
      _formatDates(dates),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
  );

  List<DateTime> _localizedValue = [DateTime(2022, 2, 18)];

  void _showCalendar({
    required TCalendarVariant variant,
    required List<DateTime> value,
    required ValueChanged<List<DateTime>> onConfirm,
    DateTime? minDate,
    DateTime? maxDate,
    TCalendarSubtitleBuilder? subtitleBuilder,
    TCalendarCellBuilder? cellBuilder,
    bool showMonthSwitcher = false,
    bool localized = false,
  }) {
    var draft = List<DateTime>.of(value);
    final start = minDate ?? DateTime(2021, 3);
    final end = maxDate ?? DateTime(2030, 3, 2);
    var anchor = draft.isEmpty ? start : draft.first;
    late TPopupHandle popup;
    popup = TPopup.show(
      Navigator.of(context).context,
      options: TPopupOptions.bottom(
        height: MediaQuery.sizeOf(context).height * 0.85,
        headerBuilder: (_, close) => SizedBox(
          height: TPopupHeader.headerHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              TText(
                localized ? 'Select Date' : '请选择日期',
                font: context.tTheme.fontTitleLarge,
              ),
              Positioned(
                right: context.tTheme.spacer,
                child: IconButton(
                  tooltip: localized ? 'Close' : '关闭',
                  onPressed: close,
                  icon: const TIcon(TIcons.close),
                ),
              ),
            ],
          ),
        ),
        child: StatefulBuilder(
          builder: (context, setPopupState) {
            final first = DateTime(anchor.year, anchor.month);
            final last = DateTime(anchor.year, anchor.month + 1, 0);
            final calendar = TCalendar(
              key: const ValueKey('calendar-popup-panel'),
              value: draft,
              variant: variant,
              minDate: showMonthSwitcher && first.isAfter(start)
                  ? first
                  : start,
              maxDate: showMonthSwitcher && last.isBefore(end) ? last : end,
              anchorDate: anchor,
              weekdayNames: _englishWeekdays,
              subtitleBuilder: subtitleBuilder,
              cellBuilder: cellBuilder,
              monthTitleBuilder: showMonthSwitcher
                  ? (_, __) => const SizedBox.shrink()
                  : localized
                  ? (_, month) => TText(
                      '${_englishMonths[month.month - 1]} ${month.year}',
                    )
                  : null,
              onChanged: (next) => setPopupState(() => draft = next),
            );
            final body = Material(
              color: context.tTheme.bgColorContainer,
              child: Column(
                children: [
                  if (showMonthSwitcher)
                    CalendarLocalizedExampleCalendarMonthSwitcher(
                      month: anchor,
                      minDate: start,
                      maxDate: end,
                      onChanged: (month) => setPopupState(() => anchor = month),
                    ),
                  Expanded(
                    child: showMonthSwitcher
                        ? Theme(
                            data: Theme.of(context).mergeExtension(
                              (Theme.of(
                                        context,
                                      ).extension<TCalendarThemeData>() ??
                                      const TCalendarThemeData())
                                  .copyWith(monthTitleHeight: 0),
                            ),
                            child: calendar,
                          )
                        : calendar,
                  ),
                  Padding(
                    padding: EdgeInsets.all(context.tTheme.spacer2),
                    child: SizedBox(
                      width: double.infinity,
                      child: TButton(
                        colorPreset: TButtonColorPreset.primary,
                        size: TButtonSize.large,
                        onPressed:
                            draft.isEmpty ||
                                (variant == TCalendarVariant.range &&
                                    draft.length != 2)
                            ? null
                            : () {
                                onConfirm(List<DateTime>.of(draft));
                                popup.close();
                              },
                        child: Text(localized ? 'Confirm' : '确定'),
                      ),
                    ),
                  ),
                ],
              ),
            );
            return body;
          },
        ),
      ),
    );
  }

  String _formatDates(List<DateTime> dates) => dates.map(_formatDate).join('、');

  String _formatDate(DateTime? date) {
    if (date == null) {
      return '';
    }
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }

  @override
  Widget build(BuildContext context) {
    return _buildLocalized(context);
  }
}

const _englishMonths = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

const _englishWeekdays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

class CalendarLocalizedExampleCalendarMonthSwitcher extends StatelessWidget {
  const CalendarLocalizedExampleCalendarMonthSwitcher({
    super.key,
    required this.month,
    required this.minDate,
    required this.maxDate,
    required this.onChanged,
  });

  final DateTime minDate;
  final DateTime maxDate;

  final DateTime month;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          tooltip: '上个月',
          onPressed:
              DateTime(
                month.year,
                month.month,
              ).isAfter(DateTime(minDate.year, minDate.month))
              ? () => onChanged(DateTime(month.year, month.month - 1))
              : null,
          icon: const TIcon(TIcons.chevron_left),
        ),
        Expanded(
          child: TText(
            '${month.year} 年 ${month.month} 月',
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          tooltip: '下个月',
          onPressed:
              DateTime(
                month.year,
                month.month,
              ).isBefore(DateTime(maxDate.year, maxDate.month))
              ? () => onChanged(DateTime(month.year, month.month + 1))
              : null,
          icon: const TIcon(TIcons.chevron_right),
        ),
      ],
    );
  }
}
```

##### 含不可选的日历

```dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CalendarLimitedExample extends StatefulWidget {
  const CalendarLimitedExample({super.key});

  @override
  State<CalendarLimitedExample> createState() => _CalendarLimitedExampleState();
}

class _CalendarLimitedExampleState extends State<CalendarLimitedExample> {
  Widget _buildLimited(BuildContext context) => TCellGroup(
    cells: [
      TCell(
        key: const ValueKey('calendar-limited-trigger'),
        title: const TText('含不可选的日期'),
        note: _dateNote(_limitedValue),
        arrow: true,
        onTap: () => _showCalendar(
          variant: TCalendarVariant.single,
          value: _limitedValue,
          minDate: DateTime(2021, 3),
          maxDate: DateTime(2030, 3, 2),
          onConfirm: (value) => setState(() => _limitedValue = value),
        ),
      ),
    ],
  );

  Widget _dateNote(List<DateTime> dates) => ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 170),
    child: TText(
      _formatDates(dates),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
  );

  List<DateTime> _limitedValue = [DateTime(2030, 3, 1)];

  void _showCalendar({
    required TCalendarVariant variant,
    required List<DateTime> value,
    required ValueChanged<List<DateTime>> onConfirm,
    DateTime? minDate,
    DateTime? maxDate,
    TCalendarSubtitleBuilder? subtitleBuilder,
    TCalendarCellBuilder? cellBuilder,
    bool showMonthSwitcher = false,
    bool localized = false,
  }) {
    var draft = List<DateTime>.of(value);
    final start = minDate ?? DateTime(2021, 3);
    final end = maxDate ?? DateTime(2030, 3, 2);
    var anchor = draft.isEmpty ? start : draft.first;
    late TPopupHandle popup;
    popup = TPopup.show(
      Navigator.of(context).context,
      options: TPopupOptions.bottom(
        height: MediaQuery.sizeOf(context).height * 0.85,
        headerBuilder: (_, close) => SizedBox(
          height: TPopupHeader.headerHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              TText(
                localized ? 'Select Date' : '请选择日期',
                font: context.tTheme.fontTitleLarge,
              ),
              Positioned(
                right: context.tTheme.spacer,
                child: IconButton(
                  tooltip: localized ? 'Close' : '关闭',
                  onPressed: close,
                  icon: const TIcon(TIcons.close),
                ),
              ),
            ],
          ),
        ),
        child: StatefulBuilder(
          builder: (context, setPopupState) {
            final first = DateTime(anchor.year, anchor.month);
            final last = DateTime(anchor.year, anchor.month + 1, 0);
            final calendar = TCalendar(
              key: const ValueKey('calendar-popup-panel'),
              value: draft,
              variant: variant,
              minDate: showMonthSwitcher && first.isAfter(start)
                  ? first
                  : start,
              maxDate: showMonthSwitcher && last.isBefore(end) ? last : end,
              anchorDate: anchor,
              subtitleBuilder: subtitleBuilder,
              cellBuilder: cellBuilder,
              monthTitleBuilder: showMonthSwitcher
                  ? (_, __) => const SizedBox.shrink()
                  : localized
                  ? (_, month) => TText(
                      '${_englishMonths[month.month - 1]} ${month.year}',
                    )
                  : null,
              onChanged: (next) => setPopupState(() => draft = next),
            );
            final body = Material(
              color: context.tTheme.bgColorContainer,
              child: Column(
                children: [
                  if (showMonthSwitcher)
                    CalendarLimitedExampleCalendarMonthSwitcher(
                      month: anchor,
                      minDate: start,
                      maxDate: end,
                      onChanged: (month) => setPopupState(() => anchor = month),
                    ),
                  Expanded(
                    child: showMonthSwitcher
                        ? Theme(
                            data: Theme.of(context).mergeExtension(
                              (Theme.of(
                                        context,
                                      ).extension<TCalendarThemeData>() ??
                                      const TCalendarThemeData())
                                  .copyWith(monthTitleHeight: 0),
                            ),
                            child: calendar,
                          )
                        : calendar,
                  ),
                  Padding(
                    padding: EdgeInsets.all(context.tTheme.spacer2),
                    child: SizedBox(
                      width: double.infinity,
                      child: TButton(
                        colorPreset: TButtonColorPreset.primary,
                        size: TButtonSize.large,
                        onPressed:
                            draft.isEmpty ||
                                (variant == TCalendarVariant.range &&
                                    draft.length != 2)
                            ? null
                            : () {
                                onConfirm(List<DateTime>.of(draft));
                                popup.close();
                              },
                        child: Text(localized ? 'Confirm' : '确定'),
                      ),
                    ),
                  ),
                ],
              ),
            );
            return localized
                ? Localizations.override(
                    context: context,
                    locale: const Locale('en'),
                    delegates: GlobalMaterialLocalizations.delegates,
                    child: body,
                  )
                : body;
          },
        ),
      ),
    );
  }

  String _formatDates(List<DateTime> dates) => dates.map(_formatDate).join('、');

  String _formatDate(DateTime? date) {
    if (date == null) {
      return '';
    }
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }

  @override
  Widget build(BuildContext context) {
    return _buildLimited(context);
  }
}

const _englishMonths = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

class CalendarLimitedExampleCalendarMonthSwitcher extends StatelessWidget {
  const CalendarLimitedExampleCalendarMonthSwitcher({
    super.key,
    required this.month,
    required this.minDate,
    required this.maxDate,
    required this.onChanged,
  });

  final DateTime minDate;
  final DateTime maxDate;

  final DateTime month;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          tooltip: '上个月',
          onPressed:
              DateTime(
                month.year,
                month.month,
              ).isAfter(DateTime(minDate.year, minDate.month))
              ? () => onChanged(DateTime(month.year, month.month - 1))
              : null,
          icon: const TIcon(TIcons.chevron_left),
        ),
        Expanded(
          child: TText(
            '${month.year} 年 ${month.month} 月',
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          tooltip: '下个月',
          onPressed:
              DateTime(
                month.year,
                month.month,
              ).isBefore(DateTime(maxDate.year, maxDate.month))
              ? () => onChanged(DateTime(month.year, month.month + 1))
              : null,
          icon: const TIcon(TIcons.chevron_right),
        ),
      ],
    );
  }
}
```

##### 不使用 Popup

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CalendarInlineExample extends StatefulWidget {
  const CalendarInlineExample({super.key, this.referenceDate});

  final DateTime? referenceDate;

  @override
  State<CalendarInlineExample> createState() => _CalendarInlineExampleState();
}

class _CalendarInlineExampleState extends State<CalendarInlineExample> {
  Widget _buildInline(BuildContext context) => ColoredBox(
    color: context.tTheme.bgColorContainer,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(context.tTheme.spacer2),
          child: TText('日历标题', font: context.tTheme.fontTitleLarge),
        ),
        TCalendar(
          key: const ValueKey('calendar-inline-panel'),
          value: _inlineValue,
          variant: TCalendarVariant.multiple,
          minDate: DateTime(2021, 3),
          maxDate: DateTime(2030, 3, 2),
          onChanged: (value) => setState(() => _inlineValue = value),
        ),
        Padding(
          padding: EdgeInsets.all(context.tTheme.spacer2),
          child: SizedBox(
            width: double.infinity,
            child: TButton(
              colorPreset: TButtonColorPreset.primary,
              size: TButtonSize.large,
              onPressed: _inlineValue.isEmpty
                  ? null
                  : () => TToast.showText(
                      _formatDates(_inlineValue),
                      context: context,
                    ),
              child: const Text('确定'),
            ),
          ),
        ),
      ],
    ),
  );

  late List<DateTime> _inlineValue;

  String _formatDates(List<DateTime> dates) => dates.map(_formatDate).join('、');

  String _formatDate(DateTime? date) {
    if (date == null) {
      return '';
    }
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }

  @override
  void initState() {
    super.initState();
    final now = widget.referenceDate ?? DateTime(2023, 3, 10);
    _referenceDate = DateTime(now.year, now.month, now.day);
    _inlineValue = [_referenceDate];
  }

  late final DateTime _referenceDate;

  @override
  Widget build(BuildContext context) {
    return _buildInline(context);
  }
}
```

## API

1. [TCalendar](#tcalendar)
2. [TCalendarCellModel](#tcalendarcellmodel)
3. [TCalendarSubtitleContext](#tcalendarsubtitlecontext)
4. [DateSelectType](#dateselecttype)
5. [TCalendarFirstDayOfWeek](#tcalendarfirstdayofweek)
6. [TCalendarVariant](#tcalendarvariant)
7. [TCalendarSubtitleBuilder](#tcalendarsubtitlebuilder)
8. [TCalendarCellBuilder](#tcalendarcellbuilder)
9. [TCalendarMonthTitleBuilder](#tcalendarmonthtitlebuilder)
10. [TCalendarThemeData](#tcalendarthemedata)

### TCalendar

#### 构造方法

##### TCalendar

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| anchorDate | DateTime? | - | 滚动锚点日期：将列表定位到该日**所在月份**的首屏位置。 **不**自动把该日设为选中。运行期更新本参数会重新滚动（见 `animateTo`）。 未设置时：有非空 `value` 则滚到其中最早一日所在月，否则滚到 `minDate` 首月。 | 否 |
| animateTo | bool | false | `anchorDate` 或首屏定位变更导致滚动时，是否使用动画，默认 false。 | 否 |
| cellBuilder | TCalendarCellBuilder? | - | 整格自定义构建器；返回非 null 时替换该格默认布局（主数字 + 副标题均不渲染）。 返回非 null 时优先于 `subtitleBuilder`；返回 null 时使用默认日期格及副标题。 | 否 |
| firstDayOfWeek | TCalendarFirstDayOfWeek | TCalendarFirstDayOfWeek.sunday | 每周从星期几开始，默认从星期日开始。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| maxDate | DateTime? | - | 最大可选日期；未传时为 2100-12-31，取日期部分，不得早于 minDate。 | 否 |
| minDate | DateTime? | - | 最小可选日期；未传时为 1970-01-01，取日期部分，不得晚于 maxDate。 | 否 |
| monthTitleBuilder | TCalendarMonthTitleBuilder? | - | 月标题构建器。 | 否 |
| onChanged | ValueChanged<List<DateTime>>? | - | 选中结果变化时触发；为 null 时整个日历禁用。 单选立即触发，多选每次切换，区间在端点变化时触发。父组件应在回调中 更新 `value`。组件挂载时不会调用本回调。 | 否 |
| onMonthChanged | ValueChanged<DateTime>? | - | 可见月份变化且不处于程序化动画滚动期间时触发，参数为当月 1 日。 程序化动画滚动不保证在结束时通知；外置控制栏应自行同步 anchorDate 对应的目标月份，用户滑动时再根据本回调更新文案。 | 否 |
| subtitleBuilder | TCalendarSubtitleBuilder? | - | 副标题构建器，在日期主数字下方渲染自定义内容。 `TCalendarSubtitleContext.date` 为当前格日期； `TCalendarSubtitleContext.selectType` 为选中/区间/禁用等态。返回 null 不显示副标题行。 | 否 |
| value | List<DateTime> | - | 受控选中日期列表。 空列表表示未选择；single 通常使用 1 个元素，multiple 使用所有选中日期， range 使用 1 个起始日期或 2 个起止日期。日期会去除时分秒、去重并排序。 | 是 |
| variant | TCalendarVariant | TCalendarVariant.single | 日历的选择模式（保留 variant 命名，不表示视觉变体），决定点击后的行为： - `TCalendarVariant.single`：单选，点击新日期取消旧选中 - `TCalendarVariant.multiple`：多选，点击切换选中/取消 - `TCalendarVariant.range`：区间选择，依次选起止日期 | 否 |
| weekdayNames | List<String>? | - | 星期标题，按星期日到星期六排列。 未设置时使用 `TResourceManager` 提供的当前语言文案。 必须按星期日到星期六提供 7 个文案，与 firstDayOfWeek 无关。 | 否 |

### TCalendarCellModel

单个日期格的不可变展示快照，由日历的受控 value 派生。

自定义构建器通过 `selectType` 读取状态；选择更新由日历的 onChanged
通知调用方，再通过 value 重建，不直接修改日期格。

#### 构造方法

##### TCalendarCellModel

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| date | DateTime | - | 当前日期。 | 是 |
| isLastDayOfMonth | bool | - | 是否为当月最后一天。 | 是 |
| selectType | DateSelectType | - | 当前格的选中、区间或禁用展示状态。 | 是 |

### TCalendarSubtitleContext

副标题构建上下文：告知 `TCalendarSubtitleBuilder` 当前渲染哪一格。

#### 构造方法

##### TCalendarSubtitleContext

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| date | DateTime | - | 当前格子的阳历日期（仅年月日，无时分秒）。 | 是 |
| selectType | DateSelectType | - | 当前格的选中/区间/禁用等展示状态，便于按态设置副标题样式。 | 是 |

### DateSelectType

日期在日历格中的选中和展示状态。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| selected | DateSelectType | - | 单选或多选下的选中。 | - |
| disabled | DateSelectType | - | 超出可选日期范围。 | - |
| start | DateSelectType | - | 区间起点。 | - |
| centre | DateSelectType | - | 区间中间日期。 | - |
| end | DateSelectType | - | 区间终点。 | - |
| empty | DateSelectType | - | 未选中且可选。 | - |

### TCalendarFirstDayOfWeek

每周的起始日。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| sunday | TCalendarFirstDayOfWeek | - | 星期日作为一周第一天。 | - |
| monday | TCalendarFirstDayOfWeek | - | 星期一作为一周第一天。 | - |
| tuesday | TCalendarFirstDayOfWeek | - | 星期二作为一周第一天。 | - |
| wednesday | TCalendarFirstDayOfWeek | - | 星期三作为一周第一天。 | - |
| thursday | TCalendarFirstDayOfWeek | - | 星期四作为一周第一天。 | - |
| friday | TCalendarFirstDayOfWeek | - | 星期五作为一周第一天。 | - |
| saturday | TCalendarFirstDayOfWeek | - | 星期六作为一周第一天。 | - |

### TCalendarVariant

日历选择形态

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| single | TCalendarVariant | - | 单选日期 | - |
| multiple | TCalendarVariant | - | 多选日期 | - |
| range | TCalendarVariant | - | 选择日期区间 | - |

### TCalendarSubtitleBuilder

副标题构建器；每个日期格渲染时调用一次。

通过 `TCalendarSubtitleContext` 获取日期与选中态。

位置参数：`context, subtitleContext`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 日期格的构建上下文。 | 是 |
| subtitleContext | TCalendarSubtitleContext | - | 当前日期及日期格的选中、区间和禁用状态。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Widget? | - | 日期格副标题内容；返回 null 时不显示副标题行。 | - |

### TCalendarCellBuilder

整格自定义构建器。

位置参数：`context, cell`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 日期格的构建上下文。 | 是 |
| cell | TCalendarCellModel | - | 当前日期格的数据与状态。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Widget? | - | 完整日期格内容，包含主数字与副标题；返回 null 时使用默认日期格及副标题。 | - |

### TCalendarMonthTitleBuilder

月标题构建器。

位置参数：`context, monthDate`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 月份标题的构建上下文。 | 是 |
| monthDate | DateTime | - | 当前月份的第一天。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Widget | - | 当前月份的标题内容。 | - |

### TCalendarThemeData

TCalendar 组件级 ThemeExtension

包含日历的装饰、字体和布局默认值。
样式字段通过 `ThemeData.mergeExtension` 在子树覆盖，不需要额外的实例 style 参数。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| bodyPadding | double? | - | 日历主体内边距；为 null 时使用全局 spacer2 Token。 | 否 |
| cellDecoration | BoxDecoration? | - | 日期单元格装饰（选中状态） null 时按日期格选择状态与全局 Token 解析默认装饰。 | 否 |
| cellHeight | double? | - | 日期单元格高度；为 null 时至少为 60 逻辑像素，内置日期随文字自然行高增长。 | 否 |
| centreColor | Color? | - | 区间中间格背景与格间衔接条颜色 null 时按区间格的选择状态与当前 Token 解析区间背景。 | 否 |
| dayStyle | TextStyle? | - | 日期数字样式 null 时继承当前全局 Token 与日期格状态解析的样式。 | 否 |
| decoration | BoxDecoration? | - | 组件容器装饰 null 时继承当前全局 Token 解析的容器装饰。 | 否 |
| height | double? | - | 日历整体高度；为 null 时由星期栏、月份标题、六行日期、间距和内边距计算视窗高度，不按全部月份展开。 | 否 |
| monthTitleHeight | double? | - | 月份标题高度；为 null 时至少为 22 逻辑像素，默认文字随自然行高增长。 | 否 |
| monthTitleStyle | TextStyle? | - | 月份标题文字样式 null 时继承当前全局 Token 解析的月份标题样式。 | 否 |
| subtitleStyle | TextStyle? | - | 副标题样式 null 时继承当前全局 Token 与选择状态解析的副标题样式。 | 否 |
| todayDayStyle | TextStyle? | - | 今天日期数字样式 null 时继承当前全局 Token 解析的今天样式。 | 否 |
| verticalGap | double? | - | 日期格垂直间距；为 null 时使用全局 spacer Token，水平间距为该值的一半。 | 否 |
| weekdayGap | double? | - | 星期之间的水平间距；为 null 时使用组件默认值 4 逻辑像素。 | 否 |
| weekdayStyle | TextStyle? | - | 星期文字样式 null 时继承当前全局 Token 解析的星期样式。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [推荐/慎用](#推荐-慎用)
4. [相似组件](#相似组件)

### 何时使用

需要在页面间跳转、返回，或需承载少量辅助功能时使用。

### 组件搭配使用

##### 通常和[单元格](<../数据展示/Cell 单元格.md>)搭配使用，点击后唤起日历。

![](https://tdesign.gtimg.com/site/design/mobile-guide/calendar/calendar-1.png)

### 推荐/慎用

##### 日期与描述结合时，通常与价格结合，不建议描述过长、或承载过复杂的信息。

![](https://tdesign.gtimg.com/site/design/mobile-guide/calendar/calendar-2.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/calendar/calendar-3.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 区间选择尽量使用在较短时间的场景中，当涉及的时间通常在数月、数年的长度时，建议使用其它方式让用户输入。

![](https://tdesign.gtimg.com/site/design/mobile-guide/calendar/calendar-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/calendar/calendar-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [时间选择器](<DateTimePicker 时间选择器.md>) | 在表单中需要输入单个日期或时间时使用。 |
