# Tabs 选项卡

> 用于内容分类后的展示切换。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/tabs)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 均分选项卡

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TabsItemWithSplit1Example extends StatelessWidget {
  const TabsItemWithSplit1Example({super.key});

  Widget _buildItemWithSplit1(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: TTabsBar(
        tabs: [
          TTab(text: '选项'),
          TTab(text: '选项'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildItemWithSplit1(context);
  }
}
```

##### `TabsItemWithSplit2Example`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TabsItemWithSplit2Example extends StatelessWidget {
  const TabsItemWithSplit2Example({super.key});

  Widget _buildItemWithSplit2(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: TTabsBar(
        tabs: [
          TTab(text: '选项'),
          TTab(text: '选项'),
          TTab(text: '上限六个文字'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildItemWithSplit2(context);
  }
}
```

##### `TabsItemWithSplit3Example`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TabsItemWithSplit3Example extends StatelessWidget {
  const TabsItemWithSplit3Example({super.key});

  Widget _buildItemWithSplit3(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: TTabsBar(
        tabs: [
          TTab(text: '选项'),
          TTab(text: '选项'),
          TTab(text: '选项'),
          TTab(text: '上限四字'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildItemWithSplit3(context);
  }
}
```

##### `TabsItemWithSplit4Example`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TabsItemWithSplit4Example extends StatelessWidget {
  const TabsItemWithSplit4Example({super.key});

  Widget _buildItemWithSplit4(BuildContext context) {
    return const DefaultTabController(
      length: 5,
      child: TTabsBar(
        tabs: [
          TTab(text: '选项'),
          TTab(text: '选项'),
          TTab(text: '选项'),
          TTab(text: '选项'),
          TTab(text: '上限四字'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildItemWithSplit4(context);
  }
}
```

##### 等距选项卡

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TabsItemWithSpaceExample extends StatelessWidget {
  const TabsItemWithSpaceExample({super.key});

  Widget _buildItemWithSpace(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: TTabsBar(tabs: List.generate(6, (_) => const TTab(text: '选项'))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildItemWithSpace(context);
  }
}
```

##### 带图标选项卡

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TabsItemWithIconExample extends StatelessWidget {
  const TabsItemWithIconExample({super.key});

  Widget _buildItemWithIcon(BuildContext context) {
    final tabs = List.generate(
      3,
      (_) => const TTab(text: '选项', icon: Icon(TIcons.app, size: 18)),
    );
    return DefaultTabController(
      length: tabs.length,
      child: TTabsBar(tabs: tabs),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildItemWithIcon(context);
  }
}
```

##### 带徽标选项卡

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TabsItemWithLogoExample extends StatelessWidget {
  const TabsItemWithLogoExample({super.key});

  Widget _buildItemWithLogo(BuildContext context) {
    const tabs = [
      TTab(
        child: TBadge(
          variant: TBadgeVariant.dot,
          offset: Offset(-4, 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(TIcons.app, size: 18),
              SizedBox(width: 4),
              Text('选项'),
            ],
          ),
        ),
      ),
      TTab(
        child: TBadge(
          label: '8',
          offset: Offset(-1, 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(TIcons.app, size: 18),
              SizedBox(width: 4),
              Text('选项'),
            ],
          ),
        ),
      ),
      TTab(text: '选项', icon: Icon(TIcons.app, size: 18)),
    ];
    return DefaultTabController(
      length: tabs.length,
      child: const TTabsBar(tabs: tabs),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildItemWithLogo(context);
  }
}
```

##### 带内容区选项卡

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TabsItemWithContentExample extends StatelessWidget {
  const TabsItemWithContentExample({super.key});

  Widget _buildItemWithContent(BuildContext context) {
    final contentColor = context.tTheme.textColorPlaceholder;
    return SizedBox(
      height: 168,
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            const TTabsBar(
              tabs: [
                TTab(text: '选项一'),
                TTab(text: '选项二'),
                TTab(text: '选项三'),
                TTab(text: '选项四'),
              ],
            ),
            Expanded(
              child: TTabsBarView(
                children: [
                  Center(
                    child: TText('内容区', style: TextStyle(color: contentColor)),
                  ),
                  Center(
                    child: TText('内容区', style: TextStyle(color: contentColor)),
                  ),
                  Center(
                    child: TText('内容区', style: TextStyle(color: contentColor)),
                  ),
                  Center(
                    child: TText('内容区', style: TextStyle(color: contentColor)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildItemWithContent(context);
  }
}
```

#### 组件状态

##### 选项卡状态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TabsItemWithStatusExample extends StatelessWidget {
  const TabsItemWithStatusExample({super.key});

  Widget _buildItemWithStatus(BuildContext context) {
    const tabs = [
      TTab(text: '选中'),
      TTab(text: '默认'),
      TTab(text: '禁用', enabled: false),
    ];
    return const DefaultTabController(length: 3, child: TTabsBar(tabs: tabs));
  }

  @override
  Widget build(BuildContext context) {
    return _buildItemWithStatus(context);
  }
}
```

#### 组件样式

##### 选项卡尺寸

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TabsItemWithSizeSmallExample extends StatelessWidget {
  const TabsItemWithSizeSmallExample({super.key});

  Widget _buildItemWithSizeSmall(BuildContext context) {
    const tabs = [
      TTab(text: '小尺寸'),
      TTab(text: '选项'),
      TTab(text: '选项'),
      TTab(text: '选项'),
    ];
    return const DefaultTabController(length: 4, child: TTabsBar(tabs: tabs));
  }

  @override
  Widget build(BuildContext context) {
    return _buildItemWithSizeSmall(context);
  }
}
```

##### `TabsItemWithSizeLargeExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TabsItemWithSizeLargeExample extends StatelessWidget {
  const TabsItemWithSizeLargeExample({super.key});

  Widget _buildItemWithSizeLarge(BuildContext context) {
    const tabs = [
      TTab(text: '大尺寸'),
      TTab(text: '选项'),
      TTab(text: '选项'),
      TTab(text: '选项'),
    ];
    return const DefaultTabController(
      length: 4,
      child: TTabsBar(tabs: tabs, size: TTabsBarSize.large),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildItemWithSizeLarge(context);
  }
}
```

##### 选项卡样式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TabsItemWithLineExample extends StatelessWidget {
  const TabsItemWithLineExample({super.key});

  Widget _buildItemWithLine(BuildContext context) {
    const tabs = [
      TTab(text: '选项'),
      TTab(text: '选项'),
      TTab(text: '选项'),
      TTab(text: '选项'),
    ];
    return const DefaultTabController(length: 4, child: TTabsBar(tabs: tabs));
  }

  @override
  Widget build(BuildContext context) {
    return _buildItemWithLine(context);
  }
}
```

##### `TabsItemWithTagExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TabsItemWithTagExample extends StatelessWidget {
  const TabsItemWithTagExample({super.key});

  Widget _buildItemWithTag(BuildContext context) {
    const tabs = [
      TTab(text: '选项'),
      TTab(text: '选项'),
      TTab(text: '选项'),
      TTab(text: '选项'),
    ];
    return const DefaultTabController(
      length: 4,
      child: TTabsBar(tabs: tabs, variant: TTabsBarVariant.tag),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildItemWithTag(context);
  }
}
```

## API

1. [TTabsBar](#ttabsbar)
2. [TTab](#ttab)
3. [TTabsBarView](#ttabsbarview)
4. [TTabsBarIndicator](#ttabsbarindicator)
5. [TTabsBarVariant](#ttabsbarvariant)
6. [TTabsBarSize](#ttabsbarsize)
7. [TTabsBarThemeData](#ttabsbarthemedata)

### TTabsBar

#### 构造方法

##### TTabsBar

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| controller | TabController? | - | 可选的标签控制器；为空时使用最近的 `DefaultTabController`。 仅在需要读取当前索引、命令式切换或跨组件共享状态时显式传入。 必须存在显式控制器或祖先 DefaultTabController，其 length 须等于 tabs.length。显式控制器由调用方释放。 | 否 |
| isScrollable | bool | false | 是否横向滚动。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| onTap | ValueChanged<int>? | - | 点击事件 仅用于点击通知；为 null 时仍可切换标签，禁用单项请使用 TTab.enabled。 | 否 |
| size | TTabsBarSize | TTabsBarSize.small | 选项卡文字尺寸，默认为 `TTabsBarSize.small`。 | 否 |
| tabs | List<TTab> | - | tab数组 | 是 |
| variant | TTabsBarVariant | TTabsBarVariant.line | 选项卡结构形态，默认为 `TTabsBarVariant.line`。 | 否 |

### TTab

Tab 组件

TDesign 选项卡标签，通常作为 `TTabsBar.tabs` 的子项使用。

#### 构造方法

##### TTab

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| child | Widget? | - | 自定义标签内容；与 text 互斥，可与 icon 同时提供。 | 否 |
| enabled | bool | true | 是否可用，默认 true。 设为 `false` 时使用禁用样式，并由 `TTabsBar` 阻止该项被选择。 Material `TabBar` 不识别此扩展字段；直接将 `TTab` 用作 Material `TabBar.tabs` 时只会呈现禁用样式，不会阻止其切换。 | 否 |
| icon | Widget? | - | 图标 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| text | String? | - | 文字内容；与 child 互斥，text、child、icon 至少提供一个。 | 否 |

### TTabsBarView

TabBarView 组件

展示与标签栏控制器同步的分页内容。
`physics` 为空时默认不可滑动。

#### 构造方法

##### TTabsBarView

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| children | List<Widget> | - | 子widget列表 | 是 |
| controller | TabController? | - | 可选的内容区控制器；为空时使用最近的 `DefaultTabController`。 与 `TTabsBar` 放在同一 `DefaultTabController` 下即可共享选中状态。 必须存在显式控制器或祖先 DefaultTabController，其 length 须等于 children.length。显式控制器由调用方释放。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| physics | ScrollPhysics? | - | 滑动物理特性；未传时默认不可滑动。 | 否 |

### TTabsBarIndicator

TDesign自定义下标

#### 构造方法

##### TTabsBarIndicator

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| indicatorColor | Color | - | 指示器颜色 | 是 |
| indicatorHeight | double? | - | 指示器高度 | 否 |
| indicatorWidth | double? | - | 指示器宽度 | 否 |

### TTabsBarVariant

TabsBar 形态枚举。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| line | TTabsBarVariant | - | 底部指示器样式。 | - |
| tag | TTabsBarVariant | - | 胶囊标签样式。 | - |
| card | TTabsBarVariant | - | 卡片样式。 | - |

### TTabsBarSize

选项卡文字尺寸。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| small | TTabsBarSize | - | 小尺寸，使用 14px 字体 Token。 | - |
| large | TTabsBarSize | - | 大尺寸，使用 16px 字体 Token。 | - |

### TTabsBarThemeData

TabBar 组件 ThemeExtension

管理 TTabsBar 的子树级视觉默认样式。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 栏背景色。 | 否 |
| disabledLabelStyle | TextStyle? | - | 禁用标签文字和图标样式。 | 否 |
| dividerColor | Color? | - | 分割线颜色。 | 否 |
| dividerHeight | double? | - | 分割线高度；小于等于 0 时不展示。 | 否 |
| indicator | Decoration? | - | 组件主题指示器；非空时覆盖内置形态指示器。 为空时 Line 使用 TDesign 默认指示器，Tag 与 Card 不展示指示器。 | 否 |
| labelPadding | EdgeInsetsGeometry? | - | 标签外层内容边距。 tag 形态内框另有左右 spacer2 Token（默认各 16 逻辑像素）的内边距。 | 否 |
| labelStyle | TextStyle? | - | 选中标签文字样式。 | 否 |
| selectedTagBackgroundColor | Color? | - | Tag 形态下的选中背景色。 | 否 |
| tagBackgroundColor | Color? | - | Tag 形态下的默认背景色。 | 否 |
| unselectedLabelStyle | TextStyle? | - | 未选中标签文字样式。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [组件搭配使用](#组件搭配使用)
4. [常见用法](#常见用法)
5. [推荐/慎用示例](#推荐-慎用示例)
6. [相似组件](#相似组件)

### 何时使用

当内容/数据需要一定的分类纬度进行区分，便于用户快速作出选择并切换时可以使用。

### 与页面布局相关

##### 位于页面或模块的顶部，统领下方内容的切换，通常设置吸顶，方便用户快速切换。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-2.png)

### 组件搭配使用

##### 选项卡与[徽标](<../数据展示/Badge 徽标.md>)组合使用，用于展示户该分类的状态变化或营销信息。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-3.png)

### 常见用法

##### 较常使用于以信息瀑布流为场景的应用，使用选项卡承载类目或状态，便于用户区分和切换。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-4.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-5.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-6.png)

### 推荐/慎用示例

##### 不建议使用选项卡来实现功能模块间的切换。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-7.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-8.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 建议文本简明扼要，不建议将文本进行截断或换行；若需要使用较长文本，建议使用等距选项卡。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-9.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-10.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 尽量避免使用多个选项卡进行嵌套，若使用，建议避免使用相同样式进行嵌套；一般情况下选项卡内的信息需要进一步分类，建议使用下拉菜单或标签进行选择过滤。

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-11.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/tabs/tabs-12.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [标签栏](<TabBar 标签栏.md>) | 当目标模块/视图需要从应用的任何地方直接进行访问时使用。 |
| [侧边栏](<SideBar 侧边栏.md>) | 当内容项数量较多，需要用户根据品类快速选择到目标内容项时使用。 |
