# Avatar 头像

> 用于展示用户头像信息，除了纯展示也可点击进入个人详情等操作。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/avatar)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 图片头像

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ImageAvatarExample extends StatelessWidget {
  const ImageAvatarExample({super.key});

  /// 图片头像
  Widget _buildImageAvatar(BuildContext context) {
    return const Row(
      // spacing: 32,
      children: [
        TAvatar(
          size: TAvatarSize.medium,
          image: AssetImage('assets/img/t_avatar_1.png'),
        ),
        SizedBox(width: 32),
        TAvatar(
          size: TAvatarSize.medium,
          shape: TAvatarShape.square,
          image: AssetImage('assets/img/t_avatar_1.png'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildImageAvatar(context);
  }
}
```

##### 字符头像

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextAvatarExample extends StatelessWidget {
  const TextAvatarExample({super.key});

  /// 字符头像
  Widget _buildTextAvatar(BuildContext context) {
    return Theme(
      data: Theme.of(context).mergeExtension(
        TAvatarThemeData(
          backgroundColor: context.tTheme.brandColor,
          foregroundColor: context.tTheme.whiteColor1,
        ),
      ),
      child: const Row(
        // spacing: 32,
        children: [
          TAvatar(size: TAvatarSize.medium, child: Text('A')),
          SizedBox(width: 32),
          TAvatar(
            size: TAvatarSize.medium,
            shape: TAvatarShape.square,
            child: Text('A'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTextAvatar(context);
  }
}
```

##### 图标头像

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class IconAvatarExample extends StatelessWidget {
  const IconAvatarExample({super.key});

  /// 图标头像
  Widget _buildIconAvatar(BuildContext context) {
    return const Row(
      // spacing: 32,
      children: [
        TAvatar(size: TAvatarSize.medium),
        SizedBox(width: 32),
        TAvatar(size: TAvatarSize.medium, shape: TAvatarShape.square),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildIconAvatar(context);
  }
}
```

##### 带徽标头像

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class BadgeAvatarExample extends StatelessWidget {
  const BadgeAvatarExample({super.key});

  /// 带徽标头像
  Widget _buildBadgeAvatar(BuildContext context) {
    return Row(
      // spacing: 32,
      children: [
        Theme(
          data: Theme.of(context).mergeExtension(
            const TBadgeThemeData(dotSize: 10),
          ),
          child: const TBadge(
            variant: TBadgeVariant.dot,
            offset: Offset(-1, 2),
            child: TAvatar(
              size: TAvatarSize.medium,
              image: AssetImage('assets/img/t_avatar_1.png'),
            ),
          ),
        ),
        const SizedBox(width: 32),
        Theme(
          data: Theme.of(context).mergeExtension(
            TAvatarThemeData(
              backgroundColor: context.tTheme.brandColor,
              foregroundColor: context.tTheme.whiteColor1,
            ),
          ),
          child: const TBadge(
            label: '8',
            offset: Offset(-5, 6),
            child: TAvatar(size: TAvatarSize.medium, child: Text('A')),
          ),
        ),
        const SizedBox(width: 32),
        const TBadge(
          label: '12',
          offset: Offset(-5, 6),
          child: TAvatar(size: TAvatarSize.medium),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBadgeAvatar(context);
  }
}
```

#### 特殊类型

##### 纯展示的头像组

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DisplayAvatarExample extends StatelessWidget {
  const DisplayAvatarExample({super.key});

  /// 纯展示的头像组
  Widget _buildDisplayAvatar(BuildContext context) {
    return const TAvatarGroup(
      maxCount: 5,
      overflow: TAvatar(child: Text('+2')),
      children: [
        TAvatar(image: AssetImage('assets/img/t_avatar_1.png')),
        TAvatar(image: AssetImage('assets/img/t_avatar_3.png')),
        TAvatar(image: AssetImage('assets/img/t_avatar_4.png')),
        TAvatar(image: AssetImage('assets/img/t_avatar_2.png')),
        TAvatar(image: AssetImage('assets/img/t_avatar_5.png')),
        TAvatar(image: AssetImage('assets/img/t_avatar_1.png')),
        TAvatar(image: AssetImage('assets/img/t_avatar_2.png')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDisplayAvatar(context);
  }
}
```

##### 带操作的头像组

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class OperationAvatarExample extends StatelessWidget {
  const OperationAvatarExample({super.key});

  /// 带操作的头像组
  Widget _buildOperationAvatar(BuildContext context) {
    return TAvatarGroup(
      cascading: TAvatarGroupCascading.endUp,
      children: [
        const TAvatar(image: AssetImage('assets/img/t_avatar_1.png')),
        const TAvatar(image: AssetImage('assets/img/t_avatar_3.png')),
        const TAvatar(image: AssetImage('assets/img/t_avatar_4.png')),
        const TAvatar(image: AssetImage('assets/img/t_avatar_2.png')),
        const TAvatar(image: AssetImage('assets/img/t_avatar_5.png')),
        TAvatar(
          child: const Icon(TIcons.user_add),
          onTap: () => TToast.showText('点击了操作', context: context),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildOperationAvatar(context);
  }
}
```

#### 组件尺寸

##### 组件尺寸

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SizeAvatarExample extends StatelessWidget {
  const SizeAvatarExample({super.key});

  /// 组件尺寸
  Widget _buildSizeAvatar(BuildContext context) {
    Widget avatarRow(TAvatarSize size) {
      return Row(
        children: [
          TAvatar(
            size: size,
            image: const AssetImage('assets/img/t_avatar_1.png'),
          ),
          const SizedBox(width: 32),
          Theme(
            data: Theme.of(context).mergeExtension(
              TAvatarThemeData(
                backgroundColor: context.tTheme.brandColor,
                foregroundColor: context.tTheme.whiteColor1,
              ),
            ),
            child: TAvatar(size: size, child: const Text('A')),
          ),
          const SizedBox(width: 32),
          TAvatar(size: size),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        avatarRow(TAvatarSize.large),
        const SizedBox(height: 24),
        avatarRow(TAvatarSize.medium),
        const SizedBox(height: 24),
        avatarRow(TAvatarSize.small),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSizeAvatar(context);
  }
}
```

## API

1. [TAvatar](#tavatar)
2. [TAvatarGroup](#tavatargroup)
3. [TAvatarSize](#tavatarsize)
4. [TAvatarShape](#tavatarshape)
5. [TAvatarGroupCascading](#tavatargroupcascading)
6. [TAvatarThemeData](#tavatarthemedata)

### TAvatar

#### 构造方法

##### TAvatar

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| child | Widget? | - | 自定义头像内容。 | 否 |
| fit | BoxFit | BoxFit.cover | 图片填充方式。 | 否 |
| image | ImageProvider<Object>? | - | 头像图片。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| onTap | GestureTapCallback? | - | 点击回调；为空时头像不创建点击行为。 | 否 |
| shape | TAvatarShape? | - | 头像形状；未设置时使用圆形默认值。 | 否 |
| size | TAvatarSize? | - | 头像尺寸；未设置时继承所在头像组的尺寸，独立使用时默认为中号。 | 否 |

### TAvatarGroup

叠放头像组。

头像组只负责布局，不解析图片来源或缓存成员状态。
当成员是 `TAvatar` 时，其 `TAvatar.shape` 同时决定成员外框与裁剪形状；
其他 Widget 使用圆形默认值。
组尺寸由首个可见且显式设置 `TAvatar.size` 的成员确定，未设置时为中号；
成员自己的显式尺寸始终优先，未设置的成员和折叠头像继承组尺寸。
默认按 8 逻辑像素重叠，所有成员使用按尺寸区分的描边与阴影；
可通过 `TAvatarThemeData` 调整这些视觉值。

#### 构造方法

##### TAvatarGroup

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| cascading | TAvatarGroupCascading | TAvatarGroupCascading.endUp | 头像组成员的层叠方向，使用 start/end 语义并跟随文字方向。 | 否 |
| children | List<Widget> | - | 头像列表。 | 是 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| maxCount | int? | - | 最多显示的原始头像数量；为空时显示全部，非空时必须大于 0。 若发生截断且提供了 `overflow`，会额外显示一个折叠头像。 | 否 |
| overflow | Widget? | - | 发生截断时显示在末尾的内容。 | 否 |
| spacing | double? | - | 相邻头像的重叠宽度；非空时必须是有限、非负值，布局时限制到成员边长。 为空时使用组件主题，最终回退为 8 逻辑像素。 | 否 |

### TAvatarSize

头像尺寸。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| large | TAvatarSize | - | 大尺寸。 | - |
| medium | TAvatarSize | - | 中尺寸。 | - |
| small | TAvatarSize | - | 小尺寸。 | - |

### TAvatarShape

头像形状。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| circle | TAvatarShape | - | 圆形头像。 | - |
| square | TAvatarShape | - | 方形头像。 | - |

### TAvatarGroupCascading

头像组的层叠方向。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| startUp | TAvatarGroupCascading | - | 起始侧头像位于上层。 | - |
| endUp | TAvatarGroupCascading | - | 结束侧头像位于上层。 | - |

### TAvatarThemeData

头像组件级 ThemeExtension。

仅保存视觉默认值，不保存头像内容、回调或头像组成员。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 默认背景色；未设置时回退全局 `brandColorLightActive`。 | 否 |
| circleBorderRadius | double? | - | 圆形头像圆角；未设置时回退全局 `radiusCircle`（逻辑像素）。 | 否 |
| dimension | double? | - | 自定义头像边长；未设置时使用全局 size12/size13/size15，默认小、中、大为 40/48/64 逻辑像素。 | 否 |
| foregroundColor | Color? | - | 默认图标与继承文字的前景色；未设置时回退全局品牌色。 | 否 |
| groupBorderColor | Color? | - | 头像组成员描边颜色；未设置时使用 `bgColorContainer` Token。 | 否 |
| groupBorderWidth | double? | - | 头像组成员描边宽度。 未设置时按成员尺寸使用小/中/大 1/2/3 逻辑像素。 | 否 |
| groupShadow | BoxShadow? | - | 头像组成员阴影；未设置时使用 1px 水平偏移、2px `blurRadius` 和 15% 黑色。 | 否 |
| groupSpacing | double? | - | 头像组重叠宽度；未设置时为 8 逻辑像素，实例 spacing 优先。 | 否 |
| iconSize | double? | - | 默认图标大小；未设置时小档为 20，中、大档分别读取 size8、size10（默认 24、32）。 | 否 |
| squareBorderRadius | double? | - | 方形头像圆角；未设置时回退全局 `radiusDefault`（默认 6 逻辑像素）。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)

### 何时使用

作为一个用户信息展示，或用来代表某个/某些具体用户。

### 组件搭配使用

##### 头像与[动作面板](<../反馈/ActionSheet 动作面板.md>) 组合使用，在分享场景中利用动作面板承载用户头像，用于分享对象的选择。

![](https://tdesign.gtimg.com/site/design/mobile-guide/avatar/avatar-1.png)

---

##### 头像与[单元格](<Cell 单元格.md>) 组合使用，用于展示结构化的成员名称及信息，方便快速识别。

![](https://tdesign.gtimg.com/site/design/mobile-guide/avatar/avatar-2.png)

---

##### 头像与[徽标](<Badge 徽标.md>) 组合使用，可作为消息提示或人员数量提示等。

![](https://tdesign.gtimg.com/site/design/mobile-guide/avatar/avatar-3.png)

### 常见用法

##### 多个头像可组合展示构成头像组；当页面布局空间有限，超过可外显个数时候，可将重复性较高的头像信息做隐藏收起，需要时再让用户主动触发查看。

![](https://tdesign.gtimg.com/site/design/mobile-guide/avatar/avatar-4.png)

### 推荐/慎用示例

##### 对于字符型头像，需要根据场景定义最大字符数，避免字符过多影响可读性，降低可识别度。

![](https://tdesign.gtimg.com/site/design/mobile-guide/avatar/avatar-5.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/avatar/avatar-6.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)
