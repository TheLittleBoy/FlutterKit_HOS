# ActionSheet 动作面板

> 在当前场景下向用户呈现一组可选操作。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/action-sheet)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 列表型动作面板

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ActionSheetBasicListExample extends StatelessWidget {
  const ActionSheetBasicListExample({super.key});

  Widget _basicList(BuildContext context) => _trigger(
    label: '常规列表型',
    onPressed: () => TActionSheet.showList(
      context,
      cancelText: 'Cancel',
      items: _textItems(),
      onSelected: (item) => _showSelection(context, item),
    ),
  );

  Widget _trigger({required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: Text(label),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
      ),
    );
  }

  List<TActionSheetItem<String>> _textItems() => [
    const TActionSheetItem(value: 'move', label: 'Move'),
    const TActionSheetItem(value: 'important', label: 'Mark as important'),
    const TActionSheetItem(value: 'unsubscribe', label: 'Unsubscribe'),
    const TActionSheetItem(value: 'tasks', label: 'Add to Tasks'),
  ];

  void _showSelection(BuildContext context, TActionSheetItem<String> item) {
    TToast.showText('已选择：${item.label}', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return _basicList(context);
  }
}
```

##### `ActionSheetDescriptionListExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ActionSheetDescriptionListExample extends StatelessWidget {
  const ActionSheetDescriptionListExample({super.key});

  Widget _descriptionList(BuildContext context) => _trigger(
    label: '带描述列表型',
    onPressed: () => TActionSheet.showList(
      context,
      cancelText: 'Cancel',
      subtitle: 'Email Settings',
      items: _textItems(),
      onSelected: (item) => _showSelection(context, item),
    ),
  );

  Widget _trigger({required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: Text(label),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
      ),
    );
  }

  List<TActionSheetItem<String>> _textItems() => [
    const TActionSheetItem(value: 'move', label: 'Move'),
    const TActionSheetItem(value: 'important', label: 'Mark as important'),
    const TActionSheetItem(value: 'unsubscribe', label: 'Unsubscribe'),
    const TActionSheetItem(value: 'tasks', label: 'Add to Tasks'),
  ];

  void _showSelection(BuildContext context, TActionSheetItem<String> item) {
    TToast.showText('已选择：${item.label}', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return _descriptionList(context);
  }
}
```

##### `ActionSheetIconListExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ActionSheetIconListExample extends StatelessWidget {
  const ActionSheetIconListExample({super.key});

  Widget _iconList(BuildContext context) => _trigger(
    label: '带图标列表型',
    onPressed: () => TActionSheet.showList(
      context,
      cancelText: 'Cancel',
      items: _iconItems(),
      onSelected: (item) => _showSelection(context, item),
    ),
  );

  Widget _trigger({required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: Text(label),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
      ),
    );
  }

  List<TActionSheetItem<String>> _iconItems() => [
    const TActionSheetItem(
      value: 'move',
      label: 'Move',
      icon: Icon(TIcons.enter),
    ),
    const TActionSheetItem(
      value: 'important',
      label: 'Mark as important',
      icon: Icon(TIcons.bookmark),
    ),
    const TActionSheetItem(
      value: 'unsubscribe',
      label: 'Unsubscribe',
      icon: Icon(TIcons.pin),
    ),
    const TActionSheetItem(
      value: 'tasks',
      label: 'Add to Tasks',
      icon: Icon(TIcons.cloud_upload),
    ),
  ];

  void _showSelection(BuildContext context, TActionSheetItem<String> item) {
    TToast.showText('已选择：${item.label}', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return _iconList(context);
  }
}
```

##### `ActionSheetBadgeListExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ActionSheetBadgeListExample extends StatelessWidget {
  const ActionSheetBadgeListExample({super.key});

  Widget _badgeList(BuildContext context) => _trigger(
    label: '带徽标列表型',
    onPressed: () => TActionSheet.showList(
      context,
      cancelText: 'Cancel',
      items: _badgeItems(),
      onSelected: (item) => _showSelection(context, item),
    ),
  );

  Widget _trigger({required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: Text(label),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
      ),
    );
  }

  List<TActionSheetItem<String>> _badgeItems() => [
    const TActionSheetItem(
      value: 'move',
      label: 'Move',
      badge: TBadgeConfig(variant: TBadgeVariant.dot),
    ),
    const TActionSheetItem(
      value: 'important',
      label: 'Mark as important',
      badge: TBadgeConfig(label: '8'),
    ),
    const TActionSheetItem(
      value: 'unsubscribe',
      label: 'Unsubscribe',
      badge: TBadgeConfig(label: '99'),
    ),
    const TActionSheetItem(
      value: 'tasks',
      label: 'Add to Tasks',
      badge: TBadgeConfig(label: '99+'),
    ),
  ];

  void _showSelection(BuildContext context, TActionSheetItem<String> item) {
    TToast.showText('已选择：${item.label}', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return _badgeList(context);
  }
}
```

##### 宫格型动作面板

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ActionSheetBasicGridExample extends StatelessWidget {
  const ActionSheetBasicGridExample({super.key});

  Widget _basicGrid(BuildContext context) => _trigger(
    label: '常规宫格型',
    onPressed: () => TActionSheet.showGrid(
      context,
      cancelText: 'Cancel',
      items: _gridItems(),
      onSelected: (item) => _showSelection(context, item),
    ),
  );

  Widget _trigger({required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: Text(label),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
      ),
    );
  }

  List<TActionSheetItem<String>> _gridItems() => [
    ..._appGridItems(),
    ..._iconGridItems(),
  ];

  void _showSelection(BuildContext context, TActionSheetItem<String> item) {
    TToast.showText('已选择：${item.label}', context: context);
  }

  List<TActionSheetItem<String>> _appGridItems() => [
    TActionSheetItem(
      value: 'wechat',
      label: 'WeChat',
      icon: _assetGridIcon('assets/img/action_sheet_wechat.png'),
    ),
    TActionSheetItem(
      value: 'qq',
      label: 'QQ',
      icon: _assetGridIcon('assets/img/action_sheet_qq.png'),
    ),
    TActionSheetItem(
      value: 'document',
      label: 'Doc',
      icon: _assetGridIcon('assets/img/action_sheet_doc.png'),
    ),
    TActionSheetItem(
      value: 'map',
      label: 'Map',
      icon: _assetGridIcon('assets/img/action_sheet_map.png'),
    ),
  ];

  List<TActionSheetItem<String>> _iconGridItems() => [
    TActionSheetItem(
      value: 'share',
      label: 'Share',
      icon: _iconGridIcon(TIcons.share),
    ),
    TActionSheetItem(
      value: 'favorite',
      label: 'Collect',
      icon: _iconGridIcon(TIcons.star),
    ),
    TActionSheetItem(
      value: 'download',
      label: 'Download',
      icon: _iconGridIcon(TIcons.cloud_download),
    ),
    TActionSheetItem(
      value: 'edit',
      label: 'Edit',
      icon: _iconGridIcon(TIcons.edit),
    ),
  ];

  Widget _iconGridIcon(IconData icon) => Builder(
    builder: (context) => Container(
      key: ValueKey(icon),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: context.tTheme.bgColorSecondaryContainer,
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: Icon(icon, size: 24),
    ),
  );

  Widget _assetGridIcon(String path) {
    return Container(
      key: ValueKey(path),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.06),
          width: 0.5,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _basicGrid(context);
  }
}
```

##### `ActionSheetDescriptionGridExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ActionSheetDescriptionGridExample extends StatelessWidget {
  const ActionSheetDescriptionGridExample({super.key});

  Widget _descriptionGrid(BuildContext context) => _trigger(
    label: '带描述宫格型',
    onPressed: () => TActionSheet.showGrid(
      context,
      cancelText: 'Cancel',
      subtitle: 'Forward To',
      items: _gridItems(),
      onSelected: (item) => _showSelection(context, item),
    ),
  );

  Widget _trigger({required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: Text(label),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
      ),
    );
  }

  List<TActionSheetItem<String>> _gridItems() => [
    ..._appGridItems(),
    ..._iconGridItems(),
  ];

  void _showSelection(BuildContext context, TActionSheetItem<String> item) {
    TToast.showText('已选择：${item.label}', context: context);
  }

  List<TActionSheetItem<String>> _appGridItems() => [
    TActionSheetItem(
      value: 'wechat',
      label: 'WeChat',
      icon: _assetGridIcon('assets/img/action_sheet_wechat.png'),
    ),
    TActionSheetItem(
      value: 'qq',
      label: 'QQ',
      icon: _assetGridIcon('assets/img/action_sheet_qq.png'),
    ),
    TActionSheetItem(
      value: 'document',
      label: 'Doc',
      icon: _assetGridIcon('assets/img/action_sheet_doc.png'),
    ),
    TActionSheetItem(
      value: 'map',
      label: 'Map',
      icon: _assetGridIcon('assets/img/action_sheet_map.png'),
    ),
  ];

  List<TActionSheetItem<String>> _iconGridItems() => [
    TActionSheetItem(
      value: 'share',
      label: 'Share',
      icon: _iconGridIcon(TIcons.share),
    ),
    TActionSheetItem(
      value: 'favorite',
      label: 'Collect',
      icon: _iconGridIcon(TIcons.star),
    ),
    TActionSheetItem(
      value: 'download',
      label: 'Download',
      icon: _iconGridIcon(TIcons.cloud_download),
    ),
    TActionSheetItem(
      value: 'edit',
      label: 'Edit',
      icon: _iconGridIcon(TIcons.edit),
    ),
  ];

  Widget _iconGridIcon(IconData icon) => Builder(
    builder: (context) => Container(
      key: ValueKey(icon),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: context.tTheme.bgColorSecondaryContainer,
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: Icon(icon, size: 24),
    ),
  );

  Widget _assetGridIcon(String path) {
    return Container(
      key: ValueKey(path),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.06),
          width: 0.5,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _descriptionGrid(context);
  }
}
```

##### `ActionSheetPagedGridExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ActionSheetPagedGridExample extends StatelessWidget {
  const ActionSheetPagedGridExample({super.key});

  Widget _pagedGrid(BuildContext context) => _trigger(
    label: '带翻页宫格型',
    onPressed: () => TActionSheet.showGrid(
      context,
      items: [..._gridItems(), ..._iconGridItems(), ..._gridItems()],
      layout: const TActionSheetGridLayout.paged(count: 8, rows: 2),
      cancelText: 'Cancel',
      onSelected: (item) => _showSelection(context, item),
    ),
  );

  Widget _trigger({required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: Text(label),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
      ),
    );
  }

  List<TActionSheetItem<String>> _gridItems() => [
    ..._appGridItems(),
    ..._iconGridItems(),
  ];

  List<TActionSheetItem<String>> _iconGridItems() => [
    TActionSheetItem(
      value: 'share',
      label: 'Share',
      icon: _iconGridIcon(TIcons.share),
    ),
    TActionSheetItem(
      value: 'favorite',
      label: 'Collect',
      icon: _iconGridIcon(TIcons.star),
    ),
    TActionSheetItem(
      value: 'download',
      label: 'Download',
      icon: _iconGridIcon(TIcons.cloud_download),
    ),
    TActionSheetItem(
      value: 'edit',
      label: 'Edit',
      icon: _iconGridIcon(TIcons.edit),
    ),
  ];

  void _showSelection(BuildContext context, TActionSheetItem<String> item) {
    TToast.showText('已选择：${item.label}', context: context);
  }

  Widget _iconGridIcon(IconData icon) => Builder(
    builder: (context) => Container(
      key: ValueKey(icon),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: context.tTheme.bgColorSecondaryContainer,
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: Icon(icon, size: 24),
    ),
  );

  List<TActionSheetItem<String>> _appGridItems() => [
    TActionSheetItem(
      value: 'wechat',
      label: 'WeChat',
      icon: _assetGridIcon('assets/img/action_sheet_wechat.png'),
    ),
    TActionSheetItem(
      value: 'qq',
      label: 'QQ',
      icon: _assetGridIcon('assets/img/action_sheet_qq.png'),
    ),
    TActionSheetItem(
      value: 'document',
      label: 'Doc',
      icon: _assetGridIcon('assets/img/action_sheet_doc.png'),
    ),
    TActionSheetItem(
      value: 'map',
      label: 'Map',
      icon: _assetGridIcon('assets/img/action_sheet_map.png'),
    ),
  ];

  Widget _assetGridIcon(String path) {
    return Container(
      key: ValueKey(path),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.06),
          width: 0.5,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _pagedGrid(context);
  }
}
```

##### `ActionSheetBadgeGridExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ActionSheetBadgeGridExample extends StatelessWidget {
  const ActionSheetBadgeGridExample({super.key});

  Widget _badgeGrid(BuildContext context) => _trigger(
    label: '带徽标宫格型',
    onPressed: () => TActionSheet.showGrid(
      context,
      cancelText: 'Cancel',
      items: _badgeGridItems(),
      onSelected: (item) => _showSelection(context, item),
    ),
  );

  Widget _trigger({required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: Text(label),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
      ),
    );
  }

  List<TActionSheetItem<String>> _badgeGridItems() => [
    TActionSheetItem(
      value: 'wechat',
      label: '微信',
      icon: _assetGridIcon('assets/img/t_action_sheet_1.png'),
      badge: const TBadgeConfig(label: 'NEW'),
    ),
    TActionSheetItem(
      value: 'moments',
      label: '朋友圈',
      icon: _assetGridIcon('assets/img/t_action_sheet_2.png'),
    ),
    TActionSheetItem(
      value: 'qq',
      label: 'QQ',
      icon: _assetGridIcon('assets/img/t_action_sheet_3.png'),
    ),
    TActionSheetItem(
      value: 'wecom',
      label: '企业微信',
      icon: _assetGridIcon('assets/img/t_action_sheet_4.png'),
    ),
    TActionSheetItem(
      value: 'favorite',
      label: '收藏',
      icon: _iconGridIcon(TIcons.star),
      badge: const TBadgeConfig(variant: TBadgeVariant.dot),
    ),
    TActionSheetItem(
      value: 'refresh',
      label: '刷新',
      icon: _iconGridIcon(TIcons.refresh),
    ),
    TActionSheetItem(
      value: 'download',
      label: '下载',
      icon: _iconGridIcon(TIcons.download),
      badge: const TBadgeConfig(label: '8'),
    ),
    TActionSheetItem(
      value: 'copy',
      label: '复制',
      icon: _iconGridIcon(TIcons.queue),
    ),
  ];

  void _showSelection(BuildContext context, TActionSheetItem<String> item) {
    TToast.showText('已选择：${item.label}', context: context);
  }

  Widget _assetGridIcon(String path) {
    return Container(
      key: ValueKey(path),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.06),
          width: 0.5,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }

  Widget _iconGridIcon(IconData icon) => Builder(
    builder: (context) => Container(
      key: ValueKey(icon),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: context.tTheme.bgColorSecondaryContainer,
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: Icon(icon, size: 24),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _badgeGrid(context);
  }
}
```

##### `ActionSheetScrollGridExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ActionSheetScrollGridExample extends StatelessWidget {
  const ActionSheetScrollGridExample({super.key});

  Widget _scrollGrid(BuildContext context) => _trigger(
    label: '多行滚动宫格型',
    onPressed: () => TActionSheet.showGrid(
      context,
      cancelText: 'Cancel',
      items: _scrollGridItems(),
      layout: const TActionSheetGridLayout.scroll(
        count: 10,
        rows: 2,
        itemMinWidth: 80,
      ),
      onSelected: (item) => _showSelection(context, item),
    ),
  );

  Widget _trigger({required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: Text(label),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
      ),
    );
  }

  List<TActionSheetItem<String>> _scrollGridItems() => [
    ..._appGridItems(),
    TActionSheetItem(
      value: 'qq-music',
      label: 'QQ Music',
      icon: _assetGridIcon('assets/img/action_sheet_qq_music.png'),
    ),
    ..._iconGridItems(),
    TActionSheetItem(
      value: 'link',
      label: 'Link',
      icon: _iconGridIcon(TIcons.link),
    ),
  ];

  void _showSelection(BuildContext context, TActionSheetItem<String> item) {
    TToast.showText('已选择：${item.label}', context: context);
  }

  List<TActionSheetItem<String>> _appGridItems() => [
    TActionSheetItem(
      value: 'wechat',
      label: 'WeChat',
      icon: _assetGridIcon('assets/img/action_sheet_wechat.png'),
    ),
    TActionSheetItem(
      value: 'qq',
      label: 'QQ',
      icon: _assetGridIcon('assets/img/action_sheet_qq.png'),
    ),
    TActionSheetItem(
      value: 'document',
      label: 'Doc',
      icon: _assetGridIcon('assets/img/action_sheet_doc.png'),
    ),
    TActionSheetItem(
      value: 'map',
      label: 'Map',
      icon: _assetGridIcon('assets/img/action_sheet_map.png'),
    ),
  ];

  Widget _assetGridIcon(String path) {
    return Container(
      key: ValueKey(path),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.06),
          width: 0.5,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }

  List<TActionSheetItem<String>> _iconGridItems() => [
    TActionSheetItem(
      value: 'share',
      label: 'Share',
      icon: _iconGridIcon(TIcons.share),
    ),
    TActionSheetItem(
      value: 'favorite',
      label: 'Collect',
      icon: _iconGridIcon(TIcons.star),
    ),
    TActionSheetItem(
      value: 'download',
      label: 'Download',
      icon: _iconGridIcon(TIcons.cloud_download),
    ),
    TActionSheetItem(
      value: 'edit',
      label: 'Edit',
      icon: _iconGridIcon(TIcons.edit),
    ),
  ];

  Widget _iconGridIcon(IconData icon) => Builder(
    builder: (context) => Container(
      key: ValueKey(icon),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: context.tTheme.bgColorSecondaryContainer,
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: Icon(icon, size: 24),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _scrollGrid(context);
  }
}
```

##### `ActionSheetDescriptionScrollGridExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ActionSheetDescriptionScrollGridExample extends StatelessWidget {
  const ActionSheetDescriptionScrollGridExample({super.key});

  Widget _descriptionScrollGrid(BuildContext context) => _trigger(
    label: '带描述多行滚动宫格型',
    onPressed: () => TActionSheet.showGridSections(
      context,
      cancelText: 'Cancel',
      sections: [
        TActionSheetGridSection(title: 'Forward To', items: _personGridItems()),
        TActionSheetGridSection(title: 'Share', items: _scrollGridItems()),
      ],
      onSelected: (item) => _showSelection(context, item),
    ),
  );

  Widget _trigger({required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: Text(label),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
      ),
    );
  }

  List<TActionSheetItem<String>> _personGridItems() => const [
    TActionSheetItem(
      value: 'allen',
      label: 'Allen',
      icon: ActionSheetDescriptionScrollGridExampleActionSheetAssetIcon(
        'assets/img/action_sheet_allen.png',
      ),
    ),
    TActionSheetItem(
      value: 'nick',
      label: 'Nick',
      icon: ActionSheetDescriptionScrollGridExampleActionSheetAssetIcon(
        'assets/img/action_sheet_nick.png',
      ),
    ),
    TActionSheetItem(
      value: 'jacky',
      label: 'Jacky',
      icon: ActionSheetDescriptionScrollGridExampleActionSheetAssetIcon(
        'assets/img/action_sheet_jacky.png',
      ),
    ),
    TActionSheetItem(
      value: 'eric',
      label: 'Eric',
      icon: ActionSheetDescriptionScrollGridExampleActionSheetAssetIcon(
        'assets/img/action_sheet_eric.png',
      ),
    ),
    TActionSheetItem(
      value: 'johnson',
      label: 'Johnson',
      icon: ActionSheetDescriptionScrollGridExampleActionSheetAssetIcon(
        'assets/img/action_sheet_johnson.png',
      ),
    ),
  ];

  List<TActionSheetItem<String>> _scrollGridItems() => [
    ..._appGridItems(),
    TActionSheetItem(
      value: 'qq-music',
      label: 'QQ Music',
      icon: _assetGridIcon('assets/img/action_sheet_qq_music.png'),
    ),
    ..._iconGridItems(),
    TActionSheetItem(
      value: 'link',
      label: 'Link',
      icon: _iconGridIcon(TIcons.link),
    ),
  ];

  void _showSelection(BuildContext context, TActionSheetItem<String> item) {
    TToast.showText('已选择：${item.label}', context: context);
  }

  List<TActionSheetItem<String>> _appGridItems() => [
    TActionSheetItem(
      value: 'wechat',
      label: 'WeChat',
      icon: _assetGridIcon('assets/img/action_sheet_wechat.png'),
    ),
    TActionSheetItem(
      value: 'qq',
      label: 'QQ',
      icon: _assetGridIcon('assets/img/action_sheet_qq.png'),
    ),
    TActionSheetItem(
      value: 'document',
      label: 'Doc',
      icon: _assetGridIcon('assets/img/action_sheet_doc.png'),
    ),
    TActionSheetItem(
      value: 'map',
      label: 'Map',
      icon: _assetGridIcon('assets/img/action_sheet_map.png'),
    ),
  ];

  Widget _assetGridIcon(String path) {
    return Container(
      key: ValueKey(path),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.06),
          width: 0.5,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }

  List<TActionSheetItem<String>> _iconGridItems() => [
    TActionSheetItem(
      value: 'share',
      label: 'Share',
      icon: _iconGridIcon(TIcons.share),
    ),
    TActionSheetItem(
      value: 'favorite',
      label: 'Collect',
      icon: _iconGridIcon(TIcons.star),
    ),
    TActionSheetItem(
      value: 'download',
      label: 'Download',
      icon: _iconGridIcon(TIcons.cloud_download),
    ),
    TActionSheetItem(
      value: 'edit',
      label: 'Edit',
      icon: _iconGridIcon(TIcons.edit),
    ),
  ];

  Widget _iconGridIcon(IconData icon) => Builder(
    builder: (context) => Container(
      key: ValueKey(icon),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: context.tTheme.bgColorSecondaryContainer,
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: Icon(icon, size: 24),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _descriptionScrollGrid(context);
  }
}

class ActionSheetDescriptionScrollGridExampleActionSheetAssetIcon
    extends StatelessWidget {
  const ActionSheetDescriptionScrollGridExampleActionSheetAssetIcon(
    this.path, {
    super.key,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.06),
          width: 0.5,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }
}
```

#### 组件状态

##### 列表型选项状态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ActionSheetStatusIconListExample extends StatelessWidget {
  const ActionSheetStatusIconListExample({super.key});

  Widget _statusIconList(BuildContext context) => _trigger(
    label: '列表型选项状态',
    onPressed: () => TActionSheet.showList(
      context,
      cancelText: 'Cancel',
      items: [
        const TActionSheetItem(
          value: 'move',
          label: 'Move',
          icon: Icon(TIcons.enter),
        ),
        TActionSheetItem(
          value: 'important',
          label: 'Mark as important',
          icon: Icon(TIcons.bookmark, color: context.tTheme.brandColor),
          textStyle: TextStyle(color: context.tTheme.brandColor),
        ),
        TActionSheetItem(
          value: 'unsubscribe',
          label: 'Unsubscribe',
          icon: Icon(TIcons.pin, color: context.tTheme.errorColor),
          textStyle: TextStyle(color: context.tTheme.errorColor),
        ),
        const TActionSheetItem(
          value: 'tasks',
          label: 'Add to Tasks',
          icon: Icon(TIcons.cloud_upload),
          disabled: true,
        ),
      ],
      onSelected: (item) => _showSelection(context, item),
    ),
  );

  Widget _trigger({required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: Text(label),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
      ),
    );
  }

  void _showSelection(BuildContext context, TActionSheetItem<String> item) {
    TToast.showText('已选择：${item.label}', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return _statusIconList(context);
  }
}
```

#### 组件样式

##### 列表型对齐方式

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ActionSheetCenterListExample extends StatelessWidget {
  const ActionSheetCenterListExample({super.key});

  Widget _centerList(BuildContext context) => _trigger(
    label: '居中列表型',
    onPressed: () => TActionSheet.showList(
      context,
      cancelText: 'Cancel',
      subtitle: 'Email Settings',
      align: TActionSheetAlign.center,
      items: _iconItems(),
      onSelected: (item) => _showSelection(context, item),
    ),
  );

  Widget _trigger({required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: Text(label),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
      ),
    );
  }

  List<TActionSheetItem<String>> _iconItems() => [
    const TActionSheetItem(
      value: 'move',
      label: 'Move',
      icon: Icon(TIcons.enter),
    ),
    const TActionSheetItem(
      value: 'important',
      label: 'Mark as important',
      icon: Icon(TIcons.bookmark),
    ),
    const TActionSheetItem(
      value: 'unsubscribe',
      label: 'Unsubscribe',
      icon: Icon(TIcons.pin),
    ),
    const TActionSheetItem(
      value: 'tasks',
      label: 'Add to Tasks',
      icon: Icon(TIcons.cloud_upload),
    ),
  ];

  void _showSelection(BuildContext context, TActionSheetItem<String> item) {
    TToast.showText('已选择：${item.label}', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return _centerList(context);
  }
}
```

##### `ActionSheetLeftListExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ActionSheetLeftListExample extends StatelessWidget {
  const ActionSheetLeftListExample({super.key});

  Widget _leftList(BuildContext context) => _trigger(
    label: '左对齐列表型',
    onPressed: () => TActionSheet.showList(
      context,
      cancelText: 'Cancel',
      subtitle: 'Email Settings',
      align: TActionSheetAlign.left,
      items: _iconItems(),
      onSelected: (item) => _showSelection(context, item),
    ),
  );

  Widget _trigger({required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        child: Text(label),
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: onPressed,
      ),
    );
  }

  List<TActionSheetItem<String>> _iconItems() => [
    const TActionSheetItem(
      value: 'move',
      label: 'Move',
      icon: Icon(TIcons.enter),
    ),
    const TActionSheetItem(
      value: 'important',
      label: 'Mark as important',
      icon: Icon(TIcons.bookmark),
    ),
    const TActionSheetItem(
      value: 'unsubscribe',
      label: 'Unsubscribe',
      icon: Icon(TIcons.pin),
    ),
    const TActionSheetItem(
      value: 'tasks',
      label: 'Add to Tasks',
      icon: Icon(TIcons.cloud_upload),
    ),
  ];

  void _showSelection(BuildContext context, TActionSheetItem<String> item) {
    TToast.showText('已选择：${item.label}', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return _leftList(context);
  }
}
```

## API

1. [TActionSheetItem](#tactionsheetitem)
2. [TActionSheet](#tactionsheet)
3. [TActionSheetGridLayout](#tactionsheetgridlayout)
4. [TActionSheetGridSection](#tactionsheetgridsection)
5. [TActionSheetAlign](#tactionsheetalign)
6. [TActionSheetGridMode](#tactionsheetgridmode)
7. [TActionSheetOnSelected](#tactionsheetonselected)
8. [TActionSheetThemeData](#tactionsheetthemedata)

### TActionSheetItem

类型参数：`T`

#### 构造方法

##### TActionSheetItem

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| badge | TBadgeConfig? | - | 展示在项目内容上的徽标配置；为空时不显示。 列表模式下以标题为锚点；宫格模式下以 `icon` 为锚点，因此宫格模式仅在 `icon` 非空时展示。默认位置由 ActionSheet 管理，`TBadgeConfig.alignment` 与 `TBadgeConfig.offset` 可逐项覆盖；完全自定义外观使用 `TBadgeConfig.custom`。 | 否 |
| disabled | bool | false | 是否禁用 | 否 |
| icon | Widget? | - | 图标槽位；调用方拥有其背景、形状和显式尺寸。 未显式设置尺寸或颜色的 `Icon` 会继承 `TActionSheetThemeData`。 | 否 |
| label | String | - | 标题 | 是 |
| subtitle | String? | - | 列表模式下的描述信息；宫格模式不展示。 | 否 |
| textStyle | TextStyle? | - | 标题样式 | 否 |
| value | T | - | 稳定的业务值 | 是 |

### TActionSheet

动作面板命令式入口。

点击启用项目时先调用 onSelected，再请求关闭；回调为空时仍会关闭。
点击取消按钮先调用 onCancel，再请求关闭；onClosed 在关闭流程完成后通知。
各方法返回 TPopupHandle，可主动关闭面板。

#### 静态方法

##### TActionSheet.showGrid

类型参数：`T`

位置参数：`context`

显示宫格动作面板

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 用于查找承载弹层的 Navigator。 | 是 |
| items | List<TActionSheetItem<T>> | - | 宫格中的动作项目。 | 是 |
| layout | TActionSheetGridLayout | const TActionSheetGridLayout.fixed() | 普通、分页或横向滚动宫格布局。 | 否 |
| cancelText | String? | - | 取消按钮文字。 | 否 |
| subtitle | String? | - | 面板副标题；为 null 或空字符串时不展示。 | 否 |
| showCancel | bool | true | 是否显示取消按钮。 | 否 |
| showOverlay | bool | true | 是否显示蒙层。 | 否 |
| closeOnOverlayClick | bool | true | 点击蒙层是否关闭。 | 否 |
| useSafeArea | bool | true | 是否避让系统安全区。 | 否 |
| itemHeight | double? | - | 宫格项目高度；显式值保持固定，默认至少 96 并随内置文字增长。 | 否 |
| onCancel | VoidCallback? | - | 点击取消时回调。 | 否 |
| onClosed | VoidCallback? | - | 面板关闭后回调。 | 否 |
| onSelected | TActionSheetOnSelected<T>? | - | 点击动作时回调。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | TPopupHandle | - | 已经发起打开的动作面板控制句柄，可用于查询状态与关闭面板。 | - |

##### TActionSheet.showGridSections

类型参数：`T`

位置参数：`context`

显示带标题分组的横向滚动宫格动作面板。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 用于查找承载弹层的 Navigator。 | 是 |
| sections | List<TActionSheetGridSection<T>> | - | 带标题的分组列表，每组独立横向滚动。 | 是 |
| cancelText | String? | - | 取消按钮文字，为 null 时使用本地化文案。 | 否 |
| showCancel | bool | true | 是否显示取消按钮。 | 否 |
| showOverlay | bool | true | 是否显示蒙层。 | 否 |
| closeOnOverlayClick | bool | true | 点击蒙层是否关闭。 | 否 |
| useSafeArea | bool | true | 是否避让系统安全区。 | 否 |
| itemWidth | double | 80 | 横向列表单项宽度，默认为 80。 | 否 |
| itemHeight | double? | - | 单项高度；为 null 时使用组件主题，默认至少为 96，并随内置标签的自然高度增长。 | 否 |
| onCancel | VoidCallback? | - | 点击取消时回调。 | 否 |
| onClosed | VoidCallback? | - | 面板关闭后回调。 | 否 |
| onSelected | TActionSheetOnSelected<T>? | - | 点击项目时回传原始项目。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | TPopupHandle | - | 已经发起打开的动作面板控制句柄，可用于查询状态与关闭面板。 | - |

##### TActionSheet.showList

类型参数：`T`

位置参数：`context`

显示列表动作面板

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 用于查找承载弹层的 Navigator。 | 是 |
| items | List<TActionSheetItem<T>> | - | 列表中的动作项目。 | 是 |
| align | TActionSheetAlign | TActionSheetAlign.center | 项目文字对齐方式。 | 否 |
| cancelText | String? | - | 取消按钮文字。 | 否 |
| subtitle | String? | - | 面板副标题；为 null 或空字符串时不展示。 | 否 |
| showCancel | bool | true | 是否显示取消按钮。 | 否 |
| showOverlay | bool | true | 是否显示蒙层。 | 否 |
| closeOnOverlayClick | bool | true | 点击蒙层是否关闭。 | 否 |
| useSafeArea | bool | true | 是否避让系统安全区。 | 否 |
| onCancel | VoidCallback? | - | 点击取消时回调。 | 否 |
| onClosed | VoidCallback? | - | 面板关闭后回调。 | 否 |
| onSelected | TActionSheetOnSelected<T>? | - | 点击动作时回调。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | TPopupHandle | - | 已经发起打开的动作面板控制句柄，可用于查询状态与关闭面板。 | - |

### TActionSheetGridLayout

动作面板宫格布局

使用 `TActionSheetGridLayout.fixed`、`TActionSheetGridLayout.paged` 或
`TActionSheetGridLayout.scroll` 创建互斥的布局配置。

#### 构造方法

##### TActionSheetGridLayout.fixed

普通固定宫格

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| count | int | - | 一个可视面板期望容纳的项目数，默认 8。必须大于 0、不得小于 rows， 且能被 rows 整除。 | 否 |
| rows | int | - | 行数，默认 2；必须大于 0。 | 否 |

##### TActionSheetGridLayout.paged

整页切换并显示分页指示器的宫格

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| count | int | - | 一个可视面板期望容纳的项目数，默认 8。必须大于 0、不得小于 rows， 且能被 rows 整除。 | 否 |
| rows | int | - | 行数，默认 2；必须大于 0。 | 否 |

##### TActionSheetGridLayout.scroll

可连续横向滚动的宫格

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| count | int | - | 一个可视面板期望容纳的项目数，默认 8。必须大于 0、不得小于 rows， 且能被 rows 整除。 | 否 |
| rows | int | - | 行数，默认 2；必须大于 0。 | 否 |
| itemMinWidth | double? | - | 横向滚动项目的最小宽度；仅滚动布局可能返回非空值。 | 否 |

#### 属性

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| count | int | - | 一个可视面板期望容纳的项目数，默认 8。必须大于 0、不得小于 rows， 且能被 rows 整除。 | - |
| itemMinWidth | double? | - | 横向滚动项目的最小宽度；仅滚动布局可能返回非空值。 | - |
| mode | TActionSheetGridMode | - | 布局模式 | - |
| rows | int | - | 行数，默认 2；必须大于 0。 | - |

### TActionSheetGridSection

类型参数：`T`

横向滚动宫格中的一个带标题分组。

通过 `TActionSheet.showGridSections` 展示。每个分组独立横向滚动，
`title` 显示在该组项目上方；`items` 为空时仍保留标题。

#### 构造方法

##### TActionSheetGridSection

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| items | List<TActionSheetItem<T>> | - | 该分组中的宫格项目。 | 是 |
| title | String | - | 分组标题。 | 是 |

### TActionSheetAlign

动作面板列表内容的物理对齐方式，不随文字方向交换左右。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| center | TActionSheetAlign | - | 居中对齐 | - |
| left | TActionSheetAlign | - | 左对齐 | - |
| right | TActionSheetAlign | - | 右对齐 | - |

### TActionSheetGridMode

宫格布局模式

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| fixed | TActionSheetGridMode | - | 固定宫格 | - |
| paged | TActionSheetGridMode | - | 分页宫格 | - |
| scroll | TActionSheetGridMode | - | 横向滚动宫格 | - |

### TActionSheetOnSelected

类型参数：`T`

选择动作面板项目时触发

位置参数：`item`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| item | TActionSheetItem<T> | - | 被点击的原始动作项目。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | void | - | 无返回值。 | - |

### TActionSheetThemeData

TActionSheet 组件级视觉 ThemeExtension

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| barrierColor | Color? | - | 蒙层颜色 | 否 |
| gridIconExtent | double? | - | 宫格布局的图标槽位尺寸；未设置时默认 40dp。 | 否 |
| gridItemHeight | double? | - | 宫格项目高度 未配置时为 96 逻辑像素，show 方法的 itemHeight 优先。 | 否 |
| iconColor | Color? | - | 默认图标颜色。 未配置时使用 textColorPrimary Token；禁用项使用 textColorDisabled。 | 否 |
| iconSize | double? | - | 默认图标字形尺寸；同时作为列表图标槽位尺寸。 未配置时为 24 逻辑像素。 | 否 |
| panelRadius | double? | - | 面板圆角 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)
5. [相似组件](#相似组件)

### 何时使用

需要提供一组与当前场景操作相关的关联操作时使用。

### 组件搭配使用

##### 动作面板与[按钮](<../基础/Button 按钮.md>)组合使用，通过按钮点击唤起动作面板。

![](https://tdesign.gtimg.com/site/design/mobile-guide/action-sheet/action-sheet-1.png)

### 常见用法

##### 当用户完成一个事件可以通过若干种方式达成，可以用动态面板来承载这若干种方式的操作。

![](https://tdesign.gtimg.com/site/design/mobile-guide/action-sheet/action-sheet-2.png)

---

##### 当页面中有一组操作因低频/空间不足不希望外露时，但却必要存在，可以用动作面板来承载，通过“更多”按钮触发

![](https://tdesign.gtimg.com/site/design/mobile-guide/action-sheet/action-sheet-3.png)

### 推荐/慎用示例

##### 动作面板中不建议提供太多操作项，若过多项在小屏手机中导致需纵向滚动，体验将会受损。

![](https://tdesign.gtimg.com/site/design/mobile-guide/action-sheet/action-sheet-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/action-sheet/action-sheet-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 动作面板中的操作项不建议用icon完成替代文字。

![](https://tdesign.gtimg.com/site/design/mobile-guide/action-sheet/action-sheet-6.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/action-sheet/action-sheet-7.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [抽屉](<../导航/Drawer 抽屉.md>) | 需要收折展示一组数量较多的菜单时使用。 |
| [对话框](<Dialog 对话框.md>) | 需要用户做一些决定，或这提供完成某个任务是需要的一些额外信息时使用。 |
| [下拉菜单](<DropdownMenu 下拉菜单.md>) | 当内容较多时，需要通过筛选快速定位某一类内容时使用。 |
| [选择器](<DropdownMenu 下拉菜单.md>) | 当需要在有限的空间展示大量选项供用户选择，或者一组选项由递进层级构成需要用户逐级选择时使用。 |
