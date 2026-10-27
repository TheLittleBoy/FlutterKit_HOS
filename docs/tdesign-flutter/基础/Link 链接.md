# Link 链接

> 文字超链接用于跳转一个新页面，如当前项目跳转，友情链接等。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/link)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 基础文字链接

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class BasicLinksExample extends StatelessWidget {
  const BasicLinksExample({super.key});
  Widget _buildBasicLinks(BuildContext context) {
    return _exampleRow(context, [
      _link(context, colorPreset: TLinkColorPreset.primary),
      _link(context),
    ]);
  }

  Widget _exampleRow(BuildContext context, List<Widget> children) {
    return Container(
      height: 48,
      color: context.tTheme.bgColorContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }

  TLink _link(
    BuildContext context, {
    String label = '跳转链接',
    TLinkColorPreset? colorPreset,
    TLinkSize size = TLinkSize.small,
    bool? underline,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool disabled = false,
  }) {
    return TLink(
      child: Text(label),
      colorPreset: colorPreset,
      size: size,
      underline: underline,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onPressed: disabled ? null : () => _onLinkPressed(context),
    );
  }

  void _onLinkPressed(BuildContext context) {
    TToast.showText('点击了链接', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBasicLinks(context);
  }
}
```

##### 下划线文字链接

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class UnderlineLinksExample extends StatelessWidget {
  const UnderlineLinksExample({super.key});
  Widget _buildUnderlineLinks(BuildContext context) {
    return _exampleRow(context, [
      _link(context, colorPreset: TLinkColorPreset.primary, underline: true),
      _link(context, underline: true),
    ]);
  }

  Widget _exampleRow(BuildContext context, List<Widget> children) {
    return Container(
      height: 48,
      color: context.tTheme.bgColorContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }

  TLink _link(
    BuildContext context, {
    String label = '跳转链接',
    TLinkColorPreset? colorPreset,
    TLinkSize size = TLinkSize.small,
    bool? underline,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool disabled = false,
  }) {
    return TLink(
      child: Text(label),
      colorPreset: colorPreset,
      size: size,
      underline: underline,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onPressed: disabled ? null : () => _onLinkPressed(context),
    );
  }

  void _onLinkPressed(BuildContext context) {
    TToast.showText('点击了链接', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return _buildUnderlineLinks(context);
  }
}
```

##### 前置图标文字链接

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PrefixLinksExample extends StatelessWidget {
  const PrefixLinksExample({super.key});
  Widget _buildPrefixLinks(BuildContext context) {
    return _exampleRow(context, [
      _link(
        context,
        colorPreset: TLinkColorPreset.primary,
        prefixIcon: const Icon(TIcons.link),
      ),
      _link(context, prefixIcon: const Icon(TIcons.link)),
    ]);
  }

  Widget _exampleRow(BuildContext context, List<Widget> children) {
    return Container(
      height: 48,
      color: context.tTheme.bgColorContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }

  TLink _link(
    BuildContext context, {
    String label = '跳转链接',
    TLinkColorPreset? colorPreset,
    TLinkSize size = TLinkSize.small,
    bool? underline,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool disabled = false,
  }) {
    return TLink(
      child: Text(label),
      colorPreset: colorPreset,
      size: size,
      underline: underline,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onPressed: disabled ? null : () => _onLinkPressed(context),
    );
  }

  void _onLinkPressed(BuildContext context) {
    TToast.showText('点击了链接', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return _buildPrefixLinks(context);
  }
}
```

##### 后置图标文字链接

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SuffixLinksExample extends StatelessWidget {
  const SuffixLinksExample({super.key});
  Widget _buildSuffixLinks(BuildContext context) {
    return _exampleRow(context, [
      _link(
        context,
        colorPreset: TLinkColorPreset.primary,
        suffixIcon: const Icon(TIcons.jump),
      ),
      _link(context, suffixIcon: const Icon(TIcons.jump)),
    ]);
  }

  Widget _exampleRow(BuildContext context, List<Widget> children) {
    return Container(
      height: 48,
      color: context.tTheme.bgColorContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }

  TLink _link(
    BuildContext context, {
    String label = '跳转链接',
    TLinkColorPreset? colorPreset,
    TLinkSize size = TLinkSize.small,
    bool? underline,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool disabled = false,
  }) {
    return TLink(
      child: Text(label),
      colorPreset: colorPreset,
      size: size,
      underline: underline,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onPressed: disabled ? null : () => _onLinkPressed(context),
    );
  }

  void _onLinkPressed(BuildContext context) {
    TToast.showText('点击了链接', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuffixLinks(context);
  }
}
```

#### 组件状态

##### 不同主题

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ColorPresetLinksExample extends StatelessWidget {
  const ColorPresetLinksExample({super.key});
  Widget _buildColorPresetLinks(BuildContext context) {
    return Column(
      children: [
        _exampleRow(context, [
          _link(
            context,
            colorPreset: TLinkColorPreset.primary,
            suffixIcon: const Icon(TIcons.jump),
          ),
          _link(context, suffixIcon: const Icon(TIcons.jump)),
          _link(
            context,
            colorPreset: TLinkColorPreset.danger,
            suffixIcon: const Icon(TIcons.jump),
          ),
        ]),
        const SizedBox(height: 16),
        _exampleRow(context, [
          _link(
            context,
            colorPreset: TLinkColorPreset.warning,
            suffixIcon: const Icon(TIcons.jump),
          ),
          _link(
            context,
            colorPreset: TLinkColorPreset.success,
            suffixIcon: const Icon(TIcons.jump),
          ),
        ]),
      ],
    );
  }

  Widget _exampleRow(BuildContext context, List<Widget> children) {
    return Container(
      height: 48,
      color: context.tTheme.bgColorContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }

  TLink _link(
    BuildContext context, {
    String label = '跳转链接',
    TLinkColorPreset? colorPreset,
    TLinkSize size = TLinkSize.small,
    bool? underline,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool disabled = false,
  }) {
    return TLink(
      child: Text(label),
      colorPreset: colorPreset,
      size: size,
      underline: underline,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onPressed: disabled ? null : () => _onLinkPressed(context),
    );
  }

  void _onLinkPressed(BuildContext context) {
    TToast.showText('点击了链接', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return _buildColorPresetLinks(context);
  }
}
```

##### 禁用状态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DisabledLinksExample extends StatelessWidget {
  const DisabledLinksExample({super.key});
  Widget _buildDisabledLinks(BuildContext context) {
    return Column(
      children: [
        _exampleRow(context, [
          _link(
            context,
            colorPreset: TLinkColorPreset.primary,
            suffixIcon: const Icon(TIcons.jump),
            disabled: true,
          ),
          _link(context, suffixIcon: const Icon(TIcons.jump), disabled: true),
          _link(
            context,
            colorPreset: TLinkColorPreset.danger,
            suffixIcon: const Icon(TIcons.jump),
            disabled: true,
          ),
        ]),
        const SizedBox(height: 16),
        _exampleRow(context, [
          _link(
            context,
            colorPreset: TLinkColorPreset.warning,
            suffixIcon: const Icon(TIcons.jump),
            disabled: true,
          ),
          _link(
            context,
            colorPreset: TLinkColorPreset.success,
            suffixIcon: const Icon(TIcons.jump),
            disabled: true,
          ),
        ]),
      ],
    );
  }

  Widget _exampleRow(BuildContext context, List<Widget> children) {
    return Container(
      height: 48,
      color: context.tTheme.bgColorContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }

  TLink _link(
    BuildContext context, {
    String label = '跳转链接',
    TLinkColorPreset? colorPreset,
    TLinkSize size = TLinkSize.small,
    bool? underline,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool disabled = false,
  }) {
    return TLink(
      child: Text(label),
      colorPreset: colorPreset,
      size: size,
      underline: underline,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onPressed: disabled ? null : () => _onLinkPressed(context),
    );
  }

  void _onLinkPressed(BuildContext context) {
    TToast.showText('点击了链接', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return _buildDisabledLinks(context);
  }
}
```

#### 组件样式

##### 链接尺寸

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class LinkSizesExample extends StatelessWidget {
  const LinkSizesExample({super.key});
  Widget _buildLinkSizes(BuildContext context) {
    return _exampleRow(context, [
      _link(
        context,
        label: 'S号链接',
        colorPreset: TLinkColorPreset.primary,
        size: TLinkSize.small,
        suffixIcon: const Icon(TIcons.jump),
      ),
      _link(
        context,
        label: 'M号链接',
        colorPreset: TLinkColorPreset.primary,
        size: TLinkSize.medium,
        suffixIcon: const Icon(TIcons.jump),
      ),
      _link(
        context,
        label: 'L号链接',
        colorPreset: TLinkColorPreset.primary,
        size: TLinkSize.large,
        suffixIcon: const Icon(TIcons.jump),
      ),
    ]);
  }

  Widget _exampleRow(BuildContext context, List<Widget> children) {
    return Container(
      height: 48,
      color: context.tTheme.bgColorContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }

  TLink _link(
    BuildContext context, {
    String label = '跳转链接',
    TLinkColorPreset? colorPreset,
    TLinkSize size = TLinkSize.small,
    bool? underline,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool disabled = false,
  }) {
    return TLink(
      child: Text(label),
      colorPreset: colorPreset,
      size: size,
      underline: underline,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      onPressed: disabled ? null : () => _onLinkPressed(context),
    );
  }

  void _onLinkPressed(BuildContext context) {
    TToast.showText('点击了链接', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return _buildLinkSizes(context);
  }
}
```

## API

1. [TLink](#tlink)
2. [TLinkColorPreset](#tlinkcolorpreset)
3. [TLinkSize](#tlinksize)
4. [TLinkThemeData](#tlinkthemedata)

### TLink

#### 构造方法

##### TLink

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| child | Widget? | - | 链接内容，通常为 `Text`。 | 否 |
| colorPreset | TLinkColorPreset? | - | 内置配色预设；未设置时默认为 `TLinkColorPreset.defaultTheme`。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| onPressed | VoidCallback? | - | 点击回调；为 null 时链接为禁用态。 | 否 |
| prefixIcon | Widget? | - | 前置图标；为 null 时不占位。 | 否 |
| semanticLabel | String? | - | 无障碍语义标签。 | 否 |
| size | TLinkSize? | - | 链接尺寸；未设置时默认为 `TLinkSize.medium`。 | 否 |
| suffixIcon | Widget? | - | 后置图标；为 null 时不占位。 | 否 |
| tooltip | String? | - | 鼠标悬浮提示。 | 否 |
| underline | bool? | - | 是否显示下划线；未设置时为 false。 | 否 |

### TLinkColorPreset

链接内置配色预设，不是 Material ColorScheme。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| primary | TLinkColorPreset | - | 品牌主色链接。 | - |
| defaultTheme | TLinkColorPreset | - | 默认文本色链接。 | - |
| danger | TLinkColorPreset | - | 危险操作链接。 | - |
| warning | TLinkColorPreset | - | 警告提示链接。 | - |
| success | TLinkColorPreset | - | 成功状态链接。 | - |

### TLinkSize

链接尺寸。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| small | TLinkSize | - | 小尺寸链接。 | - |
| medium | TLinkSize | - | 中尺寸链接。 | - |
| large | TLinkSize | - | 大尺寸链接。 | - |

### TLinkThemeData

TLink 组件级主题。

通过 Theme 子树注入链接字号样式、图标尺寸和间距等具体视觉值。
尺寸档位、配色预设和下划线选择仅由 `TLink` 实例控制。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| iconGap | double? | - | 前/后图标与内容之间的间距；未设置时为 4 逻辑像素。 | 否 |
| iconSize | double? | - | 图标尺寸；未设置时小、中、大尺寸分别为 14、16、18 逻辑像素。 | 否 |
| textStyle | TextStyle? | - | 链接文字样式；字号、行高与字重默认由实例尺寸对应 Token 提供。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [推荐/慎用示例](#推荐-慎用示例)
4. [相似组件](#相似组件)

### 何时使用

当需要跳转至外链时使用。

### 组件搭配使用

##### 链接与[消息通知](<../反馈/Message 全局提示.md>)、[公告栏](<../反馈/NoticeBar 消息提醒.md>)组合使用，在进行消息通知与提示的同时，提供解决方案或详情的跳转入口。

![](https://tdesign.gtimg.com/site/design/mobile-guide/link/link-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/link/link-2.png)

### 推荐/慎用示例

##### 在同一段文本中如使用多个链接，需要利用纯文本字符等将其区隔开。

![](https://tdesign.gtimg.com/site/design/mobile-guide/link/link-3.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/link/link-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [按钮](<Button 按钮.md>) | 当前流程的结束或新流程的开启需要用户点击触发时使用。 |
