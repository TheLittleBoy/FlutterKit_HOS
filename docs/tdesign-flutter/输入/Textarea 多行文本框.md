# Textarea 多行文本框

> 用于多行文本信息输入。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/textarea)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 基础多行文本框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextareaBasicExample extends StatelessWidget {
  const TextareaBasicExample({super.key});

  Widget _buildBasic(BuildContext context) =>
      const SizedBox(height: 128, child: TTextarea(hintText: '请输入文字'));

  @override
  Widget build(BuildContext context) {
    return _buildBasic(context);
  }
}
```

##### 带标题多行文本框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextareaLabelExample extends StatelessWidget {
  const TextareaLabelExample({super.key});

  Widget _buildLabel(BuildContext context) => const SizedBox(
    height: 128,
    child: TTextarea(label: '标签文字', hintText: '请输入文字', minLines: 2),
  );

  @override
  Widget build(BuildContext context) {
    return _buildLabel(context);
  }
}
```

##### 自动增高多行文本框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextareaAutosizeExample extends StatelessWidget {
  const TextareaAutosizeExample({super.key});

  Widget _buildAutosize(BuildContext context) =>
      const TTextarea(label: '标签文字', hintText: '请输入文字', minLines: 1);

  @override
  Widget build(BuildContext context) {
    return _buildAutosize(context);
  }
}
```

##### 设置字符数限制

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextareaMaxLengthExample extends StatelessWidget {
  const TextareaMaxLengthExample({super.key});

  Widget _buildMaxLength(BuildContext context) => const SizedBox(
    height: 128,
    child: TTextarea(
      label: '标签文字',
      hintText: '请输入文字',
      minLines: 2,
      maxLength: 500,
      indicator: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _buildMaxLength(context);
  }
}
```

#### 组件状态

##### 禁用状态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextareaDisabledExample extends StatelessWidget {
  const TextareaDisabledExample({super.key});

  Widget _buildDisabled(BuildContext context) => const SizedBox(
    height: 128,
    child: TTextarea(
      label: '标签文字',
      hintText: '请输入文字',
      initialValue: '不可编辑文字',
      enabled: false,
      minLines: 2,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _buildDisabled(context);
  }
}
```

#### 组件样式

##### 竖排样式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextareaVerticalExample extends StatelessWidget {
  const TextareaVerticalExample({super.key});

  Widget _buildVertical(BuildContext context) => const SizedBox(
    height: 162,
    child: TTextarea(
      label: '标签文字',
      hintText: '预设长文本预设长文本',
      layout: TTextareaLayout.vertical,
      minLines: 2,
      maxLength: 500,
      indicator: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _buildVertical(context);
  }
}
```

##### 卡片样式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextareaCardExample extends StatelessWidget {
  const TextareaCardExample({super.key});

  Widget _buildCard(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Theme(
      data: Theme.of(
        context,
      ).mergeExtension(const TInputThemeData(borderRadius: 9)),
      child: const SizedBox(
        height: 156,
        child: TTextarea(
          label: '标签文字',
          hintText: '请输入文字',
          minLines: 2,
          maxLength: 500,
          indicator: true,
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _buildCard(context);
  }
}
```

#### 特殊样式

##### 标签外置输入框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextareaCustomExample extends StatelessWidget {
  const TextareaCustomExample({super.key});

  Widget _buildCustom(BuildContext context) => Theme(
    data: Theme.of(context)
        .mergeExtension(
          TFormThemeData(
            layout: TFormLayout.vertical,
            backgroundColor: context.tTheme.bgColorContainer,
            borderColor: Colors.transparent,
            itemPadding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            labelGap: context.tTheme.spacer,
            labelStyle: TextStyle(
              fontSize: context.tTheme.fontBodySmall?.size,
              height: context.tTheme.fontBodySmall?.height,
              fontWeight: context.tTheme.fontBodySmall?.fontWeight,
            ),
          ),
        )
        .mergeExtension(
          const TInputThemeData(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
    child: const TFormItem(
      label: '标签文字',
      child: SizedBox(
        height: 124,
        child: TTextarea(
          hintText: '请输入文字',
          bordered: true,
          minLines: 2,
          maxLength: 100,
          indicator: true,
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _buildCustom(context);
  }
}
```

## API

1. [TTextarea](#ttextarea)
2. [TTextareaLayout](#ttextarealayout)

### TTextarea

#### 构造方法

##### TTextarea

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| autofocus | bool | false | 是否自动聚焦。 | 否 |
| bordered | bool | false | 是否显示外边框。 | 否 |
| clearButtonMode | TInputClearButtonMode? | - | 清除按钮显示模式；未传时不显示清除按钮。 | 否 |
| controller | TextEditingController? | - | 文本控制器；与 initialValue 互斥。外部控制器由调用方释放， 未提供时由组件创建并释放内部控制器。 | 否 |
| enabled | bool | true | 是否可交互。 | 否 |
| focusNode | FocusNode? | - | 焦点节点；外部节点由调用方释放，未提供时由组件管理内部节点。 | 否 |
| hintText | String? | - | 占位提示文案。 | 否 |
| indicator | bool | false | 是否显示当前字符计数。 | 否 |
| initialValue | String? | - | 内部控制器的初始文本，仅初始化一次。 | 否 |
| inputAction | TextInputAction? | - | 键盘动作。 | 否 |
| inputFormatters | List<TextInputFormatter>? | - | 输入格式化器。 | 否 |
| inputType | TextInputType | TextInputType.multiline | 键盘类型。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| label | String? | - | 输入框内部标题。 表单中的字段标签请使用 `TFormItem.label`，避免与表单必填、校验语义重复。 | 否 |
| layout | TTextareaLayout | TTextareaLayout.horizontal | 内部标题与编辑区的排列方式。 | 否 |
| maxCharacter | int? | - | 最大字符权重，按 Unicode code point 计算：ASCII code point 计 1， 非 ASCII code point 计 2；非空时必须大于或等于 0，与 maxLength 互斥。 | 否 |
| maxLength | int? | - | 最大字符数；非空时必须大于或等于 0，与 maxCharacter 互斥。 | 否 |
| maxLines | int? | - | 最大行数；null 表示不限制。 | 否 |
| minLines | int? | - | 最小行数；未传时使用 4 行，并限制到非空 maxLines。 | 否 |
| onChanged | ValueChanged<String>? | - | 文本变化通知。 | 否 |
| onEditingComplete | VoidCallback? | - | 编辑完成回调。 | 否 |
| onSubmitted | ValueChanged<String>? | - | 提交回调。 | 否 |
| prefix | Widget? | - | 前缀组件。 | 否 |
| readOnly | bool | false | 是否只读。 | 否 |
| status | TInputStatus | TInputStatus.normal | 输入框语义状态。 | 否 |
| suffix | Widget? | - | 后缀组件。 | 否 |
| textAlign | TextAlign | TextAlign.start | 文本对齐方式。 | 否 |

### TTextareaLayout

多行文本框内部标题与编辑区的排列方式。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| horizontal | TTextareaLayout | - | 标题与编辑区横向排列。 | - |
| vertical | TTextareaLayout | - | 标题与编辑区竖向排列。 | - |

## 设计指南

1. [何时使用](#何时使用)
2. [常见用法](#常见用法)
3. [推荐/慎用示例](#推荐-慎用示例)
4. [相似组件](#相似组件)

### 何时使用

需要进行文字输入，且需填写的字数较多时使用。

### 常见用法

##### 常见于表单、内容发布的场景中，用于输入较长的文本内容。

![](https://tdesign.gtimg.com/site/design/mobile-guide/textarea/textarea-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/textarea/textarea-2.png)

### 推荐/慎用示例

##### 尽量避免输入过于复杂的文本内容，考虑将内容拆分，让用户分步输入。

![](https://tdesign.gtimg.com/site/design/mobile-guide/textarea/textarea-3.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/textarea/textarea-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

---

##### 建议根据待输入的内容决定多行文本框的高度。

![](https://tdesign.gtimg.com/site/design/mobile-guide/textarea/textarea-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/textarea/textarea-6.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [输入框](<Input 输入框.md>) | 需要进行文字输入，且需填写的字数较少时使用。 |
