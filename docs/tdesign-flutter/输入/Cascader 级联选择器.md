# Cascader 级联选择器

> 用于多层级数据的逐级选择

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/cascader)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 垂直级联选择器

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CascaderBaseExample extends StatelessWidget {
  const CascaderBaseExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CascaderDesignDemo(id: 'vertical');
  }
}

/// Shared Cascader composition used by the six public examples.
class CascaderDesignDemo extends StatefulWidget {
  const CascaderDesignDemo({
    super.key,
    required this.id,
    this.variant = TCascaderVariant.step,
    this.showTitle = true,
  });

  final String id;
  final TCascaderVariant variant;
  final bool showTitle;

  @override
  State<CascaderDesignDemo> createState() => _CascaderDesignDemoState();
}

class _CascaderDesignDemoState extends State<CascaderDesignDemo> {
  static const _options = [
    TCascaderOption(
      label: '广东',
      value: 'guangdong',
      children: [
        TCascaderOption(
          label: '深圳',
          value: 'shenzhen',
          children: [
            TCascaderOption(
              label: '南山区',
              value: 'nanshan',
              children: [
                TCascaderOption(label: '粤海街道', value: 'yuehai'),
                TCascaderOption(label: '南头街道', value: 'nantou'),
                TCascaderOption(label: '蛇口街道', value: 'shekou'),
              ],
            ),
            TCascaderOption(
              label: '福田区',
              value: 'futian',
              children: [
                TCascaderOption(label: '福田街道', value: 'futian-street'),
              ],
            ),
          ],
        ),
        TCascaderOption(
          label: '广州',
          value: 'guangzhou',
          children: [
            TCascaderOption(
              label: '天河区',
              value: 'tianhe',
              children: [TCascaderOption(label: '石牌街道', value: 'shipai')],
            ),
          ],
        ),
      ],
    ),
  ];

  List<Object?> _value = const ['guangdong', 'shenzhen', 'nanshan', 'yuehai'];

  static List<String> _labelsFor(List<Object?> values) {
    final labels = <String>[];
    var current = _options;
    for (final value in values) {
      final index = current.indexWhere((option) => option.value == value);
      if (index < 0) {
        break;
      }
      labels.add(current[index].label);
      current = current[index].children;
    }
    return labels;
  }

  static bool _isComplete(List<Object?> values) {
    var current = _options;
    for (var index = 0; index < values.length; index++) {
      final optionIndex = current.indexWhere(
        (option) => option.value == values[index],
      );
      if (optionIndex < 0) {
        return false;
      }
      final option = current[optionIndex];
      if (index == values.length - 1) {
        return option.children.isEmpty;
      }
      current = option.children;
    }
    return false;
  }

  void _showCascader() {
    var draft = List<Object?>.of(_value);
    late VoidCallback closePopup;
    TPopup.show(
      context,
      options: TPopupOptions.bottom(
        height: 580,
        headerBuilder: widget.showTitle
            ? (_, close) {
                closePopup = close;
                return TPopupHeader(
                  title: const TText('标题文字'),
                  confirmButton: TToolbarPressable(
                    onTap: close,
                    child: TIcon(
                      TIcons.close,
                      size: 24,
                      color: context.tTheme.textColorPrimary,
                    ),
                  ),
                );
              }
            : (_, close) {
                closePopup = close;
                return const SizedBox.shrink();
              },
        child: StatefulBuilder(
          builder: (context, setPopupState) => TCascader(
            key: const ValueKey('cascader-popup-panel'),
            options: _options,
            value: draft,
            variant: widget.variant,
            subtitles: const ['一级选项标题', '二级选项标题', '三级选项标题', '四级选项标题'],
            onChanged: (next) {
              setPopupState(() => draft = List<Object?>.of(next));
              if (_isComplete(next)) {
                setState(() => _value = List<Object?>.unmodifiable(next));
                closePopup();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TCellGroup(
      cells: [
        TCell(
          key: ValueKey('cascader-${widget.id}-trigger'),
          title: const TText('选择地区'),
          note: TText(_labelsFor(_value).join(' ')),
          arrow: true,
          onTap: _showCascader,
        ),
      ],
    );
  }
}
```

##### 垂直级联选择器-带字母定位

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CascaderInitialExample extends StatelessWidget {
  const CascaderInitialExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CascaderDesignDemo(id: 'vertical-locator');
  }
}

/// Shared Cascader composition used by the six public examples.
class CascaderDesignDemo extends StatefulWidget {
  const CascaderDesignDemo({
    super.key,
    required this.id,
    this.variant = TCascaderVariant.step,
    this.showTitle = true,
  });

  final String id;
  final TCascaderVariant variant;
  final bool showTitle;

  @override
  State<CascaderDesignDemo> createState() => _CascaderDesignDemoState();
}

class _CascaderDesignDemoState extends State<CascaderDesignDemo> {
  static const _options = [
    TCascaderOption(
      label: '广东',
      value: 'guangdong',
      children: [
        TCascaderOption(
          label: '深圳',
          value: 'shenzhen',
          children: [
            TCascaderOption(
              label: '南山区',
              value: 'nanshan',
              children: [
                TCascaderOption(label: '粤海街道', value: 'yuehai'),
                TCascaderOption(label: '南头街道', value: 'nantou'),
                TCascaderOption(label: '蛇口街道', value: 'shekou'),
              ],
            ),
            TCascaderOption(
              label: '福田区',
              value: 'futian',
              children: [
                TCascaderOption(label: '福田街道', value: 'futian-street'),
              ],
            ),
          ],
        ),
        TCascaderOption(
          label: '广州',
          value: 'guangzhou',
          children: [
            TCascaderOption(
              label: '天河区',
              value: 'tianhe',
              children: [TCascaderOption(label: '石牌街道', value: 'shipai')],
            ),
          ],
        ),
      ],
    ),
  ];

  List<Object?> _value = const ['guangdong', 'shenzhen', 'nanshan', 'yuehai'];

  static List<String> _labelsFor(List<Object?> values) {
    final labels = <String>[];
    var current = _options;
    for (final value in values) {
      final index = current.indexWhere((option) => option.value == value);
      if (index < 0) {
        break;
      }
      labels.add(current[index].label);
      current = current[index].children;
    }
    return labels;
  }

  static bool _isComplete(List<Object?> values) {
    var current = _options;
    for (var index = 0; index < values.length; index++) {
      final optionIndex = current.indexWhere(
        (option) => option.value == values[index],
      );
      if (optionIndex < 0) {
        return false;
      }
      final option = current[optionIndex];
      if (index == values.length - 1) {
        return option.children.isEmpty;
      }
      current = option.children;
    }
    return false;
  }

  void _showCascader() {
    var draft = List<Object?>.of(_value);
    late VoidCallback closePopup;
    TPopup.show(
      context,
      options: TPopupOptions.bottom(
        height: 580,
        headerBuilder: widget.showTitle
            ? (_, close) {
                closePopup = close;
                return TPopupHeader(
                  title: const TText('标题文字'),
                  confirmButton: TToolbarPressable(
                    onTap: close,
                    child: TIcon(
                      TIcons.close,
                      size: 24,
                      color: context.tTheme.textColorPrimary,
                    ),
                  ),
                );
              }
            : (_, close) {
                closePopup = close;
                return const SizedBox.shrink();
              },
        child: StatefulBuilder(
          builder: (context, setPopupState) => TCascader(
            key: const ValueKey('cascader-popup-panel'),
            options: _options,
            value: draft,
            variant: widget.variant,
            subtitles: const ['一级选项标题', '二级选项标题', '三级选项标题', '四级选项标题'],
            onChanged: (next) {
              setPopupState(() => draft = List<Object?>.of(next));
              if (_isComplete(next)) {
                setState(() => _value = List<Object?>.unmodifiable(next));
                closePopup();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TCellGroup(
      cells: [
        TCell(
          key: ValueKey('cascader-${widget.id}-trigger'),
          title: const TText('选择地区'),
          note: TText(_labelsFor(_value).join(' ')),
          arrow: true,
          onTap: _showCascader,
        ),
      ],
    );
  }
}
```

##### 水平级联选择器

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CascaderTabExample extends StatelessWidget {
  const CascaderTabExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CascaderDesignDemo(
      id: 'horizontal',
      variant: TCascaderVariant.tab,
    );
  }
}

/// Shared Cascader composition used by the six public examples.
class CascaderDesignDemo extends StatefulWidget {
  const CascaderDesignDemo({
    super.key,
    required this.id,
    this.variant = TCascaderVariant.step,
    this.showTitle = true,
  });

  final String id;
  final TCascaderVariant variant;
  final bool showTitle;

  @override
  State<CascaderDesignDemo> createState() => _CascaderDesignDemoState();
}

class _CascaderDesignDemoState extends State<CascaderDesignDemo> {
  static const _options = [
    TCascaderOption(
      label: '广东',
      value: 'guangdong',
      children: [
        TCascaderOption(
          label: '深圳',
          value: 'shenzhen',
          children: [
            TCascaderOption(
              label: '南山区',
              value: 'nanshan',
              children: [
                TCascaderOption(label: '粤海街道', value: 'yuehai'),
                TCascaderOption(label: '南头街道', value: 'nantou'),
                TCascaderOption(label: '蛇口街道', value: 'shekou'),
              ],
            ),
            TCascaderOption(
              label: '福田区',
              value: 'futian',
              children: [
                TCascaderOption(label: '福田街道', value: 'futian-street'),
              ],
            ),
          ],
        ),
        TCascaderOption(
          label: '广州',
          value: 'guangzhou',
          children: [
            TCascaderOption(
              label: '天河区',
              value: 'tianhe',
              children: [TCascaderOption(label: '石牌街道', value: 'shipai')],
            ),
          ],
        ),
      ],
    ),
  ];

  List<Object?> _value = const ['guangdong', 'shenzhen', 'nanshan', 'yuehai'];

  static List<String> _labelsFor(List<Object?> values) {
    final labels = <String>[];
    var current = _options;
    for (final value in values) {
      final index = current.indexWhere((option) => option.value == value);
      if (index < 0) {
        break;
      }
      labels.add(current[index].label);
      current = current[index].children;
    }
    return labels;
  }

  static bool _isComplete(List<Object?> values) {
    var current = _options;
    for (var index = 0; index < values.length; index++) {
      final optionIndex = current.indexWhere(
        (option) => option.value == values[index],
      );
      if (optionIndex < 0) {
        return false;
      }
      final option = current[optionIndex];
      if (index == values.length - 1) {
        return option.children.isEmpty;
      }
      current = option.children;
    }
    return false;
  }

  void _showCascader() {
    var draft = List<Object?>.of(_value);
    late VoidCallback closePopup;
    TPopup.show(
      context,
      options: TPopupOptions.bottom(
        height: 580,
        headerBuilder: widget.showTitle
            ? (_, close) {
                closePopup = close;
                return TPopupHeader(
                  title: const TText('标题文字'),
                  confirmButton: TToolbarPressable(
                    onTap: close,
                    child: TIcon(
                      TIcons.close,
                      size: 24,
                      color: context.tTheme.textColorPrimary,
                    ),
                  ),
                );
              }
            : (_, close) {
                closePopup = close;
                return const SizedBox.shrink();
              },
        child: StatefulBuilder(
          builder: (context, setPopupState) => TCascader(
            key: const ValueKey('cascader-popup-panel'),
            options: _options,
            value: draft,
            variant: widget.variant,
            subtitles: const ['一级选项标题', '二级选项标题', '三级选项标题', '四级选项标题'],
            onChanged: (next) {
              setPopupState(() => draft = List<Object?>.of(next));
              if (_isComplete(next)) {
                setState(() => _value = List<Object?>.unmodifiable(next));
                closePopup();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TCellGroup(
      cells: [
        TCell(
          key: ValueKey('cascader-${widget.id}-trigger'),
          title: const TText('选择地区'),
          note: TText(_labelsFor(_value).join(' ')),
          arrow: true,
          onTap: _showCascader,
        ),
      ],
    );
  }
}
```

##### 水平级联选择器-带字母定位

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CascaderKeysExample extends StatelessWidget {
  const CascaderKeysExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CascaderDesignDemo(
      id: 'horizontal-locator',
      variant: TCascaderVariant.tab,
    );
  }
}

/// Shared Cascader composition used by the six public examples.
class CascaderDesignDemo extends StatefulWidget {
  const CascaderDesignDemo({
    super.key,
    required this.id,
    this.variant = TCascaderVariant.step,
    this.showTitle = true,
  });

  final String id;
  final TCascaderVariant variant;
  final bool showTitle;

  @override
  State<CascaderDesignDemo> createState() => _CascaderDesignDemoState();
}

class _CascaderDesignDemoState extends State<CascaderDesignDemo> {
  static const _options = [
    TCascaderOption(
      label: '广东',
      value: 'guangdong',
      children: [
        TCascaderOption(
          label: '深圳',
          value: 'shenzhen',
          children: [
            TCascaderOption(
              label: '南山区',
              value: 'nanshan',
              children: [
                TCascaderOption(label: '粤海街道', value: 'yuehai'),
                TCascaderOption(label: '南头街道', value: 'nantou'),
                TCascaderOption(label: '蛇口街道', value: 'shekou'),
              ],
            ),
            TCascaderOption(
              label: '福田区',
              value: 'futian',
              children: [
                TCascaderOption(label: '福田街道', value: 'futian-street'),
              ],
            ),
          ],
        ),
        TCascaderOption(
          label: '广州',
          value: 'guangzhou',
          children: [
            TCascaderOption(
              label: '天河区',
              value: 'tianhe',
              children: [TCascaderOption(label: '石牌街道', value: 'shipai')],
            ),
          ],
        ),
      ],
    ),
  ];

  List<Object?> _value = const ['guangdong', 'shenzhen', 'nanshan', 'yuehai'];

  static List<String> _labelsFor(List<Object?> values) {
    final labels = <String>[];
    var current = _options;
    for (final value in values) {
      final index = current.indexWhere((option) => option.value == value);
      if (index < 0) {
        break;
      }
      labels.add(current[index].label);
      current = current[index].children;
    }
    return labels;
  }

  static bool _isComplete(List<Object?> values) {
    var current = _options;
    for (var index = 0; index < values.length; index++) {
      final optionIndex = current.indexWhere(
        (option) => option.value == values[index],
      );
      if (optionIndex < 0) {
        return false;
      }
      final option = current[optionIndex];
      if (index == values.length - 1) {
        return option.children.isEmpty;
      }
      current = option.children;
    }
    return false;
  }

  void _showCascader() {
    var draft = List<Object?>.of(_value);
    late VoidCallback closePopup;
    TPopup.show(
      context,
      options: TPopupOptions.bottom(
        height: 580,
        headerBuilder: widget.showTitle
            ? (_, close) {
                closePopup = close;
                return TPopupHeader(
                  title: const TText('标题文字'),
                  confirmButton: TToolbarPressable(
                    onTap: close,
                    child: TIcon(
                      TIcons.close,
                      size: 24,
                      color: context.tTheme.textColorPrimary,
                    ),
                  ),
                );
              }
            : (_, close) {
                closePopup = close;
                return const SizedBox.shrink();
              },
        child: StatefulBuilder(
          builder: (context, setPopupState) => TCascader(
            key: const ValueKey('cascader-popup-panel'),
            options: _options,
            value: draft,
            variant: widget.variant,
            subtitles: const ['一级选项标题', '二级选项标题', '三级选项标题', '四级选项标题'],
            onChanged: (next) {
              setPopupState(() => draft = List<Object?>.of(next));
              if (_isComplete(next)) {
                setState(() => _value = List<Object?>.unmodifiable(next));
                closePopup();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TCellGroup(
      cells: [
        TCell(
          key: ValueKey('cascader-${widget.id}-trigger'),
          title: const TText('选择地区'),
          note: TText(_labelsFor(_value).join(' ')),
          arrow: true,
          onTap: _showCascader,
        ),
      ],
    );
  }
}
```

#### 组件样式

##### 带标题级联选择器

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CascaderSubtitleExample extends StatelessWidget {
  const CascaderSubtitleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CascaderDesignDemo(id: 'with-title');
  }
}

/// Shared Cascader composition used by the six public examples.
class CascaderDesignDemo extends StatefulWidget {
  const CascaderDesignDemo({
    super.key,
    required this.id,
    this.variant = TCascaderVariant.step,
    this.showTitle = true,
  });

  final String id;
  final TCascaderVariant variant;
  final bool showTitle;

  @override
  State<CascaderDesignDemo> createState() => _CascaderDesignDemoState();
}

class _CascaderDesignDemoState extends State<CascaderDesignDemo> {
  static const _options = [
    TCascaderOption(
      label: '广东',
      value: 'guangdong',
      children: [
        TCascaderOption(
          label: '深圳',
          value: 'shenzhen',
          children: [
            TCascaderOption(
              label: '南山区',
              value: 'nanshan',
              children: [
                TCascaderOption(label: '粤海街道', value: 'yuehai'),
                TCascaderOption(label: '南头街道', value: 'nantou'),
                TCascaderOption(label: '蛇口街道', value: 'shekou'),
              ],
            ),
            TCascaderOption(
              label: '福田区',
              value: 'futian',
              children: [
                TCascaderOption(label: '福田街道', value: 'futian-street'),
              ],
            ),
          ],
        ),
        TCascaderOption(
          label: '广州',
          value: 'guangzhou',
          children: [
            TCascaderOption(
              label: '天河区',
              value: 'tianhe',
              children: [TCascaderOption(label: '石牌街道', value: 'shipai')],
            ),
          ],
        ),
      ],
    ),
  ];

  List<Object?> _value = const ['guangdong', 'shenzhen', 'nanshan', 'yuehai'];

  static List<String> _labelsFor(List<Object?> values) {
    final labels = <String>[];
    var current = _options;
    for (final value in values) {
      final index = current.indexWhere((option) => option.value == value);
      if (index < 0) {
        break;
      }
      labels.add(current[index].label);
      current = current[index].children;
    }
    return labels;
  }

  static bool _isComplete(List<Object?> values) {
    var current = _options;
    for (var index = 0; index < values.length; index++) {
      final optionIndex = current.indexWhere(
        (option) => option.value == values[index],
      );
      if (optionIndex < 0) {
        return false;
      }
      final option = current[optionIndex];
      if (index == values.length - 1) {
        return option.children.isEmpty;
      }
      current = option.children;
    }
    return false;
  }

  void _showCascader() {
    var draft = List<Object?>.of(_value);
    late VoidCallback closePopup;
    TPopup.show(
      context,
      options: TPopupOptions.bottom(
        height: 580,
        headerBuilder: widget.showTitle
            ? (_, close) {
                closePopup = close;
                return TPopupHeader(
                  title: const TText('标题文字'),
                  confirmButton: TToolbarPressable(
                    onTap: close,
                    child: TIcon(
                      TIcons.close,
                      size: 24,
                      color: context.tTheme.textColorPrimary,
                    ),
                  ),
                );
              }
            : (_, close) {
                closePopup = close;
                return const SizedBox.shrink();
              },
        child: StatefulBuilder(
          builder: (context, setPopupState) => TCascader(
            key: const ValueKey('cascader-popup-panel'),
            options: _options,
            value: draft,
            variant: widget.variant,
            subtitles: const ['一级选项标题', '二级选项标题', '三级选项标题', '四级选项标题'],
            onChanged: (next) {
              setPopupState(() => draft = List<Object?>.of(next));
              if (_isComplete(next)) {
                setState(() => _value = List<Object?>.unmodifiable(next));
                closePopup();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TCellGroup(
      cells: [
        TCell(
          key: ValueKey('cascader-${widget.id}-trigger'),
          title: const TText('选择地区'),
          note: TText(_labelsFor(_value).join(' ')),
          arrow: true,
          onTap: _showCascader,
        ),
      ],
    );
  }
}
```

##### 无标题级联选择器

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CascaderAnyExample extends StatelessWidget {
  const CascaderAnyExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const CascaderDesignDemo(id: 'without-title', showTitle: false);
  }
}

/// Shared Cascader composition used by the six public examples.
class CascaderDesignDemo extends StatefulWidget {
  const CascaderDesignDemo({
    super.key,
    required this.id,
    this.variant = TCascaderVariant.step,
    this.showTitle = true,
  });

  final String id;
  final TCascaderVariant variant;
  final bool showTitle;

  @override
  State<CascaderDesignDemo> createState() => _CascaderDesignDemoState();
}

class _CascaderDesignDemoState extends State<CascaderDesignDemo> {
  static const _options = [
    TCascaderOption(
      label: '广东',
      value: 'guangdong',
      children: [
        TCascaderOption(
          label: '深圳',
          value: 'shenzhen',
          children: [
            TCascaderOption(
              label: '南山区',
              value: 'nanshan',
              children: [
                TCascaderOption(label: '粤海街道', value: 'yuehai'),
                TCascaderOption(label: '南头街道', value: 'nantou'),
                TCascaderOption(label: '蛇口街道', value: 'shekou'),
              ],
            ),
            TCascaderOption(
              label: '福田区',
              value: 'futian',
              children: [
                TCascaderOption(label: '福田街道', value: 'futian-street'),
              ],
            ),
          ],
        ),
        TCascaderOption(
          label: '广州',
          value: 'guangzhou',
          children: [
            TCascaderOption(
              label: '天河区',
              value: 'tianhe',
              children: [TCascaderOption(label: '石牌街道', value: 'shipai')],
            ),
          ],
        ),
      ],
    ),
  ];

  List<Object?> _value = const ['guangdong', 'shenzhen', 'nanshan', 'yuehai'];

  static List<String> _labelsFor(List<Object?> values) {
    final labels = <String>[];
    var current = _options;
    for (final value in values) {
      final index = current.indexWhere((option) => option.value == value);
      if (index < 0) {
        break;
      }
      labels.add(current[index].label);
      current = current[index].children;
    }
    return labels;
  }

  static bool _isComplete(List<Object?> values) {
    var current = _options;
    for (var index = 0; index < values.length; index++) {
      final optionIndex = current.indexWhere(
        (option) => option.value == values[index],
      );
      if (optionIndex < 0) {
        return false;
      }
      final option = current[optionIndex];
      if (index == values.length - 1) {
        return option.children.isEmpty;
      }
      current = option.children;
    }
    return false;
  }

  void _showCascader() {
    var draft = List<Object?>.of(_value);
    late VoidCallback closePopup;
    TPopup.show(
      context,
      options: TPopupOptions.bottom(
        height: 580,
        headerBuilder: widget.showTitle
            ? (_, close) {
                closePopup = close;
                return TPopupHeader(
                  title: const TText('标题文字'),
                  confirmButton: TToolbarPressable(
                    onTap: close,
                    child: TIcon(
                      TIcons.close,
                      size: 24,
                      color: context.tTheme.textColorPrimary,
                    ),
                  ),
                );
              }
            : (_, close) {
                closePopup = close;
                return const SizedBox.shrink();
              },
        child: StatefulBuilder(
          builder: (context, setPopupState) => TCascader(
            key: const ValueKey('cascader-popup-panel'),
            options: _options,
            value: draft,
            variant: widget.variant,
            subtitles: const ['一级选项标题', '二级选项标题', '三级选项标题', '四级选项标题'],
            onChanged: (next) {
              setPopupState(() => draft = List<Object?>.of(next));
              if (_isComplete(next)) {
                setState(() => _value = List<Object?>.unmodifiable(next));
                closePopup();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TCellGroup(
      cells: [
        TCell(
          key: ValueKey('cascader-${widget.id}-trigger'),
          title: const TText('选择地区'),
          note: TText(_labelsFor(_value).join(' ')),
          arrow: true,
          onTap: _showCascader,
        ),
      ],
    );
  }
}
```

## API

1. [TCascader](#tcascader)
2. [TCascaderOption](#tcascaderoption)
3. [TCascaderVariant](#tcascadervariant)
4. [TCascaderThemeData](#tcascaderthemedata)

### TCascader

#### 构造方法

##### TCascader

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| onChanged | ValueChanged<List<Object?>>? | - | 选中路径变化回调；为 null 时禁用。 分支点击只发出候选路径；调用方需回写 `value`，组件才会推进活动层级。 | 否 |
| options | List<TCascaderOption> | - | 根选项列表。 | 是 |
| placeholder | String | '请选择' | 未选择层级的占位文案。 | 否 |
| subtitles | List<String> | const [] | 各层级的次级标题。 组件按内部活动层级读取对应内容，因此调用方无需持有或控制层级状态； 列表没有对应层级或对应内容为空时不显示次级标题。 | 否 |
| value | List<Object?> | - | 受控选中路径。 | 是 |
| variant | TCascaderVariant | TCascaderVariant.tab | 导航展示形态。 | 否 |

### TCascaderOption

级联选项。

`children` 应按 Flutter Widget 配置的不可变约定使用。数据变化时请创建新的
`TCascaderOption` 和列表，不要原地修改已有列表。

#### 构造方法

##### TCascaderOption

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| children | List<TCascaderOption> | const [] | 子选项。 | 否 |
| disabled | bool | false | 是否禁用。 | 否 |
| label | String | - | 展示文案。 | 是 |
| value | Object? | - | 选项值。 | 是 |

### TCascaderVariant

级联导航展示形态。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| step | TCascaderVariant | - | 纵向步骤导航。 | - |
| tab | TCascaderVariant | - | 横向标签导航。 | - |

### TCascaderThemeData

TCascader 组件级 ThemeExtension。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| activeTextStyle | TextStyle? | - | 当前活动导航及已选选项文案样式。 | 否 |
| backgroundColor | Color? | - | 背景色。 未配置时使用 bgColorContainer Token。 | 否 |
| borderRadius | double? | - | 圆角。 未配置时使用 radiusDefault Token。 | 否 |
| disabledTextStyle | TextStyle? | - | 禁用文案样式。 | 否 |
| dividerColor | Color? | - | 分隔线颜色。 未配置时使用 componentStroke Token。 | 否 |
| height | double? | - | 组件高度。 未配置时为 360 逻辑像素。 | 否 |
| indicatorColor | Color? | - | 末级选中图标颜色。 未配置时使用 brandColor Token。 | 否 |
| navigationPadding | EdgeInsetsGeometry? | - | 导航区域内边距。 null 时 step 形态左右使用 spacer2、上方为 0、下方为 4；tab 形态不增加导航内边距。 | 否 |
| textStyle | TextStyle? | - | 普通文案样式。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

### 何时使用

当一组选项由递进层级构成，且每个层级有大量的选项需要用户逐级选择时使用。

### 组件搭配使用

##### 级联选择器与[索引](<../导航/Indexes 索引.md>)组合使用，当每个层级选项较多时，配合索引有利于用户快速找到目标选项。

![](https://tdesign.gtimg.com/site/design/mobile-guide/cascader/cascader-1.png)

### 常见用法

##### 在表单中，级联选择器可放置于表单内容需要的顺序中，通常用于地址信息的选择和填写。

![](https://tdesign.gtimg.com/site/design/mobile-guide/cascader/cascader-2.png)

### 推荐/慎用示例

##### 级联选择器的层级不宜超过4层，层级过多时应调整数据结构或改用其他交互方式。

![](https://tdesign.gtimg.com/site/design/mobile-guide/cascader/cascader-3.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 在多层级中，各层级选项的归属关系应具备逻辑相关性，数据层级由大到小，避免归属关系混乱。

![](https://tdesign.gtimg.com/site/design/mobile-guide/cascader/cascader-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/cascader/cascader-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [选择器](<Picker 选择器.md>) | 当需要在有限的空间展示大量选项供用户选择，或者一组选项由递进层级构成需要用户逐级选择时使用。 |
