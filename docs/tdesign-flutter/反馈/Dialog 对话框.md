# Dialog 对话框

> 用于显示重要提示或请求用户完成关键操作的居中模态视图。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/dialog)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 反馈类对话框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class FeedbackDialogsExample extends StatelessWidget {
  const FeedbackDialogsExample({super.key});

  Widget _feedbackDialogs(BuildContext context) {
    return _scenarios(context, [
      _trigger('反馈类-带标题', () {
        TDialog.show<bool>(
          context,
          barrierDismissible: true,
          dialog: const TConfirmDialog(title: '对话框标题', content: _description),
        );
      }),
      _trigger('反馈类-无标题', () {
        TDialog.show<bool>(
          context,
          barrierDismissible: true,
          dialog: const TConfirmDialog(content: _description),
        );
      }),
      _trigger('反馈类-纯标题', () {
        TDialog.show<bool>(
          context,
          barrierDismissible: true,
          dialog: const TConfirmDialog(title: '对话框标题'),
        );
      }),
      _trigger('反馈类-内容超长', () {
        TDialog.show<void>(
          context,
          barrierDismissible: true,
          dialog: Theme(
            data: Theme.of(
              context,
            ).mergeExtension(const TDialogThemeData(maxHeight: 400)),
            child: TDialog(
              title: const Text('对话框标题'),
              content: Text(List.filled(48, '这里是辅助内容文案。').join()),
              actions: const [
                TDialogAction(
                  child: Text('知道了'),
                  role: TDialogActionRole.primary,
                ),
              ],
            ),
          ),
        );
      }),
    ]);
  }

  Widget _scenarios(BuildContext context, List<Widget> children) {
    return Column(
      children: [
        for (var index = 0; index < children.length; index++) ...[
          if (index > 0) SizedBox(height: context.tTheme.spacer2),
          children[index],
        ],
      ],
    );
  }

  Widget _trigger(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }

  static const _description = '告知当前状态、信息和解决方法，等内容。描述尽可能控制在三行内。';

  @override
  Widget build(BuildContext context) {
    return _feedbackDialogs(context);
  }
}
```

##### 确认类对话框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ConfirmDialogsExample extends StatelessWidget {
  const ConfirmDialogsExample({super.key});

  Widget _confirmDialogs(BuildContext context) {
    return _scenarios(context, [
      _trigger('确认类-带标题', () {
        TDialog.show<bool>(
          context,
          barrierDismissible: true,
          dialog: TDialog(
            title: const Text('对话框标题'),
            content: const Text(_description),
            actions: _actions(),
          ),
        );
      }),
      _trigger('确认类-无标题', () {
        TDialog.show<bool>(
          context,
          barrierDismissible: true,
          dialog: TDialog(
            content: const Text(_description),
            actions: _actions(),
          ),
        );
      }),
      _trigger('确认类-纯标题', () {
        TDialog.show<bool>(
          context,
          barrierDismissible: true,
          dialog: TDialog(title: const Text('对话框标题'), actions: _actions()),
        );
      }),
    ]);
  }

  Widget _scenarios(BuildContext context, List<Widget> children) {
    return Column(
      children: [
        for (var index = 0; index < children.length; index++) ...[
          if (index > 0) SizedBox(height: context.tTheme.spacer2),
          children[index],
        ],
      ],
    );
  }

  Widget _trigger(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }

  static const _description = '告知当前状态、信息和解决方法，等内容。描述尽可能控制在三行内。';

  List<TDialogAction> _actions({
    bool destructive = false,
    TButtonVariant? variant,
    TButtonColorPreset? primaryColorScheme,
  }) => [
    TDialogAction(variant: variant, child: const Text('取消'), result: false),
    TDialogAction(
      child: Text(destructive ? '警示操作' : '确定'),
      result: true,
      variant: variant,
      colorPreset: primaryColorScheme,
      role: destructive
          ? TDialogActionRole.destructive
          : TDialogActionRole.primary,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _confirmDialogs(context);
  }
}
```

##### 输入类对话框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class InputDialogsExample extends StatelessWidget {
  const InputDialogsExample({super.key});

  Widget _inputDialogs(BuildContext context) {
    return _scenarios(context, [
      _trigger('输入类-无描述', () {
        TDialog.show<bool>(
          context,
          barrierDismissible: true,
          dialog: TDialog(
            title: const Text('带输入框对话框'),
            content: _dialogInput(context, topPadding: context.tTheme.spacer),
            actions: _actions(variant: TButtonVariant.text),
          ),
        );
      }),
      _trigger('输入类-带描述', () {
        TDialog.show<bool>(
          context,
          barrierDismissible: true,
          dialog: TDialog(
            title: const Text('带输入框对话框'),
            content: Column(
              children: [
                const Text(_description),
                SizedBox(height: context.tTheme.spacer2),
                _dialogInput(context),
              ],
            ),
            actions: _actions(variant: TButtonVariant.text),
          ),
        );
      }),
    ]);
  }

  Widget _scenarios(BuildContext context, List<Widget> children) {
    return Column(
      children: [
        for (var index = 0; index < children.length; index++) ...[
          if (index > 0) SizedBox(height: context.tTheme.spacer2),
          children[index],
        ],
      ],
    );
  }

  Widget _trigger(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }

  Widget _dialogInput(BuildContext context, {double topPadding = 0}) {
    final token = context.tTheme;
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Theme(
        data: Theme.of(context).mergeExtension(
          TInputThemeData(
            contentPadding: EdgeInsets.symmetric(
              horizontal: token.spacer2,
              vertical: token.spacer1,
            ),
            borderRadius: 4,
            backgroundColor: token.bgColorPage,
          ),
        ),
        child: const TInput(
          borderless: true,
          hintText: '输入12文案',
          clearButtonMode: TInputClearButtonMode.focused,
        ),
      ),
    );
  }

  List<TDialogAction> _actions({
    bool destructive = false,
    TButtonVariant? variant,
    TButtonColorPreset? primaryColorScheme,
  }) => [
    TDialogAction(variant: variant, child: const Text('取消'), result: false),
    TDialogAction(
      child: Text(destructive ? '警示操作' : '确定'),
      result: true,
      variant: variant,
      colorPreset: primaryColorScheme,
      role: destructive
          ? TDialogActionRole.destructive
          : TDialogActionRole.primary,
    ),
  ];

  static const _description = '告知当前状态、信息和解决方法，等内容。描述尽可能控制在三行内。';

  @override
  Widget build(BuildContext context) {
    return _inputDialogs(context);
  }
}
```

##### 带图片的对话框

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ImageDialogsExample extends StatelessWidget {
  const ImageDialogsExample({super.key});

  Widget _imageDialogs(BuildContext context) {
    return _scenarios(context, [
      _trigger('图片置顶-带标题描述', () {
        _showImageDialog(
          context,
          imageOnTop: true,
          showTitle: true,
          showContent: true,
        );
      }),
      _trigger('图片置顶-无标题', () {
        _showImageDialog(
          context,
          imageOnTop: true,
          showTitle: false,
          showContent: true,
        );
      }),
      _trigger('图片置顶-纯标题', () {
        _showImageDialog(
          context,
          imageOnTop: true,
          showTitle: true,
          showContent: false,
        );
      }),
      _trigger('图片置顶-纯图片', () {
        _showImageDialog(
          context,
          imageOnTop: true,
          showTitle: false,
          showContent: false,
        );
      }),
      _trigger('图片居中-带标题描述', () {
        _showImageDialog(
          context,
          imageOnTop: false,
          showTitle: true,
          showContent: true,
        );
      }),
      _trigger('图片居中-纯标题', () {
        _showImageDialog(
          context,
          imageOnTop: false,
          showTitle: true,
          showContent: false,
        );
      }),
    ]);
  }

  Widget _scenarios(BuildContext context, List<Widget> children) {
    return Column(
      children: [
        for (var index = 0; index < children.length; index++) ...[
          if (index > 0) SizedBox(height: context.tTheme.spacer2),
          children[index],
        ],
      ],
    );
  }

  Widget _trigger(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }

  void _showImageDialog(
    BuildContext context, {
    required bool imageOnTop,
    required bool showTitle,
    required bool showContent,
  }) {
    const image = AspectRatio(
      key: ValueKey('dialog-image'),
      aspectRatio: 16 / 9,
      child: Image(
        image: AssetImage('assets/img/image.png'),
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
    final token = context.tTheme;
    final title = showTitle
        ? TText(
            '对话框标题',
            textAlign: TextAlign.center,
            font: token.fontTitleLarge,
            style: TextStyle(color: token.textColorPrimary),
          )
        : null;
    final description = showContent
        ? const Text(_description, textAlign: TextAlign.center)
        : null;
    final textContent = Padding(
      padding: EdgeInsets.fromLTRB(
        token.spacer3,
        token.spacer3,
        token.spacer3,
        imageOnTop ? 0 : token.spacer3,
      ),
      child: Column(
        children: [
          if (title != null) title,
          if (title != null && description != null)
            SizedBox(height: token.spacer),
          if (description != null) description,
        ],
      ),
    );
    TDialog.show<bool>(
      context,
      barrierDismissible: true,
      dialog: Theme(
        data: Theme.of(context).mergeExtension(
          const TDialogThemeData(contentPadding: EdgeInsets.zero),
        ),
        child: TDialog(
          content: Column(
            children: [
              if (imageOnTop) image,
              if (showTitle || showContent) textContent,
              if (!imageOnTop) image,
            ],
          ),
          actions: _actions(),
        ),
      ),
    );
  }

  static const _description = '告知当前状态、信息和解决方法，等内容。描述尽可能控制在三行内。';

  List<TDialogAction> _actions({
    bool destructive = false,
    TButtonVariant? variant,
    TButtonColorPreset? primaryColorScheme,
  }) => [
    TDialogAction(variant: variant, child: const Text('取消'), result: false),
    TDialogAction(
      child: Text(destructive ? '警示操作' : '确定'),
      result: true,
      variant: variant,
      colorPreset: primaryColorScheme,
      role: destructive
          ? TDialogActionRole.destructive
          : TDialogActionRole.primary,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _imageDialogs(context);
  }
}
```

#### 组件状态

##### `ButtonDialogsExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ButtonDialogsExample extends StatelessWidget {
  const ButtonDialogsExample({super.key});

  Widget _buttonDialogs(BuildContext context) {
    return _scenarios(context, [
      _statusScenario(
        context,
        '文字按钮',
        _trigger('文字按钮', () {
          TDialog.show<bool>(
            context,
            barrierDismissible: true,
            dialog: TDialog(
              title: const Text('对话框标题'),
              content: const Text(_description),
              actions: _actions(variant: TButtonVariant.text),
            ),
          );
        }),
      ),
      _statusScenario(
        context,
        '水平基础按钮',
        _trigger('水平基础按钮', () {
          TDialog.show<bool>(
            context,
            barrierDismissible: true,
            dialog: TDialog(
              content: const Text(_description),
              actions: _actions(),
            ),
          );
        }),
      ),
      _statusScenario(
        context,
        '垂直基础按钮',
        _trigger('垂直基础按钮', () {
          TDialog.show<bool>(
            context,
            barrierDismissible: true,
            dialog: TDialog(
              title: const Text('对话框标题'),
              content: const Text(_description),
              actionsWidget: _verticalButtons(context),
            ),
          );
        }),
      ),
      _statusScenario(
        context,
        '多按钮',
        _trigger('多按钮', () {
          TDialog.show<String>(
            context,
            barrierDismissible: true,
            dialog: const TDialog(
              title: Text('对话框标题'),
              content: Text(_description),
              actions: [
                TDialogAction(child: Text('次要按钮'), result: 'secondary-1'),
                TDialogAction(child: Text('次要按钮'), result: 'secondary-2'),
                TDialogAction(
                  child: Text('主要按钮'),
                  result: 'primary',
                  role: TDialogActionRole.primary,
                ),
              ],
            ),
          );
        }),
      ),
      _statusScenario(
        context,
        '带关闭按钮的对话框',
        _trigger('带关闭按钮的对话框', () {
          TDialog.show<bool>(
            context,
            barrierDismissible: true,
            dialog: TDialog(
              title: const Text('对话框标题'),
              content: const Text(_description),
              showCloseButton: true,
              actions: _actions(destructive: true),
            ),
          );
        }),
      ),
    ]);
  }

  Widget _scenarios(BuildContext context, List<Widget> children) {
    return Column(
      children: [
        for (var index = 0; index < children.length; index++) ...[
          if (index > 0) SizedBox(height: context.tTheme.spacer2),
          children[index],
        ],
      ],
    );
  }

  Widget _statusScenario(BuildContext context, String label, Widget trigger) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TText(
          label,
          font: context.tTheme.fontBodyMedium,
          style: TextStyle(color: context.tTheme.textColorSecondary),
        ),
        SizedBox(height: context.tTheme.spacer2),
        trigger,
      ],
    );
  }

  Widget _trigger(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }

  static const _description = '告知当前状态、信息和解决方法，等内容。描述尽可能控制在三行内。';

  List<TDialogAction> _actions({
    bool destructive = false,
    TButtonVariant? variant,
    TButtonColorPreset? primaryColorScheme,
  }) => [
    TDialogAction(variant: variant, child: const Text('取消'), result: false),
    TDialogAction(
      child: Text(destructive ? '警示操作' : '确定'),
      result: true,
      variant: variant,
      colorPreset: primaryColorScheme,
      role: destructive
          ? TDialogActionRole.destructive
          : TDialogActionRole.primary,
    ),
  ];

  Widget _verticalButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.tTheme.spacer3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TButton(
            variant: TButtonVariant.fill,
            colorPreset: TButtonColorPreset.primary,
            onPressed: () => Navigator.pop(context, true),
            child: const Text('确定'),
          ),
          SizedBox(height: context.tTheme.spacer1),
          TButton(
            variant: TButtonVariant.fill,
            colorPreset: TButtonColorPreset.light,
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buttonDialogs(context);
  }
}
```

#### 组件用法

##### 命令调用

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CommandDialogExample extends StatelessWidget {
  const CommandDialogExample({super.key});

  Widget _commandDialog(BuildContext context) {
    return _trigger('命令行操作', () async {
      final result = await TDialog.show<_DialogCommandResult>(
        context,
        barrierDismissible: true,
        barrierResult: _DialogCommandResult.overlay,
        dialog: const TDialog(
          title: Text('弹窗标题'),
          content: Text('告知当前状态、信息和解决方法等内容。'),
          showCloseButton: true,
          closeButtonResult: _DialogCommandResult.closeButton,
          actions: [
            TDialogAction(
              child: Text('取消'),
              result: _DialogCommandResult.cancel,
              variant: TButtonVariant.text,
            ),
            TDialogAction(
              child: Text('确定'),
              role: TDialogActionRole.primary,
              result: _DialogCommandResult.confirm,
              variant: TButtonVariant.text,
            ),
          ],
        ),
      );
      if (!context.mounted) {
        return;
      }
      final message = switch (result) {
        _DialogCommandResult.confirm => '点击了确定',
        _DialogCommandResult.cancel => '点击了取消',
        _DialogCommandResult.overlay => '点击蒙层关闭',
        _DialogCommandResult.closeButton => '点击关闭按钮',
        null => '返回或程序关闭',
      };
      TToast.showText(message, context: context);
    });
  }

  Widget _trigger(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _commandDialog(context);
  }
}

enum _DialogCommandResult { confirm, cancel, overlay, closeButton }
```

##### 自定义按钮

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CustomActionDialogExample extends StatelessWidget {
  const CustomActionDialogExample({super.key});

  Widget _customActionDialog(BuildContext context) {
    return _trigger('开放能力按钮', () async {
      final result = await TDialog.show<String>(
        context,
        barrierDismissible: true,
        dialog: const TDialog(
          title: Text('弹窗标题'),
          content: Text('通过现有操作项组合业务能力，无需增加跨端专用参数。'),
          actions: [
            TDialogAction(
              child: Text('取消'),
              result: 'cancel',
              variant: TButtonVariant.text,
            ),
            TDialogAction(
              result: 'share',
              role: TDialogActionRole.primary,
              variant: TButtonVariant.text,
              child: Text('分享给朋友'),
            ),
          ],
        ),
      );
      debugPrint(result == 'share' ? '执行分享能力' : '取消操作');
    });
  }

  Widget _trigger(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _customActionDialog(context);
  }
}
```

## API

1. [TDialog](#tdialog)
2. [TDialogAction](#tdialogaction)
3. [TConfirmDialog](#tconfirmdialog)
4. [TDialogActionRole](#tdialogactionrole)
5. [TDialogThemeData](#tdialogthemedata)

### TDialog

#### 构造方法

##### TDialog

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| actions | List<TDialogAction> | const <TDialogAction>[] | 操作列表；一到两个操作横向排列，更多操作纵向排列。 一到两个操作全部显式使用 `TButtonVariant.text` 时，操作区使用带分隔线的 贴边文字按钮 Footer；其他情况使用带内边距的普通操作区。 纵向排列时，`TDialogAction.role` 为 `TDialogActionRole.primary` 或 `TDialogActionRole.destructive` 的强调操作优先展示，同类操作保持声明顺序。 | 否 |
| actionSpacing | double? | - | 操作之间的间距。未设置时使用主题 token 默认值。 | 否 |
| actionsPadding | EdgeInsetsGeometry? | - | 操作区内边距。未设置时使用主题 token 默认值。 一到两个操作全部显式使用 `TButtonVariant.text` 时，默认仅保留 32dp 顶部间距，使文字按钮 Footer 横向贴边；显式设置后使用传入的内边距。 | 否 |
| actionsWidget | Widget? | - | 完全自定义操作区。 使用后 `actions` 必须为空；仅在标准操作列表无法表达布局时使用。 | 否 |
| closeButtonResult | Object? | - | 点击内置关闭按钮并成功关闭时的返回值，默认为 null。 类型应与 `show` 的泛型一致。可与 `TDialogAction.result` 和 `show` 的 `barrierResult` 配合，通过同一个 Future 区分关闭来源。 不影响系统返回或业务调用 Navigator.pop 的返回值。 | 否 |
| content | Widget? | - | 内容槽位；`title` 与 `content` 至少提供一个。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| semanticLabel | String? | - | 无障碍语义标签。 | 否 |
| showCloseButton | bool | false | 是否显示右上角关闭按钮。 | 否 |
| title | Widget? | - | 标题槽位；`title` 与 `content` 至少提供一个。 | 否 |

#### 静态方法

##### TDialog.show

类型参数：`T`

位置参数：`context`

使用居中模态路由展示 Dialog。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 当前构建上下文，用于读取祖先配置。 | 是 |
| dialog | Widget | - | 要放入模态路由的弹窗内容。 | 是 |
| barrierDismissible | bool | false | 默认为 false，点击蒙层不会关闭。 显式开启后，蒙层关闭成功时返回 `barrierResult`（默认 null）； 操作按钮与内置关闭按钮分别返回各自配置的结果。 蒙层与内置关闭按钮通过 Navigator.maybePop 关闭，遵守 PopScope。 系统返回及未携带结果的 Navigator.pop 仍返回 null，不使用 `barrierResult`。 | 否 |
| barrierResult | T? | - | 开启蒙层关闭后，由蒙层成功关闭路由时返回的结果；默认 null。 | 否 |
| barrierColor | Color? | - | 蒙层颜色；为空时使用 Colors.black54。 | 否 |
| useRootNavigator | bool | true | 是否将弹窗推入根 Navigator，默认 true。 | 否 |
| useSafeArea | bool | true | 是否使用 SafeArea 避让系统区域，默认 true。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Future<T?> | - | 路由被弹出时完成并提供关闭结果；未携带结果时为 null，不等待关闭动画结束。 | - |

### TDialogAction

Dialog 操作项。

`role` 表达操作语义，并决定未显式覆盖时的默认配色；`variant` 表达按钮的
视觉形态。普通、主要和危险操作默认分别渲染为浅色、品牌色和危险色填充按钮。
`colorPreset` 和 `style` 用于确有需要时覆盖单个操作的默认样式。

一到两个操作全部显式使用 `TButtonVariant.text` 时，`TDialog` 会使用带分隔线的
贴边文字按钮 Footer；只改变某一个操作的变体不会切换整个 Footer 布局。

#### 构造方法

##### TDialogAction

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| child | Widget | - | 按钮内容。 | 是 |
| closeOnPressed | bool | true | 点击后是否自动关闭。 | 否 |
| colorPreset | TButtonColorPreset? | - | 显式按钮配色；未指定时由角色和最终变体解析。 普通操作的填充变体使用 `TButtonColorPreset.light`，其他变体使用 `TButtonColorPreset.defaultTheme`；主要和危险操作分别使用 `TButtonColorPreset.primary`、`TButtonColorPreset.danger`。 | 否 |
| disabled | bool | false | 是否禁用。 | 否 |
| onPressed | VoidCallback? | - | 点击回调，在自动关闭前执行。 | 否 |
| result | Object? | - | 关闭 Dialog 时返回的结果。 | 否 |
| role | TDialogActionRole | TDialogActionRole.normal | 操作语义角色，默认为 `TDialogActionRole.normal`。 未指定 `variant` 时使用填充按钮：普通操作采用 `TButtonColorPreset.light`， 主要操作采用 `TButtonColorPreset.primary`，危险操作采用 `TButtonColorPreset.danger`。显式设置的 `variant`、`colorPreset` 和 `style` 优先于角色提供的默认值。 | 否 |
| style | ButtonStyle? | - | 显式按钮样式；用于覆盖单个操作，未设置时使用 Dialog Theme 和角色默认样式。 | 否 |
| variant | TButtonVariant? | - | 显式按钮变体；未指定时使用 `TButtonVariant.fill`。 当 `TDialog.actions` 中有一到两个操作，且所有操作都显式使用 `TButtonVariant.text` 时，Dialog 自动切换为带分隔线的贴边文字按钮 Footer。 混合使用不同变体时仍采用普通操作区布局，每个按钮保留各自的变体。 | 否 |

### TConfirmDialog

单操作确认弹窗，是 `TDialog` 的便捷封装。

内置操作使用 `TDialogActionRole.primary`，默认渲染为品牌色填充按钮。需要多个
操作、文字按钮 Footer 或其他按钮变体时，使用 `TDialog` 和
`TDialog.actions` 组合 `TDialogAction`。

#### 构造方法

##### TConfirmDialog

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| buttonStyle | ButtonStyle? | - | 内置确认按钮的显式 Material 样式；透传至 TDialogAction.style。 | 否 |
| buttonText | String? | - | 确认按钮文案；为空时使用资源代理的 knew 文案。 | 否 |
| closeButtonResult | Object? | - | 内置关闭按钮成功关闭时返回的值，默认 null；透传至 `TDialog.closeButtonResult`。 | 否 |
| closeOnPressed | bool | true | 确认按钮点击后是否关闭弹窗，默认 true。 | 否 |
| content | String? | - | 正文文案，与 `contentWidget` 互斥；为空时不显示文字正文。 | 否 |
| contentWidget | Widget? | - | 自定义正文组件，与 `content` 互斥。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| onPressed | VoidCallback? | - | 确认按钮点击回调；关闭行为由 `closeOnPressed` 决定。 | 否 |
| result | Object? | true | 确认操作成功关闭弹窗时返回给路由的值，默认 true。 | 否 |
| semanticLabel | String? | - | 弹窗的无障碍语义标签；为空时使用 `title`。 | 否 |
| showCloseButton | bool | false | 是否显示内置关闭按钮，默认 false。 | 否 |
| title | String? | - | 标题文案；为空时不显示标题。 | 否 |

### TDialogActionRole

Dialog 操作的语义角色。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| normal | TDialogActionRole | - | 次要操作。 | - |
| primary | TDialogActionRole | - | 主要操作。 | - |
| destructive | TDialogActionRole | - | 危险操作。 | - |

### TDialogThemeData

TDialog 组件级 ThemeExtension

通过 Theme 子树注入，控制子树的默认对话框样式。
面板视觉值由本扩展统一配置；未设置时回退 TDesign Token 或组件内置值，
不从 Flutter DialogTheme 读取。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 背景色（对应 Material `DialogThemeData.backgroundColor`） 未配置时使用 bgColorContainer Token。 | 否 |
| contentPadding | EdgeInsetsGeometry? | - | 内容内边距（对应 Material `Dialog` 的 contentPadding；TDesign 扩展） 未配置时左、上、右均使用 spacer3，底部为 0。 | 否 |
| contentTextStyle | TextStyle? | - | 内容文案样式（对应 Material `DialogThemeData.contentTextStyle`） 未配置时使用 fontBodyLarge / textColorSecondary Token。 | 否 |
| elevation | double? | - | 阴影（对应 Material `DialogThemeData.elevation`） 未配置时为 0。 | 否 |
| maxHeight | double? | - | 面板最大高度。 未配置时为视口高度的 80%；同时不超过视口高度减 spacer4，最小为 0。 | 否 |
| shape | ShapeBorder? | - | 形状（圆角；对应 Material `DialogThemeData.shape`） 未配置时使用 radiusExtraLarge Token 构造圆角矩形。 | 否 |
| titleTextStyle | TextStyle? | - | 标题文案样式（对应 Material `DialogThemeData.titleTextStyle`） 未配置时使用 fontTitleLarge / textColorPrimary Token。 | 否 |
| width | double? | - | 弹窗宽度 未配置时为 311 逻辑像素，实际布局仍受可用宽度限制。 | 否 |

#### 静态方法

##### TDialogThemeData.lerpDouble

位置参数：`a, b, t`

对 `a` 和 `b` 按 `t` 线性插值；两端均为 null 时返回 null，仅一端为 null 时按 0 参与计算。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| a | double? | - | 插值起始值；单端为空时按 0 参与插值。 | 是 |
| b | double? | - | 插值目标值；单端为空时按 0 参与插值。 | 是 |
| t | double | - | 插值进度；0 表示起点，1 表示终点。 | 是 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | double? | - | 按 t 线性插值的数值；两端均为 null 时为 null，仅一端为 null 时将该端按 0 计算。 | - |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

### 何时使用

需要用户做一些决定，或提供完成某个任务需要的一些额外信息时使用。

### 组件搭配使用

##### 与输入类组合使用，用于帮助用户完成一些快捷的输入或选择；但不建议一个对话框内有多种不同的输入类组件。

![](https://tdesign.gtimg.com/site/design/mobile-guide/dialog/dialog-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/dialog/dialog-2.png)

### 常见用法

##### 用于较为重要的信息提示。

![](https://tdesign.gtimg.com/site/design/mobile-guide/dialog/dialog-3.png)

---

##### 用于较为重要的信息提示，且需要用户决定。

![](https://tdesign.gtimg.com/site/design/mobile-guide/dialog/dialog-4.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/dialog/dialog-5.png)

### 推荐/慎用示例

##### 确认类对话框通常用于较危险操作的二次确认，建议对话框按钮文本的涉及需要清楚地表明操作后果，加强感知避免误操作。

![](https://tdesign.gtimg.com/site/design/mobile-guide/dialog/dialog-6.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/dialog/dialog-7.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [轻提示](<Toast 轻提示.md>) | 当需要对用户进行轻量反馈或提示，且不需要用户进行操作时使用，轻提示会在一段时间后自动消失。 |
