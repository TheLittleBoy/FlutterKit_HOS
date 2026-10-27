# Toast 轻提示

> 用于轻量级反馈或提示，不会打断用户操作。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/toast)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 基础提示

##### 纯文本

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextToastExample extends StatelessWidget {
  const TextToastExample({super.key});

  Widget _buildTextToast(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: const Text('纯文本'),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: () {
          TToast.showText('轻提示文字内容', context: context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTextToast(context);
  }
}
```

##### 多行文字

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class MultipleTextToastExample extends StatelessWidget {
  const MultipleTextToastExample({super.key});

  Widget _buildMultipleTextToast(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: const Text('多行文字'),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: () {
          TToast.showText('最多一行展示十个汉字宽度限制最多不超过三行文字', context: context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildMultipleTextToast(context);
  }
}
```

##### 带横向图标

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class HorizontalIconToastExample extends StatelessWidget {
  const HorizontalIconToastExample({super.key});

  Widget _buildHorizontalIconToast(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: const Text('带横向图标'),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: () {
          TToast.showIconText(
            '带横向图标',
            icon: TIcons.check_circle,
            direction: IconTextDirection.horizontal,
            context: context,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildHorizontalIconToast(context);
  }
}
```

##### 带竖向图标

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class VerticalIconToastExample extends StatelessWidget {
  const VerticalIconToastExample({super.key});

  Widget _buildVerticalIconToast(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: const Text('带竖向图标'),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: () {
          TToast.showIconText(
            '带竖向图标',
            icon: TIcons.check_circle,
            direction: IconTextDirection.vertical,
            context: context,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildVerticalIconToast(context);
  }
}
```

##### 加载状态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class LoadingToastExample extends StatelessWidget {
  const LoadingToastExample({super.key});

  Widget _buildLoadingToast(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: const Text('加载状态'),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: () {
          TToast.showLoading(text: '加载中...', context: context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildLoadingToast(context);
  }
}
```

#### 组件状态

##### 成功提示

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SuccessToastExample extends StatelessWidget {
  const SuccessToastExample({super.key});

  Widget _buildSuccessToast(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: const Text('成功提示'),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: () {
          TToast.showSuccess(
            '成功文案',
            direction: IconTextDirection.vertical,
            context: context,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuccessToast(context);
  }
}
```

##### 警告提示

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class WarningToastExample extends StatelessWidget {
  const WarningToastExample({super.key});

  Widget _buildWarningToast(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: const Text('警告提示'),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: () {
          TToast.showWarning(
            '警告文案',
            direction: IconTextDirection.vertical,
            context: context,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildWarningToast(context);
  }
}
```

##### 错误提示

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class FailToastExample extends StatelessWidget {
  const FailToastExample({super.key});

  Widget _buildFailToast(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: const Text('错误提示'),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: () {
          TToast.showFail(
            '错误文案',
            direction: IconTextDirection.vertical,
            context: context,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildFailToast(context);
  }
}
```

#### 显示遮罩

##### 禁止滑动和点击

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CoverToastExample extends StatelessWidget {
  const CoverToastExample({super.key});

  Widget _buildCoverToast(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: const Text('禁止滑动和点击'),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: () {
          TToast.showText(
            '禁止滑动和点击',
            context: context,
            overlay: const TOverlayConfig(
              showOverlay: true,
              opacity: 0.4,
              preventScrollThrough: true,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCoverToast(context);
  }
}
```

#### 手动关闭

##### 显示提示

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ShowToastExample extends StatelessWidget {
  const ShowToastExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: const Text('显示提示'),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: () {
          TToast.showText(
            '轻提示文字内容',
            context: context,
            duration: Duration.zero,
            toastId: 'manual-close-demo',
          );
        },
      ),
    );
  }
}
```

##### 关闭提示

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class HideToastExample extends StatelessWidget {
  const HideToastExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: const Text('关闭提示'),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: () {
          TToast.dismissToast('manual-close-demo');
        },
      ),
    );
  }
}
```

## API

1. [TToast](#ttoast)
2. [TOverlayConfig](#toverlayconfig)
3. [IconTextDirection](#icontextdirection)
4. [TToastPlacement](#ttoastplacement)
5. [TToastThemeData](#ttoastthemedata)

### TToast

#### 构造方法

##### TToast

无参数。

#### 静态方法

##### TToast.dismissAll

无参数。

关闭所有Toast

##### TToast.dismissToast

位置参数：`toastId`

关闭指定的Toast

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| toastId | String | - | 要关闭的 Toast 实例 ID。 | 是 |

##### TToast.showFail

位置参数：`text`

失败提示Toast

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| text | String? | - | 提示文案。 | 是 |
| direction | IconTextDirection | IconTextDirection.horizontal | 图标与文案排列方向。 | 否 |
| context | BuildContext | - | 用于查找 Overlay 的上下文。 | 是 |
| duration | Duration | const Duration(milliseconds: 2000) | 自动关闭时长，默认 2000ms；零或负时长不自动关闭，请调用 dismissToast 或 dismissAll。 | 否 |
| overlay | TOverlayConfig? | - | 蒙层行为配置（可见遮罩、拦截点击等）。 | 否 |
| placement | TToastPlacement | TToastPlacement.middle | Toast 展示位置。 | 否 |
| backgroundColor | Color? | - | Toast 背景色。 | 否 |
| maxLines | int? | - | 文案最大行数。 | 否 |
| textStyle | TextStyle? | - | Toast 文案样式。 | 否 |
| iconSize | double? | - | 图标尺寸。 | 否 |
| iconColor | Color? | - | 图标颜色。 | 否 |
| toastId | String? | - | 指定实例 ID；不传时共用固定匿名 ID toast_anonymous，后一次展示替换前一次。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | String | - | 本次 Toast 的标识，可传给 `dismissToast`；未传 toastId 时使用共享匿名标识并复用匿名提示。 | - |

##### TToast.showIconText

位置参数：`text`

带图标的Toast

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| text | String? | - | 提示文案。 | 是 |
| icon | IconData? | - | 左侧或上方图标。 | 否 |
| direction | IconTextDirection | IconTextDirection.horizontal | 图标与文案排列方向。 | 否 |
| context | BuildContext | - | 用于查找 Overlay 的上下文。 | 是 |
| duration | Duration | const Duration(milliseconds: 2000) | 自动关闭时长，默认 2000ms；零或负时长不自动关闭，请调用 dismissToast 或 dismissAll。 | 否 |
| overlay | TOverlayConfig? | - | 蒙层行为配置（可见遮罩、拦截点击等）。 | 否 |
| placement | TToastPlacement | TToastPlacement.middle | Toast 展示位置。 | 否 |
| backgroundColor | Color? | - | Toast 背景色。 | 否 |
| maxLines | int? | - | 文案最大行数。 | 否 |
| textStyle | TextStyle? | - | Toast 文案样式。 | 否 |
| iconSize | double? | - | 图标尺寸。 | 否 |
| iconColor | Color? | - | 图标颜色。 | 否 |
| toastId | String? | - | 指定实例 ID；不传时共用固定匿名 ID toast_anonymous，后一次展示替换前一次。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | String | - | 本次 Toast 的标识，可传给 `dismissToast`；未传 toastId 时使用共享匿名标识并复用匿名提示。 | - |

##### TToast.showLoading

带文案的加载Toast

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 用于查找 Overlay 的上下文。 | 是 |
| text | String? | - | 加载提示文案。 | 否 |
| duration | Duration | const Duration(milliseconds: 2000) | 自动关闭时长，默认 2000ms；零或负时长不自动关闭，请调用 dismissToast 或 dismissAll。 | 否 |
| overlay | TOverlayConfig? | - | 蒙层行为配置（可见遮罩、拦截点击等）。 | 否 |
| placement | TToastPlacement | TToastPlacement.middle | Toast 展示位置。 | 否 |
| customWidget | Widget? | - | 自定义加载文案区域；传入后替换 text 对应内容，加载指示器仍显示。 | 否 |
| backgroundColor | Color? | - | Toast 背景色。 | 否 |
| textStyle | TextStyle? | - | Toast 文案样式。 | 否 |
| iconSize | double? | - | 加载图标尺寸。 | 否 |
| iconColor | Color? | - | 加载图标颜色。 | 否 |
| toastId | String? | - | 指定实例 ID；不传时共用固定匿名 ID toast_anonymous，后一次展示替换前一次。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | String | - | 本次 Toast 的标识，可传给 `dismissToast`；未传 toastId 时使用共享匿名标识并复用匿名提示。 | - |

##### TToast.showLoadingWithoutText

不带文案的加载Toast

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 用于查找 Overlay 的上下文。 | 是 |
| duration | Duration | const Duration(milliseconds: 2000) | 自动关闭时长，默认 2000ms；零或负时长不自动关闭，请调用 dismissToast 或 dismissAll。 | 否 |
| overlay | TOverlayConfig? | - | 蒙层行为配置（可见遮罩、拦截点击等）。 | 否 |
| placement | TToastPlacement | TToastPlacement.middle | Toast 展示位置。 | 否 |
| backgroundColor | Color? | - | Toast 背景色。 | 否 |
| iconSize | double? | - | 加载图标尺寸。 | 否 |
| iconColor | Color? | - | 加载图标颜色。 | 否 |
| toastId | String? | - | 指定实例 ID；不传时共用固定匿名 ID toast_anonymous，后一次展示替换前一次。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | String | - | 本次 Toast 的标识，可传给 `dismissToast`；未传 toastId 时使用共享匿名标识并复用匿名提示。 | - |

##### TToast.showSuccess

位置参数：`text`

成功提示Toast

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| text | String? | - | 提示文案。 | 是 |
| direction | IconTextDirection | IconTextDirection.horizontal | 图标与文案排列方向。 | 否 |
| context | BuildContext | - | 用于查找 Overlay 的上下文。 | 是 |
| duration | Duration | const Duration(milliseconds: 2000) | 自动关闭时长，默认 2000ms；零或负时长不自动关闭，请调用 dismissToast 或 dismissAll。 | 否 |
| overlay | TOverlayConfig? | - | 蒙层行为配置（可见遮罩、拦截点击等）。 | 否 |
| placement | TToastPlacement | TToastPlacement.middle | Toast 展示位置。 | 否 |
| backgroundColor | Color? | - | Toast 背景色。 | 否 |
| maxLines | int? | - | 文案最大行数。 | 否 |
| textStyle | TextStyle? | - | Toast 文案样式。 | 否 |
| iconSize | double? | - | 图标尺寸。 | 否 |
| iconColor | Color? | - | 图标颜色。 | 否 |
| toastId | String? | - | 指定实例 ID；不传时共用固定匿名 ID toast_anonymous，后一次展示替换前一次。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | String | - | 本次 Toast 的标识，可传给 `dismissToast`；未传 toastId 时使用共享匿名标识并复用匿名提示。 | - |

##### TToast.showText

位置参数：`text`

普通文本Toast

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| text | String? | - | 提示文案；为 null 时只展示自定义内容。 | 是 |
| context | BuildContext | - | 用于查找 Overlay 的上下文。 | 是 |
| duration | Duration | const Duration(milliseconds: 2000) | 自动关闭时长，默认 2000ms；零或负时长不自动关闭，请调用 dismissToast 或 dismissAll。 | 否 |
| maxLines | int? | - | 文案最大行数。 | 否 |
| constraints | BoxConstraints? | - | Toast 内容约束。 | 否 |
| overlay | TOverlayConfig? | - | 蒙层行为配置（可见遮罩、拦截点击等）。 | 否 |
| placement | TToastPlacement | TToastPlacement.middle | Toast 展示位置。 | 否 |
| customWidget | Widget? | - | 自定义内容；传入后优先展示。 | 否 |
| backgroundColor | Color? | - | Toast 背景色。 | 否 |
| textStyle | TextStyle? | - | Toast 文案样式。 | 否 |
| toastId | String? | - | 指定实例 ID；不传时共用固定匿名 ID toast_anonymous，后一次展示替换前一次。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | String | - | 本次 Toast 的标识，可传给 `dismissToast`；未传 toastId 时使用共享匿名标识并复用匿名提示。 | - |

##### TToast.showWarning

位置参数：`text`

警告Toast

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| text | String? | - | 提示文案。 | 是 |
| direction | IconTextDirection | IconTextDirection.horizontal | 图标与文案排列方向。 | 否 |
| context | BuildContext | - | 用于查找 Overlay 的上下文。 | 是 |
| duration | Duration | const Duration(milliseconds: 2000) | 自动关闭时长，默认 2000ms；零或负时长不自动关闭，请调用 dismissToast 或 dismissAll。 | 否 |
| overlay | TOverlayConfig? | - | 蒙层行为配置（可见遮罩、拦截点击等）。 | 否 |
| placement | TToastPlacement | TToastPlacement.middle | Toast 展示位置。 | 否 |
| backgroundColor | Color? | - | Toast 背景色。 | 否 |
| maxLines | int? | - | 文案最大行数。 | 否 |
| textStyle | TextStyle? | - | Toast 文案样式。 | 否 |
| iconSize | double? | - | 图标尺寸。 | 否 |
| iconColor | Color? | - | 图标颜色。 | 否 |
| toastId | String? | - | 指定实例 ID；不传时共用固定匿名 ID toast_anonymous，后一次展示替换前一次。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | String | - | 本次 Toast 的标识，可传给 `dismissToast`；未传 toastId 时使用共享匿名标识并复用匿名提示。 | - |

### TOverlayConfig

蒙层行为配置

统一收敛 Toast 展示期间遮罩层的各项行为：

- `showOverlay`：是否显示可见半透明蒙层（与 `preventScrollThrough` 解耦，
  `true` 时展示半透明黑色蒙层遮住背景）；
- `color` / `opacity`：蒙层颜色与透明度，`color` 为 null 时由
  `Colors.black.withValues(alpha: opacity)` 派生黑色蒙层；
- `preventScrollThrough`：是否禁止背景点击和滚动（与蒙层是否可见解耦，
  `true` 时展示期间阻止背景点击、触控滑动和鼠标滚轮；Toast 内容自身仍可交互）。

#### 构造方法

##### TOverlayConfig

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| color | Color? | - | 蒙层颜色；为 null 时由 `opacity` 派生黑色蒙层。 | 否 |
| opacity | double | 0.2 | 蒙层透明度（0~1，默认 0.2）。 | 否 |
| preventScrollThrough | bool | false | 是否禁止背景点击和滚动（默认 false）。 | 否 |
| showOverlay | bool | false | 是否显示可见半透明蒙层（默认 false）。 | 否 |

### IconTextDirection

Toast 文案排列方向

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| horizontal | IconTextDirection | - | 横向 | - |
| vertical | IconTextDirection | - | 竖向 | - |

### TToastPlacement

Toast 展示位置

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| top | TToastPlacement | - | 顶部（中心距 Overlay 顶部 25%，水平居中） | - |
| middle | TToastPlacement | - | 中间（中心距 Overlay 顶部 45%） | - |
| bottom | TToastPlacement | - | 底部（中心距 Overlay 顶部 75%，水平居中） | - |

### TToastThemeData

TToast 组件级 ThemeExtension

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 背景色 | 否 |
| borderRadius | double? | - | 圆角 | 否 |
| iconColor | Color? | - | 图标颜色 | 否 |
| iconSize | double? | - | 图标尺寸；未配置时横向读取 size8（24），纵向与加载读取 size10（32）。 | 否 |
| maxWidth | double? | - | 最大宽度 | 否 |
| padding | EdgeInsetsGeometry? | - | 内边距 | 否 |
| textStyle | TextStyle? | - | 文案样式 | 否 |

#### 静态方法

##### TToastThemeData.lerpDouble

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
2. [与页面布局相关](#与页面布局相关)
3. [组件搭配使用](#组件搭配使用)
4. [推荐/慎用示例](#推荐-慎用示例)

### 何时使用

当需要对用户进行轻量反馈或提示，且不需要用户进行操作时使用，轻提示会在一段时间后自动消失。

### 与页面布局相关

##### 轻提示通常放置在页面正中间，一段时间后自动消失。

![](https://tdesign.gtimg.com/site/design/mobile-guide/toast/toast-1.png)

### 组件搭配使用

##### 轻提示经常和加载搭配使用，在页面内进行某项操作后，用作加载反馈。

![](https://tdesign.gtimg.com/site/design/mobile-guide/toast/toast-2.png)

### 推荐/慎用示例

##### 轻提示的文案内容通常不超过30个字，确保用户有充足的时间进行阅读，若需要提示较长的文本内容，建议使用其它交互方式。

![](https://tdesign.gtimg.com/site/design/mobile-guide/toast/toast-3.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/toast/toast-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)
