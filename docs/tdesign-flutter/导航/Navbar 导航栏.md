# Navbar 导航栏

> 用于不同页面之间切换或者跳转，位于内容区的上方，系统状态栏的下方。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/navbar)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 基础H5导航栏

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class BaseH5NavbarExample extends StatelessWidget {
  const BaseH5NavbarExample({super.key});

  Widget _baseH5Navbar(BuildContext context) {
    return const TNavBar(
      key: Key('navbar-demo-base'),
      title: Text('标题文字'),
      useDefaultBack: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _baseH5Navbar(context);
  }
}
```

##### `NavbarLeftMultiActionExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class NavbarLeftMultiActionExample extends StatelessWidget {
  const NavbarLeftMultiActionExample({super.key});

  Widget _leftMultiAction(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TNavBar(
        key: const Key('navbar-demo-left-multi-action'),
        title: const Text('标题文字'),
        useDefaultBack: true,
        leading: [
          TNavBarItem(
            icon: TIcons.close,
            iconSize: 24,
            onTap: () => TToast.showText('点击了关闭', context: context),
          ),
        ],
        actions: [
          TNavBarItem(
            icon: TIcons.ellipsis,
            iconSize: 24,
            onTap: () => TToast.showText('点击了更多', context: context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _leftMultiAction(context);
  }
}
```

##### `NavbarRightMultiActionExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class NavbarRightMultiActionExample extends StatelessWidget {
  const NavbarRightMultiActionExample({super.key});

  Widget _rightMultiAction(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TNavBar(
        key: const Key('navbar-demo-right-multi-action'),
        title: const Text('标题文字'),
        useDefaultBack: true,
        actions: [
          TNavBarItem(
            icon: TIcons.home,
            iconSize: 24,
            onTap: () => TToast.showText('点击了首页', context: context),
          ),
          TNavBarItem(
            icon: TIcons.ellipsis,
            iconSize: 24,
            onTap: () => TToast.showText('点击了更多', context: context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _rightMultiAction(context);
  }
}
```

##### 带搜索导航栏

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SearchNavbarExample extends StatelessWidget {
  const SearchNavbarExample({super.key});

  Widget _searchNavbar(BuildContext context) {
    return Theme(
      data: Theme.of(
        context,
      ).mergeExtension(const TNavBarThemeData(titleMargin: 0)),
      child: TNavBar(
        key: const Key('navbar-demo-search'),
        centerTitle: false,
        title: TSearchBar(
          variant: TSearchBarVariant.round,
          hintText: '搜索预设文案',
          onChanged: (String text) {
            print('input：$text');
          },
        ),
        actions: [
          TNavBarItem(
            icon: TIcons.home,
            iconSize: 24,
            onTap: () => TToast.showText('点击了首页', context: context),
          ),
          TNavBarItem(
            icon: TIcons.ellipsis,
            iconSize: 24,
            onTap: () => TToast.showText('点击了更多', context: context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _searchNavbar(context);
  }
}
```

##### 带图片导航栏

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class LogoNavbarExample extends StatelessWidget {
  const LogoNavbarExample({super.key});

  Widget _logoNavbar(BuildContext context) {
    return Theme(
      data: Theme.of(
        context,
      ).mergeExtension(const TNavBarThemeData(titleMargin: 0)),
      child: TNavBar(
        key: const Key('navbar-demo-image'),
        centerTitle: false,
        title: const TImage(
          src: 'assets/img/t_brand.png',
          width: 87,
          height: 24,
          fit: BoxFit.contain,
        ),
        actions: [
          TNavBarItem(
            icon: TIcons.home,
            iconSize: 24,
            onTap: () => TToast.showText('点击了首页', context: context),
          ),
          TNavBarItem(
            icon: TIcons.ellipsis,
            iconSize: 24,
            onTap: () => TToast.showText('点击了更多', context: context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _logoNavbar(context);
  }
}
```

#### 组件样式

##### 标题对齐

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TitleCenterNavbarExample extends StatelessWidget {
  const TitleCenterNavbarExample({super.key});

  Widget _titleCenterNavbar(BuildContext context) {
    return TNavBar(
      title: const Text('标题文字'),
      useDefaultBack: true,
      actions: [
        TNavBarItem(
          icon: TIcons.home,
          iconSize: 24,
          onTap: () => TToast.showText('点击了首页', context: context),
        ),
        TNavBarItem(
          icon: TIcons.ellipsis,
          iconSize: 24,
          onTap: () => TToast.showText('点击了更多', context: context),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _titleCenterNavbar(context);
  }
}
```

##### `TitleLeftNavbarExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TitleLeftNavbarExample extends StatelessWidget {
  const TitleLeftNavbarExample({super.key});

  Widget _titleLeftNavbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Theme(
        data: Theme.of(
          context,
        ).mergeExtension(const TNavBarThemeData(titleMargin: 0)),
        child: TNavBar(
          title: const Text('标题文字'),
          centerTitle: false,
          useDefaultBack: true,
          actions: [
            TNavBarItem(
              icon: TIcons.home,
              iconSize: 24,
              onTap: () => TToast.showText('点击了首页', context: context),
            ),
            TNavBarItem(
              icon: TIcons.ellipsis,
              iconSize: 24,
              onTap: () => TToast.showText('点击了更多', context: context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _titleLeftNavbar(context);
  }
}
```

##### 标题尺寸

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TitleNormalNavbarExample extends StatelessWidget {
  const TitleNormalNavbarExample({super.key});

  Widget _titleNormalNavbar(BuildContext context) {
    return TNavBar(
      title: const Text('标题文字'),
      useDefaultBack: true,
      actions: [
        TNavBarItem(
          icon: TIcons.home,
          iconSize: 24,
          onTap: () => TToast.showText('点击了首页', context: context),
        ),
        TNavBarItem(
          icon: TIcons.ellipsis,
          iconSize: 24,
          onTap: () => TToast.showText('点击了更多', context: context),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _titleNormalNavbar(context);
  }
}
```

##### `TitleBelowNavbarExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TitleBelowNavbarExample extends StatelessWidget {
  const TitleBelowNavbarExample({super.key});

  Widget _titleBelowNavbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Theme(
        data: Theme.of(
          context,
        ).mergeExtension(const TNavBarThemeData(titleMargin: 8)),
        child: TNavBar(
          key: const Key('navbar-demo-custom-height'),
          height: 80,
          title: TText('返回', font: context.tTheme.fontBodyLarge),
          belowTitleWidget: SizedBox(
            height: 36,
            child: TText(
              '标题文字',
              font: Font(size: 28, lineHeight: 36),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          centerTitle: false,
          useDefaultBack: false,
          leading: [
            TNavBarItem(
              icon: TIcons.chevron_left,
              iconSize: 24,
              onTap: () => TToast.showText('点击了返回', context: context),
            ),
          ],
          actions: [
            TNavBarItem(
              icon: TIcons.home,
              iconSize: 24,
              onTap: () => TToast.showText('点击了首页', context: context),
            ),
            TNavBarItem(
              icon: TIcons.ellipsis,
              iconSize: 24,
              onTap: () => TToast.showText('点击了更多', context: context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _titleBelowNavbar(context);
  }
}
```

##### 自定义颜色

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SetBgColorNavbarExample extends StatelessWidget {
  const SetBgColorNavbarExample({super.key});

  Widget _setBgColorNavbar(BuildContext context) {
    return Theme(
      data: Theme.of(context).mergeExtension(
        TNavBarThemeData(
          titleColor: Colors.white,
          backgroundColor: context.tTheme.brandColor,
        ),
      ),
      child: TNavBar(
        title: const Text(
          '标题文字',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        useDefaultBack: false,
        leading: [
          TNavBarItem(
            icon: TIcons.chevron_left,
            iconSize: 24,
            iconColor: Colors.white,
            onTap: () => TToast.showText('点击了返回', context: context),
          ),
        ],
        actions: [
          TNavBarItem(
            icon: TIcons.home,
            iconSize: 24,
            iconColor: Colors.white,
            onTap: () => TToast.showText('点击了首页', context: context),
          ),
          TNavBarItem(
            icon: TIcons.ellipsis,
            iconSize: 24,
            iconColor: Colors.white,
            onTap: () => TToast.showText('点击了更多', context: context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _setBgColorNavbar(context);
  }
}
```

## API

1. [TNavBar](#tnavbar)
2. [TNavBarItem](#tnavbaritem)
3. [TNavBarBorder](#tnavbarborder)
4. [TNavBarThemeData](#tnavbarthemedata)

### TNavBar

#### 构造方法

##### TNavBar

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| actions | List<TNavBarItem>? | - | 右侧操作项（对齐 AppBar.actions） | 否 |
| belowTitleWidget | Widget? | - | NavBar 标题区域下方的 Widget。 该内容位于 `height` 所定义的内容高度内；内容较高时，调用方需要同步增大 `height`，避免挤压标题栏。 | 否 |
| centerTitle | bool | true | 标题是否居中 | 否 |
| flexibleSpace | Widget? | - | 固定背景 Widget。 位于导航栏内容下层；若 Theme 的背景色完全不透明，背景内容不会透出。 | 否 |
| height | double | 48 | 高度；作为 `PreferredSizeWidget.preferredSize` 的唯一高度来源 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| leading | List<TNavBarItem>? | - | 左侧操作项（对齐 AppBar.leading） | 否 |
| onBack | VoidCallback? | - | 默认返回按钮的点击事件。 仅在 `useDefaultBack` 为 true 时生效。提供该回调时，由调用方完全接管返回 行为；未提供时，默认返回按钮会执行 `Navigator.maybePop`。 | 否 |
| title | Widget? | - | 标题控件。 文本标题可传入 `Text`，用法与 `AppBar.title` 一致。 标题自身的显式文本样式优先于 NavBar 提供的默认标题样式；例如 `TText` 默认会解析正文颜色，如需使用 Theme 的标题颜色，请通过 `TText.style` 传入相同颜色，或改用未显式设置颜色的 `Text`。 | 否 |
| useBorderStyle | bool | false | 是否使用边框模式 | 否 |
| useDefaultBack | bool | false | 是否使用默认的返回按钮，默认不显示 | 否 |
| useSafeArea | bool | false | 是否避让顶部系统安全区。 默认为 false。仅当导航栏直接位于页面顶部且外层未处理安全区时开启。 开启后，安全区高度只计入实际渲染高度，不计入 `preferredSize`； `height` 始终表示导航栏内容高度。 | 否 |

### TNavBarItem

NavBar 操作项

#### 构造方法

##### TNavBarItem

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| customWidget | Widget? | - | 自定义组件，优先级高于 icon，可以是任意 Widget | 否 |
| icon | IconData? | - | 图标 | 否 |
| iconColor | Color? | - | 图标颜色 | 否 |
| iconSize | double? | 24.0 | 图标尺寸，默认 24；显式传入 null 时由当前 `IconTheme` 决定。 | 否 |
| onTap | VoidCallback? | - | 点击回调；`null` 表示禁用 | 否 |
| padding | EdgeInsetsGeometry? | - | 内部填充 | 否 |

### TNavBarBorder

NavBar 边框配置（迁入 ThemeData）

#### 构造方法

##### TNavBarBorder

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| color | Color? | - | 边框颜色 | 否 |
| padding | EdgeInsetsGeometry? | - | 内部填充 | 否 |
| radius | double | 22.0 | 边框圆角 | 否 |
| width | double | 1.0 | 边框宽度 | 否 |

### TNavBarThemeData

NavBar 组件 ThemeExtension

管理 TNavBar 的子树级默认样式（标题颜色、背景、内边距、阴影、边框等）。
构造器参数优先级高于 ThemeData。高度属于 PreferredSizeWidget 契约，只能通过 TNavBar.height 设置。

复制配置时，省略或传入 null 会保留原值；恢复下层 Theme 或 Token 时，
重新构造主题并只传入仍需保留的字段。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| backgroundColor | Color? | - | 背景颜色 | 否 |
| backIconColor | Color? | - | 返回图标颜色 | 否 |
| border | TNavBarBorder? | - | 操作项边框配置，仅在 TNavBar.useBorderStyle 为 true 时生效 | 否 |
| boxShadow | List<BoxShadow>? | - | 底部阴影 | 否 |
| opacity | double? | - | 背景颜色透明度，未配置时为 1 | 否 |
| padding | EdgeInsetsGeometry? | - | 内部填充 | 否 |
| titleColor | Color? | - | 标题的子树默认颜色。 仅在 NavBar 标题未自行提供前景色时生效；标题 Widget 自身的显式颜色优先。 | 否 |
| titleMargin | double? | - | 中间文案左右两边间距 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)

### 何时使用

需要在页面间跳转、返回，或需承载少量辅助功能时使用。

### 组件搭配使用

##### 带图标的导航栏与[抽屉](<Drawer 抽屉.md>)、[动作面板](<../反馈/ActionSheet 动作面板.md>)组合使用，用于唤起一组操作或功能。

![](https://tdesign.gtimg.com/site/design/mobile-guide/navbar/navbar-1.png)

---

![](https://tdesign.gtimg.com/site/design/mobile-guide/navbar/navbar-2.png)

### 常见用法

##### 通常用来承载页面标题和返回操作，点击跳转回到上一个打开的页面。

![](https://tdesign.gtimg.com/site/design/mobile-guide/navbar/navbar-3.png)

---

##### 在应用内，通常用来承载搜索、扫码等功能性高频操作。

![](https://tdesign.gtimg.com/site/design/mobile-guide/navbar/navbar-4.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/navbar/navbar-5.png)

---

##### 在需要定位的场景，通常结合当前定位进行、所在城市等进行展示并提供切换的能力。

![](https://tdesign.gtimg.com/site/design/mobile-guide/navbar/navbar-6.png)
