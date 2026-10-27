# Badge 徽标

> 用于告知用户，该区域的状态变化或者待处理任务的数量。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/badge)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 红点徽标

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DotMessageBadgeExample extends StatelessWidget {
  const DotMessageBadgeExample({super.key});

  Widget _buildDotMessageBadge(BuildContext context) => TBadge(
    variant: TBadgeVariant.dot,
    offset: const Offset(-1, 1),
    child: TText('消息', font: context.tTheme.fontBodyLarge),
  );

  Widget _buildDotIconBadge(BuildContext context) => const TBadge(
    variant: TBadgeVariant.dot,
    offset: Offset(-1, 1),
    child: Icon(TIcons.notification),
  );

  Widget _buildDotButtonBadge(BuildContext context) => TBadge(
    variant: TBadgeVariant.dot,
    offset: const Offset(-1, 1),
    child: TButton(
      size: TButtonSize.large,
      style: const ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 24)),
      ),
      onPressed: () {},
      child: const Text('按钮'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Builder(builder: _buildDotMessageBadge),
        const SizedBox(width: 48),
        Builder(builder: _buildDotIconBadge),
        const SizedBox(width: 48),
        Builder(builder: _buildDotButtonBadge),
      ],
    );
  }
}
```

##### 数字徽标

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class NumberMessageBadgeExample extends StatelessWidget {
  const NumberMessageBadgeExample({super.key});

  Widget _buildNumberMessageBadge(BuildContext context) => TBadge(
    label: '8',
    child: TText('消息', font: context.tTheme.fontBodyLarge),
  );

  Widget _buildNumberIconBadge(BuildContext context) =>
      const TBadge(label: '8', child: Icon(TIcons.notification));

  Widget _buildNumberButtonBadge(BuildContext context) => TBadge(
    label: '8',
    child: TButton(
      size: TButtonSize.large,
      style: const ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 24)),
      ),
      onPressed: () {},
      child: const Text('按钮'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Builder(builder: _buildNumberMessageBadge),
        const SizedBox(width: 48),
        Builder(builder: _buildNumberIconBadge),
        const SizedBox(width: 48),
        Builder(builder: _buildNumberButtonBadge),
      ],
    );
  }
}
```

##### 自定义徽标

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CustomBadgeExample extends StatelessWidget {
  const CustomBadgeExample({super.key});

  Widget _buildCustomBadge(BuildContext context) => TBadge.custom(
    badge: Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: context.tTheme.errorColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: TText(
        'NEW',
        font: context.tTheme.fontMarkExtraSmall,
        // 自定义内容自行控制单行留白，不由 TBadge 改写调用方排版。
        style: TextStyle(
          color: context.tTheme.textColorAnti,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    ),
    child: TButton(
      shape: TButtonShape.square,
      size: TButtonSize.large,
      icon: const Icon(TIcons.notification),
      onPressed: () {},
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _buildCustomBadge(context);
  }
}
```

#### 组件样式

##### 圆形徽标

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CircleBadgeExample extends StatelessWidget {
  const CircleBadgeExample({super.key});

  Widget _buildCircleBadge(BuildContext context) => const TBadge(
    label: '8',
    offset: Offset(2, -2),
    child: Icon(TIcons.notification),
  );

  @override
  Widget build(BuildContext context) {
    return _buildCircleBadge(context);
  }
}
```

##### 方形徽标

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SquareBadgeExample extends StatelessWidget {
  const SquareBadgeExample({super.key});

  Widget _buildSquareBadge(BuildContext context) => const TBadge(
    label: '8',
    variant: TBadgeVariant.square,
    offset: Offset(2, -2),
    child: Icon(TIcons.notification),
  );

  @override
  Widget build(BuildContext context) {
    return _buildSquareBadge(context);
  }
}
```

##### 气泡徽标

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class BubbleBadgeExample extends StatelessWidget {
  const BubbleBadgeExample({super.key});

  Widget _buildBubbleBadge(BuildContext context) => TBadge(
    label: '领取积分',
    variant: TBadgeVariant.bubble,
    offset: const Offset(8, 0),
    child: TButton(
      shape: TButtonShape.square,
      size: TButtonSize.large,
      icon: const Icon(TIcons.shop),
      onPressed: () {},
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _buildBubbleBadge(context);
  }
}
```

##### 角标

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class RibbonBadgeExample extends StatelessWidget {
  const RibbonBadgeExample({super.key});

  Widget _buildRibbonBadge(BuildContext context) => TCellGroup(
    cells: const [
      TCell(title: Text('单行标题')),
      TCell(title: Text('单行标题')),
    ],
    builder: (context, cell, index) => TBadge(
      label: 'NEW',
      variant: index == 0
          ? TBadgeVariant.ribbonLeft
          : TBadgeVariant.ribbonRight,
      size: TBadgeSize.large,
      child: cell,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _buildRibbonBadge(context);
  }
}
```

##### 三角角标

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TriangleBadgeExample extends StatelessWidget {
  const TriangleBadgeExample({super.key});

  Widget _buildTriangleBadge(BuildContext context) => TCellGroup(
    cells: const [
      TCell(title: Text('单行标题')),
      TCell(title: Text('单行标题')),
    ],
    builder: (context, cell, index) => TBadge(
      label: 'NEW',
      variant: index == 0
          ? TBadgeVariant.triangleLeft
          : TBadgeVariant.triangleRight,
      size: TBadgeSize.large,
      child: cell,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _buildTriangleBadge(context);
  }
}
```

#### 组件尺寸

##### Large

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class LargeBadgeExample extends StatelessWidget {
  const LargeBadgeExample({super.key});

  Widget _buildLargeBadge(BuildContext context) => const TBadge(
    label: '8',
    size: TBadgeSize.large,
    child: TAvatar(
      size: TAvatarSize.large,
      image: AssetImage('assets/img/t_avatar_1.png'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _buildLargeBadge(context);
  }
}
```

##### Medium

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class MediumBadgeExample extends StatelessWidget {
  const MediumBadgeExample({super.key});

  Widget _buildMediumBadge(BuildContext context) => const TBadge(
    label: '8',
    size: TBadgeSize.medium,
    child: TAvatar(
      size: TAvatarSize.medium,
      image: AssetImage('assets/img/t_avatar_1.png'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _buildMediumBadge(context);
  }
}
```

## API

1. [TBadge](#tbadge)
2. [TBadgeConfig](#tbadgeconfig)
3. [TBadgeVariant](#tbadgevariant)
4. [TBadgeSize](#tbadgesize)
5. [TBadgeThemeData](#tbadgethemedata)

### TBadge

#### 构造方法

##### TBadge

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| alignment | AlignmentGeometry? | - | 徽标相对 `child` 的对齐方式。 为空时使用组合组件提供的对齐位置，最终回退为逻辑 右上角 `AlignmentDirectional.topEnd`，在 RTL 下对应物理左上角。 ribbon、triangle 的方位已编码在 `variant` 中，不读取该字段。 当 `child` 为空时不参与布局。 | 否 |
| border | bool | false | 是否为徽标增加对比色描边，默认为 false，适用于全部形态。 | 否 |
| child | Widget? | - | 被徽标标记的内容；为空时徽标可独立展示。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| label | String? | '0' | 徽标实际展示的短文本，例如 `8`、`99+` 或 `NEW`。 文本形态下为 null 时隐藏徽标；`TBadgeVariant.dot` 不读取该字段。 | 否 |
| offset | Offset? | - | 相对默认锚点的逐实例位置偏移；未设置时使用组合组件提供的 默认偏移，最终回退为 `Offset.zero`。 显式值使用物理坐标：正 x 始终向右，RTL 下不会自动镜像。 默认徽标以中心点对齐内容的逻辑右上角，在 RTL 下对应物理左上角。 当 `child` 为空时不参与布局。 | 否 |
| onTap | GestureTapCallback? | - | 点击徽标及其 `child` 时触发；为空时不创建点击语义。 | 否 |
| showZero | bool | true | `label` 恰好为字符串 `0` 时是否显示徽标，默认为 true。 `TBadgeVariant.dot` 始终显示，不受该字段影响。 | 否 |
| size | TBadgeSize | TBadgeSize.medium | 徽标的预设尺寸，默认为 `TBadgeSize.medium`。 `TBadgeVariant.dot` 与 `TBadge.custom` 不读取该字段。 | 否 |
| variant | TBadgeVariant | TBadgeVariant.circle | 徽标的结构形态，默认为 `TBadgeVariant.circle`。 `TBadge.custom` 不读取该字段。 | 否 |

##### TBadge.custom

创建完全自定义外观的徽标；`badge` 是徽标本体，`child` 是可选锚点，未提供锚点时直接展示徽标本体。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| badge | Widget? | - | `TBadge.custom` 提供的完整徽标外观。 普通构造下为 null。该 Widget 仅表示徽标本体，不包含 `child`。 | 是 |
| alignment | AlignmentGeometry? | - | 徽标相对 `child` 的对齐方式。 为空时使用组合组件提供的对齐位置，最终回退为逻辑 右上角 `AlignmentDirectional.topEnd`，在 RTL 下对应物理左上角。 ribbon、triangle 的方位已编码在 `variant` 中，不读取该字段。 当 `child` 为空时不参与布局。 | 否 |
| offset | Offset? | - | 相对默认锚点的逐实例位置偏移；未设置时使用组合组件提供的 默认偏移，最终回退为 `Offset.zero`。 显式值使用物理坐标：正 x 始终向右，RTL 下不会自动镜像。 默认徽标以中心点对齐内容的逻辑右上角，在 RTL 下对应物理左上角。 当 `child` 为空时不参与布局。 | 否 |
| child | Widget? | - | 被徽标标记的内容；为空时徽标可独立展示。 | 否 |
| onTap | GestureTapCallback? | - | 点击徽标及其 `child` 时触发；为空时不创建点击语义。 | 否 |

#### 属性

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| badge | Widget? | - | `TBadge.custom` 提供的完整徽标外观。 普通构造下为 null。该 Widget 仅表示徽标本体，不包含 `child`。 | - |

### TBadgeConfig

由组合组件消费的徽标配置。

该对象不参与 Widget 树，也不拥有被标记的内容。仅当 TabBar、SideBar、
ActionSheet 等组件在内部创建徽标锚点时使用；组件会把配置和自己的锚点交给
与 `TBadge` 相同的渲染实现。

调用方已经拥有锚点 Widget 时，应直接使用 `TBadge`：

完全自定义徽标外观时使用 `TBadgeConfig.custom`。传入的 `badge` 是徽标本体，
不应包含锚点或自行使用 `Positioned` 定位。

#### 构造方法

##### TBadgeConfig

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| alignment | AlignmentGeometry? | - | 徽标相对锚点的对齐方式。 为空时使用消费组件的默认值。 ribbon、triangle 的方位已编码在 `variant` 中，不读取该字段。 | 否 |
| border | bool | false | 是否为预设徽标增加对比色描边，默认为 false。 `TBadgeConfig.custom` 不读取该字段。 | 否 |
| label | String? | '0' | 预设徽标展示的短文本，例如 `8`、`99+` 或 `NEW`。 文本形态下为 null 时隐藏徽标；`TBadgeVariant.dot` 不读取该字段。 `TBadgeConfig.custom` 下固定为 null。 | 否 |
| offset | Offset? | - | 在最终对齐位置上追加的偏移。 为空时使用消费组件的默认值。 显式值使用物理坐标：正 x 始终向右，RTL 下不会自动镜像；消费组件仅会 根据最终生效的 `alignment` 转换自己提供的默认偏移。 ribbon、triangle 始终贴住锚点的物理左上角或右上角，但仍读取该偏移。 | 否 |
| showZero | bool | true | `label` 恰好为字符串 `0` 时是否显示，默认为 true。 `TBadgeVariant.dot` 与 `TBadgeConfig.custom` 不读取该字段。 | 否 |
| size | TBadgeSize | TBadgeSize.medium | 预设徽标尺寸，默认为 `TBadgeSize.medium`。 `TBadgeVariant.dot` 与 `TBadgeConfig.custom` 不读取该字段。 | 否 |
| variant | TBadgeVariant | TBadgeVariant.circle | 预设徽标的结构形态，默认为 `TBadgeVariant.circle`。 `TBadgeConfig.custom` 不读取该字段。 | 否 |

##### TBadgeConfig.custom

创建完全自定义外观的徽标配置。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| badge | Widget? | - | 仅定义徽标本体；最终锚点和默认位置由消费该配置的组合组件决定。 | 是 |
| alignment | AlignmentGeometry? | - | 徽标相对锚点的对齐方式。 为空时使用消费组件的默认值。 ribbon、triangle 的方位已编码在 `variant` 中，不读取该字段。 | 否 |
| offset | Offset? | - | 在最终对齐位置上追加的偏移。 为空时使用消费组件的默认值。 显式值使用物理坐标：正 x 始终向右，RTL 下不会自动镜像；消费组件仅会 根据最终生效的 `alignment` 转换自己提供的默认偏移。 ribbon、triangle 始终贴住锚点的物理左上角或右上角，但仍读取该偏移。 | 否 |

#### 属性

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| badge | Widget? | - | `TBadgeConfig.custom` 提供的完整徽标外观。 普通构造下为 null。该 Widget 不包含锚点，定位由消费组件负责。 | - |
| isCustom | bool | - | 当前配置是否使用完全自定义徽标外观。 | - |

### TBadgeVariant

徽标的结构形态；尺寸与描边分别由 `TBadge.size`、`TBadge.border` 控制。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| circle | TBadgeVariant | - | 标准文本徽标；单字符呈圆形，多字符随内容扩展为胶囊形。 | - |
| dot | TBadgeVariant | - | 不显示文本的圆点徽标，默认直径为 8 逻辑像素。 | - |
| square | TBadgeVariant | - | 小圆角方形文本徽标；多字符时随内容横向扩展为矩形。 圆角读取全局 radiusSmall，默认3逻辑像素。 | - |
| bubble | TBadgeVariant | - | 左下角收紧、其余角为圆角的气泡徽标。 | - |
| ribbonRight | TBadgeVariant | - | 位于内容物理右上角的带状角标；RTL 下不交换方位。 | - |
| ribbonLeft | TBadgeVariant | - | 位于内容物理左上角的带状角标；RTL 下不交换方位。 | - |
| triangleRight | TBadgeVariant | - | 位于内容物理右上角的三角角标；RTL 下不交换方位。 | - |
| triangleLeft | TBadgeVariant | - | 位于内容物理左上角的三角角标；RTL 下不交换方位。 | - |

### TBadgeSize

徽标的预设尺寸，控制文本徽标的文字 Token、标签行盒高度与水平内边距。

`TBadgeVariant.dot` 的直径由 `TBadgeThemeData.dotSize` 控制，不读取该值；
角标形态会按该值在 32 与 40 逻辑像素两档尺寸之间切换。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| medium | TBadgeSize | - | 中尺寸，使用 `fontMarkExtraSmall` 与 16 逻辑像素标签行盒。 | - |
| large | TBadgeSize | - | 大尺寸，使用 `fontMarkSmall` 与 20 逻辑像素标签行盒。 | - |

### TBadgeThemeData

TDesign 徽标的子树级视觉默认值。

形态、内容、对齐和偏移由实例 API 控制，不从 Material BadgeTheme 读取。

子树气泡圆角配置示例：

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 徽标背景色；为空时使用全局错误色 Token。 | 否 |
| borderColor | Color? | - | 开启描边时使用的颜色；为空时回退到当前容器背景色。 | 否 |
| borderWidth | double? | - | 开启描边时使用的宽度；为空时使用 1 逻辑像素。 | 否 |
| bubbleBorderRadius | BorderRadiusGeometry? | - | 气泡徽标的四角圆角，仅对 bubble 形态生效。 未设置时左上、右上、右下为 10dp，左下为 1dp；不引用全局圆角。 支持 BorderRadiusDirectional，按当前文字方向解析。 | 否 |
| dotSize | double? | - | 圆点直径；为空时读取 size4，默认 8 逻辑像素。 | 否 |
| labelHeight | double? | - | 文字徽标高度；为空时由当前尺寸的字体 Token 决定。 | 否 |
| padding | EdgeInsetsGeometry? | - | 文字徽标内边距；为空时中、大尺寸分别使用左右 4、6 逻辑像素。 | 否 |
| textStyle | TextStyle? | - | 徽标文字的唯一组件级样式入口；未配置字段从字体与反色文字 Token 取得。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

### 何时使用

当需要展示特定对象的状态变化或承载运营性质提示时使用。

### 组件搭配使用

##### 徽标与[选项卡](<../导航/Tabs 选项卡.md>)、[底部标签栏](<../导航/TabBar 标签栏.md>)组合使用，置于文字段的右上方，用于展示状态信息或营销信息。

![](https://tdesign.gtimg.com/site/design/mobile-guide/badge/badge-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/badge/badge-2.png)

---

##### 徽标与[头像](<Avatar 头像.md>)组合使用，可作为消息提示或数量提示。

![](https://tdesign.gtimg.com/site/design/mobile-guide/badge/badge-3.png)

### 常见用法

##### 当用户只需要关注是否有消息，而无需关注消息数量时，可使用红点型徽标；当提示的信息需要精确显示数量时，应使用带数字的徽标。

![](https://tdesign.gtimg.com/site/design/mobile-guide/badge/badge-4.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/badge/badge-5.png)

### 推荐/慎用示例

##### 建议根据场景和信息类型定义最长字数，不宜出现过长的情况。

![](https://tdesign.gtimg.com/site/design/mobile-guide/badge/badge-6.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/badge/badge-7.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [标签](<Tag 标签.md>) | 当需要展示内容本身的属性、状态、类别、营销情况时作为纯展示使用；或者当大量的内容数据需要根据类型进行选择筛选时使用。 |
