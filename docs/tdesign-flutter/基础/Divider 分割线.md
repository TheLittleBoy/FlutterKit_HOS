# Divider 分割线

> 用于分割、组织、细化有一定逻辑的组织元素内容和页面结构。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/divider)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 水平分割线

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DividerBaseExample extends StatelessWidget {
  const DividerBaseExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TDivider(),
          _sectionTitle(context, '带文字水平分割线'),
          const TDivider(child: Text('文字信息'), align: TDividerAlign.left),
          const TDivider(child: Text('文字信息')),
          const TDivider(child: Text('文字信息'), align: TDividerAlign.right),
          _sectionTitle(context, '垂直分割线'),
          const Padding(
            padding: EdgeInsetsDirectional.only(start: 16),
            child: Row(
              children: [
                Text('文字信息'),
                TDivider(layout: TDividerLayout.vertical),
                Text('文字信息'),
                TDivider(layout: TDividerLayout.vertical),
                Text('文字信息'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: context.tTheme.fontBodyMedium?.size,
          height: 20 / 14,
          fontWeight: context.tTheme.fontBodyMedium?.fontWeight,
          color: context.tTheme.textColorSecondary,
        ),
      ),
    );
  }
}
```

#### 组件状态

##### 虚线样式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DividerDashedExample extends StatelessWidget {
  const DividerDashedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TDivider(dashed: true),
          TDivider(
            dashed: true,
            child: Text('文字信息'),
            align: TDividerAlign.left,
          ),
          TDivider(dashed: true, child: Text('文字信息')),
          TDivider(
            dashed: true,
            child: Text('文字信息'),
            align: TDividerAlign.right,
          ),
        ],
      ),
    );
  }
}
```

## API

1. [TDivider](#tdivider)
2. [TDividerLayout](#tdividerlayout)
3. [TDividerAlign](#tdivideralign)
4. [TDividerThemeData](#tdividerthemedata)

### TDivider

#### 构造方法

##### TDivider

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| align | TDividerAlign? | - | 中间内容在线条中的位置，默认 `TDividerAlign.center` 仅 `TDividerLayout.horizontal` 生效 | 否 |
| child | Widget? | - | 中间子元素 纯文案用 `child: Text('……')` | 否 |
| dashed | bool? | - | 是否为虚线，默认 false 仅 `TDividerLayout.horizontal` 生效 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| layout | TDividerLayout? | - | 横/竖分割线，默认 `TDividerLayout.horizontal`。 竖向强制实线并忽略 align、child，默认高度 14、左右外边距 16 逻辑像素。 | 否 |

### TDividerLayout

分割线布局方向

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| horizontal | TDividerLayout | - | 水平分割线 | - |
| vertical | TDividerLayout | - | 垂直分割线 | - |

### TDividerAlign

中间内容在线条中的位置（仅 `TDividerLayout.horizontal` 生效）

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| left | TDividerAlign | - | 内容靠左 | - |
| center | TDividerAlign | - | 内容居中 | - |
| right | TDividerAlign | - | 内容靠右 | - |

### TDividerThemeData

TDivider 组件级 ThemeExtension

通过 Theme 子树注入，控制子树的默认样式。
布局、内容和虚线选择由实例控制；视觉值从本主题读取，未配置时回退
TDesign Token 或组件内置值，不读取 Material DividerTheme。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| color | Color? | - | 线条颜色；未设置时使用 `bgColorComponent` Token。 | 否 |
| endIndent | double? | - | 纯水平线结束侧缩进；未设置时为 0，带内容或垂直线时不生效。 | 否 |
| gapPadding | EdgeInsetsGeometry? | - | 线与中间内容之间的间距，默认左右各使用 `spacer1`（12dp）。 | 否 |
| indent | double? | - | 纯水平线起始侧缩进；未设置时为 0，带内容或垂直线时不生效。 | 否 |
| margin | EdgeInsetsGeometry? | - | 外边距。未设置时，水平分割线使用上下 10dp，垂直分割线使用左右 16dp。 | 否 |
| textStyle | TextStyle? | - | child 为文本时的默认样式，覆盖 `fontBodySmall` / `textColorPlaceholder` Token。 | 否 |
| thickness | double? | - | 线粗：横线 = 高度，竖线 = 宽度（默认 0.5） | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [推荐/慎用示例](#推荐-慎用示例)

### 何时使用

为了区分内容与内容之间的分组、层级关系时可使用。

### 与页面布局相关

##### 通栏分割线：横向贯穿整个页面，一般为了区分更加独立性的内容信息，让信息分隔的更明显，更加独立性。

![](https://tdesign.gtimg.com/site/design/mobile-guide/divider/divider-1.png)

---

##### 内嵌分割线：一般会在左侧或者右侧预留缺口，目的来区分统一模块下的相关内容，目的是为了让用户浏览大量相关内容时，更加高效。

![](https://tdesign.gtimg.com/site/design/mobile-guide/divider/divider-2.png)

---

##### 组合分割线：通栏分割线与内嵌分割线组合布局。

![](https://tdesign.gtimg.com/site/design/mobile-guide/divider/divider-3.png)

### 推荐/慎用示例

##### 当有明显的留白或副标题已经对内容起到分割作用时，要避免过度使用分割线导致的视觉干扰。

![](https://tdesign.gtimg.com/site/design/mobile-guide/divider/divider-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/divider/divider-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)
