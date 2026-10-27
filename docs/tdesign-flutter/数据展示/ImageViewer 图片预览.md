# ImageViewer 图片预览

> 用于图片内容的缩略展示与查看。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/image-viewer)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 基础图片预览

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ImageViewerBasicExample extends StatelessWidget {
  const ImageViewerBasicExample({super.key});

  Widget _buildBasic(BuildContext context) {
    const images = <ImageProvider<Object>>[
      AssetImage('assets/img/image.png'),
      AssetImage('assets/img/t_action_sheet_8.png'),
    ];
    return SizedBox(
      width: double.infinity,
      child: TButton(
        size: TButtonSize.large,
        variant: TButtonVariant.outline,
        colorPreset: TButtonColorPreset.primary,
        onPressed: () => TImageViewer.show(
          context: context,
          images: images,
          showClose: false,
          showIndex: true,
        ),
        child: const Text('基础图片预览'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBasic(context);
  }
}
```

##### 带操作图片预览

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ImageViewerWithActionsExample extends StatefulWidget {
  const ImageViewerWithActionsExample({super.key});

  @override
  State<ImageViewerWithActionsExample> createState() =>
      _ImageViewerWithActionsExampleState();
}

class _ImageViewerWithActionsExampleState
    extends State<ImageViewerWithActionsExample> {
  static const _initialImages = <ImageProvider<Object>>[
    AssetImage('assets/img/image.png'),
    AssetImage('assets/img/t_action_sheet_8.png'),
  ];

  List<ImageProvider<Object>> _images = _initialImages;
  bool _opening = false;

  Future<void> _showImages() async {
    if (_opening) {
      return;
    }
    _opening = true;
    if (_images.isEmpty) {
      setState(() => _images = _initialImages);
    }
    final navigator = Navigator.of(context, rootNavigator: true);
    var initialIndex = 0;
    try {
      while (mounted && _images.isNotEmpty) {
        int? deletedIndex;
        var previewOpen = true;
        var confirming = false;
        // 每次预览持有独立快照；删除只发生在旧预览关闭后。
        final snapshot = List<ImageProvider<Object>>.unmodifiable(_images);
        await TImageViewer.show(
          context: context,
          images: snapshot,
          initialIndex: initialIndex,
          showClose: true,
          showDelete: true,
          showIndex: true,
          onDelete: (index) async {
            if (!mounted || confirming || !previewOpen) {
              return;
            }
            confirming = true;
            var confirmed = false;
            final closed = Completer<void>();
            TActionSheet.showList<int>(
              context,
              subtitle: '要删除这张照片吗？',
              items: [
                TActionSheetItem(
                  value: 1,
                  label: '删除',
                  textStyle: TextStyle(color: context.tTheme.errorColor),
                ),
              ],
              onSelected: (_) => confirmed = true,
              onClosed: closed.complete,
            );
            await closed.future;
            confirming = false;
            if (confirmed && mounted && previewOpen) {
              deletedIndex = index;
              navigator.pop();
            }
          },
        ).whenComplete(() => previewOpen = false);
        final index = deletedIndex;
        if (!mounted || index == null) {
          break;
        }
        setState(() {
          _images = [...snapshot]..removeAt(index);
        });
        if (_images.isEmpty) {
          TToast.showText('图片已全部删除', context: context);
          break;
        }
        initialIndex = index.clamp(0, _images.length - 1);
      }
    } finally {
      _opening = false;
    }
  }

  Widget _buildWithActions(BuildContext context) => SizedBox(
    width: double.infinity,
    child: TButton(
      size: TButtonSize.large,
      variant: TButtonVariant.outline,
      colorPreset: TButtonColorPreset.primary,
      onPressed: _showImages,
      child: Text(_images.isEmpty ? '重新体验带操作图片预览' : '带操作图片预览'),
    ),
  );

  @override
  Widget build(BuildContext context) => _buildWithActions(context);
}
```

## API

1. [TImageViewer](#timageviewer)
2. [TImageViewerItemBuilder](#timagevieweritembuilder)
3. [TImageViewerThemeData](#timageviewerthemedata)

### TImageViewer

#### 静态方法

##### TImageViewer.show

显示全屏图片预览。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 用于展示预览弹窗。 调用方需要主动关闭时，可通过持有的 `NavigatorState` 调用 `NavigatorState.pop`；返回的 Future 会在路由关闭后完成一次。 | 是 |
| images | List<ImageProvider<Object>> | - | 是待预览的图片列表，不能为空。 | 是 |
| labels | List<String>? | - | 是与图片一一对应的标签文案；非空时长度必须等于 images，否则抛出 ArgumentError。 | 否 |
| initialIndex | int | 0 | 设置初始展示的图片索引，必须在 0 到 images.length - 1 之间；否则抛出 RangeError。 | 否 |
| showClose | bool | true | 控制关闭按钮是否显示。 | 否 |
| showDelete | bool | false | 控制删除按钮是否显示。 | 否 |
| showIndex | bool | true | 控制当前页码是否显示。 | 否 |
| loop | bool | false | 控制是否循环切换图片。 | 否 |
| autoplay | bool | false | 控制是否自动切换图片；图片放大时暂停，还原后恢复。 | 否 |
| autoplayInterval | Duration | const Duration(seconds: 3) | 设置自动切换图片的时间间隔，必须大于 Duration.zero；否则抛出 ArgumentError。 | 否 |
| onIndexChanged | ValueChanged<int>? | - | 在当前图片索引变化时触发。 | 否 |
| onDelete | ValueChanged<int>? | - | 在点击删除按钮时触发，仅通知当前索引。 | 否 |
| onTap | ValueChanged<int>? | - | 在点击当前全屏预览区、关闭预览前触发。 | 否 |
| onLongPress | ValueChanged<int>? | - | 在长按当前图片时触发。 | 否 |
| leadingBuilder | TImageViewerItemBuilder? | - | 构建导航栏起始区域。 | 否 |
| trailingBuilder | TImageViewerItemBuilder? | - | 构建导航栏末尾区域。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Future<void> | - | 预览路由被弹出时完成，不等待关闭动画结束；参数不合法时在展示前同步抛出异常。 | - |

### TImageViewerItemBuilder

图片预览导航栏槽位构建器。

位置参数：`context, index`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 图片预览导航栏的构建上下文。 | 是 |
| index | int | - | 当前图片索引，从 0 开始。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Widget | - | 导航栏对应槽位的内容。 | - |

### TImageViewerThemeData

图片预览组件级 ThemeExtension

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| appBarBackgroundColor | Color? | - | 导航栏背景色 null 时使用不透明 fontGray1 Token。 | 否 |
| backgroundColor | Color? | - | 预览页背景色 null 时由 fontGray1 与 bgColorContainer 叠加得到默认背景色。 | 否 |
| iconColor | Color? | - | 图标颜色 null 时使用 textColorAnti Token。 | 否 |
| indexStyle | TextStyle? | - | 页码文字样式 null 时使用 textColorAnti 和 fontBodyMedium 字号，字号最终回退 14。 | 否 |
| labelStyle | TextStyle? | - | 标签文字样式 null 时使用 textColorAnti 作为标签文字颜色。 | 否 |
| viewerHeight | double? | - | 预览区默认高度 | 否 |
| viewerWidth | double? | - | 预览区默认宽度 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [推荐/慎用示例](#推荐-慎用示例)
4. [相似组件](#相似组件)

### 何时使用

当需要对展示的图片进行快速查看，以及在查看时存在放大、缩小、删除等操作诉求时使用。

### 组件搭配使用

##### 图片预览与[图片](<Image 图片.md>)组合使用，通过图片作为缩略图，点击后进行图片预览。

![](https://tdesign.gtimg.com/site/design/mobile-guide/image-viewer/image-viewer-1.png)

---

##### 当使用带删除操作的图片预览组件时，可与[动作面板](<../反馈/ActionSheet 动作面板.md>)组合使用，对删除操作进行二次确认。

![](https://tdesign.gtimg.com/site/design/mobile-guide/image-viewer/image-viewer-2.png)

### 推荐/慎用示例

##### 在可点击进入详情的卡片入口中，不建议针对图片添加图片预览能力。

![](https://tdesign.gtimg.com/site/design/mobile-guide/image-viewer/image-viewer-3.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [图片](<Image 图片.md>) | 当需要对图像内容进行陈列、展示，以便用户快速了解图像信息时使用。 |
