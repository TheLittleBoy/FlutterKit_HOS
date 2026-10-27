# Popover 弹出气泡

> 用于文字提示的气泡框。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/popover)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 带箭头的弹出气泡

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PopoverArrowExample extends StatefulWidget {
  const PopoverArrowExample({super.key});

  @override
  State<PopoverArrowExample> createState() => _PopoverArrowExampleState();
}

class _PopoverArrowExampleState extends State<PopoverArrowExample> {
  Widget _buildPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return TButton(
            size: TButtonSize.large,
            child: const Text('带箭头'),
            variant: TButtonVariant.outline,
            colorPreset: TButtonColorPreset.primary,
            onPressed: () {
              TPopover.showPopover(
                context: popoverContext,
                content: const Text('弹出气泡内容'),
                colorPreset: theme,
              );
            },
          );
        },
      ),
    );
  }

  TPopoverColorPreset theme = TPopoverColorPreset.light;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        theme = Theme.of(context).brightness == Brightness.dark
            ? TPopoverColorPreset.light
            : TPopoverColorPreset.defaultTheme;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildPopover(context);
  }
}
```

##### 不带箭头的弹出气泡

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PopoverNoArrowExample extends StatefulWidget {
  const PopoverNoArrowExample({super.key});

  @override
  State<PopoverNoArrowExample> createState() => _PopoverNoArrowExampleState();
}

class _PopoverNoArrowExampleState extends State<PopoverNoArrowExample> {
  Widget _buildNoArrowPopover(BuildContext context) {
    return LayoutBuilder(
      builder: (popoverContext, constrains) {
        return TButton(
          size: TButtonSize.large,
          child: const Text('不带箭头'),
          variant: TButtonVariant.outline,
          colorPreset: TButtonColorPreset.primary,
          onPressed: () {
            TPopover.showPopover(
              context: popoverContext,
              content: const Text('弹出气泡内容'),
              showArrow: false,
              colorPreset: theme,
            );
          },
        );
      },
    );
  }

  TPopoverColorPreset theme = TPopoverColorPreset.light;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        theme = Theme.of(context).brightness == Brightness.dark
            ? TPopoverColorPreset.light
            : TPopoverColorPreset.defaultTheme;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildNoArrowPopover(context);
  }
}
```

##### 自定义内容弹出气泡

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PopoverCustomContentExample extends StatefulWidget {
  const PopoverCustomContentExample({super.key});

  @override
  State<PopoverCustomContentExample> createState() =>
      _PopoverCustomContentExampleState();
}

class _PopoverCustomContentExampleState
    extends State<PopoverCustomContentExample> {
  Widget _buildNCustomPopover(BuildContext context) {
    void selectOption(String option) {
      _customContentPopoverController.close();
      TToast.showText('已选择：$option', context: context);
    }

    final textStyle = TextStyle(
      fontSize: context.tTheme.fontBodyMedium?.size,
      height: context.tTheme.fontBodyMedium?.height,
      fontWeight: context.tTheme.fontBodyMedium?.fontWeight,
      color: theme == TPopoverColorPreset.light
          ? context.tTheme.fontGray1
          : context.tTheme.fontWhite1,
    );
    final dividerColor = textStyle.color;
    return Theme(
      data: Theme.of(
        context,
      ).mergeExtension(const TPopoverThemeData(padding: EdgeInsets.zero)),
      child: TPopoverAnchor(
        controller: _customContentPopoverController,
        colorPreset: theme,
        width: 150,
        content: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 146),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                key: const Key('popover-custom-option-1'),
                behavior: HitTestBehavior.opaque,
                onTap: () => selectOption('选项1'),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                  child: Text('选项1', style: textStyle),
                ),
              ),
              Container(height: 1, color: dividerColor),
              GestureDetector(
                key: const Key('popover-custom-option-2'),
                behavior: HitTestBehavior.opaque,
                onTap: () => selectOption('选项2'),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                  child: Text('选项2', style: textStyle),
                ),
              ),
              Container(height: 1, color: dividerColor),
              GestureDetector(
                key: const Key('popover-custom-option-3'),
                behavior: HitTestBehavior.opaque,
                onTap: () => selectOption('选项3'),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                  child: Text('选项3', style: textStyle),
                ),
              ),
            ],
          ),
        ),
        builder: (popoverContext, controller, child) {
          return TButton(
            key: const Key('popover-custom-content-trigger'),
            size: TButtonSize.large,
            child: const Text('自定义内容'),
            variant: TButtonVariant.outline,
            colorPreset: TButtonColorPreset.primary,
            onPressed: controller.open,
          );
        },
      ),
    );
  }

  final _customContentPopoverController = TPopoverController();

  TPopoverColorPreset theme = TPopoverColorPreset.light;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        theme = Theme.of(context).brightness == Brightness.dark
            ? TPopoverColorPreset.light
            : TPopoverColorPreset.defaultTheme;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildNCustomPopover(context);
  }
}
```

#### 组件样式

##### `PopoverColorPresetsExample`

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PopoverColorPresetsExample extends StatelessWidget {
  const PopoverColorPresetsExample({super.key});

  Widget _buildDarkPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return TButton(
            size: TButtonSize.large,
            child: const Text('深色'),
            variant: TButtonVariant.outline,
            colorPreset: TButtonColorPreset.primary,
            onPressed: () {
              TPopover.showPopover(
                context: popoverContext,
                content: const Text('弹出气泡内容'),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildLightPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return TButton(
            size: TButtonSize.large,
            child: const Text('浅色'),
            variant: TButtonVariant.outline,
            colorPreset: TButtonColorPreset.primary,
            onPressed: () {
              TPopover.showPopover(
                context: popoverContext,
                content: const Text('弹出气泡内容'),
                colorPreset: TPopoverColorPreset.light,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildPrimaryPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return TButton(
            size: TButtonSize.large,
            child: const Text('品牌色'),
            variant: TButtonVariant.outline,
            colorPreset: TButtonColorPreset.primary,
            onPressed: () {
              TPopover.showPopover(
                context: popoverContext,
                content: const Text('弹出气泡内容'),
                colorPreset: TPopoverColorPreset.primary,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildSuccessPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return TButton(
            size: TButtonSize.large,
            child: const Text('成功色'),
            variant: TButtonVariant.outline,
            colorPreset: TButtonColorPreset.primary,
            onPressed: () {
              TPopover.showPopover(
                context: popoverContext,
                content: const Text('弹出气泡内容'),
                colorPreset: TPopoverColorPreset.success,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildWarningPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return TButton(
            size: TButtonSize.large,
            child: const Text('警告色'),
            variant: TButtonVariant.outline,
            colorPreset: TButtonColorPreset.primary,
            onPressed: () {
              TPopover.showPopover(
                context: popoverContext,
                content: const Text('弹出气泡内容'),
                colorPreset: TPopoverColorPreset.warning,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildDangerPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return TButton(
            size: TButtonSize.large,
            child: const Text('错误色'),
            variant: TButtonVariant.outline,
            colorPreset: TButtonColorPreset.primary,
            onPressed: () {
              TPopover.showPopover(
                context: popoverContext,
                content: const Text('弹出气泡内容'),
                colorPreset: TPopoverColorPreset.danger,
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: Builder(builder: _buildDarkPopover)),
              Expanded(child: Builder(builder: _buildLightPopover)),
              Expanded(child: Builder(builder: _buildPrimaryPopover)),
            ],
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: Builder(builder: _buildSuccessPopover)),
              Expanded(child: Builder(builder: _buildWarningPopover)),
              Expanded(child: Builder(builder: _buildDangerPopover)),
            ],
          ),
        ],
      ),
    );
  }
}
```

##### 顶部弹出气泡

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PopoverTopPlacementsExample extends StatefulWidget {
  const PopoverTopPlacementsExample({super.key});

  @override
  State<PopoverTopPlacementsExample> createState() =>
      _PopoverTopPlacementsExampleState();
}

class _PopoverTopPlacementsExampleState
    extends State<PopoverTopPlacementsExample> {
  Widget _buildTopLeftPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return TButton(
            size: TButtonSize.large,
            child: const Text('顶部左'),
            variant: TButtonVariant.outline,
            colorPreset: TButtonColorPreset.primary,
            onPressed: () {
              TPopover.showPopover(
                context: popoverContext,
                content: const Text('弹出气泡内容'),
                placement: TPopoverPlacement.topLeft,
                colorPreset: theme,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildTopPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return TButton(
            size: TButtonSize.large,
            child: const Text('顶部中'),
            variant: TButtonVariant.outline,
            colorPreset: TButtonColorPreset.primary,
            onPressed: () {
              TPopover.showPopover(
                context: popoverContext,
                content: const Text('弹出气泡内容'),
                placement: TPopoverPlacement.top,
                colorPreset: theme,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildTopRightPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return TButton(
            size: TButtonSize.large,
            child: const Text('顶部右'),
            variant: TButtonVariant.outline,
            colorPreset: TButtonColorPreset.primary,
            onPressed: () {
              TPopover.showPopover(
                context: popoverContext,
                content: const Text('弹出气泡内容'),
                placement: TPopoverPlacement.topRight,
                colorPreset: theme,
              );
            },
          );
        },
      ),
    );
  }

  TPopoverColorPreset theme = TPopoverColorPreset.light;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        theme = Theme.of(context).brightness == Brightness.dark
            ? TPopoverColorPreset.light
            : TPopoverColorPreset.defaultTheme;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(child: Builder(builder: _buildTopLeftPopover)),
          Expanded(child: Builder(builder: _buildTopPopover)),
          Expanded(child: Builder(builder: _buildTopRightPopover)),
        ],
      ),
    );
  }
}
```

##### 底部弹出气泡

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PopoverBottomPlacementsExample extends StatefulWidget {
  const PopoverBottomPlacementsExample({super.key});

  @override
  State<PopoverBottomPlacementsExample> createState() =>
      _PopoverBottomPlacementsExampleState();
}

class _PopoverBottomPlacementsExampleState
    extends State<PopoverBottomPlacementsExample> {
  Widget _buildBottomLeftPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return TButton(
            size: TButtonSize.large,
            child: const Text('底部左'),
            variant: TButtonVariant.outline,
            colorPreset: TButtonColorPreset.primary,
            onPressed: () {
              TPopover.showPopover(
                context: popoverContext,
                content: const Text('弹出气泡内容'),
                placement: TPopoverPlacement.bottomLeft,
                colorPreset: theme,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildBottomPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return TButton(
            size: TButtonSize.large,
            child: const Text('底部中'),
            variant: TButtonVariant.outline,
            colorPreset: TButtonColorPreset.primary,
            onPressed: () {
              TPopover.showPopover(
                context: popoverContext,
                content: const Text('弹出气泡内容'),
                placement: TPopoverPlacement.bottom,
                colorPreset: theme,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildBottomRightPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return TButton(
            size: TButtonSize.large,
            child: const Text('底部右'),
            variant: TButtonVariant.outline,
            colorPreset: TButtonColorPreset.primary,
            onPressed: () {
              TPopover.showPopover(
                context: popoverContext,
                content: const Text('弹出气泡内容'),
                placement: TPopoverPlacement.bottomRight,
                colorPreset: theme,
              );
            },
          );
        },
      ),
    );
  }

  TPopoverColorPreset theme = TPopoverColorPreset.light;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        theme = Theme.of(context).brightness == Brightness.dark
            ? TPopoverColorPreset.light
            : TPopoverColorPreset.defaultTheme;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(child: Builder(builder: _buildBottomLeftPopover)),
          Expanded(child: Builder(builder: _buildBottomPopover)),
          Expanded(child: Builder(builder: _buildBottomRightPopover)),
        ],
      ),
    );
  }
}
```

##### 右侧弹出气泡

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PopoverRightPlacementsExample extends StatefulWidget {
  const PopoverRightPlacementsExample({super.key});

  @override
  State<PopoverRightPlacementsExample> createState() =>
      _PopoverRightPlacementsExampleState();
}

class _PopoverRightPlacementsExampleState
    extends State<PopoverRightPlacementsExample> {
  Widget _buildRightTopPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return SizedBox(
            width: 223,
            child: TButton(
              size: TButtonSize.large,
              child: const Text('右侧上'),
              variant: TButtonVariant.outline,
              colorPreset: TButtonColorPreset.primary,
              onPressed: () {
                TPopover.showPopover(
                  context: popoverContext,
                  content: const Text('气泡内容'),
                  placement: TPopoverPlacement.rightTop,
                  colorPreset: theme,
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildRightPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return SizedBox(
            width: 223,
            child: TButton(
              size: TButtonSize.large,
              child: const Text('右侧中'),
              variant: TButtonVariant.outline,
              colorPreset: TButtonColorPreset.primary,
              onPressed: () {
                TPopover.showPopover(
                  context: popoverContext,
                  content: const Text('气泡内容'),
                  placement: TPopoverPlacement.right,
                  colorPreset: theme,
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildRightBottomPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return SizedBox(
            width: 223,
            child: TButton(
              size: TButtonSize.large,
              child: const Text('右侧下'),
              variant: TButtonVariant.outline,
              colorPreset: TButtonColorPreset.primary,
              onPressed: () {
                TPopover.showPopover(
                  context: popoverContext,
                  content: const Text('气泡内容'),
                  placement: TPopoverPlacement.rightBottom,
                  colorPreset: theme,
                );
              },
            ),
          );
        },
      ),
    );
  }

  TPopoverColorPreset theme = TPopoverColorPreset.light;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        theme = Theme.of(context).brightness == Brightness.dark
            ? TPopoverColorPreset.light
            : TPopoverColorPreset.defaultTheme;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Builder(builder: _buildRightTopPopover),
          Builder(builder: _buildRightPopover),
          Builder(builder: _buildRightBottomPopover),
        ],
      ),
    );
  }
}
```

##### 左侧弹出气泡

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PopoverLeftPlacementsExample extends StatefulWidget {
  const PopoverLeftPlacementsExample({super.key});

  @override
  State<PopoverLeftPlacementsExample> createState() =>
      _PopoverLeftPlacementsExampleState();
}

class _PopoverLeftPlacementsExampleState
    extends State<PopoverLeftPlacementsExample> {
  Widget _buildLeftTopPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return SizedBox(
            width: 223,
            child: TButton(
              size: TButtonSize.large,
              child: const Text('左侧上'),
              variant: TButtonVariant.outline,
              colorPreset: TButtonColorPreset.primary,
              onPressed: () {
                TPopover.showPopover(
                  context: popoverContext,
                  content: const Text('气泡内容'),
                  placement: TPopoverPlacement.leftTop,
                  colorPreset: theme,
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildLeftPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return SizedBox(
            width: 223,
            child: TButton(
              size: TButtonSize.large,
              child: const Text('左侧中'),
              variant: TButtonVariant.outline,
              colorPreset: TButtonColorPreset.primary,
              onPressed: () {
                TPopover.showPopover(
                  context: popoverContext,
                  content: const Text('气泡内容'),
                  placement: TPopoverPlacement.left,
                  colorPreset: theme,
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildLeftBottomPopover(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (popoverContext, constraints) {
          return SizedBox(
            width: 223,
            child: TButton(
              size: TButtonSize.large,
              child: const Text('左侧下'),
              variant: TButtonVariant.outline,
              colorPreset: TButtonColorPreset.primary,
              onPressed: () {
                TPopover.showPopover(
                  context: popoverContext,
                  content: const Text('气泡内容'),
                  placement: TPopoverPlacement.leftBottom,
                  colorPreset: theme,
                );
              },
            ),
          );
        },
      ),
    );
  }

  TPopoverColorPreset theme = TPopoverColorPreset.light;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        theme = Theme.of(context).brightness == Brightness.dark
            ? TPopoverColorPreset.light
            : TPopoverColorPreset.defaultTheme;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Builder(builder: _buildLeftTopPopover),
          Builder(builder: _buildLeftPopover),
          Builder(builder: _buildLeftBottomPopover),
        ],
      ),
    );
  }
}
```

## API

1. [TPopover](#tpopover)
2. [TPopoverAnchor](#tpopoveranchor)
3. [TPopoverController](#tpopovercontroller)
4. [TPopoverColorPreset](#tpopovercolorpreset)
5. [TPopoverPlacement](#tpopoverplacement)
6. [TPopoverAnchorBuilder](#tpopoveranchorbuilder)
7. [TPopoverThemeData](#tpopoverthemedata)

### TPopover

#### 构造方法

##### TPopover

无参数。

#### 静态方法

##### TPopover.showPopover

显示气泡弹层

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 触发元素的上下文，用于计算气泡锚点位置。 | 是 |
| content | Widget | - | 气泡内容。 直接传入未设置样式的 `Text` 时使用气泡默认文字样式；组合内容应自行定义 子组件样式和布局。 | 是 |
| colorPreset | TPopoverColorPreset | TPopoverColorPreset.defaultTheme | 气泡预设配色。 | 否 |
| closeOnClickOutside | bool | true | 点击气泡外部区域时是否关闭弹层。 外部目标仍会接收该次点击，因此可在单次点击中从一个气泡切换到另一个气泡。 | 否 |
| closeOnScroll | bool | true | 页面滚动时是否关闭弹层。 默认为 true，避免触发元素移动后气泡停留在旧坐标。 | 否 |
| placement | TPopoverPlacement | TPopoverPlacement.top | 浮层出现位置，默认为 `TPopoverPlacement.top`。 | 否 |
| showArrow | bool? | - | 是否显示气泡箭头。 | 否 |
| width | double? | - | 内容外框宽度（包含 padding）。 未设置时按 `content` 的实际布局宽度确定，并受组件主题尺寸约束。 | 否 |
| height | double? | - | 内容外框高度（包含 padding）。 未设置时按 `content` 的实际布局高度确定，并受组件主题尺寸约束。 | 否 |
| onTap | VoidCallback? | - | 点击气泡内容时触发。 | 否 |
| onLongTap | VoidCallback? | - | 长按气泡内容时触发。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Future<void> | - | 气泡关闭时完成的 Future；不是打开完成通知。 | - |

### TPopoverAnchor

将可控制的气泡与 Widget 树中的触发区域绑定。

`TPopoverAnchor` 声明气泡内容、位置和视觉配置，`TPopoverController` 只负责
`open`、`close` 和 `isOpen`。简单的一次性展示仍可使用
`TPopover.showPopover`。
蒙层色与圆角由最近的 `TPopoverThemeData` 控制；单个气泡使用局部 Theme。

气泡展开时会读取当前的内容、位置、视觉配置和关闭策略；展开期间更新这些
配置不会刷新已显示的浮层，关闭后再次展开时生效。`builder` 和 `child` 仍按
普通 Widget 树的更新规则重建。

#### 构造方法

##### TPopoverAnchor

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| builder | TPopoverAnchorBuilder | - | 构建气泡所绑定的触发区域。 构建器会收到当前有效的控制器；未传入 `controller` 时由组件内部创建。 | 是 |
| child | Widget? | - | 传递给 `builder` 的可选子组件。 | 否 |
| closeOnClickOutside | bool | true | 点击气泡外部区域时是否关闭弹层。 外部目标仍会接收该次点击，因此可在单次点击中从一个气泡切换到另一个气泡。 | 否 |
| closeOnScroll | bool | true | 页面滚动时是否关闭弹层。 | 否 |
| colorPreset | TPopoverColorPreset | TPopoverColorPreset.defaultTheme | 气泡预设配色。 | 否 |
| content | Widget | - | 气泡内容。 | 是 |
| controller | TPopoverController? | - | 可选控制器，用于从触发区域外部展开或关闭气泡。 | 否 |
| height | double? | - | 内容外框高度（包含 padding）。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| onClose | VoidCallback? | - | 气泡通过任意路径关闭后触发。 | 否 |
| onLongTap | VoidCallback? | - | 长按气泡内容时触发。 | 否 |
| onOpen | VoidCallback? | - | 气泡展开后触发。 | 否 |
| onTap | VoidCallback? | - | 点击气泡内容时触发。 | 否 |
| placement | TPopoverPlacement | TPopoverPlacement.top | 浮层出现位置。 | 否 |
| showArrow | bool? | - | 是否显示气泡箭头。 | 否 |
| width | double? | - | 内容外框宽度（包含 padding）。 | 否 |

### TPopoverController

控制与其绑定的 `TPopoverAnchor`。

气泡内容、位置和视觉配置由 `TPopoverAnchor` 声明，控制器只负责展开、关闭
和查询当前状态，不形成第二份配置来源。

#### 构造方法

##### TPopoverController

无参数。

#### 属性

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| isOpen | bool | - | 与该控制器绑定的气泡是否已展开。 | - |

#### 静态方法

##### TPopoverController.maybeOf

位置参数：`context`

返回 `context` 最近的 `TPopoverAnchor` 所关联的控制器。

未处于 Anchor 的触发区域或气泡内容子树时返回 null。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 当前构建上下文，用于读取祖先配置。 | 是 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | TPopoverController? | - | 最近的 PopoverAnchor 控制器；不在其触发区域或气泡内容子树时为 null。 | - |

#### 实例方法

##### TPopoverController.close

无参数。

关闭与该控制器绑定的气泡。

未绑定或已经关闭时无副作用。

##### TPopoverController.open

无参数。

展开与该控制器绑定的气泡。

控制器必须先通过 `TPopoverAnchor.controller` 绑定到 Widget 树。

### TPopoverColorPreset

弹出气泡的内置配色预设；不切换全局明暗主题。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| defaultTheme | TPopoverColorPreset | - | 默认深色配色。 | - |
| light | TPopoverColorPreset | - | 浅色。 | - |
| primary | TPopoverColorPreset | - | 品牌主色。 | - |
| success | TPopoverColorPreset | - | 成功。 | - |
| warning | TPopoverColorPreset | - | 警告。 | - |
| danger | TPopoverColorPreset | - | 危险色。 | - |

### TPopoverPlacement

气泡弹层定位方向。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| topLeft | TPopoverPlacement | - | 上左。 | - |
| top | TPopoverPlacement | - | 上方。 | - |
| topRight | TPopoverPlacement | - | 上右。 | - |
| rightTop | TPopoverPlacement | - | 右上。 | - |
| right | TPopoverPlacement | - | 右侧。 | - |
| rightBottom | TPopoverPlacement | - | 右下。 | - |
| bottomRight | TPopoverPlacement | - | 下右。 | - |
| bottom | TPopoverPlacement | - | 下方。 | - |
| bottomLeft | TPopoverPlacement | - | 下左。 | - |
| leftBottom | TPopoverPlacement | - | 左下。 | - |
| left | TPopoverPlacement | - | 左侧。 | - |
| leftTop | TPopoverPlacement | - | 左上。 | - |

### TPopoverAnchorBuilder

`TPopoverAnchor` 的触发区域构建器。

位置参数：`context, controller, child`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 触发区域的构建上下文。 | 是 |
| controller | TPopoverController | - | 关联气泡控制器，用于开关气泡与查询状态。 | 是 |
| child | Widget? | - | 传入 Anchor 的可选静态子组件。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Widget | - | 气泡触发区域内容。 | - |

### TPopoverThemeData

TPopover 组件级 ThemeExtension

通过 Theme 子树注入，控制子树的默认气泡样式。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| arrowSize | double? | - | 箭头尺寸；未配置时为 8 逻辑像素。 | 否 |
| backgroundColor | Color? | - | 气泡背景色 | 否 |
| barrierColor | Color? | - | 蒙层色；未设置时透明。单个气泡可用局部 Theme 覆盖。 | 否 |
| borderRadius | BorderRadius? | - | 气泡圆角；未设置时回退全局默认圆角。单个气泡可用局部 Theme 覆盖。 | 否 |
| boxShadow | List<BoxShadow>? | - | 气泡阴影；未配置时使用 shadow3 Token，Token 为空时无阴影。 | 否 |
| maxHeight | double? | - | 最大高度 | 否 |
| maxWidth | double? | - | 文本内容的最大宽度 | 否 |
| minWidth | double? | - | 最小宽度 | 否 |
| offset | double? | - | 弹层与触发元素的间距；未配置时为 4 逻辑像素。 | 否 |
| padding | EdgeInsetsGeometry? | - | 内边距 | 否 |
