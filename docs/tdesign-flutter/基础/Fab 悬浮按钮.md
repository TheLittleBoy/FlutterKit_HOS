# Fab 悬浮按钮

> 当功能使用图标即可表意清楚时，可使用纯图标悬浮按钮，例如添加、发布。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/fab)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 纯图标悬浮按钮

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class FabIconOnlyExample extends StatelessWidget {
  const FabIconOnlyExample({super.key, required this.onSelected});

  final VoidCallback onSelected;

  static Widget buildFab(VoidCallback onPressed) {
    return TFab(onPressed: onPressed, semanticLabel: '增加');
  }

  @override
  Widget build(BuildContext context) => _selector('纯图标悬浮按钮');

  Widget _selector(String text) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: SizedBox(
      width: double.infinity,
      child: TButton(
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onSelected,
        child: Text(text),
      ),
    ),
  );
}
```

##### 图标加文字悬浮按钮

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class FabIconTextExample extends StatelessWidget {
  const FabIconTextExample({super.key, required this.onSelected});

  final VoidCallback onSelected;

  static Widget buildFab(VoidCallback onPressed) {
    return TFab(
      icon: const Icon(TIcons.share),
      text: '分享给朋友',
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) => _selector('图标加文字悬浮按钮');

  Widget _selector(String text) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: SizedBox(
      width: double.infinity,
      child: TButton(
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onSelected,
        child: Text(text),
      ),
    ),
  );
}
```

#### 组件样式

##### 可移动悬浮按钮

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class FabDraggableExample extends StatelessWidget {
  const FabDraggableExample({super.key, required this.onSelected});

  final VoidCallback onSelected;

  static Widget buildFab(VoidCallback onPressed) {
    return TFab(
      icon: const Icon(TIcons.gesture_press),
      text: '拖我',
      draggable: TFabDragAxis.all,
      yBounds: const TFabBounds(start: 0, end: 32),
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) => _selector('可移动悬浮按钮');

  Widget _selector(String text) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: SizedBox(
      width: double.infinity,
      child: TButton(
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onSelected,
        child: Text(text),
      ),
    ),
  );
}
```

##### 带自动收缩功能

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class FabCollapsibleExample extends StatelessWidget {
  const FabCollapsibleExample({super.key, required this.onSelected});

  final VoidCallback onSelected;

  static Widget buildFab(VoidCallback onPressed, {required bool scrolling}) {
    return TFab(
      right: scrolling ? 0 : 16,
      bottom: scrolling ? 64 : 24,
      onPressed: onPressed,
      child: scrolling
          ? const _CollapsedFabContent()
          : const _ExpandedFabContent(),
    );
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: SizedBox(
      width: double.infinity,
      child: TButton(
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onSelected,
        child: const Text('带自动收缩功能'),
      ),
    ),
  );
}

class _ExpandedFabContent extends StatelessWidget {
  const _ExpandedFabContent();

  @override
  Widget build(BuildContext context) => Container(
    width: 44,
    height: 156,
    padding: const EdgeInsets.symmetric(vertical: 8),
    decoration: ShapeDecoration(
      color: context.tTheme.bgColorContainer,
      shape: StadiumBorder(
        side: BorderSide(color: context.tTheme.componentBorder),
      ),
      shadows: context.tTheme.shadow2 ?? const [],
    ),
    child: const Column(
      children: [
        Expanded(
          child: _CollapsibleAction(icon: TIcons.add_circle, text: '添加'),
        ),
        SizedBox(height: 4),
        Expanded(
          child: _CollapsibleAction(icon: TIcons.star, text: '收藏'),
        ),
        SizedBox(height: 4),
        Expanded(
          child: _CollapsibleAction(icon: TIcons.jump, text: '分享'),
        ),
      ],
    ),
  );
}

class _CollapsibleAction extends StatelessWidget {
  const _CollapsibleAction({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) => SizedBox.expand(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(icon, size: 20, color: context.tTheme.textColorPrimary),
        TText(
          text,
          font: context.tTheme.fontBodySmall,
          style: TextStyle(color: context.tTheme.textColorPrimary),
        ),
      ],
    ),
  );
}

class _CollapsedFabContent extends StatelessWidget {
  const _CollapsedFabContent();

  @override
  Widget build(BuildContext context) => Container(
    width: 32,
    height: 32,
    decoration: ShapeDecoration(
      color: context.tTheme.bgColorContainer,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
        side: BorderSide(color: context.tTheme.componentBorder),
      ),
      shadows: context.tTheme.shadow2 ?? const [],
    ),
    alignment: Alignment.center,
    child: Icon(
      TIcons.chevron_left,
      size: 20,
      color: context.tTheme.textColorPrimary,
    ),
  );
}
```

## API

1. [TFab](#tfab)
2. [TFabBounds](#tfabbounds)
3. [TFabDragDetails](#tfabdragdetails)
4. [TFabDragAxis](#tfabdragaxis)
5. [TFabMagnet](#tfabmagnet)
6. [TFabDragCallback](#tfabdragcallback)
7. [TFabThemeData](#tfabthemedata)

### TFab

#### 构造方法

##### TFab

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| bottom | double? | - | 距父级 Stack 内容区底部偏移（默认 32） | 否 |
| child | Widget? | - | 自定义内容；有则替代默认内嵌 TButton。 自定义内容自行负责尺寸、形状、颜色和投影；`TFab` 继续负责定位、拖拽、 点击和禁用语义。 | 否 |
| draggable | TFabDragAxis? | - | 拖拽轴向；null 表示不启用拖拽，`TFabDragAxis.all` 表示全向拖拽 | 否 |
| icon | Widget? | - | 图标；未传时使用 TDesign add 图标。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| magnet | TFabMagnet? | - | 拖拽结束吸附方向；null 表示不吸附 | 否 |
| onDragEnd | TFabDragCallback? | - | 拖拽结束回调 | 否 |
| onDragStart | TFabDragCallback? | - | 拖拽开始回调 | 否 |
| onPressed | VoidCallback? | - | 点击回调，null 时禁用 | 否 |
| right | double? | - | 距父级 Stack 内容区右侧偏移（默认 16） | 否 |
| semanticLabel | String? | - | 读屏标签 | 否 |
| text | String | '' | 应作为 `Stack` 的直接子组件使用；默认动作层使用 large / fill / primary， 纯图标为圆形，图文为胶囊形，且不继承父级 TButtonThemeData。 图标 + 文字形态；非空时内嵌 TButton 为 round 形状 | 否 |
| tooltip | String? | - | 纯图标 Fab 的 tooltip 提示 | 否 |
| useSafeArea | bool | true | 是否避让系统安全区。 默认为 true。固定定位的 `right`、`bottom` 从安全边界起算； 拖拽与吸附范围同时避让四侧安全区。 | 否 |
| xBounds | TFabBounds? | - | 水平拖拽边界限制 | 否 |
| yBounds | TFabBounds? | - | 垂直拖拽边界限制 | 否 |

### TFabBounds

拖拽边界限制

`start` 和 `end` 必须是非负有限值。

#### 构造方法

##### TFabBounds

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| end | double | - | 终点留白（水平：right，垂直：bottom）。 | 是 |
| start | double | - | 起点留白（水平：left，垂直：top）。 | 是 |

### TFabDragDetails

拖拽回调详情

#### 构造方法

##### TFabDragDetails

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| end | DragEndDetails? | - | 拖拽结束详情 | 否 |
| position | Offset | - | 当前定位偏移，`dx` 为 right，`dy` 为 bottom。 | 是 |
| start | DragStartDetails? | - | 拖拽开始详情 | 否 |

### TFabDragAxis

拖拽轴向

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| all | TFabDragAxis | - | 允许水平和垂直方向拖拽 | - |
| vertical | TFabDragAxis | - | 仅允许垂直方向拖拽 | - |
| horizontal | TFabDragAxis | - | 仅允许水平方向拖拽 | - |

### TFabMagnet

吸附方向

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| left | TFabMagnet | - | 拖拽结束后吸附到左侧边界 | - |
| right | TFabMagnet | - | 拖拽结束后吸附到右侧边界 | - |

### TFabDragCallback

拖拽回调

位置参数：`details`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| details | TFabDragDetails | - | 当前 right/bottom 定位偏移及对应手势详情。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | void | - | 无返回值。 | - |

### TFabThemeData

Fab 定位层 ThemeExtension

仅管理 Fab 定位层的默认值（偏移、边界、拖拽阈值等）。
默认动作层固定使用 large / fill / primary；需要完整自定义动作层时使用
`TFab.child`。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| defaultBottom | double? | - | 距父级 Stack 底部的默认偏移；未设置时为 32 逻辑像素。 | 否 |
| defaultRight | double? | - | 距父级 Stack 右侧的默认偏移；未设置时为 16 逻辑像素。 | 否 |
| defaultXBounds | TFabBounds? | - | 默认水平拖拽边界；未设置时左右各保留 16 逻辑像素。 | 否 |
| defaultYBounds | TFabBounds? | - | 默认垂直拖拽边界；未设置时上下边界均为 0。 | 否 |
| dragTapSlop | double? | - | 点击与拖拽的判定阈值；未设置时为 18 逻辑像素。 按手势起点到当前位置的屏幕全方向最大位移判定，与 `TFabDragAxis` 限制的 位置更新轴向无关。 | 否 |
| magnetAnimationDuration | Duration? | - | 吸附动画时长；未设置时为 200 毫秒。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [组件搭配使用](#组件搭配使用)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

### 何时使用

当某个操作为全局操作，且为用户高频/业务强推的操作时可使用。

### 与页面布局相关

##### 为了避免遮挡页面中重要内容，通常将悬浮按钮放置于页面右下角，当页面中没有底部标签栏时，也可以考虑放置于中下位置。

![](https://tdesign.gtimg.com/site/design/mobile-guide/fab/fab-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/fab/fab-2.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/fab/fab-3.png)

### 组件搭配使用

##### 悬浮按钮与[动作面板](<../反馈/ActionSheet 动作面板.md>)组合使用，当触发悬浮按钮涉及的任务通过若干种方式达成，可以用动态面板来承载这若干种方式的操作。

![](https://tdesign.gtimg.com/site/design/mobile-guide/fab/fab-4.png)

### 推荐/慎用示例

##### 通常情况下页面中建议只使用一个悬浮按钮；若页面以地图、看板为主要场景，需要出现多个悬浮按钮时，建议通过样式区分主次、层级关系。

![](https://tdesign.gtimg.com/site/design/mobile-guide/fab/fab-5.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/fab/fab-6.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 图标加文字悬浮按钮上的字数建议精简，控制在2-4个字左右，避免遮挡过多页面内容。

![](https://tdesign.gtimg.com/site/design/mobile-guide/fab/fab-7.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/fab/fab-8.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [按钮](<Button 按钮.md>) | 当前流程的结束或新流程的开启需要用户点击触发时使用。 |
| [返回顶部](<../导航/BackTop 返回顶部.md>) | 当页面内容过长，用户有快速返回到页面顶部的诉求时使用。 |
