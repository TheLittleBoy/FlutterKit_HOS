# Text 文本

> 使用 TDesign Token 渲染 Flutter 原生文本。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/text)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 普通文本

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PlainTextExample extends StatelessWidget {
  const PlainTextExample({super.key});
  Widget _buildPlainText(BuildContext context) {
    return const TText(exampleText);
  }

  static const exampleText = '文本 Text';

  @override
  Widget build(BuildContext context) {
    return _buildPlainText(context);
  }
}
```

##### 富文本

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class RichTextExample extends StatelessWidget {
  const RichTextExample({super.key});

  Widget _buildRichText(BuildContext context) {
    return TText.rich(
      TextSpan(
        children: [
          const TextSpan(text: '使用 '),
          TTextSpan(
            text: 'TTextSpan',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: context.tTheme.brandColor,
            ),
          ),
          const TextSpan(text: ' 组合局部样式 '),
          const WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Icon(TIcons.check_circle, size: 20),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildRichText(context);
  }
}
```

#### 文本样式

##### 字体 Token 与颜色

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextTokenStyleExample extends StatelessWidget {
  const TextTokenStyleExample({super.key});
  Widget _buildTokenStyle(BuildContext context) {
    return TText(
      exampleText,
      font: context.tTheme.fontHeadlineSmall,
      style: TextStyle(color: context.tTheme.brandColor),
    );
  }

  static const exampleText = '文本 Text';

  @override
  Widget build(BuildContext context) {
    return _buildTokenStyle(context);
  }
}
```

##### 字重与删除线

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextDecorationExample extends StatelessWidget {
  const TextDecorationExample({super.key});

  Widget _buildDecoration(BuildContext context) {
    return TText(
      '已失效文本',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.lineThrough,
        decorationColor: context.tTheme.errorColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDecoration(context);
  }
}
```

##### 字形背景与行盒背景

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextBackgroundExample extends StatelessWidget {
  const TextBackgroundExample({super.key});

  Widget _buildBackground(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Theme(
          data: Theme.of(context).mergeExtension(
            TTextThemeData(
              textStyle: TextStyle(
                backgroundColor: context.tTheme.brandColorFocus,
              ),
            ),
          ),
          child: const TText('字形背景'),
        ),
        const SizedBox(height: 12),
        ColoredBox(
          color: context.tTheme.brandColorFocus,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: TText('行盒背景'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBackground(context);
  }
}
```

##### 字体族与资源 package

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextFontFamilyExample extends StatelessWidget {
  const TextFontFamilyExample({super.key});

  Widget _buildFontFamily(BuildContext context) {
    return const TText(
      '0123456789',
      style: TextStyle(fontFamily: 'TCloudNumber', package: 'tdesign_flutter'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildFontFamily(context);
  }
}
```

#### 段落与辅助能力

##### 多行省略

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextOverflowExample extends StatelessWidget {
  const TextOverflowExample({super.key});

  Widget _buildOverflow(BuildContext context) {
    return const SizedBox(
      width: 240,
      child: TText(
        '这是一段用于展示多行省略的较长文本，超出两行后使用省略号。',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildOverflow(context);
  }
}
```

##### 对齐与文字缩放

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextLayoutExample extends StatelessWidget {
  const TextLayoutExample({super.key});

  Widget _buildLayout(BuildContext context) {
    return const SizedBox(
      width: 240,
      child: TText(
        '居中文本 Text',
        textAlign: TextAlign.center,
        textScaler: TextScaler.linear(1.25),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildLayout(context);
  }
}
```

##### 文字选择与语义

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class AccessibleTextExample extends StatelessWidget {
  const AccessibleTextExample({super.key});

  Widget _buildAccessibleText(BuildContext context) {
    return SelectionArea(
      child: TText(
        '长按或拖拽选择这段文本',
        semanticsLabel: '可选择的示例文本',
        semanticsIdentifier: 't-text-selection-example',
        selectionColor: context.tTheme.brandColorFocus,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildAccessibleText(context);
  }
}
```

##### 获取 Flutter 原生 Text

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class RawTextExample extends StatelessWidget {
  const RawTextExample({super.key});
  Widget _buildRawText(BuildContext context) {
    return const TText(exampleText).getRawText(context: context);
  }

  static const exampleText = '文本 Text';

  @override
  Widget build(BuildContext context) {
    return _buildRawText(context);
  }
}
```

#### 组件主题

##### 子树默认样式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextThemeExample extends StatelessWidget {
  const TextThemeExample({super.key});

  Widget _buildTextThemeExample(BuildContext context) {
    return Theme(
      data: Theme.of(context).mergeExtension(
        TTextThemeData(
          textStyle: TextStyle(
            fontSize: context.tTheme.fontTitleLarge?.size,
            height: context.tTheme.fontTitleLarge?.height,
            fontWeight: context.tTheme.fontTitleLarge?.fontWeight,
            color: context.tTheme.brandColor,
          ),
        ),
      ),
      child: const TText('继承组件主题样式'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTextThemeExample(context);
  }
}
```

## API

1. [TText](#ttext)
2. [TTextSpan](#ttextspan)
3. [TFontLoader](#tfontloader)
4. [TTextThemeData](#ttextthemedata)

### TText

#### 构造方法

##### TText

位置参数：`data`

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| data | String | - | 文本内容。 | 是 |
| font | Font? | - | TDesign 字体 Token 预设，包含字号、行高和字重；`style` 的显式字段优先。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| locale | Locale? | - | 透传至 `Text.locale`。 | 否 |
| maxLines | int? | - | 透传至 `Text.maxLines`。 | 否 |
| overflow | TextOverflow? | - | 透传至 `Text.overflow`。 | 否 |
| selectionColor | Color? | - | 选择高亮颜色；未指定时使用 TD brandColor 的 40% alpha，不继承 Material 选择主题。 | 否 |
| semanticsIdentifier | String? | - | 透传至 `Text.semanticsIdentifier`。 | 否 |
| semanticsLabel | String? | - | 透传至 `Text.semanticsLabel`。 | 否 |
| softWrap | bool? | - | 透传至 `Text.softWrap`。 | 否 |
| strutStyle | StrutStyle? | - | 透传至 `Text.strutStyle`。 | 否 |
| style | TextStyle? | - | 当前实例的完整文字样式；仅覆盖显式字段，优先于 `font` 和子树组件 Theme。 | 否 |
| textAlign | TextAlign? | - | 透传至 `Text.textAlign`。 | 否 |
| textDirection | TextDirection? | - | 透传至 `Text.textDirection`。 | 否 |
| textHeightBehavior | ui.TextHeightBehavior? | - | 透传至 `Text.textHeightBehavior`。 | 否 |
| textScaler | TextScaler? | - | Flutter 原生文字缩放器；为 null 时继承 MediaQuery。 | 否 |
| textWidthBasis | TextWidthBasis? | - | 透传至 `Text.textWidthBasis`。 | 否 |

##### TText.rich

位置参数：`textSpan`

创建 TDesign 富文本。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| textSpan | InlineSpan | - | 富文本内容。 | 是 |
| font | Font? | - | TDesign 字体 Token 预设，包含字号、行高和字重；`style` 的显式字段优先。 | 否 |
| style | TextStyle? | - | 当前实例的完整文字样式；仅覆盖显式字段，优先于 `font` 和子树组件 Theme。 | 否 |
| strutStyle | StrutStyle? | - | 透传至 `Text.strutStyle`。 | 否 |
| textAlign | TextAlign? | - | 透传至 `Text.textAlign`。 | 否 |
| textDirection | TextDirection? | - | 透传至 `Text.textDirection`。 | 否 |
| locale | Locale? | - | 透传至 `Text.locale`。 | 否 |
| softWrap | bool? | - | 透传至 `Text.softWrap`。 | 否 |
| overflow | TextOverflow? | - | 透传至 `Text.overflow`。 | 否 |
| textScaler | TextScaler? | - | Flutter 原生文字缩放器；为 null 时继承 MediaQuery。 | 否 |
| maxLines | int? | - | 透传至 `Text.maxLines`。 | 否 |
| semanticsLabel | String? | - | 透传至 `Text.semanticsLabel`。 | 否 |
| semanticsIdentifier | String? | - | 透传至 `Text.semanticsIdentifier`。 | 否 |
| textWidthBasis | TextWidthBasis? | - | 透传至 `Text.textWidthBasis`。 | 否 |
| textHeightBehavior | ui.TextHeightBehavior? | - | 透传至 `Text.textHeightBehavior`。 | 否 |
| selectionColor | Color? | - | 选择高亮颜色；未指定时使用 TD brandColor 的 40% alpha，不继承 Material 选择主题。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |

#### 属性

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| textSpan | InlineSpan? | - | 富文本内容。 | - |

#### 实例方法

##### TText.getRawText

获取与当前 TText 配置等价的 Flutter 原生 `Text`。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 当前构建上下文，用于读取祖先配置。 | 是 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Text | - | 保留当前文本配置和 key 的原生 Text。 | - |

##### TText.getTextStyle

位置参数：`context`

获取最终 Flutter `TextStyle`。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 当前构建上下文，用于读取祖先配置。 | 是 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | TextStyle | - | 结合当前组件配置与上下文主题解析出的最终 TextStyle。 | - |

### TTextSpan

使用原生 `TextStyle` 配置局部样式的 Flutter `TextSpan`。

未显式配置的字段保持为空，并继承父 Span 样式。

#### 构造方法

##### TTextSpan

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| children | List<InlineSpan>? | - | 透传至 `TextSpan.children`。 | 否 |
| locale | Locale? | - | 透传至 `TextSpan.locale`。 | 否 |
| mouseCursor | MouseCursor? | - | 透传至 `TextSpan.mouseCursor`。 | 否 |
| onEnter | PointerEnterEventListener? | - | 透传至 `TextSpan.onEnter`。 | 否 |
| onExit | PointerExitEventListener? | - | 透传至 `TextSpan.onExit`。 | 否 |
| recognizer | GestureRecognizer? | - | 透传至 `TextSpan.recognizer`。 | 否 |
| semanticsIdentifier | String? | - | 透传至 `TextSpan.semanticsIdentifier`。 | 否 |
| semanticsLabel | String? | - | 透传至 `TextSpan.semanticsLabel`。 | 否 |
| spellOut | bool? | - | 透传至 `TextSpan.spellOut`。 | 否 |
| style | TextStyle? | - | Span 的唯一文字样式入口；未设置的字段继承父 Span。 | 否 |
| text | String? | - | 透传至 `TextSpan.text`。 | 否 |

### TFontLoader

Flutter 动态字体注册工具。

字体应在构建 Text 前加载完成；组件不会在绘制过程中隐式下载字体。

#### 静态方法

##### TFontLoader.load

下载并注册字体。

同一 `name` 和 `fontFamilyUrl` 的并发调用共享同一个 Future。加载失败会
清除缓存并允许重试；已经注册或正在注册的字体不能切换 URL。
返回 true 表示字体已成功注册；空名称、空 URL、URL 冲突或下载/注册失败
返回 false。重复加载相同资源返回其加载结果。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| name | String | - | 注册到 Flutter 字体系统中的字体族名称。 | 是 |
| fontFamilyUrl | String | - | 可直接下载的字体资源 URL。 | 是 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Future<bool> | - | 字体成功注册时为 true；空名称、空 URL、URL 冲突或下载/注册失败时为 false。同一资源的重复调用共享加载结果。 | - |

### TTextThemeData

TText 子树的组件默认值。

仅在对应实例参数未指定时生效；实例字体预设和段落参数
优先于这里的默认值。外部 Flutter `DefaultTextStyle` 不会自动覆盖 TDesign 文字。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| strutStyle | StrutStyle? | - | 子树的段落支柱样式默认值；实例 `TText.strutStyle` 优先。 | 否 |
| textHeightBehavior | ui.TextHeightBehavior? | - | 子树的文字高度行为默认值；实例 `TText.textHeightBehavior` 优先。 | 否 |
| textStyle | TextStyle? | - | 子树的完整文字样式；字号、行高和字重也由本字段统一设置。 TText 实例的显式字体参数仍优先于本默认值。 | 否 |
| textWidthBasis | TextWidthBasis? | - | 子树的文字宽度计算默认值；实例 `TText.textWidthBasis` 优先。 | 否 |
