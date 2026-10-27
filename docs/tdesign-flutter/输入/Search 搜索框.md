# Search 搜索框

> 用于用户输入搜索信息，并进行页面内容搜索。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/search)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 基础搜索框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SearchBarBaseExample extends StatefulWidget {
  const SearchBarBaseExample({super.key});

  @override
  State<SearchBarBaseExample> createState() => _SearchBarBaseExampleState();
}

class _SearchBarBaseExampleState extends State<SearchBarBaseExample> {
  Widget _buildBase(BuildContext context) {
    return Column(
      children: [
        const SearchBarBaseExampleSearchDemoSurface(
          child: TSearchBar(hintText: '搜索预设文案'),
        ),
        const SizedBox(height: 16),
        SearchBarBaseExampleSearchDemoSurface(
          child: Column(
            children: [
              TSearchBar(
                controller: _resultController,
                hintText: '输入tdesign，有预览结果',
                onChanged: _filterResults,
                onFocusChanged: _handleResultFocusChanged,
              ),
              ..._results.map(
                (result) => TCell(
                  title: _highlightResult(result),
                  onTap: () => _selectResult(result),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  final _resultController = TextEditingController();

  void _filterResults(String value) {
    setState(() {
      _resultSelected = false;
      _results = _resultFocused
          ? _allResults.where((item) => item.contains(value)).toList()
          : const [];
    });
  }

  void _handleResultFocusChanged(bool focused) {
    setState(() {
      _resultFocused = focused;
      _results = focused && !_resultSelected
          ? _allResults
                .where((item) => item.contains(_resultController.text))
                .toList()
          : const [];
    });
  }

  var _results = const <String>[];

  Widget _highlightResult(String result) {
    final query = _resultController.text;
    final start = result.indexOf(query);
    if (query.isEmpty || start < 0) {
      return Text(result);
    }
    final end = start + query.length;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: result.substring(0, start)),
          TextSpan(
            text: result.substring(start, end),
            style: TextStyle(color: context.tTheme.brandColor),
          ),
          TextSpan(text: result.substring(end)),
        ],
      ),
    );
  }

  void _selectResult(String result) {
    setState(() {
      _resultController.text = result;
      _resultSelected = true;
      _results = const [];
    });
  }

  var _resultSelected = false;

  var _resultFocused = false;

  static const _allResults = <String>[
    'tdesign-vue',
    'tdesign-react',
    'tdesign-miniprogram',
    'tdesign-angular',
    'tdesign-mobile-vue',
    'tdesign-mobile-react',
  ];

  @override
  void dispose() {
    _resultController.dispose();
    _actionController.dispose();
    super.dispose();
  }

  final _actionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _buildBase(context);
  }
}

class SearchBarBaseExampleSearchDemoSurface extends StatelessWidget {
  const SearchBarBaseExampleSearchDemoSurface({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.tTheme.bgColorContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: child,
      ),
    );
  }
}
```

##### 字数限制

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SearchBarMaxLengthExample extends StatelessWidget {
  const SearchBarMaxLengthExample({super.key});

  Widget _buildMaxLength(BuildContext context) {
    return const Column(
      children: [
        SearchBarMaxLengthExampleSearchDemoSurface(
          child: TSearchBar(hintText: '最多输入10个汉字', maxLength: 10),
        ),
        SizedBox(height: 16),
        SearchBarMaxLengthExampleSearchDemoSurface(
          child: TSearchBar(hintText: '最多输入10个字符（汉字算两个）', maxCharacter: 10),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildMaxLength(context);
  }
}

class SearchBarMaxLengthExampleSearchDemoSurface extends StatelessWidget {
  const SearchBarMaxLengthExampleSearchDemoSurface({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.tTheme.bgColorContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: child,
      ),
    );
  }
}
```

##### 获取焦点后显示取消按钮

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SearchBarActionExample extends StatefulWidget {
  const SearchBarActionExample({super.key});

  @override
  State<SearchBarActionExample> createState() => _SearchBarActionExampleState();
}

class _SearchBarActionExampleState extends State<SearchBarActionExample> {
  Widget _buildAction(BuildContext context) {
    return SearchBarActionExampleSearchDemoSurface(
      child: TSearchBar(
        controller: _actionController,
        hintText: '搜索预设文案',
        actionText: _showAction ? '取消' : null,
        onFocusChanged: (focused) => setState(() => _showAction = focused),
        onActionPressed: () {
          _actionController.clear();
          FocusManager.instance.primaryFocus?.unfocus();
          setState(() => _showAction = false);
        },
      ),
    );
  }

  final _actionController = TextEditingController();

  var _showAction = false;

  @override
  void dispose() {
    _resultController.dispose();
    _actionController.dispose();
    super.dispose();
  }

  final _resultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _buildAction(context);
  }
}

class SearchBarActionExampleSearchDemoSurface extends StatelessWidget {
  const SearchBarActionExampleSearchDemoSurface({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.tTheme.bgColorContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: child,
      ),
    );
  }
}
```

#### 组件样式

##### 搜索框形状

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SearchBarShapeExample extends StatelessWidget {
  const SearchBarShapeExample({super.key});

  Widget _buildShape(BuildContext context) {
    return const Column(
      children: [
        SearchBarShapeExampleSearchDemoSurface(
          child: TSearchBar(hintText: '搜索预设文案'),
        ),
        SizedBox(height: 16),
        SearchBarShapeExampleSearchDemoSurface(
          child: TSearchBar(
            hintText: '搜索预设文案',
            variant: TSearchBarVariant.round,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildShape(context);
  }
}

class SearchBarShapeExampleSearchDemoSurface extends StatelessWidget {
  const SearchBarShapeExampleSearchDemoSurface({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.tTheme.bgColorContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: child,
      ),
    );
  }
}
```

##### 默认状态其他对齐方式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SearchBarCenterExample extends StatelessWidget {
  const SearchBarCenterExample({super.key});

  Widget _buildCenter(BuildContext context) {
    return const SearchBarCenterExampleSearchDemoSurface(
      child: TSearchBar(
        hintText: '搜索预设文案',
        textAlignment: TSearchBarAlignment.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCenter(context);
  }
}

class SearchBarCenterExampleSearchDemoSurface extends StatelessWidget {
  const SearchBarCenterExampleSearchDemoSurface({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.tTheme.bgColorContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: child,
      ),
    );
  }
}
```

## API

1. [TSearchBar](#tsearchbar)
2. [TSearchBarVariant](#tsearchbarvariant)
3. [TSearchBarAlignment](#tsearchbaralignment)
4. [TSearchBarThemeData](#tsearchbarthemedata)

### TSearchBar

#### 构造方法

##### TSearchBar

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| actionText | String? | - | 右侧操作文案；为空时不占据布局空间。 | 否 |
| autofocus | bool | false | 是否自动聚焦。 | 否 |
| clearable | bool | true | 是否在存在文本、enabled 为 true 且非只读时显示清除按钮；无需聚焦。 | 否 |
| controller | TextEditingController? | - | 文本控制器；与 initialValue 互斥。外部控制器由调用方释放， 未提供时由组件创建并释放内部控制器。 | 否 |
| enabled | bool | true | 是否可交互。 | 否 |
| focusNode | FocusNode? | - | 焦点节点；外部节点由调用方释放，未提供时由组件管理内部节点。 | 否 |
| hintText | String? | - | 占位提示。 | 否 |
| initialValue | String? | - | 内部控制器的初始文本，仅初始化一次。 | 否 |
| inputAction | TextInputAction | TextInputAction.search | 键盘动作。 | 否 |
| inputFormatters | List<TextInputFormatter>? | - | 输入格式化器。 | 否 |
| inputType | TextInputType | TextInputType.text | 键盘类型。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| maxCharacter | int? | - | 最大加权字符数，ASCII 字符计 1，非 ASCII 字符计 2。 | 否 |
| maxLength | int? | - | 最大字符数；不显示 Material 计数器，与 maxCharacter 互斥。 | 否 |
| onActionPressed | VoidCallback? | - | 右侧操作点击回调。组件不会隐式清空输入或释放焦点。 | 否 |
| onChanged | ValueChanged<String>? | - | 文本变化通知。 | 否 |
| onClearPressed | VoidCallback? | - | 清除按钮点击回调；先清空 controller，再调用本回调，最后触发 onChanged('')。 | 否 |
| onFocusChanged | ValueChanged<bool>? | - | 焦点变化通知。 | 否 |
| onSubmitted | ValueChanged<String>? | - | 提交回调。 | 否 |
| readOnly | bool | false | 是否只读。只读时仍可获得焦点和选择文字，但不显示清除按钮。 | 否 |
| textAlignment | TSearchBarAlignment? | - | 文本对齐方式，默认左对齐。 | 否 |
| variant | TSearchBarVariant? | - | 搜索框形态；未设置时为 `TSearchBarVariant.square`。 | 否 |

### TSearchBarVariant

搜索框形态。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| square | TSearchBarVariant | - | 方形搜索框。 | - |
| round | TSearchBarVariant | - | 圆角搜索框。 | - |

### TSearchBarAlignment

搜索框文本对齐方式。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| left | TSearchBarAlignment | - | 左对齐。 | - |
| center | TSearchBarAlignment | - | 居中对齐。 | - |

### TSearchBarThemeData

`TSearchBar` 的默认视觉配置。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| actionGap | double? | - | 搜索框与右侧操作文字的间距，默认 15dp。 | 否 |
| actionTextStyle | TextStyle? | - | 右侧操作文字样式。 | 否 |
| clearIconTheme | IconThemeData? | - | 清除图标主题。 | 否 |
| contentPadding | EdgeInsetsGeometry? | - | 输入区域内部留白，默认水平方向 12dp。 | 否 |
| cursorHeight | double? | - | 光标高度。 | 否 |
| height | double? | - | 搜索框高度；默认最小高度读取 size12（40dp）。 显式高度保持固定；默认随内置文字和图标的自然尺寸增长。 | 否 |
| hintStyle | TextStyle? | - | 占位文字样式，未设置字段继承 `fontBodyLarge` 和占位色 Token。 | 否 |
| inputBackgroundColor | Color? | - | 输入区域背景色，默认 `bgColorSecondaryContainer` Token。 | 否 |
| searchIconTheme | IconThemeData? | - | 搜索图标主题。 | 否 |
| textStyle | TextStyle? | - | 输入文字样式，未设置字段继承 `fontBodyLarge` Token。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [常见用法](#常见用法)
4. [相似组件](#相似组件)

### 何时使用

当需要从海量信息中准确提取准确的内容时使用。

### 与页面布局相关

##### 位于页面或内容模块的最上方，通过搜索框、搜索icon等方式承载和触发功能。

![](https://tdesign.gtimg.com/site/design/mobile-guide/search/search-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/search/search-2.png)

### 常见用法

##### 在可搜索内容类型较为单一的场景下，可直接在原页面激活搜索态进行搜索，并通过高亮命中字符的方式展示搜索结果，页面内容组织结构保持不变。

![](https://tdesign.gtimg.com/site/design/mobile-guide/search/search-3.png)

---

##### 在可搜索内容类型较丰富的场景下，通过模态承载搜索态，并在新页面中按分类呈现搜索结果。

![](https://tdesign.gtimg.com/site/design/mobile-guide/search/search-4.png)

---

##### 在用户触发搜索后，对用户即将搜索的内容进行预判和推荐，并需要满足营销的诉求。

![](https://tdesign.gtimg.com/site/design/mobile-guide/search/search-5.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [输入框](<Input 输入框.md>) | 需要进行文字输入，且需填写的字数较少时使用。 |
