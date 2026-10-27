# SwipeCell 滑动操作

> 为任意列表项内容提供起始侧和结束侧的滑动操作面板。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/swipe-cell)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 左滑操作

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SwipeCellSwiperCellExample extends StatelessWidget {
  const SwipeCellSwiperCellExample({super.key});

  Widget _buildSwiperCell(BuildContext context) {
    return Column(
      children: [
        TSwipeCell(
          end: TSwipeCellPanel(
            children: [_action(context, '删除', context.tTheme.errorColor)],
          ),
          child: const TCell(title: Text('左滑单操作'), note: Text('辅助信息')),
        ),
        const SizedBox(height: 16),
        TSwipeCell(
          end: TSwipeCellPanel(
            children: [_action(context, '删除', context.tTheme.errorColor)],
          ),
          child: const TCell(
            title: Text('左滑大列表'),
            note: Text('辅助信息'),
            subtitle: Text('一段很长很长的内容文字'),
            image: CircleAvatar(
              backgroundImage: AssetImage('assets/img/t_avatar_1.png'),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TSwipeCell(
          end: TSwipeCellPanel(
            children: [
              _action(context, '编辑', context.tTheme.warningColor),
              _action(context, '删除', context.tTheme.errorColor),
            ],
          ),
          child: const TCell(title: Text('左滑双操作'), note: Text('辅助信息')),
        ),
        const SizedBox(height: 16),
        TSwipeCell(
          end: TSwipeCellPanel(
            children: [
              _action(context, '收藏', context.tTheme.brandColor),
              _action(context, '编辑', context.tTheme.warningColor),
              _action(context, '删除', context.tTheme.errorColor),
            ],
          ),
          child: const TCell(title: Text('左滑多操作'), note: Text('辅助信息')),
        ),
      ],
    );
  }

  TSwipeCellAction _action(
    BuildContext context,
    String label,
    Color? color, {
    IconData? icon,
  }) {
    return TSwipeCellAction(backgroundColor: color, icon: icon, label: label);
  }

  @override
  Widget build(BuildContext context) {
    return _buildSwiperCell(context);
  }
}
```

##### 右滑操作

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SwipeCellSwiperRightCellExample extends StatelessWidget {
  const SwipeCellSwiperRightCellExample({super.key});

  Widget _buildSwiperRightCell(BuildContext context) {
    return TSwipeCell(
      start: TSwipeCellPanel(
        children: [_action(context, '选择', context.tTheme.brandColor)],
      ),
      child: const TCell(title: Text('右滑单操作'), note: Text('辅助信息')),
    );
  }

  TSwipeCellAction _action(
    BuildContext context,
    String label,
    Color? color, {
    IconData? icon,
  }) {
    return TSwipeCellAction(backgroundColor: color, icon: icon, label: label);
  }

  @override
  Widget build(BuildContext context) {
    return _buildSwiperRightCell(context);
  }
}
```

##### 左右滑操作

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SwipeCellSwiperRightLeftCellExample extends StatelessWidget {
  const SwipeCellSwiperRightLeftCellExample({super.key});

  Widget _buildSwiperRightLeftCell(BuildContext context) {
    return TSwipeCell(
      start: TSwipeCellPanel(
        children: [_action(context, '选择', context.tTheme.brandColor)],
      ),
      end: TSwipeCellPanel(
        children: [_action(context, '删除', context.tTheme.errorColor)],
      ),
      child: const TCell(title: Text('左右滑操作'), note: Text('辅助信息')),
    );
  }

  TSwipeCellAction _action(
    BuildContext context,
    String label,
    Color? color, {
    IconData? icon,
  }) {
    return TSwipeCellAction(backgroundColor: color, icon: icon, label: label);
  }

  @override
  Widget build(BuildContext context) {
    return _buildSwiperRightLeftCell(context);
  }
}
```

##### 带图标的滑动操作

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SwipeCellSwiperIconCellExample extends StatelessWidget {
  const SwipeCellSwiperIconCellExample({super.key});

  Widget _buildSwiperIconCell(BuildContext context) {
    return Column(
      children: [
        TSwipeCell(
          end: TSwipeCellPanel(
            children: [
              _action(
                context,
                '编辑',
                context.tTheme.warningColor,
                icon: TIcons.edit,
              ),
              _action(
                context,
                '删除',
                context.tTheme.errorColor,
                icon: TIcons.delete,
              ),
            ],
          ),
          child: const TCell(title: Text('左滑-带图标文本双操作'), note: Text('辅助信息')),
        ),
        const SizedBox(height: 16),
        TSwipeCell(
          end: TSwipeCellPanel(
            children: [
              TSwipeCellAction(
                backgroundColor: context.tTheme.warningColor,
                icon: TIcons.edit,
              ),
              TSwipeCellAction(
                backgroundColor: context.tTheme.errorColor,
                icon: TIcons.delete,
              ),
            ],
          ),
          child: const TCell(title: Text('左滑-仅带图标双操作'), note: Text('辅助信息')),
        ),
      ],
    );
  }

  TSwipeCellAction _action(
    BuildContext context,
    String label,
    Color? color, {
    IconData? icon,
  }) {
    return TSwipeCellAction(backgroundColor: color, icon: icon, label: label);
  }

  @override
  Widget build(BuildContext context) {
    return _buildSwiperIconCell(context);
  }
}
```

## API

1. [TSwipeCell](#tswipecell)
2. [TSwipeCellController](#tswipecellcontroller)
3. [TSwipeCellPanel](#tswipecellpanel)
4. [TSwipeCellAction](#tswipecellaction)
5. [TSwipeCellSide](#tswipecellside)
6. [TSwipeCellChanged](#tswipecellchanged)
7. [TSwipeCellThemeData](#tswipecellthemedata)

### TSwipeCell

#### 构造方法

##### TSwipeCell

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| child | Widget | - | 要增强为可滑动单元格的内容。 | 是 |
| closeOnScroll | bool | true | 祖先滚动容器开始滚动时是否关闭面板，默认为 true。 | 否 |
| controller | TSwipeCellController? | - | 命令式控制器。 | 否 |
| enabled | bool | true | 是否允许用户拖动，默认为 true。 仅控制用户拖动，不阻止控制器命令。 | 否 |
| end | TSwipeCellPanel? | - | 结束侧操作面板。 | 否 |
| initialOpenSide | TSwipeCellSide? | - | 首次布局后默认展开的面板；为空时保持关闭。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| onOpenChanged | TSwipeCellChanged? | - | 面板展开状态变化回调。 在展开状态改变时通知，早于动画结束；切换侧时先通知旧侧关闭，再通知新侧打开。 | 否 |
| start | TSwipeCellPanel? | - | 起始侧操作面板。 | 否 |

### TSwipeCellController

`TSwipeCell` 的命令式控制器。

一个控制器同一时间只能绑定一个 `TSwipeCell`。通常无需使用控制器，用户拖动、
点击操作项、点击单元格外部或滚动列表时，组件会自行管理展开状态。

#### 构造方法

##### TSwipeCellController

无参数。

#### 实例方法

##### TSwipeCellController.close

无参数。

关闭当前展开的操作面板。
动画结束、被后续命令打断或组件卸载取消时，Future 均会完成；不表示当前仍处于请求的目标状态。
未绑定组件时立即完成且不执行操作。

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Future<void> | - | 本次关闭动画完成或取消时结束；未绑定时立即完成。完成后面板可能已被后续命令重新打开。 | - |

##### TSwipeCellController.open

位置参数：`side`

展开指定侧的操作面板。
动画结束、被后续命令打断或组件卸载取消时，Future 均会完成；不表示当前仍处于请求的目标状态。
未绑定组件时立即完成且不执行操作。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| side | TSwipeCellSide | - | 需要展开的操作面板侧；该侧没有面板时关闭当前面板。 | 是 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Future<void> | - | 本次展开动画完成或取消时结束；未绑定时立即完成。完成后面板可能已被后续命令关闭。 | - |

### TSwipeCellPanel

滑动单元格操作面板。

#### 构造方法

##### TSwipeCellPanel

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| children | List<TSwipeCellAction> | - | 操作项列表。面板宽度由所有操作项的实际布局宽度自动确定。 列表必须非空。 | 是 |

#### 实例方法

##### TSwipeCellPanel.build

位置参数：`context`

构建操作项的横向布局，宽度由 `children` 的实际布局宽度决定。

操作项沿交叉轴拉伸；返回的布局由调用方放入滑动单元格。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 调用方的构建上下文；当前布局不读取其中的主题或尺寸。 | 是 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Widget | - | 由 children 横向排列、沿交叉轴拉伸的操作面板布局。 | - |

### TSwipeCellAction

滑动单元格操作项。

同一面板中的操作项可使用不同的颜色和文字样式。
未指定的图文视觉字段从全局 TDesign Token 取得默认值；
`TSwipeCellThemeData` 只提供共用内边距。
`builder` 自行绘制操作项，不能同时传入内置背景、图文或图文样式字段。

#### 构造方法

##### TSwipeCellAction

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 当前操作项背景颜色。 | 否 |
| builder | WidgetBuilder? | - | 自定义操作项。不可同时传入内置背景、图文或图文样式字段； 冲突配置会在构建时抛出 `FlutterError`，包括 release 构建。 其实际布局宽度会直接用于面板宽度，无需额外指定尺寸。 `onPressed` 仍负责点击回调，随后会自动关闭操作面板。 | 否 |
| icon | IconData? | - | 图标。 | 否 |
| iconColor | Color? | - | 图标颜色。 | 否 |
| iconLabelSpacing | double? | - | 图标和标签之间的水平间距，默认 8。 | 否 |
| iconSize | double? | - | 图标大小，默认 20。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| label | String? | - | 操作文字。 | 否 |
| labelStyle | TextStyle? | - | 操作文字样式。 | 否 |
| onPressed | void Function(BuildContext context)? | - | 点击回调。回调后组件会自动关闭操作面板。 | 否 |

### TSwipeCellSide

操作面板所在侧。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| start | TSwipeCellSide | - | 沿当前文字方向的起始侧；LTR 为左侧，RTL 为右侧。 | - |
| end | TSwipeCellSide | - | 沿当前文字方向的结束侧；LTR 为右侧，RTL 为左侧。 | - |

### TSwipeCellChanged

滑动展开状态变化回调。

位置参数：`side, isOpen`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| side | TSwipeCellSide | - | 发生变化的操作面板侧。 | 是 |
| isOpen | bool | - | 该侧面板是否展开。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | void | - | 无返回值。 | - |

### TSwipeCellThemeData

TSwipeCell 组件级 ThemeExtension

通过 Theme 子树注入操作项共享内边距；逐项图文样式由操作项实例控制。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| actionPadding | EdgeInsetsGeometry? | - | 操作项左右内边距。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

### 何时使用

需要针对列表项目进行某项低频的辅助操作时使用。

### 组件搭配使用

##### 与[单元格](<../数据展示/Cell 单元格.md>)、[按钮](<../基础/Button 按钮.md>)组合使用，单元格作为承载滑动操作的容器，左右滑动后展示操作项的按钮。

![](https://tdesign.gtimg.com/site/design/mobile-guide/swipe-cell/swipe-cell-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/swipe-cell/swipe-cell-2.png)

### 常见用法

##### 通常使用在对话列表、收藏列表、购物车等场景中，承载删除、收藏等辅助操作。

![](https://tdesign.gtimg.com/site/design/mobile-guide/swipe-cell/swipe-cell-3.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/swipe-cell/swipe-cell-4.png)

---

##### 通常左滑后展示删除按钮，若删除操作重要且无法撤回，可在滑动操作中对删除进行二次确认。

![](https://tdesign.gtimg.com/site/design/mobile-guide/swipe-cell/swipe-cell-5.png)

### 推荐/慎用示例

##### 左右滑动操作通常承载低频的辅助功能，不建议承载高频或过于复杂的功能。

![](https://tdesign.gtimg.com/site/design/mobile-guide/swipe-cell/swipe-cell-6.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 按钮的顺序、颜色使用需要符合用户预期。

![](https://tdesign.gtimg.com/site/design/mobile-guide/swipe-cell/swipe-cell-7.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 左滑的操作数不建议超过4个，右滑不建议超过1个，操作过多时应改用其它交互方式。

![](https://tdesign.gtimg.com/site/design/mobile-guide/swipe-cell/swipe-cell-8.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [按钮](<../基础/Button 按钮.md>) | 当前流程的结束或新流程的开启需要用户点击触发时使用。 |
