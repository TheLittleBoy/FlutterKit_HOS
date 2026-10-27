# Icon 图标

> Icon 作为UI构成中重要的元素，一定程度上影响UI界面整体呈现出的风格。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/icon)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 主题与图标

##### TIcon 基础用法:

```dart
import 'package:flutter/services.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart' hide TIcons;
import 'package:tdesign_flutter_icons/tdesign_flutter_icons.dart';
import 'package:url_launcher/link.dart';

class BasicTIconExample extends StatelessWidget {
  const BasicTIconExample({super.key});

  Widget _buildBasicTIcon(BuildContext context) {
    // TIcon Widget（Material Icon 薄包装）
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TIcon(TIcons.home_filled),
        SizedBox(width: 16),
        TIcon(TIcons.setting),
        SizedBox(width: 16),
        TIcon(TIcons.notification),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBasicTIcon(context);
  }
}
```

##### 指定 size 和 color:

```dart
import 'package:flutter/services.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart' hide TIcons;
import 'package:tdesign_flutter_icons/tdesign_flutter_icons.dart';
import 'package:url_launcher/link.dart';

class SizedTIconExample extends StatelessWidget {
  const SizedTIconExample({super.key});

  Widget _buildSizedTIcon(BuildContext context) {
    // 构造器参数 size/color 直接生效
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TIcon(TIcons.home_filled, size: 32, color: context.tTheme.brandColor),
        const SizedBox(width: 16),
        TIcon(TIcons.setting, size: 28, color: context.tTheme.errorColor),
        const SizedBox(width: 16),
        TIcon(
          TIcons.notification,
          size: 24,
          color: context.tTheme.warningColor,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSizedTIcon(context);
  }
}
```

##### TIcon.fromName 通过名称:

```dart
import 'package:flutter/services.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart' hide TIcons;
import 'package:tdesign_flutter_icons/tdesign_flutter_icons.dart';
import 'package:url_launcher/link.dart';

class IconFromNameExample extends StatelessWidget {
  const IconFromNameExample({super.key});

  Widget _buildFromName(BuildContext context) {
    // 通过图标名查找（内部查找 TIcons.allIconsMap）
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TIcon.fromName('home_filled'),
        const SizedBox(width: 16),
        TIcon.fromName('heart_filled', color: context.tTheme.errorColor),
        const SizedBox(width: 16),
        TIcon.fromName('star_filled', color: context.tTheme.warningColor),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildFromName(context);
  }
}
```

##### TDesign Token 默认尺寸与颜色:

```dart
import 'package:flutter/services.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart' hide TIcons;
import 'package:tdesign_flutter_icons/tdesign_flutter_icons.dart';
import 'package:url_launcher/link.dart';

class IconTokenExample extends StatelessWidget {
  const IconTokenExample({super.key});

  Widget _buildIconTokenExample(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TIcon(TIcons.home_filled),
            SizedBox(width: 16),
            TIcon(TIcons.setting),
            SizedBox(width: 16),
            TIcon(TIcons.notification),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          '↑ 默认 24dp，颜色使用文字主色 Token',
          style: TextStyle(
            fontSize: 12,
            color: context.tTheme.textColorSecondary,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildIconTokenExample(context);
  }
}
```

##### 构造器参数覆盖默认值:

```dart
import 'package:flutter/services.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart' hide TIcons;
import 'package:tdesign_flutter_icons/tdesign_flutter_icons.dart';
import 'package:url_launcher/link.dart';

class IconPriorityExample extends StatelessWidget {
  const IconPriorityExample({super.key});

  Widget _buildIconPriorityExample(BuildContext context) {
    // 构造器显式值覆盖 TDesign Token 默认值。
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 构造器 size 覆盖默认 24dp。
            const TIcon(TIcons.home_filled, size: 20),
            const SizedBox(width: 16),
            // 构造器 color 覆盖文字主色 Token。
            TIcon(TIcons.setting, color: context.tTheme.errorColor),
            const SizedBox(width: 16),
            // 无构造器参数，使用 TDesign Token 默认值。
            const TIcon(TIcons.notification),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          '↑ 前两个图标显式覆盖，第三个使用 Token 默认值',
          style: TextStyle(
            fontSize: 12,
            color: context.tTheme.textColorSecondary,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildIconPriorityExample(context);
  }
}
```

#### icon示例

##### `ShowAllIconsExample`

```dart
import 'package:flutter/services.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart' hide TIcons;
import 'package:tdesign_flutter_icons/tdesign_flutter_icons.dart';
import 'package:url_launcher/link.dart';

class ShowAllIconsExample extends StatefulWidget {
  const ShowAllIconsExample({super.key});

  @override
  State<ShowAllIconsExample> createState() => _ShowAllIconsExampleState();
}

class _ShowAllIconsExampleState extends State<ShowAllIconsExample> {
  Widget _showAllIcons(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          RepaintBoundary(
            key: const Key('icon-official-link-section'),
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.topLeft,
              color: context.tTheme.bgColorContainer,
              child: Link(
                key: const Key('icon-official-link'),
                uri: Uri.parse('https://tdesign.tencent.com/icons'),
                target: LinkTarget.blank,
                builder: (context, followLink) => TLink(
                  child: const Text('https://tdesign.tencent.com/icons'),
                  prefixIcon: const Icon(TIcons.link),
                  suffixIcon: const Icon(TIcons.jump),
                  colorPreset: TLinkColorPreset.primary,
                  semanticLabel: '打开 TDesign 图标官网',
                  onPressed: followLink,
                ),
              ),
            ),
          ),
          TSearchBar(
            hintText: '搜索',
            onChanged: (text) {
              final query = text.trim().toLowerCase();
              setState(() {
                iconList = query.isEmpty
                    ? TIcons.allIconsMap.entries.toList()
                    : TIcons.allIconsMap.entries
                          .where(
                            (item) => item.key.toLowerCase().contains(query),
                          )
                          .toList();
              });
            },
          ),
          Builder(
            builder: (context) {
              if (iconList.isEmpty) {
                return const SizedBox(
                  height: 96,
                  child: Center(child: TText('暂无内容')),
                );
              }

              return IconCatalogGrid(icons: iconList);
            },
          ),
        ],
      ),
    );
  }

  List<MapEntry<String, IconData>> iconList = [];

  @override
  void initState() {
    super.initState();

    iconList = TIcons.allIconsMap.entries.toList();
  }

  @override
  Widget build(BuildContext context) {
    return _showAllIcons(context);
  }
}

/// Icon Demo 使用的懒加载网格，避免一次性创建全部图标。
@visibleForTesting
class IconCatalogGrid extends StatelessWidget {
  const IconCatalogGrid({super.key, required this.icons});

  final List<MapEntry<String, IconData>> icons;

  Future<void> _copyIcon(BuildContext context, String name) async {
    final code = 'TIcon(TIcons.$name)';
    await Clipboard.setData(ClipboardData(text: code));
    if (!context.mounted) {
      return;
    }
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text('已复制 $code'),
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: GridView.builder(
        key: const Key('icon-catalog-grid'),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 96,
          mainAxisExtent: 64,
          mainAxisSpacing: 15,
        ),
        itemCount: icons.length,
        itemBuilder: (context, index) {
          final item = icons[index];
          return Semantics(
            button: true,
            label: '${item.key} 图标',
            hint: '点击复制代码',
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () => _copyIcon(context, item.key),
              child: Container(
                key: ValueKey('icon-catalog-item-${item.key}'),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TIcon(item.value, size: 24),
                    const SizedBox(height: 4),
                    TText(
                      item.key,
                      font: context.tTheme.fontBodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: context.tTheme.textColorPlaceholder,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
```

## API

1. [TIcon](#ticon)

### TIcon

#### 构造方法

##### TIcon

位置参数：`icon`

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| icon | IconData | - | 要绘制的图标数据，通常使用 `tdesign_flutter_icons` 提供的 `TIcons.xxx`。 | 是 |
| color | Color? | - | 图标颜色。 未设置时继承 TDesign 组合组件的图标颜色；独立使用时读取 `textColorPrimary` Token。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| semanticLabel | String? | - | 无障碍语义标签。 非空时由原生 `Icon` 暴露给辅助技术；为空时图标不单独提供语义节点。 | 否 |
| size | double? | - | 图标尺寸，单位为逻辑像素。 未设置时继承 TDesign 组合组件的图标尺寸；独立使用时为 24dp。 | 否 |

##### TIcon.fromName

位置参数：`name`

通过图标名称构造，并在 `TIcons.allIconsMap` 中查找对应图标。

如果名称不存在，抛出 `ArgumentError`。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| name | String | - | 图标名称，对应 `TIcons.allIconsMap` 中的 key。 | 是 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| size | double? | - | 图标尺寸，单位为逻辑像素。 未设置时继承 TDesign 组合组件的图标尺寸；独立使用时为 24dp。 | 否 |
| color | Color? | - | 图标颜色。 未设置时继承 TDesign 组合组件的图标颜色；独立使用时读取 `textColorPrimary` Token。 | 否 |
| semanticLabel | String? | - | 无障碍语义标签。 非空时由原生 `Icon` 暴露给辅助技术；为空时图标不单独提供语义节点。 | 否 |
