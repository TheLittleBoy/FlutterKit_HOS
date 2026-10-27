# Image 图片

> 用于展示效果，主要为上下左右居中裁切、拉伸、平铺等方式。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/image)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### `ImageTypesExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ImageTypesExample extends StatelessWidget {
  const ImageTypesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildImageTypes(context);
  }
}

Widget _buildImageTypes(BuildContext context) {
  const source = 'assets/img/image.png';
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _demoRow([
        _demoItem('裁切', const TImage(src: source, fit: BoxFit.cover)),
        _demoItem(
          '适应高',
          const TImage(
            src: source,
            width: 89,
            height: 72,
            fit: BoxFit.fitHeight,
          ),
        ),
        _demoItem(
          '拉伸',
          const TImage(src: source, width: 134, height: 72, fit: BoxFit.fill),
        ),
      ]),
      const SizedBox(height: 24),
      _demoRow([
        _demoItem('方形', const TImage(src: source, fit: BoxFit.cover)),
        _demoItem(
          '圆角方形',
          const TImage(
            src: source,
            fit: BoxFit.cover,
            shape: TImageShape.roundedSquare,
          ),
        ),
        _demoItem(
          '圆形',
          const TImage(
            src: source,
            fit: BoxFit.cover,
            shape: TImageShape.circle,
          ),
        ),
      ]),
    ],
  );
}

Widget _demoRow(List<Widget> children) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var index = 0; index < children.length; index++) ...[
            if (index > 0) const SizedBox(width: 24),
            children[index],
          ],
        ],
      ),
    ),
  );
}

Widget _demoItem(String label, Widget image) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [TText(label), const SizedBox(height: 16), image],
  );
}
```

#### 组件状态

##### `ImageStatesExample`

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ImageStatesExample extends StatelessWidget {
  const ImageStatesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildImageStates(context);
  }
}

Widget _buildImageStates(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _demoRow([
        _demoItem('加载默认提示', const TImage(shape: TImageShape.roundedSquare)),
        _demoItem(
          '加载自定义提示',
          const TImage(
            shape: TImageShape.roundedSquare,
            loadingWidget: TLoading(size: 20, icon: TLoadingIcon.circle),
          ),
        ),
      ]),
      const SizedBox(height: 24),
      _demoRow([
        _demoItem(
          '失败默认提示',
          const TImage(src: '', shape: TImageShape.roundedSquare),
        ),
        _demoItem(
          '失败自定义提示',
          TImage(
            src: '',
            shape: TImageShape.roundedSquare,
            errorWidget: TText('加载失败', font: context.tTheme.fontBodyExtraSmall),
          ),
        ),
      ]),
    ],
  );
}

Widget _demoRow(List<Widget> children) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var index = 0; index < children.length; index++) ...[
            if (index > 0) const SizedBox(width: 24),
            children[index],
          ],
        ],
      ),
    ),
  );
}

Widget _demoItem(String label, Widget image) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [TText(label), const SizedBox(height: 16), image],
  );
}
```

## API

1. [TImage](#timage)
2. [TImageShape](#timageshape)
3. [TImageThemeData](#timagethemedata)

### TImage

#### 构造方法

##### TImage

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| alignment | AlignmentGeometry | Alignment.center | 图片对齐方式。 | 否 |
| cacheHeight | int? | - | 解码缓存高度。 | 否 |
| cacheWidth | int? | - | 解码缓存宽度。 | 否 |
| errorBuilder | ImageErrorWidgetBuilder? | - | 图片错误 UI 构建器；非空时优先于 `errorWidget`。 不用于执行错误上报等副作用；错误事件使用 `onError`。 | 否 |
| errorWidget | Widget? | - | 默认错误占位内容；`errorBuilder` 非空时由其接管错误渲染。 | 否 |
| excludeFromSemantics | bool | false | 是否从语义树排除图片。 | 否 |
| filterQuality | FilterQuality | FilterQuality.low | 图片滤镜质量。 | 否 |
| fit | BoxFit | BoxFit.fill | 图片适配方式，默认为 `BoxFit.fill`。 | 否 |
| frameBuilder | ImageFrameBuilder? | - | 图片帧 UI 构建器；不用于触发加载成功副作用。 | 否 |
| height | double? | - | 图片高度，未指定时为 72。 | 否 |
| imageFile | File? | - | 本地图片文件；不能与 `src` 同时提供。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| loadingBuilder | ImageLoadingBuilder? | - | 网络图片的增量加载进度构建器。 仅透传给 `Image.network`；asset 和 `imageFile` 的首帧 UI 使用 `frameBuilder`。 | 否 |
| loadingWidget | Widget? | - | 默认加载占位内容。 `src` 为 null 时直接显示；网络图片加载时仅在 `loadingBuilder` 为空时显示。 | 否 |
| onError | ImageErrorListener? | - | 图片加载失败后的回调。 每个图片来源生命周期只触发一次，并接收原始错误与堆栈。 | 否 |
| onLoad | VoidCallback? | - | 图片首帧加载成功后的回调。 每个图片来源生命周期只触发一次；动画图片的后续帧不重复触发。 | 否 |
| onTap | GestureTapCallback? | - | 点击回调；为空时不创建点击行为。 | 否 |
| repeat | ImageRepeat | ImageRepeat.noRepeat | 图片重复方式。 | 否 |
| semanticLabel | String? | - | 无障碍标签。 | 否 |
| shape | TImageShape | TImageShape.square | 图片形状，默认为 `TImageShape.square`。 | 否 |
| src | String? | - | 网络 URL 或 asset 路径。 为 null 时显示加载占位；空字符串显示失败占位。 | 否 |
| width | double? | - | 图片宽度，未指定时为 72。 | 否 |

### TImageShape

图片形状。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| square | TImageShape | - | 方形。 | - |
| roundedSquare | TImageShape | - | 圆角方形。 | - |
| circle | TImageShape | - | 圆形。 | - |

### TImageThemeData

图片组件的视觉默认值。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| centerSlice | Rect? | - | 九宫格中心切片。 | 否 |
| color | Color? | - | 图片叠加色。 | 否 |
| colorBlendMode | BlendMode? | - | 颜色混合模式。 | 否 |
| gaplessPlayback | bool? | - | 更新 provider 时是否保留上一帧。 未配置时为 false。 | 否 |
| isAntiAlias | bool? | - | 是否启用抗锯齿。 未配置时为 false。 | 否 |
| matchTextDirection | bool? | - | 是否匹配文字方向。 未配置时为 false。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [推荐/慎用示例](#推荐-慎用示例)

### 何时使用

当需要对图像内容进行陈列、展示，以便用户快速了解图像信息时使用。

### 组件搭配使用

##### 可使用[宫格](https://tdesign.tencent.com/flutter/components/grid)、[单元格](<Cell 单元格.md>)承载图片，作为某种功能、某类信息的入口。

![](https://tdesign.gtimg.com/site/design/mobile-guide/image/image-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/image/image-2.png)

---

##### 图片与[下拉刷新](<../反馈/PullDownRefresh 下拉刷新.md>)组合使用，用于图片瀑布流时的内容更新。

![](https://tdesign.gtimg.com/site/design/mobile-guide/image/image-3.png)

### 推荐/慎用示例

##### 当图片仅为展示，不具备预览功能时，应避免图片尺寸过小，从而影响图像信息的浏览和获取。

![](https://tdesign.gtimg.com/site/design/mobile-guide/image/image-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/image/image-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)
