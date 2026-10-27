# Form 表单

> 用以收集、校验和提交数据，一般由输入框、选择器等控件组成。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/form)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 基础表单

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// 可直接运行的 TForm、TFormItem 与 TFormField 组合示例。
class FormBasicDemo extends StatefulWidget {
  const FormBasicDemo({super.key});

  @override
  State<FormBasicDemo> createState() => _FormBasicDemoState();
}

class _FormBasicDemoState extends State<FormBasicDemo> {
  static const _regionItems = TPickerColumns([
    [
      TPickerOption(label: '广东省', value: 'guangdong'),
      TPickerOption(label: '北京市', value: 'beijing'),
    ],
    [
      TPickerOption(label: '深圳市', value: 'shenzhen'),
      TPickerOption(label: '广州市', value: 'guangzhou'),
      TPickerOption(label: '海淀区', value: 'haidian'),
      TPickerOption(label: '朝阳区', value: 'chaoyang'),
    ],
  ]);
  static const _initialDate = TDateTimePickerValue(
    year: 2022,
    month: 8,
    day: 10,
  );
  static const _initialName = 'Abcdefgh';
  static const _initialPassword = '12345678';
  static const _initialGender = 'man';
  static const _initialBirth = '2022-08-10';
  static const _initialPlace = '广东省 深圳市';
  static const _initialPlaceValues = <Object?>['guangdong', 'shenzhen'];
  static const _initialAge = 3;
  static const _initialDescription = 3.5;
  static const _initialResume =
      '本人性格开朗、稳重、细心、待人热情、真诚，工作认真负责，积极主动，勇于创新，具有很强的团队协作精神。';
  static const _initialPhotos = [
    TUploadFile(
      id: 'uploaded-1',
      name: 'uploaded1.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/example4.png',
      status: TUploadFileStatus.success,
    ),
    TUploadFile(
      id: 'uploaded-2',
      name: 'uploaded2.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/example4.png',
      status: TUploadFileStatus.success,
    ),
  ];

  final _formController = TFormController();
  final _nameController = TextEditingController(text: _initialName);
  final _passwordController = TextEditingController(text: _initialPassword);
  final _resumeController = TextEditingController(text: _initialResume);

  TFormLayout _layout = TFormLayout.horizontal;
  bool _disabled = false;
  String _gender = _initialGender;
  String _birth = _initialBirth;
  String _place = _initialPlace;
  List<Object?> _placeValues = List.of(_initialPlaceValues);
  num _age = _initialAge;
  double _description = _initialDescription;
  List<TUploadFile> _photos = List.of(_initialPhotos);

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _resumeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildFormDemo(context);
  }

  Widget _buildFormDemo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          decoration: BoxDecoration(
            color: context.tTheme.bgColorContainer,
            border: Border(
              bottom: BorderSide(color: context.tTheme.componentStroke),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TButton(
                  shape: TButtonShape.round,
                  key: const ValueKey('form-layout-horizontal'),
                  size: TButtonSize.small,
                  variant: TButtonVariant.fill,
                  colorPreset: _layout == TFormLayout.horizontal
                      ? TButtonColorPreset.light
                      : TButtonColorPreset.defaultTheme,
                  style: _layout == TFormLayout.horizontal
                      ? null
                      : ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            context.tTheme.bgColorSecondaryContainer,
                          ),
                        ),
                  onPressed: () =>
                      setState(() => _layout = TFormLayout.horizontal),
                  child: const TText('水平排布'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TButton(
                  shape: TButtonShape.round,
                  key: const ValueKey('form-layout-vertical'),
                  size: TButtonSize.small,
                  variant: TButtonVariant.fill,
                  colorPreset: _layout == TFormLayout.vertical
                      ? TButtonColorPreset.light
                      : TButtonColorPreset.defaultTheme,
                  style: _layout == TFormLayout.vertical
                      ? null
                      : ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            context.tTheme.bgColorSecondaryContainer,
                          ),
                        ),
                  onPressed: () =>
                      setState(() => _layout = TFormLayout.vertical),
                  child: const TText('竖向排布'),
                ),
              ),
            ],
          ),
        ),
        TCell(
          title: const TText('禁用态'),
          note: Theme(
            data: Theme.of(context).mergeExtension(
              TSwitchThemeData(trackOffColor: context.tTheme.componentBorder),
            ),
            child: TSwitch(
              key: const ValueKey('form-disabled-switch'),
              value: _disabled,
              onChanged: (value) => setState(() => _disabled = value),
            ),
          ),
        ),
        const SizedBox(height: 12),
        _buildForm(context),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    final horizontal = _layout == TFormLayout.horizontal;
    return Theme(
      data: Theme.of(context).mergeExtension(
        TFormThemeData(
          layout: _layout,
          labelAlign: TextAlign.left,
          requiredMarkPosition: TFormRequiredMarkPosition.left,
          itemSpacing: 0,
        ),
      ),
      child: TForm(
        controller: _formController,
        showErrorMessage: true,
        onSubmit: (_) => TToast.showSuccess('提交成功', context: context),
        child: Column(
          children: [
            TFormField<String>(
              name: 'name',
              value: _nameController.text,
              onChanged: _disabled ? null : (_) => setState(() {}),
              validator: (value) =>
                  RegExp(r'^[a-zA-Z]{8}$').hasMatch(value ?? '')
                  ? null
                  : '只能输入8个字符英文',
              builder: (context, value, onChanged, errorText) => TFormItem(
                label: '用户名',
                child: TInput(
                  controller: _nameController,
                  enabled: !_disabled,
                  borderless: true,
                  hintText: '请输入用户名',
                  onChanged: onChanged,
                ),
              ),
            ),
            TFormField<String>(
              name: 'password',
              value: _passwordController.text,
              onChanged: _disabled ? null : (_) => setState(() {}),
              validator: (value) =>
                  (value?.length ?? 0) > 6 ? null : '长度大于6个字符',
              builder: (context, value, onChanged, errorText) => TFormItem(
                label: '密码',
                child: TInput(
                  controller: _passwordController,
                  enabled: !_disabled,
                  borderless: true,
                  obscureText: true,
                  hintText: '请输入密码',
                  onChanged: onChanged,
                ),
              ),
            ),
            TFormField<String>(
              name: 'gender',
              value: _gender,
              onChanged: _disabled
                  ? null
                  : (value) => setState(() => _gender = value),
              validator: (value) => value?.isNotEmpty == true ? null : '不能为空',
              builder: (context, value, onChanged, errorText) => TFormItem(
                key: const ValueKey('form-gender-item'),
                label: '性别',
                verticalAlignment: horizontal
                    ? TFormItemVerticalAlignment.center
                    : null,
                child: TRadioGroup<String>.options(
                  key: const ValueKey('form-gender-options'),
                  value: value,
                  options: const [
                    TRadioOption(value: 'man', label: '男'),
                    TRadioOption(value: 'women', label: '女'),
                    TRadioOption(value: 'secret', label: '保密'),
                  ],
                  direction: Axis.horizontal,
                  variant: TRadioVariant.inline,
                  onChanged: onChanged,
                ),
              ),
            ),
            TFormField<String>(
              name: 'birth',
              value: _birth,
              onChanged: _disabled
                  ? null
                  : (value) => setState(() => _birth = value),
              validator: (value) => value?.isNotEmpty == true ? null : '不能为空',
              builder: (context, value, onChanged, errorText) => Semantics(
                button: true,
                enabled: onChanged != null,
                label: '生日',
                value: value.isNotEmpty ? value : '未选择',
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onChanged == null
                      ? null
                      : () => _showDatePicker(context, value, onChanged),
                  child: TFormItem(
                    key: const ValueKey('form-birth-item'),
                    label: '生日',
                    extra: _buildArrow(context),
                    child: _buildSelectionValue(context, value, '请输入生日'),
                  ),
                ),
              ),
            ),
            TFormField<String>(
              name: 'place',
              value: _place,
              onChanged: _disabled
                  ? null
                  : (value) => setState(() => _place = value),
              validator: (value) => value?.isNotEmpty == true ? null : '不能为空',
              builder: (context, value, onChanged, errorText) => Semantics(
                button: true,
                enabled: onChanged != null,
                label: '籍贯',
                value: value.isNotEmpty ? value : '未选择',
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onChanged == null
                      ? null
                      : () => _showRegionPicker(context, onChanged),
                  child: TFormItem(
                    key: const ValueKey('form-place-item'),
                    label: '籍贯',
                    extra: _buildArrow(context),
                    child: _buildSelectionValue(context, value, '请选择籍贯'),
                  ),
                ),
              ),
            ),
            TFormField<num>(
              name: 'age',
              value: _age,
              onChanged: _disabled
                  ? null
                  : (value) => setState(() => _age = value),
              builder: (context, value, onChanged, errorText) => TFormItem(
                key: const ValueKey('form-age-item'),
                label: '年限',
                child: TStepper(
                  value: value,
                  variant: TStepperVariant.filled,
                  onChanged: onChanged,
                ),
              ),
            ),
            TFormField<double>(
              name: 'description',
              value: _description,
              onChanged: _disabled
                  ? null
                  : (value) => setState(() => _description = value),
              validator: (value) => (value ?? 0) > 3 ? null : '分数过低会影响整体评价',
              builder: (context, value, onChanged, errorText) => TFormItem(
                key: const ValueKey('form-description-item'),
                label: '自我评价',
                child: TRate(
                  value: value,
                  allowHalf: true,
                  onChanged: onChanged,
                ),
              ),
            ),
            TFormField<String>(
              name: 'resume',
              value: _resumeController.text,
              onChanged: _disabled ? null : (_) => setState(() {}),
              validator: (value) => value?.isNotEmpty == true ? null : '不能为空',
              builder: (context, value, onChanged, errorText) => TFormItem(
                label: '个人简介',
                child: SizedBox(
                  key: const ValueKey('form-resume-content'),
                  height: 124,
                  child: TTextarea(
                    controller: _resumeController,
                    enabled: !_disabled,
                    hintText: '请输入个人简介',
                    minLines: 2,
                    maxLength: 50,
                    indicator: true,
                    onChanged: onChanged,
                  ),
                ),
              ),
            ),
            TFormField<List<TUploadFile>>(
              name: 'photo',
              value: _photos,
              onChanged: _disabled
                  ? null
                  : (value) => setState(() => _photos = value),
              validator: (value) => value?.isNotEmpty == true ? null : '请上传照片',
              builder: (context, value, onChanged, errorText) => TFormItem(
                label: '上传照片',
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final columns = horizontal ? 3 : 4;
                    final size =
                        (constraints.maxWidth - (columns - 1) * 8) / columns;
                    return Theme(
                      data: Theme.of(context).mergeExtension(
                        TUploadThemeData(itemSize: size.clamp(64, 96)),
                      ),
                      child: TUpload(
                        files: value,
                        maxFiles: horizontal ? 6 : 8,
                        onChanged: onChanged,
                      ),
                    );
                  },
                ),
              ),
            ),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildArrow(BuildContext context) => TIcon(
    TIcons.chevron_right,
    size: 24,
    color: _disabled
        ? context.tTheme.textColorDisabled
        : context.tTheme.textColorPlaceholder,
    semanticLabel: '选择',
  );

  Widget _buildSelectionValue(
    BuildContext context,
    String? value,
    String placeholder,
  ) {
    final hasValue = value?.isNotEmpty == true;
    return TText(
      hasValue ? value! : placeholder,
      font: context.tTheme.fontBodyLarge,
      style: TextStyle(
        color: _disabled
            ? context.tTheme.textColorDisabled
            : hasValue
            ? context.tTheme.textColorPrimary
            : context.tTheme.textColorPlaceholder,
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.tTheme.bgColorContainer,
        border: Border(
          bottom: BorderSide(color: context.tTheme.componentStroke),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TButton(
              key: const ValueKey('form-reset-button'),
              size: TButtonSize.large,
              variant: TButtonVariant.fill,
              colorPreset: TButtonColorPreset.light,
              onPressed: _disabled ? null : _reset,
              child: const TText('重置'),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TButton(
              key: const ValueKey('form-submit-button'),
              size: TButtonSize.large,
              variant: TButtonVariant.fill,
              colorPreset: TButtonColorPreset.primary,
              onPressed: _disabled ? null : _formController.submit,
              child: const TText('提交'),
            ),
          ),
        ],
      ),
    );
  }

  void _showDatePicker(
    BuildContext context,
    String value,
    ValueChanged<String>? onChanged,
  ) {
    var draft = _parseDate(value) ?? _initialDate;
    TPickerPopup.show(
      context,
      headerBuilder: (_, close) => TPopupHeader(
        cancelButton: TextButton(onPressed: close, child: const TText('取消')),
        title: const TText('选择日期'),
        confirmButton: TextButton(
          onPressed: () {
            if (mounted) {
              onChanged?.call(
                '${draft.year}-${draft.month.toString().padLeft(2, '0')}-${draft.day.toString().padLeft(2, '0')}',
              );
            }
            close();
          },
          child: const TText('确定'),
        ),
      ),
      child: StatefulBuilder(
        builder: (context, setPopupState) => TDateTimePicker(
          mode: DateTimePickerMode(dateMode: DateMode.date),
          value: draft,
          onChanged: (value) => setPopupState(() => draft = value),
        ),
      ),
    );
  }

  void _showRegionPicker(
    BuildContext context,
    ValueChanged<String>? onChanged,
  ) {
    var draft = List<Object?>.of(_placeValues);
    TPickerPopup.show(
      context,
      headerBuilder: (_, close) => TPopupHeader(
        cancelButton: TextButton(onPressed: close, child: const TText('取消')),
        title: const TText('选择地址'),
        confirmButton: TextButton(
          onPressed: () {
            if (mounted) {
              const labels = {
                'guangdong': '广东省',
                'beijing': '北京市',
                'shenzhen': '深圳市',
                'guangzhou': '广州市',
                'haidian': '海淀区',
                'chaoyang': '朝阳区',
              };
              _placeValues = List<Object?>.of(draft);
              onChanged?.call(
                draft.map((value) => labels[value] ?? '$value').join(' '),
              );
            }
            close();
          },
          child: const TText('确定'),
        ),
      ),
      child: StatefulBuilder(
        builder: (context, setPopupState) => TPicker(
          items: _regionItems,
          value: draft,
          onChanged: (value) => setPopupState(() => draft = value.values),
        ),
      ),
    );
  }

  void _reset() {
    _formController.reset();
    setState(() {
      _nameController.text = _initialName;
      _passwordController.text = _initialPassword;
      _resumeController.text = _initialResume;
      _gender = _initialGender;
      _birth = _initialBirth;
      _place = _initialPlace;
      _placeValues = List.of(_initialPlaceValues);
      _age = _initialAge;
      _description = _initialDescription;
      _photos = List.of(_initialPhotos);
    });
  }

  TDateTimePickerValue? _parseDate(String value) {
    final parts = value.split('-').map(int.tryParse).toList();
    if (parts.length != 3 || parts.any((part) => part == null)) {
      return null;
    }
    return TDateTimePickerValue(year: parts[0], month: parts[1], day: parts[2]);
  }
}
```

## API

1. [TForm](#tform)
2. [TFormState](#tformstate)
3. [TFormController](#tformcontroller)
4. [TFormField](#tformfield)
5. [TFormItem](#tformitem)
6. [TFormLayout](#tformlayout)
7. [TFormRequiredMarkPosition](#tformrequiredmarkposition)
8. [TFormItemVerticalAlignment](#tformitemverticalalignment)
9. [TFormItemContentAlignment](#tformitemcontentalignment)
10. [TFormFieldBuilder](#tformfieldbuilder)
11. [TFormThemeData](#tformthemedata)

### TForm

#### 构造方法

##### TForm

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| autovalidateMode | AutovalidateMode? | - | 自动校验时机。 未传时，首次 `TFormController.submit` 校验失败后会切换为 `AutovalidateMode.onUserInteraction`；显式传入时完全遵循 Flutter `Form` 的校验语义。 | 否 |
| child | Widget | - | 表单内容。 | 是 |
| controller | TFormController? | - | 表单控制器。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| onChanged | VoidCallback? | - | 用户通过 `TFormField` 提交字段值变化时触发。 回调执行时 `TFormController.values` 已包含本次变化。仅同步外部受控值、 清除校验状态或外部错误时不会触发。 | 否 |
| onSubmit | ValueChanged<Map<String, Object?>>? | - | 校验通过后触发，参数为各 `TFormField` 注册的字段值。 | 否 |
| showErrorMessage | bool | true | 是否向字段 builder 暴露错误文案。 | 否 |

### TFormState

`TForm` 的公开状态。

#### 构造方法

##### TFormState

无参数。

#### 属性

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| values | Map<String, Object?> | - | 当前字段值的只读快照。 | - |

#### 实例方法

##### TFormState.clearValidate

清除全部或指定字段的校验状态。

同时清除通过 `setValidateMessage` 注入的外部错误。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| fields | Iterable<String>? | - | 本次操作的字段名；为空时操作全部已注册字段。 | 否 |

##### TFormState.reset

无参数。

重置 Flutter 字段的交互和校验状态，并清除外部错误。

字段值由业务受控状态所有；调用方应自行恢复 `TFormField.value`。

##### TFormState.setValidateMessage

位置参数：`messages`

设置字段的外部校验错误。

常用于服务端校验。传入 `null` 的字段会清除对应外部错误；外部错误
会覆盖字段本地校验错误，直到调用 `clearValidate` 或再次设置。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| messages | Map<String, String?> | - | 字段名与外部校验消息的映射；消息为 null 或空字符串时清除对应错误。 | 是 |

##### TFormState.submit

无参数。

校验表单；校验成功后保存字段，并在配置 `TForm.onSubmit` 时触发提交回调。

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | bool | - | 表单校验结果；true 仅表示校验通过并已保存字段，不表示业务请求成功。 若未配置 `TForm.onSubmit`，不会触发业务提交回调。 | - |

##### TFormState.validate

运行表单字段校验。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| fields | Iterable<String>? | - | 为空时校验所有已注册字段；传入字段名后只校验指定字段。 未注册或尚未构建完成的字段视为校验失败。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | bool | - | 所有参与校验的字段均通过时为 true；未注册或尚未构建完成的指定字段视为失败。 | - |

### TFormController

命令式触发表单提交、校验和重置。

#### 构造方法

##### TFormController

无参数。

#### 属性

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| values | Map<String, Object?> | - | 当前字段值的只读快照。 | - |

#### 实例方法

##### TFormController.clearValidate

清除全部或指定字段的校验状态。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| fields | Iterable<String>? | - | 本次操作的字段名；为空时操作全部已注册字段。 | 否 |

##### TFormController.reset

无参数。

重置表单。

##### TFormController.setValidateMessage

位置参数：`messages`

设置字段的外部校验错误。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| messages | Map<String, String?> | - | 字段名与外部校验消息的映射；消息为 null 或空字符串时清除对应错误。 | 是 |

##### TFormController.submit

无参数。

校验并提交表单。

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | bool | - | 绑定表单的校验与提交结果；未绑定表单或校验失败时为 false。 | - |

##### TFormController.validate

运行表单字段校验。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| fields | Iterable<String>? | - | 本次操作的字段名；为空时操作全部已注册字段。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | bool | - | 绑定表单的校验结果；未绑定表单时为 false。 | - |

### TFormField

类型参数：`T`

将严格受控组件接入 Flutter `FormField` 的字段桥接组件。

#### 构造方法

##### TFormField

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| autovalidateMode | AutovalidateMode? | - | 自动校验时机；为空时继承 `TForm`。 | 否 |
| builder | TFormFieldBuilder<T> | - | 字段内容 builder。 | 是 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| name | String | - | 字段名，在表单提交数据中作为 key。 | 是 |
| onChanged | ValueChanged<T>? | - | 字段值变化回调；为 null 时禁用字段。 | 否 |
| onSaved | FormFieldSetter<T>? | - | 保存字段时触发。 | 否 |
| required | bool | false | 是否执行内置必填校验，并让表单项默认显示必填标记。 内置规则仅将 null、空白字符串、空 `Iterable` 和空 `Map` 视为未填写； false 与 0 均是有效值。对象内部的未选择状态应通过 `validator` 描述。 | 否 |
| requiredMessage | String | '此项不能为空' | 内置必填校验失败时的错误文案。 | 否 |
| validator | FormFieldValidator<T>? | - | 字段校验器。 | 否 |
| value | T | - | 受控字段值。 | 是 |

### TFormItem

表单项的标签和字段布局容器。

#### 构造方法

##### TFormItem

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| child | Widget | - | 字段内容。 | 是 |
| contentAlignment | TFormItemContentAlignment? | - | 内容区域的水平方向对齐方式。 未传时默认起始侧对齐；影响 字段控件、help 和 error 的外部位置，不影响输入文本自身的对齐方式。 | 否 |
| errorText | String? | - | 错误文案。 未传时自动使用最近 `TFormField` 的校验错误。 | 否 |
| extra | Widget? | - | 表单项尾部的额外内容。 该插槽不会被附加内边距、位移或固定尺寸。 | 否 |
| help | String? | - | 辅助说明文案。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| label | String? | - | 标签文案。 | 否 |
| leading | Widget? | - | 标签区域前的内容，通常用于字段行图标。 该插槽属于表单项结构，不会传入输入组件的编辑内容区域。 | 否 |
| required | bool? | - | 是否显示必填标记；仅覆盖展示效果，不会启用或关闭 `TFormField.required` 的校验行为。 未传时继承最近 `TFormField` 的 required 状态。 | 否 |
| showErrorMessage | bool | true | 是否展示继承的校验错误。 | 否 |
| verticalAlignment | TFormItemVerticalAlignment? | - | 水平布局下标签、字段内容和额外内容的纵向对齐方式。 未传时默认顶部对齐；这是单个表单项的结构布局选择。 | 否 |

### TFormLayout

表单项布局方向。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| horizontal | TFormLayout | - | 标签与字段水平排列。 | - |
| vertical | TFormLayout | - | 标签与字段垂直排列。 | - |

### TFormRequiredMarkPosition

表单必填标记的位置。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| left | TFormRequiredMarkPosition | - | 显示在标签左侧。 | - |
| right | TFormRequiredMarkPosition | - | 显示在标签右侧。 | - |

### TFormItemVerticalAlignment

水平表单项各区域的纵向对齐方式。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| start | TFormItemVerticalAlignment | - | 标签、字段内容和额外内容从顶部对齐。 | - |
| center | TFormItemVerticalAlignment | - | 标签、字段内容和额外内容垂直居中。 | - |

### TFormItemContentAlignment

表单项内容区域的水平方向对齐方式。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| start | TFormItemContentAlignment | - | 内容靠起始侧对齐。 | - |
| end | TFormItemContentAlignment | - | 内容靠结束侧对齐。 | - |

### TFormFieldBuilder

类型参数：`T`

TDesign 字段 builder。

位置参数：`context, value, onChanged, errorText`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 表单字段的构建上下文。 | 是 |
| value | T | - | 当前字段值。 | 是 |
| onChanged | ValueChanged<T>? | - | 更新字段值的回调；为 null 时字段不可编辑。 | 是 |
| errorText | String? | - | 当前字段校验错误；为 null 时无错误文案。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Widget | - | 表单字段的输入与展示内容。 | - |

### TFormThemeData

TForm 组件级 ThemeExtension。

主题过渡中，布局、对齐和必填标记位置在进度 0.5 处切换；
标签宽度、表单项内边距、项间距和标签间距分别按 80、四周 16、0、8
逻辑像素补空值后插值。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 表单及表单项背景色。 null 时使用 bgColorContainer Token。 | 否 |
| borderColor | Color? | - | 表单项底部分隔线颜色。 null 时使用 componentStroke Token。 | 否 |
| errorStyle | TextStyle? | - | 错误文案样式。 | 否 |
| helpStyle | TextStyle? | - | 辅助说明样式。 | 否 |
| itemPadding | EdgeInsetsGeometry? | - | 表单项内边距。 未配置时左右为 16 逻辑像素；水平布局上下为 14，垂直布局上下为 16。 | 否 |
| itemSpacing | double? | - | 表单项间距。 未配置时为 0。 | 否 |
| labelAlign | TextAlign? | - | 标签对齐方式；默认 TextAlign.start，随文字方向对齐起始侧。 | 否 |
| labelGap | double? | - | 标签与字段的垂直间距。 未配置时为 8 逻辑像素。 | 否 |
| labelStyle | TextStyle? | - | 标签样式。 | 否 |
| labelWidth | double? | - | 默认标签宽度；为空时表单项使用 80dp。 | 否 |
| layout | TFormLayout? | - | 表单项布局方向。 未配置时为 TFormLayout.horizontal。 | 否 |
| leadingGap | double? | - | 前置内容与标签区域的间距。 未配置时使用 spacer Token。 | 否 |
| messageGap | double? | - | 字段与辅助或错误文案的间距。 未配置时为 4 逻辑像素。 | 否 |
| requiredMarkPosition | TFormRequiredMarkPosition? | - | 必填标记位置。 null 时使用 TFormRequiredMarkPosition.left。 | 否 |
| requiredMarkStyle | TextStyle? | - | 必填标记样式。 | 否 |
| showColon | bool? | - | 是否在标签末尾显示冒号。 | 否 |
