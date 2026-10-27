# SideBar 侧边栏

> 用于内容分类后的展示切换。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/side-bar)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 侧边导航用法

```dart
import 'dart:math';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class NavigatorSideBarExample extends StatelessWidget {
  const NavigatorSideBarExample({super.key});

  Widget _buildNavigatorSideBar(BuildContext context) {
    return Column(
      // spacing: 16,
      children: [
        Builder(
          builder: (_) => getCustomButton(context, '锚点用法', 'SideBarAnchor'),
        ),
        const SizedBox(height: 16),
        Builder(
          builder: (_) => getCustomButton(context, '切页用法', 'SideBarPagination'),
        ),
      ],
    );
  }

  Widget getCustomButton(BuildContext context, String text, String routeName) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: Text(text),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: () => _openSideBarDemo(context, routeName),
      ),
    );
  }

  void _openSideBarDemo(BuildContext context, String routeName) {
    Widget? page;
    switch (routeName) {
      case 'SideBarAnchor':
        page = const TSideBarAnchorPage();
        break;
      case 'SideBarPagination':
        page = const TSideBarPaginationPage();
        break;
      case 'SideBarIcon':
        page = const TSideBarIconPage();
        break;
      case 'SideBarCustom':
        page = const TSideBarCustomPage();
        break;
    }
    if (page == null) {
      return;
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page!));
  }

  @override
  Widget build(BuildContext context) {
    return _buildNavigatorSideBar(context);
  }
}

/// SideBar 锚点与图标示例。
class TSideBarAnchorPage extends StatefulWidget {
  const TSideBarAnchorPage({
    super.key,
    this.title = 'SideBar 锚点用法',
    this.variant = TSideBarVariant.line,
    this.withIcons = false,
  });

  final String title;
  final TSideBarVariant variant;
  final bool withIcons;

  @override
  State<TSideBarAnchorPage> createState() => TSideBarAnchorPageState();
}

class TSideBarAnchorPageState extends State<TSideBarAnchorPage> {
  static const _anchorEdgeTolerance = 0.5;
  static const _itemCount = 10;

  var currentValue = 1;
  final _demoScroller = ScrollController();
  var _isProgrammaticScroll = false;
  var _programmaticScrollGeneration = 0;
  final _headerKeys = List.generate(_itemCount, (_) => GlobalKey());
  final _contentViewportKey = GlobalKey();
  final _lastSectionKey = GlobalKey();
  var _trailingExtent = 0.0;

  @override
  void initState() {
    super.initState();
    _demoScroller.addListener(() {
      if (!_isProgrammaticScroll) {
        _syncSelectionFromViewport();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        handleSidebarChange(currentValue);
      }
    });
  }

  void _syncSelectionFromViewport() {
    final index = _indexForViewport();
    if (index != currentValue && mounted) {
      setState(() => currentValue = index);
    }
  }

  void _syncTrailingExtent() {
    final viewport =
        _contentViewportKey.currentContext?.findRenderObject() as RenderBox?;
    final header =
        _headerKeys.last.currentContext?.findRenderObject() as RenderBox?;
    final section =
        _lastSectionKey.currentContext?.findRenderObject() as RenderBox?;
    if (viewport == null || header == null || section == null) {
      return;
    }
    final headerTop = header.localToGlobal(Offset.zero).dy;
    final sectionBottom =
        section.localToGlobal(Offset.zero).dy + section.size.height;
    final extent = max(0.0, viewport.size.height - (sectionBottom - headerTop));
    if ((extent - _trailingExtent).abs() > _anchorEdgeTolerance && mounted) {
      setState(() => _trailingExtent = extent);
    }
  }

  int _indexForViewport() {
    final viewport =
        _contentViewportKey.currentContext?.findRenderObject() as RenderBox?;
    if (viewport == null) {
      return currentValue;
    }
    final viewportTop = viewport.localToGlobal(Offset.zero).dy;
    var index = 0;
    for (var i = 1; i < _headerKeys.length; i++) {
      final header =
          _headerKeys[i].currentContext?.findRenderObject() as RenderBox?;
      if (header == null ||
          header.localToGlobal(Offset.zero).dy >
              viewportTop + _anchorEdgeTolerance) {
        break;
      }
      index = i;
    }
    return index;
  }

  Future<void> handleSidebarChange(int value) async {
    final generation = ++_programmaticScrollGeneration;
    if (currentValue != value) {
      setState(() => currentValue = value);
    }
    final targetContext = _headerKeys[value].currentContext;
    if (targetContext == null) {
      return;
    }
    _isProgrammaticScroll = true;
    try {
      await Scrollable.ensureVisible(
        targetContext,
        alignment: 0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } finally {
      if (mounted && generation == _programmaticScrollGeneration) {
        _isProgrammaticScroll = false;
        _syncSelectionFromViewport();
      }
    }
  }

  @override
  void dispose() {
    _demoScroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SideBarExampleScaffold(
    title: widget.title,
    child: _buildAnchorSideBar(context),
  );

  Widget _buildAnchorSideBar(BuildContext context) {
    // 接入说明：currentValue、handleSidebarChange 与滚动控制器由页面状态持有；
    // 此处展示 TSideBar 与内容列表的核心组装，接入时需自行维护 value/onChanged 联动。
    final labels = List.filled(10, '选项');
    final titles = List.filled(10, '标题');
    final itemCounts = List.filled(10, 8);
    final items = List.generate(
      labels.length,
      (index) => TSideBarItem(
        label: labels[index],
        value: index,
        icon: widget.withIcons ? TIcons.app : null,
        badge: switch (index) {
          1 => const TBadgeConfig(variant: TBadgeVariant.dot),
          2 => const TBadgeConfig(label: '8'),
          _ => null,
        },
      ),
    );

    Widget buildSection(int sectionIndex) {
      return KeyedSubtree(
        key: sectionIndex == labels.length - 1 ? _lastSectionKey : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KeyedSubtree(
              key: ValueKey('sidebar-section-$sectionIndex'),
              child: Container(
                key: _headerKeys[sectionIndex],
                height: 54,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TText(
                  titles[sectionIndex],
                  font: context.tTheme.fontBodyLarge,
                ),
              ),
            ),
            for (var index = 0; index < itemCounts[sectionIndex]; index++)
              Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: context.tTheme.grayColor2),
                  ),
                ),
                child: Row(
                  children: [
                    const TImage(
                      src: 'assets/img/empty.png',
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(width: 16),
                    TText('标题', font: context.tTheme.fontBodyLarge),
                  ],
                ),
              ),
          ],
        ),
      );
    }

    return Row(
      children: [
        TSideBar(
          variant: widget.variant,
          value: currentValue,
          children: items,
          onChanged: handleSidebarChange,
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  _syncTrailingExtent();
                }
              });
              return SingleChildScrollView(
                key: _contentViewportKey,
                controller: _demoScroller,
                child: Container(
                  color: context.tTheme.bgColorContainer,
                  child: Column(
                    children: [
                      for (var index = 0; index < labels.length; index++)
                        buildSection(index),
                      SizedBox(height: _trailingExtent),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// SideBar 切页示例。
class TSideBarPaginationPage extends StatefulWidget {
  const TSideBarPaginationPage({super.key});

  @override
  State<TSideBarPaginationPage> createState() => TSideBarPaginationPageState();
}

class TSideBarPaginationPageState extends State<TSideBarPaginationPage> {
  var currentValue = 1;
  final _pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SideBarExampleScaffold(
    title: 'SideBar 切页用法',
    child: _buildPaginationSideBar(context),
  );

  Widget _buildPaginationSideBar(BuildContext context) {
    // 接入说明：currentValue、setCurrentValue 与 PageController 由页面状态持有；
    // 此处展示 TSideBar 与 PageView 的核心组装，接入时需自行维护 value/onChanged 联动。
    final labels = List.filled(10, '选项');
    final titles = List.filled(10, '标题');
    final itemCounts = List.filled(10, 8);
    final items = List.generate(
      labels.length,
      (index) => TSideBarItem(
        label: labels[index],
        value: index,
        disabled: index == 4,
        badge: switch (index) {
          1 => const TBadgeConfig(variant: TBadgeVariant.dot),
          2 => const TBadgeConfig(label: '8'),
          _ => null,
        },
      ),
    );

    void setCurrentValue(int value) {
      _pageController.jumpToPage(value);
      if (currentValue != value) {
        setState(() => currentValue = value);
      }
    }

    return Row(
      children: [
        TSideBar(
          value: currentValue,
          children: items,
          onChanged: setCurrentValue,
        ),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: titles.length,
            itemBuilder: (_, pageIndex) => Container(
              color: context.tTheme.bgColorContainer,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: itemCounts[pageIndex],
                itemBuilder: (_, index) => Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: context.tTheme.grayColor2),
                    ),
                  ),
                  child: Row(
                    children: [
                      const TImage(
                        src: 'assets/img/empty.png',
                        shape: TImageShape.roundedSquare,
                        fit: BoxFit.cover,
                        width: 48,
                        height: 48,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TText(
                          titles[pageIndex],
                          font: context.tTheme.fontBodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// TSideBarIconPage 演示。
class TSideBarIconPage extends StatelessWidget {
  const TSideBarIconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSideBarAnchorPage(title: 'SideBar 带图标侧边导航', withIcons: true);
  }
}

/// SideBar 标签样式示例。
class TSideBarCustomPage extends StatefulWidget {
  const TSideBarCustomPage({super.key});

  @override
  State<TSideBarCustomPage> createState() => TSideBarCustomPageState();
}

class TSideBarCustomPageState extends State<TSideBarCustomPage> {
  var currentValue = 1;
  final _pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SideBarExampleScaffold(
    title: 'SideBar 自定义样式',
    child: _buildCustomSideBar(context),
  );

  Widget _buildCustomSideBar(BuildContext context) {
    // 接入说明：currentValue、setCurrentValue 与 PageController 由页面状态持有；
    // 此处展示 tag 变体与内容页的核心组装，接入时需自行维护 value/onChanged 联动。
    final labels = List.filled(10, '选项');
    final titles = List.filled(10, '标题');
    final itemCounts = List.filled(10, 8);
    final items = List.generate(
      labels.length,
      (index) => TSideBarItem(
        label: labels[index],
        value: index,
        badge: switch (index) {
          1 => const TBadgeConfig(variant: TBadgeVariant.dot),
          2 => const TBadgeConfig(label: '8'),
          _ => null,
        },
      ),
    );

    void setCurrentValue(int value) {
      _pageController.jumpToPage(value);
      if (currentValue != value) {
        setState(() => currentValue = value);
      }
    }

    Widget buildPage(int pageIndex) {
      return Container(
        color: context.tTheme.bgColorContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 54,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TText(
                titles[pageIndex],
                font: context.tTheme.fontBodyLarge,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: itemCounts[pageIndex],
                itemBuilder: (_, index) => Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: context.tTheme.grayColor2),
                    ),
                  ),
                  child: Row(
                    children: [
                      const TImage(
                        src: 'assets/img/empty.png',
                        width: 48,
                        height: 48,
                      ),
                      const SizedBox(width: 16),
                      TText('标题', font: context.tTheme.fontBodyLarge),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Row(
      children: [
        Theme(
          data: Theme.of(context).mergeExtension(
            TSideBarThemeData(
              selectedTextStyle: TextStyle(
                color: context.tTheme.brandColor,
                fontWeight: FontWeight.w600,
              ),
              selectedBgColor: context.tTheme.brandColorLight,
              textStyle: TextStyle(color: context.tTheme.textColorSecondary),
            ),
          ),
          child: TSideBar(
            variant: TSideBarVariant.tag,
            value: currentValue,
            children: items,
            onChanged: setCurrentValue,
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: titles.length,
            itemBuilder: (_, index) => buildPage(index),
          ),
        ),
      ],
    );
  }
}

/// Standalone shell for the full-screen SideBar auxiliary examples.
class SideBarExampleScaffold extends StatefulWidget {
  const SideBarExampleScaffold({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  State<SideBarExampleScaffold> createState() => _SideBarExampleScaffoldState();
}

class _SideBarExampleScaffoldState extends State<SideBarExampleScaffold> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    final token = context.tTheme.light;
    final page = _buildPage(context);
    return switch (_themeMode) {
      ThemeMode.light => Theme(data: TThemeBuilder.light(token), child: page),
      ThemeMode.dark => Theme(data: TThemeBuilder.dark(token), child: page),
      ThemeMode.system => page,
    };
  }

  Widget _buildPage(BuildContext context) {
    final titleLineHeight = context.tTheme.fontBodyMedium?.height ?? 22 / 14;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            bottom: false,
            child: TNavBar(
              title: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  height: titleLineHeight,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: [
                TNavBarItem(
                  icon: TIcons.chevron_left,
                  iconSize: 28,
                  onTap: () => Navigator.maybePop(context),
                ),
                TNavBarItem(
                  icon: _themeMode == ThemeMode.light
                      ? TIcons.mode_light
                      : TIcons.mode_dark,
                  onTap: () {
                    setState(() {
                      _themeMode = _themeMode == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                    });
                  },
                ),
              ],
              useDefaultBack: false,
              useSafeArea: false,
            ),
          ),
          Expanded(child: SafeArea(top: false, child: widget.child)),
        ],
      ),
    );
  }
}
```

##### 带图标侧边导航

```dart
import 'dart:math';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class IconSideBarExample extends StatelessWidget {
  const IconSideBarExample({super.key});

  Widget _buildIconSideBar(BuildContext context) {
    return getCustomButton(context, '带图标侧边导航', 'SideBarIcon');
  }

  Widget getCustomButton(BuildContext context, String text, String routeName) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: Text(text),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: () => _openSideBarDemo(context, routeName),
      ),
    );
  }

  void _openSideBarDemo(BuildContext context, String routeName) {
    Widget? page;
    switch (routeName) {
      case 'SideBarAnchor':
        page = const TSideBarAnchorPage();
        break;
      case 'SideBarPagination':
        page = const TSideBarPaginationPage();
        break;
      case 'SideBarIcon':
        page = const TSideBarIconPage();
        break;
      case 'SideBarCustom':
        page = const TSideBarCustomPage();
        break;
    }
    if (page == null) {
      return;
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page!));
  }

  @override
  Widget build(BuildContext context) {
    return _buildIconSideBar(context);
  }
}

/// SideBar 锚点与图标示例。
class TSideBarAnchorPage extends StatefulWidget {
  const TSideBarAnchorPage({
    super.key,
    this.title = 'SideBar 锚点用法',
    this.variant = TSideBarVariant.line,
    this.withIcons = false,
  });

  final String title;
  final TSideBarVariant variant;
  final bool withIcons;

  @override
  State<TSideBarAnchorPage> createState() => TSideBarAnchorPageState();
}

class TSideBarAnchorPageState extends State<TSideBarAnchorPage> {
  static const _anchorEdgeTolerance = 0.5;
  static const _itemCount = 10;

  var currentValue = 1;
  final _demoScroller = ScrollController();
  var _isProgrammaticScroll = false;
  var _programmaticScrollGeneration = 0;
  final _headerKeys = List.generate(_itemCount, (_) => GlobalKey());
  final _contentViewportKey = GlobalKey();
  final _lastSectionKey = GlobalKey();
  var _trailingExtent = 0.0;

  @override
  void initState() {
    super.initState();
    _demoScroller.addListener(() {
      if (!_isProgrammaticScroll) {
        _syncSelectionFromViewport();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        handleSidebarChange(currentValue);
      }
    });
  }

  void _syncSelectionFromViewport() {
    final index = _indexForViewport();
    if (index != currentValue && mounted) {
      setState(() => currentValue = index);
    }
  }

  void _syncTrailingExtent() {
    final viewport =
        _contentViewportKey.currentContext?.findRenderObject() as RenderBox?;
    final header =
        _headerKeys.last.currentContext?.findRenderObject() as RenderBox?;
    final section =
        _lastSectionKey.currentContext?.findRenderObject() as RenderBox?;
    if (viewport == null || header == null || section == null) {
      return;
    }
    final headerTop = header.localToGlobal(Offset.zero).dy;
    final sectionBottom =
        section.localToGlobal(Offset.zero).dy + section.size.height;
    final extent = max(0.0, viewport.size.height - (sectionBottom - headerTop));
    if ((extent - _trailingExtent).abs() > _anchorEdgeTolerance && mounted) {
      setState(() => _trailingExtent = extent);
    }
  }

  int _indexForViewport() {
    final viewport =
        _contentViewportKey.currentContext?.findRenderObject() as RenderBox?;
    if (viewport == null) {
      return currentValue;
    }
    final viewportTop = viewport.localToGlobal(Offset.zero).dy;
    var index = 0;
    for (var i = 1; i < _headerKeys.length; i++) {
      final header =
          _headerKeys[i].currentContext?.findRenderObject() as RenderBox?;
      if (header == null ||
          header.localToGlobal(Offset.zero).dy >
              viewportTop + _anchorEdgeTolerance) {
        break;
      }
      index = i;
    }
    return index;
  }

  Future<void> handleSidebarChange(int value) async {
    final generation = ++_programmaticScrollGeneration;
    if (currentValue != value) {
      setState(() => currentValue = value);
    }
    final targetContext = _headerKeys[value].currentContext;
    if (targetContext == null) {
      return;
    }
    _isProgrammaticScroll = true;
    try {
      await Scrollable.ensureVisible(
        targetContext,
        alignment: 0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } finally {
      if (mounted && generation == _programmaticScrollGeneration) {
        _isProgrammaticScroll = false;
        _syncSelectionFromViewport();
      }
    }
  }

  @override
  void dispose() {
    _demoScroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SideBarExampleScaffold(
    title: widget.title,
    child: _buildAnchorSideBar(context),
  );

  Widget _buildAnchorSideBar(BuildContext context) {
    // 接入说明：currentValue、handleSidebarChange 与滚动控制器由页面状态持有；
    // 此处展示 TSideBar 与内容列表的核心组装，接入时需自行维护 value/onChanged 联动。
    final labels = List.filled(10, '选项');
    final titles = List.filled(10, '标题');
    final itemCounts = List.filled(10, 8);
    final items = List.generate(
      labels.length,
      (index) => TSideBarItem(
        label: labels[index],
        value: index,
        icon: widget.withIcons ? TIcons.app : null,
        badge: switch (index) {
          1 => const TBadgeConfig(variant: TBadgeVariant.dot),
          2 => const TBadgeConfig(label: '8'),
          _ => null,
        },
      ),
    );

    Widget buildSection(int sectionIndex) {
      return KeyedSubtree(
        key: sectionIndex == labels.length - 1 ? _lastSectionKey : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KeyedSubtree(
              key: ValueKey('sidebar-section-$sectionIndex'),
              child: Container(
                key: _headerKeys[sectionIndex],
                height: 54,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TText(
                  titles[sectionIndex],
                  font: context.tTheme.fontBodyLarge,
                ),
              ),
            ),
            for (var index = 0; index < itemCounts[sectionIndex]; index++)
              Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: context.tTheme.grayColor2),
                  ),
                ),
                child: Row(
                  children: [
                    const TImage(
                      src: 'assets/img/empty.png',
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(width: 16),
                    TText('标题', font: context.tTheme.fontBodyLarge),
                  ],
                ),
              ),
          ],
        ),
      );
    }

    return Row(
      children: [
        TSideBar(
          variant: widget.variant,
          value: currentValue,
          children: items,
          onChanged: handleSidebarChange,
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  _syncTrailingExtent();
                }
              });
              return SingleChildScrollView(
                key: _contentViewportKey,
                controller: _demoScroller,
                child: Container(
                  color: context.tTheme.bgColorContainer,
                  child: Column(
                    children: [
                      for (var index = 0; index < labels.length; index++)
                        buildSection(index),
                      SizedBox(height: _trailingExtent),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// SideBar 切页示例。
class TSideBarPaginationPage extends StatefulWidget {
  const TSideBarPaginationPage({super.key});

  @override
  State<TSideBarPaginationPage> createState() => TSideBarPaginationPageState();
}

class TSideBarPaginationPageState extends State<TSideBarPaginationPage> {
  var currentValue = 1;
  final _pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SideBarExampleScaffold(
    title: 'SideBar 切页用法',
    child: _buildPaginationSideBar(context),
  );

  Widget _buildPaginationSideBar(BuildContext context) {
    // 接入说明：currentValue、setCurrentValue 与 PageController 由页面状态持有；
    // 此处展示 TSideBar 与 PageView 的核心组装，接入时需自行维护 value/onChanged 联动。
    final labels = List.filled(10, '选项');
    final titles = List.filled(10, '标题');
    final itemCounts = List.filled(10, 8);
    final items = List.generate(
      labels.length,
      (index) => TSideBarItem(
        label: labels[index],
        value: index,
        disabled: index == 4,
        badge: switch (index) {
          1 => const TBadgeConfig(variant: TBadgeVariant.dot),
          2 => const TBadgeConfig(label: '8'),
          _ => null,
        },
      ),
    );

    void setCurrentValue(int value) {
      _pageController.jumpToPage(value);
      if (currentValue != value) {
        setState(() => currentValue = value);
      }
    }

    return Row(
      children: [
        TSideBar(
          value: currentValue,
          children: items,
          onChanged: setCurrentValue,
        ),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: titles.length,
            itemBuilder: (_, pageIndex) => Container(
              color: context.tTheme.bgColorContainer,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: itemCounts[pageIndex],
                itemBuilder: (_, index) => Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: context.tTheme.grayColor2),
                    ),
                  ),
                  child: Row(
                    children: [
                      const TImage(
                        src: 'assets/img/empty.png',
                        shape: TImageShape.roundedSquare,
                        fit: BoxFit.cover,
                        width: 48,
                        height: 48,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TText(
                          titles[pageIndex],
                          font: context.tTheme.fontBodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// TSideBarIconPage 演示。
class TSideBarIconPage extends StatelessWidget {
  const TSideBarIconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSideBarAnchorPage(title: 'SideBar 带图标侧边导航', withIcons: true);
  }
}

/// SideBar 标签样式示例。
class TSideBarCustomPage extends StatefulWidget {
  const TSideBarCustomPage({super.key});

  @override
  State<TSideBarCustomPage> createState() => TSideBarCustomPageState();
}

class TSideBarCustomPageState extends State<TSideBarCustomPage> {
  var currentValue = 1;
  final _pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SideBarExampleScaffold(
    title: 'SideBar 自定义样式',
    child: _buildCustomSideBar(context),
  );

  Widget _buildCustomSideBar(BuildContext context) {
    // 接入说明：currentValue、setCurrentValue 与 PageController 由页面状态持有；
    // 此处展示 tag 变体与内容页的核心组装，接入时需自行维护 value/onChanged 联动。
    final labels = List.filled(10, '选项');
    final titles = List.filled(10, '标题');
    final itemCounts = List.filled(10, 8);
    final items = List.generate(
      labels.length,
      (index) => TSideBarItem(
        label: labels[index],
        value: index,
        badge: switch (index) {
          1 => const TBadgeConfig(variant: TBadgeVariant.dot),
          2 => const TBadgeConfig(label: '8'),
          _ => null,
        },
      ),
    );

    void setCurrentValue(int value) {
      _pageController.jumpToPage(value);
      if (currentValue != value) {
        setState(() => currentValue = value);
      }
    }

    Widget buildPage(int pageIndex) {
      return Container(
        color: context.tTheme.bgColorContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 54,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TText(
                titles[pageIndex],
                font: context.tTheme.fontBodyLarge,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: itemCounts[pageIndex],
                itemBuilder: (_, index) => Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: context.tTheme.grayColor2),
                    ),
                  ),
                  child: Row(
                    children: [
                      const TImage(
                        src: 'assets/img/empty.png',
                        width: 48,
                        height: 48,
                      ),
                      const SizedBox(width: 16),
                      TText('标题', font: context.tTheme.fontBodyLarge),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Row(
      children: [
        Theme(
          data: Theme.of(context).mergeExtension(
            TSideBarThemeData(
              selectedTextStyle: TextStyle(
                color: context.tTheme.brandColor,
                fontWeight: FontWeight.w600,
              ),
              selectedBgColor: context.tTheme.brandColorLight,
              textStyle: TextStyle(color: context.tTheme.textColorSecondary),
            ),
          ),
          child: TSideBar(
            variant: TSideBarVariant.tag,
            value: currentValue,
            children: items,
            onChanged: setCurrentValue,
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: titles.length,
            itemBuilder: (_, index) => buildPage(index),
          ),
        ),
      ],
    );
  }
}

/// Standalone shell for the full-screen SideBar auxiliary examples.
class SideBarExampleScaffold extends StatefulWidget {
  const SideBarExampleScaffold({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  State<SideBarExampleScaffold> createState() => _SideBarExampleScaffoldState();
}

class _SideBarExampleScaffoldState extends State<SideBarExampleScaffold> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    final token = context.tTheme.light;
    final page = _buildPage(context);
    return switch (_themeMode) {
      ThemeMode.light => Theme(data: TThemeBuilder.light(token), child: page),
      ThemeMode.dark => Theme(data: TThemeBuilder.dark(token), child: page),
      ThemeMode.system => page,
    };
  }

  Widget _buildPage(BuildContext context) {
    final titleLineHeight = context.tTheme.fontBodyMedium?.height ?? 22 / 14;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            bottom: false,
            child: TNavBar(
              title: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  height: titleLineHeight,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: [
                TNavBarItem(
                  icon: TIcons.chevron_left,
                  iconSize: 28,
                  onTap: () => Navigator.maybePop(context),
                ),
                TNavBarItem(
                  icon: _themeMode == ThemeMode.light
                      ? TIcons.mode_light
                      : TIcons.mode_dark,
                  onTap: () {
                    setState(() {
                      _themeMode = _themeMode == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                    });
                  },
                ),
              ],
              useDefaultBack: false,
              useSafeArea: false,
            ),
          ),
          Expanded(child: SafeArea(top: false, child: widget.child)),
        ],
      ),
    );
  }
}
```

#### 组件样式

##### 侧边导航样式

```dart
import 'dart:math';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class StyleSideBarExample extends StatelessWidget {
  const StyleSideBarExample({super.key});

  Widget _buildStyleSideBar(BuildContext context) {
    return Column(
      children: [
        Builder(
          builder: (_) => getCustomButton(context, '非通栏选项样式', 'SideBarAnchor'),
        ),
        const SizedBox(height: 16),
        Builder(
          builder: (_) => getCustomButton(context, '自定义样式', 'SideBarCustom'),
        ),
      ],
    );
  }

  Widget getCustomButton(BuildContext context, String text, String routeName) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: Text(text),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: () => _openSideBarDemo(context, routeName),
      ),
    );
  }

  void _openSideBarDemo(BuildContext context, String routeName) {
    Widget? page;
    switch (routeName) {
      case 'SideBarAnchor':
        page = const TSideBarAnchorPage();
        break;
      case 'SideBarPagination':
        page = const TSideBarPaginationPage();
        break;
      case 'SideBarIcon':
        page = const TSideBarIconPage();
        break;
      case 'SideBarCustom':
        page = const TSideBarCustomPage();
        break;
    }
    if (page == null) {
      return;
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page!));
  }

  @override
  Widget build(BuildContext context) {
    return _buildStyleSideBar(context);
  }
}

/// SideBar 锚点与图标示例。
class TSideBarAnchorPage extends StatefulWidget {
  const TSideBarAnchorPage({
    super.key,
    this.title = 'SideBar 锚点用法',
    this.variant = TSideBarVariant.line,
    this.withIcons = false,
  });

  final String title;
  final TSideBarVariant variant;
  final bool withIcons;

  @override
  State<TSideBarAnchorPage> createState() => TSideBarAnchorPageState();
}

class TSideBarAnchorPageState extends State<TSideBarAnchorPage> {
  static const _anchorEdgeTolerance = 0.5;
  static const _itemCount = 10;

  var currentValue = 1;
  final _demoScroller = ScrollController();
  var _isProgrammaticScroll = false;
  var _programmaticScrollGeneration = 0;
  final _headerKeys = List.generate(_itemCount, (_) => GlobalKey());
  final _contentViewportKey = GlobalKey();
  final _lastSectionKey = GlobalKey();
  var _trailingExtent = 0.0;

  @override
  void initState() {
    super.initState();
    _demoScroller.addListener(() {
      if (!_isProgrammaticScroll) {
        _syncSelectionFromViewport();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        handleSidebarChange(currentValue);
      }
    });
  }

  void _syncSelectionFromViewport() {
    final index = _indexForViewport();
    if (index != currentValue && mounted) {
      setState(() => currentValue = index);
    }
  }

  void _syncTrailingExtent() {
    final viewport =
        _contentViewportKey.currentContext?.findRenderObject() as RenderBox?;
    final header =
        _headerKeys.last.currentContext?.findRenderObject() as RenderBox?;
    final section =
        _lastSectionKey.currentContext?.findRenderObject() as RenderBox?;
    if (viewport == null || header == null || section == null) {
      return;
    }
    final headerTop = header.localToGlobal(Offset.zero).dy;
    final sectionBottom =
        section.localToGlobal(Offset.zero).dy + section.size.height;
    final extent = max(0.0, viewport.size.height - (sectionBottom - headerTop));
    if ((extent - _trailingExtent).abs() > _anchorEdgeTolerance && mounted) {
      setState(() => _trailingExtent = extent);
    }
  }

  int _indexForViewport() {
    final viewport =
        _contentViewportKey.currentContext?.findRenderObject() as RenderBox?;
    if (viewport == null) {
      return currentValue;
    }
    final viewportTop = viewport.localToGlobal(Offset.zero).dy;
    var index = 0;
    for (var i = 1; i < _headerKeys.length; i++) {
      final header =
          _headerKeys[i].currentContext?.findRenderObject() as RenderBox?;
      if (header == null ||
          header.localToGlobal(Offset.zero).dy >
              viewportTop + _anchorEdgeTolerance) {
        break;
      }
      index = i;
    }
    return index;
  }

  Future<void> handleSidebarChange(int value) async {
    final generation = ++_programmaticScrollGeneration;
    if (currentValue != value) {
      setState(() => currentValue = value);
    }
    final targetContext = _headerKeys[value].currentContext;
    if (targetContext == null) {
      return;
    }
    _isProgrammaticScroll = true;
    try {
      await Scrollable.ensureVisible(
        targetContext,
        alignment: 0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } finally {
      if (mounted && generation == _programmaticScrollGeneration) {
        _isProgrammaticScroll = false;
        _syncSelectionFromViewport();
      }
    }
  }

  @override
  void dispose() {
    _demoScroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SideBarExampleScaffold(
    title: widget.title,
    child: _buildAnchorSideBar(context),
  );

  Widget _buildAnchorSideBar(BuildContext context) {
    // 接入说明：currentValue、handleSidebarChange 与滚动控制器由页面状态持有；
    // 此处展示 TSideBar 与内容列表的核心组装，接入时需自行维护 value/onChanged 联动。
    final labels = List.filled(10, '选项');
    final titles = List.filled(10, '标题');
    final itemCounts = List.filled(10, 8);
    final items = List.generate(
      labels.length,
      (index) => TSideBarItem(
        label: labels[index],
        value: index,
        icon: widget.withIcons ? TIcons.app : null,
        badge: switch (index) {
          1 => const TBadgeConfig(variant: TBadgeVariant.dot),
          2 => const TBadgeConfig(label: '8'),
          _ => null,
        },
      ),
    );

    Widget buildSection(int sectionIndex) {
      return KeyedSubtree(
        key: sectionIndex == labels.length - 1 ? _lastSectionKey : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KeyedSubtree(
              key: ValueKey('sidebar-section-$sectionIndex'),
              child: Container(
                key: _headerKeys[sectionIndex],
                height: 54,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TText(
                  titles[sectionIndex],
                  font: context.tTheme.fontBodyLarge,
                ),
              ),
            ),
            for (var index = 0; index < itemCounts[sectionIndex]; index++)
              Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: context.tTheme.grayColor2),
                  ),
                ),
                child: Row(
                  children: [
                    const TImage(
                      src: 'assets/img/empty.png',
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(width: 16),
                    TText('标题', font: context.tTheme.fontBodyLarge),
                  ],
                ),
              ),
          ],
        ),
      );
    }

    return Row(
      children: [
        TSideBar(
          variant: widget.variant,
          value: currentValue,
          children: items,
          onChanged: handleSidebarChange,
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  _syncTrailingExtent();
                }
              });
              return SingleChildScrollView(
                key: _contentViewportKey,
                controller: _demoScroller,
                child: Container(
                  color: context.tTheme.bgColorContainer,
                  child: Column(
                    children: [
                      for (var index = 0; index < labels.length; index++)
                        buildSection(index),
                      SizedBox(height: _trailingExtent),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// SideBar 切页示例。
class TSideBarPaginationPage extends StatefulWidget {
  const TSideBarPaginationPage({super.key});

  @override
  State<TSideBarPaginationPage> createState() => TSideBarPaginationPageState();
}

class TSideBarPaginationPageState extends State<TSideBarPaginationPage> {
  var currentValue = 1;
  final _pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SideBarExampleScaffold(
    title: 'SideBar 切页用法',
    child: _buildPaginationSideBar(context),
  );

  Widget _buildPaginationSideBar(BuildContext context) {
    // 接入说明：currentValue、setCurrentValue 与 PageController 由页面状态持有；
    // 此处展示 TSideBar 与 PageView 的核心组装，接入时需自行维护 value/onChanged 联动。
    final labels = List.filled(10, '选项');
    final titles = List.filled(10, '标题');
    final itemCounts = List.filled(10, 8);
    final items = List.generate(
      labels.length,
      (index) => TSideBarItem(
        label: labels[index],
        value: index,
        disabled: index == 4,
        badge: switch (index) {
          1 => const TBadgeConfig(variant: TBadgeVariant.dot),
          2 => const TBadgeConfig(label: '8'),
          _ => null,
        },
      ),
    );

    void setCurrentValue(int value) {
      _pageController.jumpToPage(value);
      if (currentValue != value) {
        setState(() => currentValue = value);
      }
    }

    return Row(
      children: [
        TSideBar(
          value: currentValue,
          children: items,
          onChanged: setCurrentValue,
        ),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: titles.length,
            itemBuilder: (_, pageIndex) => Container(
              color: context.tTheme.bgColorContainer,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: itemCounts[pageIndex],
                itemBuilder: (_, index) => Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: context.tTheme.grayColor2),
                    ),
                  ),
                  child: Row(
                    children: [
                      const TImage(
                        src: 'assets/img/empty.png',
                        shape: TImageShape.roundedSquare,
                        fit: BoxFit.cover,
                        width: 48,
                        height: 48,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TText(
                          titles[pageIndex],
                          font: context.tTheme.fontBodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// TSideBarIconPage 演示。
class TSideBarIconPage extends StatelessWidget {
  const TSideBarIconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSideBarAnchorPage(title: 'SideBar 带图标侧边导航', withIcons: true);
  }
}

/// SideBar 标签样式示例。
class TSideBarCustomPage extends StatefulWidget {
  const TSideBarCustomPage({super.key});

  @override
  State<TSideBarCustomPage> createState() => TSideBarCustomPageState();
}

class TSideBarCustomPageState extends State<TSideBarCustomPage> {
  var currentValue = 1;
  final _pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SideBarExampleScaffold(
    title: 'SideBar 自定义样式',
    child: _buildCustomSideBar(context),
  );

  Widget _buildCustomSideBar(BuildContext context) {
    // 接入说明：currentValue、setCurrentValue 与 PageController 由页面状态持有；
    // 此处展示 tag 变体与内容页的核心组装，接入时需自行维护 value/onChanged 联动。
    final labels = List.filled(10, '选项');
    final titles = List.filled(10, '标题');
    final itemCounts = List.filled(10, 8);
    final items = List.generate(
      labels.length,
      (index) => TSideBarItem(
        label: labels[index],
        value: index,
        badge: switch (index) {
          1 => const TBadgeConfig(variant: TBadgeVariant.dot),
          2 => const TBadgeConfig(label: '8'),
          _ => null,
        },
      ),
    );

    void setCurrentValue(int value) {
      _pageController.jumpToPage(value);
      if (currentValue != value) {
        setState(() => currentValue = value);
      }
    }

    Widget buildPage(int pageIndex) {
      return Container(
        color: context.tTheme.bgColorContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 54,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TText(
                titles[pageIndex],
                font: context.tTheme.fontBodyLarge,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: itemCounts[pageIndex],
                itemBuilder: (_, index) => Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: context.tTheme.grayColor2),
                    ),
                  ),
                  child: Row(
                    children: [
                      const TImage(
                        src: 'assets/img/empty.png',
                        width: 48,
                        height: 48,
                      ),
                      const SizedBox(width: 16),
                      TText('标题', font: context.tTheme.fontBodyLarge),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Row(
      children: [
        Theme(
          data: Theme.of(context).mergeExtension(
            TSideBarThemeData(
              selectedTextStyle: TextStyle(
                color: context.tTheme.brandColor,
                fontWeight: FontWeight.w600,
              ),
              selectedBgColor: context.tTheme.brandColorLight,
              textStyle: TextStyle(color: context.tTheme.textColorSecondary),
            ),
          ),
          child: TSideBar(
            variant: TSideBarVariant.tag,
            value: currentValue,
            children: items,
            onChanged: setCurrentValue,
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: titles.length,
            itemBuilder: (_, index) => buildPage(index),
          ),
        ),
      ],
    );
  }
}

/// Standalone shell for the full-screen SideBar auxiliary examples.
class SideBarExampleScaffold extends StatefulWidget {
  const SideBarExampleScaffold({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  State<SideBarExampleScaffold> createState() => _SideBarExampleScaffoldState();
}

class _SideBarExampleScaffoldState extends State<SideBarExampleScaffold> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    final token = context.tTheme.light;
    final page = _buildPage(context);
    return switch (_themeMode) {
      ThemeMode.light => Theme(data: TThemeBuilder.light(token), child: page),
      ThemeMode.dark => Theme(data: TThemeBuilder.dark(token), child: page),
      ThemeMode.system => page,
    };
  }

  Widget _buildPage(BuildContext context) {
    final titleLineHeight = context.tTheme.fontBodyMedium?.height ?? 22 / 14;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            bottom: false,
            child: TNavBar(
              title: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  height: titleLineHeight,
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: [
                TNavBarItem(
                  icon: TIcons.chevron_left,
                  iconSize: 28,
                  onTap: () => Navigator.maybePop(context),
                ),
                TNavBarItem(
                  icon: _themeMode == ThemeMode.light
                      ? TIcons.mode_light
                      : TIcons.mode_dark,
                  onTap: () {
                    setState(() {
                      _themeMode = _themeMode == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                    });
                  },
                ),
              ],
              useDefaultBack: false,
              useSafeArea: false,
            ),
          ),
          Expanded(child: SafeArea(top: false, child: widget.child)),
        ],
      ),
    );
  }
}
```

## API

1. [TSideBar](#tsidebar)
2. [TSideBarItem](#tsidebaritem)
3. [TSideBarVariant](#tsidebarvariant)
4. [TSideBarThemeData](#tsidebarthemedata)

### TSideBar

#### 构造方法

##### TSideBar

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| children | List<TSideBarItem> | const [] | 侧边栏项。 | 否 |
| height | double? | - | 高度；未设置时占满当前可用屏幕高度，不从 Theme 读取。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| loading | bool | false | 是否展示加载态。 | 否 |
| loadingWidget | Widget? | - | 自定义加载态内容。 | 否 |
| onChanged | ValueChanged<int>? | - | 选中值变化回调；为 null 时禁用整栏。 | 否 |
| value | int | - | 当前选中项值。 | 是 |
| variant | TSideBarVariant | TSideBarVariant.line | 展示变体；属于组件实例的结构状态，不从 Theme 读取。 | 否 |
| width | double | 103 | 侧边栏宽度，默认 103。 | 否 |

### TSideBarItem

侧边导航栏的不可变配置项。

这是数据配置而非 Widget，不参与 Flutter Key 匹配。
`value` 应在同一个侧边导航栏的 children 列表中保持唯一，以便组件稳定地
保留选中状态和滚动目标。

#### 构造方法

##### TSideBarItem

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| badge | TBadgeConfig? | - | 展示在标签文字右上角的徽标；为空时不显示。 SideBar 会将标签文字作为徽标锚点，并使用 `TBadgeConfig` 描述徽标内容、 形态和可选位置覆盖。调用方已经拥有目标 Widget 时，应直接使用 `TBadge` 包装该 Widget。 | 否 |
| disabled | bool | false | 是否禁用 | 否 |
| icon | IconData? | - | 图标 | 否 |
| label | String | '' | 标签 | 否 |
| value | int | -1 | 条目的业务值；由调用方指定，默认 -1，不自动使用 children 中的位置。 父组件通过相同的值指定选中项；选择回调返回该值。 | 否 |

### TSideBarVariant

侧边栏样式

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| line | TSideBarVariant | - | 左侧品牌色指示线样式 | - |
| tag | TSideBarVariant | - | 选中项为圆角标签样式，内块圆角读取全局 radiusDefault，默认6逻辑像素。 | - |

### TSideBarThemeData

侧边栏组件 ThemeExtension

管理 TSideBar 的子树级视觉样式（内边距、选中/未选中颜色等）。
实例参数负责选中值、形态和交互；具体视觉值由本组件 Theme 配置。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| contentPadding | EdgeInsetsGeometry? | - | 默认自定义文本框内边距 | 否 |
| selectedBgColor | Color? | - | 默认选中背景颜色 | 否 |
| selectedTextStyle | TextStyle? | - | 选中文字样式；其中的 color 同时控制选中图标和指示线。 未指定 color 时读取全局品牌色；禁用态始终使用全局禁用色。 | 否 |
| textStyle | TextStyle? | - | 未选中标签文字样式；颜色同时用于未选中图标。 选中项只继承排版字段，不继承这里的颜色；禁用态使用全局禁用色。 未指定颜色时使用全局正文色。 | 否 |
| unSelectedBgColor | Color? | - | 默认未选中背景颜色 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [正确/慎用示例](#正确-慎用示例)
4. [相似组件](#相似组件)

### 何时使用

当内容项数量较多，需要用户根据品类快速选择到目标内容项时使用。

### 组件搭配使用

##### 侧边栏与徽标组合使用，用于展示品类的状态信息或营销情况。

![](https://tdesign.gtimg.com/site/design/mobile-guide/side-bar/side-bar-1.png)

### 正确/慎用示例

##### 建议文本简明扼要，若文本过长建议进行换行处理，尽量避免将文本进行截断。

![](https://tdesign.gtimg.com/site/design/mobile-guide/side-bar/side-bar-2.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/side-bar/side-bar-3.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 不建议仅用图标、emoji作为品类选项，避免表意不清晰。

![](https://tdesign.gtimg.com/site/design/mobile-guide/side-bar/side-bar-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [标签栏](<TabBar 标签栏.md>) | 目标模块/视图需要从应用的任何地方直接进行访问时使用 |
| [选项卡](<Tabs 选项卡.md>) | 当内容/数据需要一定的分类纬度进行区分，便于用户快速作出选择并切换时可以使用。 |
