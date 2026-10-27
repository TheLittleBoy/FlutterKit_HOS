# Input 输入框

> 用于单行文本信息输入。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/input)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 基础输入框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class InputBasicExample extends StatefulWidget {
  const InputBasicExample({super.key});

  @override
  State<InputBasicExample> createState() => _InputBasicExampleState();
}

class _InputBasicExampleState extends State<InputBasicExample> {
  Widget _buildBasic(BuildContext context) => Column(
    children: [
      const TFormItem(
        label: '标签文字',
        child: TInput(borderless: true, hintText: '请输入文字'),
      ),
      const SizedBox(height: 16),
      const TFormItem(
        label: '标签文字',
        required: true,
        child: TInput(borderless: true, hintText: '请输入文字'),
      ),
      const SizedBox(height: 16),
      TFormItem(
        child: TInput(
          controller: controller,
          borderless: true,
          hintText: '请输入文字',
        ),
      ),
    ],
  );

  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    priceController.dispose();
    priceFocusNode
      ..removeListener(_formatPriceOnBlur)
      ..dispose();
    super.dispose();
  }

  final priceController = TextEditingController();

  final priceFocusNode = FocusNode();

  void _formatPriceOnBlur() {
    if (priceFocusNode.hasFocus) {
      return;
    }
    final value = priceController.text;
    if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(value)) {
      return;
    }
    final formatted = double.parse(value).toStringAsFixed(2);
    if (formatted != value) {
      priceController.value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    priceFocusNode.addListener(_formatPriceOnBlur);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).mergeExtension(
        const TFormThemeData(
          requiredMarkPosition: TFormRequiredMarkPosition.right,
        ),
      ),
      child: _buildBasic(context),
    );
  }
}
```

##### 带字数限制输入框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class InputFormatterExample extends StatelessWidget {
  const InputFormatterExample({super.key});

  Widget _buildFormatter(BuildContext context) => const Column(
    children: [
      TFormItem(
        label: '标签文字',
        help: '最大输入10个字符',
        child: TInput(borderless: true, hintText: '请输入文字', maxLength: 10),
      ),
      SizedBox(height: 16),
      TFormItem(
        label: '标签文字',
        help: '最大输入10个字符，汉字算两个',
        child: TInput(borderless: true, hintText: '请输入文字', maxCharacter: 10),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return _buildFormatter(context);
  }
}
```

##### 带操作输入框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class InputActionExample extends StatelessWidget {
  const InputActionExample({super.key});

  Widget _buildAction(BuildContext context) {
    const suffixIcon = Icon(TIcons.info_circle_filled);
    const avatarIcon = Icon(TIcons.user_avatar);
    return Column(
      children: [
        const TFormItem(
          label: '标签文字',
          verticalAlignment: TFormItemVerticalAlignment.center,
          child: TInput(
            borderless: true,
            hintText: '请输入文字',
            suffix: suffixIcon,
          ),
        ),
        const SizedBox(height: 16),
        TFormItem(
          label: '标签文字',
          verticalAlignment: TFormItemVerticalAlignment.center,
          child: const TInput(borderless: true, hintText: '请输入文字'),
          extra: TButton(
            size: TButtonSize.extraSmall,
            colorPreset: TButtonColorPreset.primary,
            onPressed: () {},
            child: const Text('操作按钮'),
          ),
        ),
        const SizedBox(height: 16),
        const TFormItem(
          label: '标签文字',
          verticalAlignment: TFormItemVerticalAlignment.center,
          child: TInput(
            borderless: true,
            hintText: '请输入文字',
            suffix: avatarIcon,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildAction(context);
  }
}
```

##### 带图标输入框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class InputSlotsExample extends StatelessWidget {
  const InputSlotsExample({super.key});

  Widget _buildSlots(BuildContext context) {
    final token = context.tTheme;

    return ColoredBox(
      color: token.bgColorPage,
      child: const Column(
        children: [
          TFormItem(
            leading: Icon(TIcons.app),
            label: '标签文字',
            verticalAlignment: TFormItemVerticalAlignment.center,
            child: TInput(borderless: true, hintText: '请输入文字'),
          ),
          SizedBox(height: 16),
          TInput(borderless: true, hintText: '请输入文字', prefix: Icon(TIcons.app)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSlots(context);
  }
}
```

##### 特定类型输入框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class InputPasswordExample extends StatefulWidget {
  const InputPasswordExample({super.key});

  @override
  State<InputPasswordExample> createState() => _InputPasswordExampleState();
}

class _InputPasswordExampleState extends State<InputPasswordExample> {
  Widget _buildPassword(BuildContext context) {
    final token = context.tTheme;
    return Column(
      children: [
        const TFormItem(
          label: '输入密码',
          verticalAlignment: TFormItemVerticalAlignment.center,
          child: TInput(
            borderless: true,
            hintText: '请输入密码',
            initialValue: '12345678',
            obscureText: true,
            showPasswordToggle: true,
            inputType: TextInputType.visiblePassword,
          ),
        ),
        const SizedBox(height: 16),
        TFormItem(
          label: '验证码',
          verticalAlignment: TFormItemVerticalAlignment.center,
          child: TInput(
            borderless: true,
            hintText: '输入验证码',
            suffix: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 1, height: 24, color: token.componentStroke),
                const SizedBox(width: 16),
                SizedBox(
                  width: 72,
                  height: 24,
                  child: Center(
                    child: Text(
                      'DwrSe',
                      key: const ValueKey('input-captcha'),
                      style: TextStyle(
                        color: token.successColor,
                        fontSize: 18,
                        height: token.fontBodyMedium?.height,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        TFormItem(
          label: '手机号',
          errorText: phoneError ? '手机号输入不正确' : null,
          verticalAlignment: TFormItemVerticalAlignment.center,
          child: TInput(
            borderless: true,
            hintText: '输入手机号码',
            onChanged: _onPhoneChanged,
            inputType: TextInputType.number,
            suffix: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 1, height: 24, color: token.componentStroke),
                const SizedBox(width: 16),
                Text(
                  '发送验证码',
                  style: TextStyle(
                    color: token.brandColor,
                    fontSize: token.fontBodyLarge?.size,
                    height: token.fontBodyLarge?.height,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        TFormItem(
          label: '价格',
          errorText: priceError ? '请输入正确的价格' : null,
          verticalAlignment: TFormItemVerticalAlignment.center,
          child: TInput(
            controller: priceController,
            focusNode: priceFocusNode,
            borderless: true,
            hintText: '0.00',
            onChanged: _onPriceChanged,
            textAlign: TextAlign.end,
            suffix: Text(
              '元',
              style: TextStyle(
                color: token.textColorPrimary,
                fontSize: token.fontBodyMedium?.size,
                height: token.fontBodyMedium?.height,
              ),
            ),
            inputType: TextInputType.number,
          ),
        ),
        const SizedBox(height: 16),
        TFormItem(
          label: '数量',
          verticalAlignment: TFormItemVerticalAlignment.center,
          child: TInput(
            borderless: true,
            hintText: '填写个数',
            textAlign: TextAlign.end,
            suffix: Text(
              '个',
              style: TextStyle(
                color: token.textColorPrimary,
                fontSize: token.fontBodyMedium?.size,
                height: token.fontBodyMedium?.height,
              ),
            ),
            inputType: TextInputType.number,
          ),
        ),
      ],
    );
  }

  bool phoneError = false;

  void _onPhoneChanged(String value) {
    final valid = RegExp(r'^[1][3,4,5,7,8,9][0-9]{9}$').hasMatch(value);
    if (phoneError == valid) {
      setState(() => phoneError = !valid);
    }
  }

  bool priceError = false;

  final controller = TextEditingController();

  final priceController = TextEditingController();

  final priceFocusNode = FocusNode();

  void _onPriceChanged(String value) {
    final valid = RegExp(r'^\d+(\.\d+)?$').hasMatch(value);
    if (priceError == valid) {
      setState(() => priceError = !valid);
    }
  }

  @override
  void initState() {
    super.initState();
    priceFocusNode.addListener(_formatPriceOnBlur);
  }

  @override
  void dispose() {
    controller.dispose();
    priceController.dispose();
    priceFocusNode
      ..removeListener(_formatPriceOnBlur)
      ..dispose();
    super.dispose();
  }

  void _formatPriceOnBlur() {
    if (priceFocusNode.hasFocus) {
      return;
    }
    final value = priceController.text;
    if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(value)) {
      return;
    }
    final formatted = double.parse(value).toStringAsFixed(2);
    if (formatted != value) {
      priceController.value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildPassword(context);
  }
}
```

#### 组件状态

##### 输入框状态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class InputStatusExample extends StatelessWidget {
  const InputStatusExample({super.key});

  Widget _buildStatus(BuildContext context) {
    return Column(
      children: [
        const TFormItem(
          label: '标签文字',
          errorText: '错误提示',
          verticalAlignment: TFormItemVerticalAlignment.start,
          child: TInput(
            borderless: true,
            initialValue: '已输入内容',
            status: TInputStatus.error,
            clearButtonMode: TInputClearButtonMode.always,
          ),
        ),
        const SizedBox(height: 16),
        _buildDisabled(context),
      ],
    );
  }

  Widget _buildDisabled(BuildContext context) => const TFormItem(
    label: '标签文字',
    child: TInput(borderless: true, initialValue: '不可编辑文字', enabled: false),
  );

  @override
  Widget build(BuildContext context) {
    return _buildStatus(context);
  }
}
```

##### 信息超长状态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class InputLabelExample extends StatelessWidget {
  const InputLabelExample({super.key});

  Widget _buildLabel(BuildContext context) => const TFormItem(
    label: '标签超长时最多十个字',
    verticalAlignment: TFormItemVerticalAlignment.center,
    child: TInput(borderless: true, hintText: '请输入文字'),
  );

  @override
  Widget build(BuildContext context) {
    return _buildLabel(context);
  }
}
```

#### 组件样式

##### 内容位置

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class InputAlignExample extends StatelessWidget {
  const InputAlignExample({super.key});

  Widget _buildAlign(BuildContext context) => const Column(
    children: [
      TFormItem(
        label: '左对齐',
        child: TInput(borderless: true, hintText: '请输入文字'),
      ),
      SizedBox(height: 16),
      TFormItem(
        label: '居中',
        child: TInput(
          borderless: true,
          hintText: '请输入文字',
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(height: 16),
      TFormItem(
        label: '右对齐',
        child: TInput(
          borderless: true,
          hintText: '请输入文字',
          textAlign: TextAlign.end,
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return _buildAlign(context);
  }
}
```

##### 竖排样式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class InputLayoutExample extends StatelessWidget {
  const InputLayoutExample({super.key});

  Widget _buildLayout(BuildContext context) {
    return Theme(
      data: Theme.of(context).mergeExtension(
        const TFormThemeData(layout: TFormLayout.vertical, labelGap: 8),
      ),
      child: const TFormItem(
        label: '标签文字',
        child: TInput(
          borderless: true,
          hintText: '请输入文字',
          suffix: Icon(TIcons.info_circle_filled),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildLayout(context);
  }
}
```

##### 非通栏样式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class InputBannerExample extends StatelessWidget {
  const InputBannerExample({super.key});

  Widget _buildBanner(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: ClipRRect(
      // Banner radius is 9 logical pixels.
      borderRadius: BorderRadius.circular(9),
      child: Theme(
        data: Theme.of(
          context,
        ).mergeExtension(const TFormThemeData(borderColor: Colors.transparent)),
        child: const TFormItem(
          label: '标签文字',
          child: TInput(borderless: true, hintText: '请输入文字'),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _buildBanner(context);
  }
}
```

##### 标签外置样式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class InputBorderedExample extends StatelessWidget {
  const InputBorderedExample({super.key});

  Widget _buildBordered(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .mergeExtension(
            const TFormThemeData(
              layout: TFormLayout.vertical,
              borderColor: Colors.transparent,
              labelGap: 8,
            ),
          )
          .mergeExtension(
            const TInputThemeData(
              borderRadius: 6,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
      child: const TFormItem(
        label: '标签文字',
        child: TInput(
          hintText: '请输入文字',
          suffix: Icon(TIcons.info_circle_filled),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBordered(context);
  }
}
```

##### 自定义样式输入框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class InputCustomExample extends StatelessWidget {
  const InputCustomExample({super.key});

  Widget _buildCustom(BuildContext context) => ColoredBox(
    color: const Color(0xff2c2c2c),
    child: Theme(
      data: Theme.of(context)
          .mergeExtension(
            const TInputThemeData(
              backgroundColor: Color(0xff2c2c2c),
              borderColor: Color(0xff4b4b4b),
              hintStyle: TextStyle(color: Color(0x59ffffff)),
            ),
          )
          .mergeExtension(
            const TFormThemeData(
              backgroundColor: Color(0xff2c2c2c),
              borderColor: Color(0xff4b4b4b),
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
      child: const TFormItem(
        label: '标签文字',
        child: TInput(
          borderless: true,
          hintText: '请输入文字',
          style: TextStyle(color: Colors.white),
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

1. [TInput](#tinput)
2. [TInputClearButtonMode](#tinputclearbuttonmode)
3. [TInputStatus](#tinputstatus)
4. [TInputThemeData](#tinputthemedata)

### TInput

#### 构造方法

##### TInput

创建 TDesign 输入框。

内置文字、提示词、按钮及文本选择视觉由 TD 控制，
保留原生编辑、文本选择和平台菜单能力；前后缀自定义内容保留调用方主题。
输入装饰通过 `TInputThemeData` 配置。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| autofocus | bool | false | 是否自动聚焦。 | 否 |
| borderless | bool | false | 是否隐藏输入框边框。 | 否 |
| clearButtonMode | TInputClearButtonMode? | - | 清除按钮显示模式；为空时为 TInputClearButtonMode.never。 点击清除会清空 controller 并触发 onChanged；suffix 非空或 showPasswordToggle 为 true 时隐藏清除按钮。 | 否 |
| controller | TextEditingController? | - | 文本控制器；与 initialValue 互斥。外部控制器由调用方释放， 未提供时由组件创建并释放内部控制器。 | 否 |
| cursorColor | Color? | - | 光标颜色。 | 否 |
| enabled | bool | true | 是否可交互。 设为 `false` 时表示禁用输入框，禁止编辑、聚焦和选择，并使用禁用态文字颜色。 | 否 |
| focusNode | FocusNode? | - | 焦点节点；外部节点由调用方释放，未提供时由组件管理内部节点。 | 否 |
| hintText | String? | - | 占位提示文案。 | 否 |
| indicator | bool | false | 是否显示当前字符计数。 多行场景优先使用 `TTextarea`；未配置长度限制时不会显示。 | 否 |
| initialValue | String? | - | 内部控制器的初始文本，仅初始化一次。 | 否 |
| inputAction | TextInputAction? | - | 键盘动作。 | 否 |
| inputFormatters | List<TextInputFormatter>? | - | 输入格式化器。 | 否 |
| inputType | TextInputType | TextInputType.text | 键盘类型。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| maxCharacter | int? | - | 最大字符权重，按 Unicode code point 计算：ASCII code point 计 1， 非 ASCII code point 计 2。 非空时必须大于或等于 0，与 maxLength 二选一。提交中的文本超过限制时，保留不超过限制的 最长前缀；输入法正在 composing 时暂不截断，在 composing 结束后执行。 | 否 |
| maxLength | int? | - | 最大字符数，使用 Flutter grapheme 计数语义；非空时必须大于或等于 0， 与 maxCharacter 互斥。 | 否 |
| maxLines | int? | 1 | 最大行数。 | 否 |
| minLines | int? | - | 最小行数；为空时单行为 null，多行默认为 4，并限制到非空 maxLines。 | 否 |
| obscureText | bool | false | 是否隐藏输入文本；为 true 时仅支持 maxLines 为 1、minLines 为 null。 | 否 |
| onChanged | ValueChanged<String>? | - | 文本变化通知。 | 否 |
| onEditingComplete | VoidCallback? | - | 编辑完成回调。 | 否 |
| onSubmitted | ValueChanged<String>? | - | 提交回调。 | 否 |
| prefix | Widget? | - | 前缀组件。 | 否 |
| readOnly | bool | false | 是否只读。 设为 `true` 时禁止修改内容，但保留只读文本的选择和复制能力；文字仍使用正常态颜色。 | 否 |
| showPasswordToggle | bool | false | 是否在后置插槽显示内置密码显隐按钮。 初始显隐状态由 `obscureText` 决定，按钮点击后的显隐状态由输入框 自身维护。启用后会使用 TDesign 的浏览图标和 24dp 图标槽，且不会 额外撑高输入框；仅支持单行输入。如果同时传入 `suffix`，自定义后置内容 会紧跟在该按钮之后。启用密码显隐按钮时，不同时显示内置清除按钮。 | 否 |
| status | TInputStatus | TInputStatus.normal | 输入框语义状态。 状态色用于输入壳层、计数器和错误提示； 已输入文字仍使用正常正文色，除非通过 `style` 显式覆盖。 当输入框位于 `TFormField` 中且表单错误需要在输入框内展示时， 表单错误状态优先于这里显式设置的状态。 | 否 |
| style | TextStyle? | - | 输入文本样式。 输入文字样式的唯一组件公开配置入口。未指定的字段使用 TD Theme 与 TDesign `fontBodyLarge`；提示文字由组件 Theme 的 `hintStyle` 单独控制。 | 否 |
| suffix | Widget? | - | 后缀组件；传入后不显示内置清除按钮。 | 否 |
| textAlign | TextAlign | TextAlign.start | 文本对齐方式。 | 否 |

### TInputClearButtonMode

输入框清除按钮的显示模式。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| never | TInputClearButtonMode | - | 从不显示清除按钮。 | - |
| always | TInputClearButtonMode | - | 有文本时显示清除按钮。 | - |
| focused | TInputClearButtonMode | - | 输入框获得焦点且有文本时显示清除按钮。 | - |

### TInputStatus

输入框的语义状态。

状态不改变已输入文字的正文色。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| normal | TInputStatus | - | 默认状态。 | - |
| success | TInputStatus | - | 成功状态。 | - |
| warning | TInputStatus | - | 警告状态。 | - |
| error | TInputStatus | - | 错误状态。 | - |

### TInputThemeData

TInput 与 TTextarea 共用的组件级 ThemeExtension。

输入组件的外层边框、颜色、内边距和提示文字样式在这里提供组件级默认值；
默认状态不继承全局填充色，避免输入区被 `ThemeData.inputDecorationTheme`
污染。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 输入区域背景色。 null 时在 TFormItem 作用域内透明，独立输入框使用 bgColorContainer Token。 | 否 |
| borderColor | Color? | - | 输入区域边框颜色。 null 时按启用、焦点与语义状态解析边框颜色；禁用态使用 componentStroke Token。 | 否 |
| borderRadius | double? | - | 输入区域圆角。 对非多行、非无边框输入框设置为大于 0 的值时，输入框使用完整边框； 未设置时保留单行输入框的底部分隔线。 | 否 |
| borderWidth | double? | - | 输入区域边框宽度。 null 时为 1 逻辑像素。 | 否 |
| clearIconColor | Color? | - | 清除图标颜色。 null 时错误态使用 errorColor，其他状态使用 textColorPlaceholder Token。 | 否 |
| clearIconSize | double? | - | 清除图标尺寸。 null 时为 20 逻辑像素。 | 否 |
| contentPadding | EdgeInsetsGeometry? | - | 输入区域内边距。 null 时在 TFormItem 作用域内为零，独立输入框为四周 16 逻辑像素；Textarea 组合有独立的容器分工。 | 否 |
| hintStyle | TextStyle? | - | 占位提示文本样式。 未指定的字段继承 TDesign 输入框提示词 token。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

### 何时使用

需要进行文字输入，且需填写的字数较少时使用。

### 组件搭配使用

##### 呈现在单元格中，可与按钮组件相结合，点击按钮触发相关功能。

![](https://tdesign.gtimg.com/site/design/mobile-guide/input/input-1.png)

### 常见用法

##### 通常使用在表单中进行文字填写，填写状态下可在右侧显示清空输入的按钮，供用户快速清空已输入的内容。

![](https://tdesign.gtimg.com/site/design/mobile-guide/input/input-2.png)

---

##### 当需要进行较复杂的内容填写，如验证码等，可使用特定类型输入框，结合按钮、图形等辅助元素帮助用户完成流程。

![](https://tdesign.gtimg.com/site/design/mobile-guide/input/input-3.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/input/input-4.png)

### 推荐/慎用示例

##### 标签、占位符文本简明扼要地描述用户需要输入的内容，标签超过10个字时请考虑使用其它展示方式。

![](https://tdesign.gtimg.com/site/design/mobile-guide/input/input-5.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/input/input-6.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 当需要输入较长的复杂内容时，建议使用多行文本框输入。

![](https://tdesign.gtimg.com/site/design/mobile-guide/input/input-7.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [搜索框](<Search 搜索框.md>) | 当需要从海量信息中准确提取准确的内容时使用。 |
