# Loading 加载

> 用于表示页面或操作的加载状态，给予用户反馈的同时减缓等待的焦虑感，由一个或一组反馈动效组成。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/loading)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 纯图标

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PureIconLoadingExample extends StatelessWidget {
  const PureIconLoadingExample({super.key});

  /// 纯图标
  Widget _buildPureIconLoading(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TLoading(icon: TLoadingIcon.circle),
        const SizedBox(width: 40),
        const TLoading(icon: TLoadingIcon.activity),
        const SizedBox(width: 40),
        Theme(
          data: Theme.of(context).mergeExtension(
            TLoadingThemeData(iconColor: context.tTheme.brandColor),
          ),
          child: const TLoading(size: 40, icon: TLoadingIcon.point),
        ),
        const SizedBox(width: 40),
        Theme(
          data: Theme.of(context).mergeExtension(
            TLoadingThemeData(iconColor: context.tTheme.brandColor),
          ),
          child: const TLoading(
            customIcon: Image(
              image: AssetImage('assets/img/loading-logo2.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPureIconLoading(context);
  }
}
```

##### 图标加文字横向

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextIconHorizontalLoadingExample extends StatelessWidget {
  const TextIconHorizontalLoadingExample({super.key});

  /// 图标加文字横向
  Widget _buildTextIconHorizontalLoading(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Theme(
          data: Theme.of(
            context,
          ).mergeExtension(const TLoadingThemeData(axis: Axis.horizontal)),
          child: const TLoading(icon: TLoadingIcon.circle, text: '加载中...'),
        ),
        const SizedBox(width: 64),
        Theme(
          data: Theme.of(
            context,
          ).mergeExtension(const TLoadingThemeData(axis: Axis.horizontal)),
          child: const TLoading(icon: TLoadingIcon.activity, text: '加载中...'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTextIconHorizontalLoading(context);
  }
}
```

##### 图标加文字竖向

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextIconVerticalLoadingExample extends StatelessWidget {
  const TextIconVerticalLoadingExample({super.key});

  /// 图标加文字竖向
  Widget _buildTextIconVerticalLoading(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Theme(
          data: Theme.of(
            context,
          ).mergeExtension(const TLoadingThemeData(axis: Axis.vertical)),
          child: const TLoading(icon: TLoadingIcon.circle, text: '加载中'),
        ),
        const SizedBox(width: 64),
        Theme(
          data: Theme.of(
            context,
          ).mergeExtension(const TLoadingThemeData(axis: Axis.vertical)),
          child: const TLoading(icon: TLoadingIcon.activity, text: '加载中'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTextIconVerticalLoading(context);
  }
}
```

##### 纯文字

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PureTextLoadingExample extends StatelessWidget {
  const PureTextLoadingExample({super.key});

  /// 纯文字
  Widget _buildPureTextLoading(BuildContext context) =>
      const TLoading(icon: null, text: '加载中...');

  @override
  Widget build(BuildContext context) {
    return _buildPureTextLoading(context);
  }
}
```

#### 组件尺寸

##### 大尺寸

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class LoadingSizesExample extends StatelessWidget {
  const LoadingSizesExample({super.key});

  /// 组件尺寸
  Widget _buildLoadingSizes(BuildContext context) {
    Widget loading(double size) => Theme(
      data: Theme.of(
        context,
      ).mergeExtension(const TLoadingThemeData(axis: Axis.horizontal)),
      child: TLoading(size: size, icon: TLoadingIcon.circle, text: '加载中...'),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        loading(32),
        const SizedBox(height: 24),
        const Text('中尺寸'),
        const SizedBox(height: 16),
        loading(28),
        const SizedBox(height: 24),
        const Text('小尺寸'),
        const SizedBox(height: 16),
        loading(24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildLoadingSizes(context);
  }
}
```

#### 加载速度

##### 加载速度调整

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CustomSpeedLoadingExample extends StatefulWidget {
  const CustomSpeedLoadingExample({super.key});

  @override
  State<CustomSpeedLoadingExample> createState() =>
      _CustomSpeedLoadingExampleState();
}

class _CustomSpeedLoadingExampleState extends State<CustomSpeedLoadingExample> {
  /// 加载速度
  Widget _buildCustomSpeedLoading(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Theme(
          data: Theme.of(context).mergeExtension(
            TLoadingThemeData(
              axis: Axis.horizontal,
              duration: (2000 - _currentSliderValue).round(),
            ),
          ),
          child: const TLoading(
            size: 26,
            icon: TLoadingIcon.circle,
            text: '加载中...',
          ),
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            const min = 100.0;
            const max = 1500.0;
            const trackInset = 24.0;
            const labelWidth = 48.0;
            final progress = (_currentSliderValue - min) / (max - min);
            final trackWidth = constraints.maxWidth - trackInset * 2;
            final thumbCenter = trackInset + trackWidth * progress;
            final labelLeft = (thumbCenter - labelWidth / 2).clamp(
              0.0,
              constraints.maxWidth - labelWidth,
            );
            return SizedBox(
              height: 64,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: labelLeft,
                    width: labelWidth,
                    child: Text(
                      '${_currentSliderValue.round()}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: TSlider(
                      value: _currentSliderValue,
                      min: min,
                      max: max,
                      divisions: 100,
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  double _currentSliderValue = 800;

  @override
  Widget build(BuildContext context) {
    return _buildCustomSpeedLoading(context);
  }
}
```

## API

1. [TLoading](#tloading)
2. [TLoadingController](#tloadingcontroller)
3. [TLoadingIcon](#tloadingicon)
4. [TLoadingThemeData](#tloadingthemedata)

### TLoading

#### 构造方法

##### TLoading

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| customIcon | Widget? | - | 自定义加载图标，优先于 `icon`，并按当前 Loading 动画时长持续旋转。 | 否 |
| icon | TLoadingIcon? | TLoadingIcon.circle | 预设图标，支持圆形、点状、菊花状；为 null 时不显示预设图标。 `customIcon` 不为 null 时仍优先显示自定义图标。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| refreshWidget | Widget? | - | 文案后的自定义操作内容 | 否 |
| size | double | 20 | 加载指示器的外部尺寸，单位为逻辑像素，默认为 20，必须大于 0。 | 否 |
| text | String? | - | 文案 | 否 |

### TLoadingController

用于命令式显示和关闭加载状态的控制器。

#### 构造方法

##### TLoadingController

无参数。

#### 静态方法

##### TLoadingController.dismiss

无参数。

移除并释放全局加载层；没有加载层时调用无效，可重复调用。

##### TLoadingController.show

位置参数：`context`

在 `context` 的 Overlay 中显示全局加载层。

已有加载层或找不到 Overlay 时不重复创建。`child` 非空时替代内置 TLoading；
否则使用 `size`、`icon` 和 `text` 构建加载内容，text 为空时读取资源代理。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 当前构建上下文，用于读取祖先配置。 | 是 |
| child | Widget? | - | 替代默认加载内容的自定义组件；为空时由 size、icon 和 text 构建 TLoading。 | 否 |
| size | double | 20 | 加载指示器的外部尺寸，单位为逻辑像素，默认为 20，必须大于 0。 | 否 |
| icon | TLoadingIcon? | TLoadingIcon.circle | 预设图标，支持圆形、点状、菊花状；为 null 时不显示预设图标。 `customIcon` 不为 null 时仍优先显示自定义图标。 | 否 |
| text | String? | - | 加载文案；为空时使用资源代理的 loading 文案。 | 否 |
| theme | TLoadingThemeData? | - | 仅作用于本次加载层，未提供时保留捕获的祖先主题。 | 否 |

### TLoadingIcon

Loading图标

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| circle | TLoadingIcon | - | 圆形 | - |
| point | TLoadingIcon | - | 点状 | - |
| activity | TLoadingIcon | - | 菊花状 | - |

### TLoadingThemeData

TLoading 组件级 ThemeExtension

通过 Theme 子树注入，控制子树的默认加载样式。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| axis | Axis? | - | 文案和图标相对方向 未配置时为 Axis.horizontal。 | 否 |
| duration | int? | - | 一次刷新的时间（毫秒），控制动画速度。 未指定时默认 `800`ms。 小于或等于 0 时归一化为 1 毫秒。 | 否 |
| iconColor | Color? | - | 图标颜色。 未指定时 circle / point 使用品牌主色，activity 使用主文字色； 不读取 Flutter ProgressIndicatorTheme 或 ColorScheme 的默认颜色。 | 否 |
| textColor | Color? | - | 文案颜色 未配置时使用 textColorPrimary Token。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [组件搭配使用](#组件搭配使用)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

### 何时使用

当打开新页面或操作完成后，等待加载时使用。

### 与页面布局相关

##### 当展示整个页面、或模块的加载进度时，通常放置在页面、模块的正中间。

![](https://tdesign.gtimg.com/site/design/mobile-guide/loading/loading-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/loading/loading-2.png)

### 组件搭配使用

##### 在信息流页面中，可结合下拉刷新使用，对未展示出来的最新内容进行加载。

![](https://tdesign.gtimg.com/site/design/mobile-guide/loading/loading-3.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/loading/loading-4.png)

### 推荐/慎用示例

##### 当加载时间较长，尤其是超过10秒的场景中，推荐使用进度条，向用户明确展示当前任务的进展，避免等待时间过长带来焦急的负面体验。

![](https://tdesign.gtimg.com/site/design/mobile-guide/loading/loading-5.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/loading/loading-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [下拉刷新](<PullDownRefresh 下拉刷新.md>) | 当需要对页面信息进行整体刷新或加载更多同类信息时使用。 |
