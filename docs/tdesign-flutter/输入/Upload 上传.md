# Upload 上传

> 用于相册读取或拉起拍照的图片上传功能。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/upload)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 单选上传

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class UploadSingleExample extends StatefulWidget {
  const UploadSingleExample({super.key});

  @override
  State<UploadSingleExample> createState() => _UploadSingleExampleState();
}

class _UploadSingleExampleState extends State<UploadSingleExample> {
  var _files = const <TUploadFile>[];

  Widget _single(BuildContext context) {
    return _demo(
      TUpload(
        files: _files,
        maxFiles: 1,
        onChanged: (value) => setState(() => _files = value),
      ),
      title: '上传图片',
    );
  }

  Widget _demo(TUpload upload, {required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TText(title),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: upload,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _single(context);
  }
}
```

##### 多选上传

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class UploadMultipleExample extends StatefulWidget {
  const UploadMultipleExample({super.key});

  @override
  State<UploadMultipleExample> createState() => _UploadMultipleExampleState();
}

class _UploadMultipleExampleState extends State<UploadMultipleExample> {
  var _files = _imageFiles;

  Widget _multiple(BuildContext context) {
    return _demo(
      TUpload(
        files: _files,
        maxFiles: 4,
        onChanged: (value) => setState(() => _files = value),
      ),
      title: '上传图片',
    );
  }

  static const _imageFiles = [
    TUploadFile(
      id: 'image-1',
      name: 'uploaded1.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/example4.png',
      status: TUploadFileStatus.success,
    ),
    TUploadFile(
      id: 'image-2',
      name: 'uploaded2.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/example6.png',
      status: TUploadFileStatus.success,
    ),
    TUploadFile(
      id: 'image-3',
      name: 'uploaded3.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/example5.png',
      status: TUploadFileStatus.success,
    ),
  ];

  Widget _demo(TUpload upload, {required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TText(title),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: upload,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _multiple(context);
  }
}
```

##### 长按图片拖拽排片

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class UploadTileExample extends StatefulWidget {
  const UploadTileExample({super.key});

  @override
  State<UploadTileExample> createState() => _UploadTileExampleState();
}

class _UploadTileExampleState extends State<UploadTileExample> {
  var _files = _imageFiles;

  Widget _tile(BuildContext context) {
    return _demo(
      TUpload(
        files: _files,
        maxFiles: 4,
        draggable: true,
        onChanged: (value) => setState(() => _files = value),
      ),
      title: '上传图片',
    );
  }

  static const _imageFiles = [
    TUploadFile(
      id: 'image-1',
      name: 'uploaded1.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/example4.png',
      status: TUploadFileStatus.success,
    ),
    TUploadFile(
      id: 'image-2',
      name: 'uploaded2.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/example6.png',
      status: TUploadFileStatus.success,
    ),
    TUploadFile(
      id: 'image-3',
      name: 'uploaded3.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/example5.png',
      status: TUploadFileStatus.success,
    ),
  ];

  Widget _demo(TUpload upload, {required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TText(title),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: upload,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _tile(context);
  }
}
```

#### 组件状态

##### 加载状态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class UploadStatusExample extends StatefulWidget {
  const UploadStatusExample({super.key});

  @override
  State<UploadStatusExample> createState() => _UploadStatusExampleState();
}

class _UploadStatusExampleState extends State<UploadStatusExample> {
  var _files = _statusFiles;

  Widget _status(BuildContext context) {
    return _demo(
      TUpload(
        files: _files,
        maxFiles: 4,
        onChanged: (value) => setState(() => _files = value),
      ),
      title: '上传图片',
    );
  }

  static const _statusFiles = [
    TUploadFile(
      id: 'loading',
      name: 'uploaded1.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/example4.png',
      status: TUploadFileStatus.uploading,
    ),
    TUploadFile(
      id: 'progress',
      name: 'uploaded2.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/example5.png',
      status: TUploadFileStatus.uploading,
      progress: 0.68,
    ),
    TUploadFile(
      id: 'retry',
      name: 'uploaded3.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/example6.png',
      status: TUploadFileStatus.retryableError,
    ),
    TUploadFile(
      id: 'failed',
      name: 'uploaded4.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/example5.png',
      status: TUploadFileStatus.error,
    ),
  ];

  Widget _demo(TUpload upload, {required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TText(title),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: upload,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _status(context);
  }
}
```

##### 从聊天记录上选

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class UploadMessageFileExample extends StatefulWidget {
  const UploadMessageFileExample({super.key});

  @override
  State<UploadMessageFileExample> createState() =>
      _UploadMessageFileExampleState();
}

class _UploadMessageFileExampleState extends State<UploadMessageFileExample> {
  var _files = [_imageFiles.first];

  Widget _messageFile(BuildContext context) {
    return _demo(
      TUpload(
        files: _files,
        maxFiles: 4,
        onChanged: (value) => setState(() => _files = value),
      ),
      title: '上传图片',
    );
  }

  static const _imageFiles = [
    TUploadFile(
      id: 'image-1',
      name: 'uploaded1.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/example4.png',
      status: TUploadFileStatus.success,
    ),
    TUploadFile(
      id: 'image-2',
      name: 'uploaded2.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/example6.png',
      status: TUploadFileStatus.success,
    ),
    TUploadFile(
      id: 'image-3',
      name: 'uploaded3.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/example5.png',
      status: TUploadFileStatus.success,
    ),
  ];

  Widget _demo(TUpload upload, {required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TText(title),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: upload,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _messageFile(context);
  }
}
```

#### 组件风格

##### 宫格/列表布局

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class UploadLayoutsExample extends StatefulWidget {
  const UploadLayoutsExample({super.key});

  @override
  State<UploadLayoutsExample> createState() => _UploadLayoutsExampleState();
}

class _UploadLayoutsExampleState extends State<UploadLayoutsExample> {
  var _gridFiles = _gridLayoutFiles;
  var _listLayoutFiles = _listFiles;

  Widget _layouts(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TText('宫格布局上传'),
          const SizedBox(height: 16),
          TUpload(
            files: _gridFiles,
            maxFiles: null,
            onChanged: (value) => setState(() => _gridFiles = value),
          ),
          const SizedBox(height: 16),
          const TText('列表布局上传'),
          const SizedBox(height: 16),
          TUpload(
            files: _listLayoutFiles,
            maxFiles: null,
            layout: TUploadLayout.list,
            onChanged: (value) => setState(() => _listLayoutFiles = value),
          ),
        ],
      ),
    );
  }

  static const _gridLayoutFiles = [
    TUploadFile(
      id: 'grid-loading',
      name: 'loading-file.txt',
      status: TUploadFileStatus.uploading,
    ),
    TUploadFile(
      id: 'grid-progress',
      name: 'loading-file2.txt',
      status: TUploadFileStatus.uploading,
      progress: 0.68,
    ),
    TUploadFile(
      id: 'grid-retry',
      name: 'failed-file.txt',
      status: TUploadFileStatus.retryableError,
    ),
    TUploadFile(
      id: 'grid-failed',
      name: 'error-file.txt',
      status: TUploadFileStatus.error,
    ),
    TUploadFile(
      id: 'grid-excel',
      name: 'report.xlsx',
      size: 153600,
      status: TUploadFileStatus.success,
    ),
    TUploadFile(
      id: 'grid-pdf',
      name: 'document.pdf',
      size: 327680,
      status: TUploadFileStatus.success,
    ),
    TUploadFile(
      id: 'grid-powerpoint',
      name: 'presentation.pptx',
      size: 524288,
      status: TUploadFileStatus.success,
    ),
    TUploadFile(
      id: 'grid-word',
      name: 'article.docx',
      size: 262144,
      status: TUploadFileStatus.success,
    ),
    TUploadFile(
      id: 'grid-image-loading',
      name: 'image-loading.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/upload6.png',
      status: TUploadFileStatus.uploading,
    ),
    TUploadFile(
      id: 'grid-image-progress',
      name: 'image-percent.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/upload6.png',
      status: TUploadFileStatus.uploading,
      progress: 0.68,
    ),
    TUploadFile(
      id: 'grid-image-retry',
      name: 'image-reload.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/upload6.png',
      status: TUploadFileStatus.retryableError,
    ),
    TUploadFile(
      id: 'grid-image-failed',
      name: 'image-failed.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/upload6.png',
      status: TUploadFileStatus.error,
    ),
    TUploadFile(
      id: 'grid-image-done',
      name: 'image-done.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/upload6.png',
      status: TUploadFileStatus.success,
    ),
  ];

  static const _listFiles = [
    TUploadFile(
      id: 'list-loading',
      name: 'Technical Design Document.pdf',
      size: 222208,
      status: TUploadFileStatus.uploading,
      progress: 0.3,
    ),
    TUploadFile(
      id: 'list-failed',
      name: 'Technical Design Document.pdf',
      size: 222208,
      status: TUploadFileStatus.error,
    ),
    TUploadFile(
      id: 'list-image',
      name: 'Design Mockup.png',
      url: 'https://tdesign.gtimg.com/mobile/demos/upload6.png',
      size: 1048576,
      status: TUploadFileStatus.success,
    ),
    TUploadFile(
      id: 'list-video',
      name: 'Product Demo.mp4',
      size: 5242880,
      status: TUploadFileStatus.success,
    ),
    TUploadFile(
      id: 'list-word',
      name: 'Project Proposal.docx',
      size: 131072,
      status: TUploadFileStatus.success,
    ),
    TUploadFile(
      id: 'list-excel',
      name: 'Financial Report.xlsx',
      size: 262144,
      status: TUploadFileStatus.success,
    ),
    TUploadFile(
      id: 'list-pdf',
      name: 'User Manual.pdf',
      size: 524288,
      status: TUploadFileStatus.success,
    ),
    TUploadFile(
      id: 'list-powerpoint',
      name: 'Quarterly Review.pptx',
      size: 786432,
      status: TUploadFileStatus.success,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _layouts(context);
  }
}
```

## API

1. [TUpload](#tupload)
2. [TUploadFile](#tuploadfile)
3. [TUploadFileStatus](#tuploadfilestatus)
4. [TUploadLayout](#tuploadlayout)
5. [TUploadVariant](#tuploadvariant)
6. [TUploadMediaType](#tuploadmediatype)
7. [TUploadValidationError](#tuploadvalidationerror)
8. [TUploadPicker](#tuploadpicker)
9. [TUploadThemeData](#tuploadthemedata)

### TUpload

#### 构造方法

##### TUpload

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| draggable | bool | false | 是否支持长按拖拽排序，默认为 false。 排序完成后通过 `onChanged` 返回新的不可变文件列表；当 `onChanged` 为 null 时组件禁用，不会开始拖拽。 | 否 |
| files | List<TUploadFile> | - | 受控文件列表。 长度不能超过 maxFiles；各文件 id 应唯一。组件不执行网络上传，由业务更新上传状态。 | 是 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| layout | TUploadLayout | TUploadLayout.grid | 文件布局方式。 | 否 |
| maxFiles | int? | 1 | 最大文件数量；null 表示不限制。 非 null 时必须大于 0；video 模式必须设为 1，包括使用自定义 picker 时。 | 否 |
| maxFileSize | int? | - | 单个文件最大字节数；null 表示不限制。 自定义 picker 返回的文件未提供 size 时跳过大小校验，调用方需自行保证大小限制。 | 否 |
| mediaType | TUploadMediaType | TUploadMediaType.image | 允许选择的媒体类型。 | 否 |
| onChanged | ValueChanged<List<TUploadFile>>? | - | 文件列表变化回调；为 null 时禁用。 为 null 只阻止新的交互，不取消已经开始的选择。 异步选择完成后优先使用当前回调；当前回调为空时使用选择开始时的回调。 组件卸载后不再通知。 | 否 |
| onError | ValueChanged<Object>? | - | 文件选择器抛出异常时触发，包括读取所选文件失败。 不表示网络上传失败；组件不执行网络上传。业务回调（包括 `onChanged`、`onValidationError`）抛出的异常不会被捕获或转发到此回调。 在途选择不受临时禁用影响；发生异常时优先使用当前回调， 当前回调为空时使用选择开始时的回调。组件卸载后不再通知。 | 否 |
| onFileTap | ValueChanged<TUploadFile>? | - | 点击任意状态的已有文件时触发。 组件不会自动预览或重新上传；调用方应根据 `TUploadFile.status` 决定后续行为。组件禁用时不会触发。 | 否 |
| onValidationError | ValueChanged<TUploadValidationError>? | - | 文件校验失败时触发。 新增批次超出数量或大小限制时整批拒绝，不触发 onChanged。 异步选择完成后优先使用当前回调；当前回调为空时使用选择开始时的回调。 | 否 |
| picker | TUploadPicker? | - | 自定义文件选择器；为空时使用 image_picker。 同一组件选择期间忽略重复点击。选择完成后按最新的受控文件列表与 数量、大小限制校验并合并；禁用不取消在途选择，组件卸载后不再通知。 | 否 |

### TUploadFile

不可变的上传文件数据。

#### 构造方法

##### TUploadFile

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| bytes | Uint8List? | - | 本地预览字节。 | 否 |
| canRemove | bool | true | 是否允许移除。 | 否 |
| errorText | String? | - | 失败状态文案。 | 否 |
| id | String | - | 文件唯一标识。 | 是 |
| name | String | - | 文件名。 | 是 |
| progress | double? | - | 上传进度，范围为 0 到 1。 | 否 |
| size | int? | - | 文件字节数。 | 否 |
| status | TUploadFileStatus | TUploadFileStatus.ready | 上传状态。 | 否 |
| url | String? | - | 远程预览地址。 | 否 |

#### 实例方法

##### TUploadFile.copyWith

创建部分字段变化的新实例。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| id | String? | - | 字段含义：文件唯一标识。 调用时的空值行为见方法说明。 | 否 |
| name | String? | - | 字段含义：文件名。 调用时的空值行为见方法说明。 | 否 |
| url | String? | - | 字段含义：远程预览地址。 调用时的空值行为见方法说明。 | 否 |
| bytes | Uint8List? | - | 字段含义：本地预览字节。 调用时的空值行为见方法说明。 | 否 |
| size | int? | - | 字段含义：文件字节数。 调用时的空值行为见方法说明。 | 否 |
| status | TUploadFileStatus? | - | 字段含义：上传状态。 调用时的空值行为见方法说明。 | 否 |
| progress | double? | - | 字段含义：上传进度，范围为 0 到 1。 调用时的空值行为见方法说明。 | 否 |
| errorText | String? | - | 字段含义：失败状态文案。 调用时的空值行为见方法说明。 | 否 |
| canRemove | bool? | - | 字段含义：是否允许移除。 调用时的空值行为见方法说明。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | TUploadFile | - | 用非空参数替换对应字段的新文件对象；null 参数保留当前字段。 | - |

### TUploadFileStatus

上传文件展示状态。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| ready | TUploadFileStatus | - | 已选择，等待业务上传。 | - |
| uploading | TUploadFileStatus | - | 上传中。 | - |
| success | TUploadFileStatus | - | 上传成功。 | - |
| error | TUploadFileStatus | - | 上传失败。 | - |
| retryableError | TUploadFileStatus | - | 上传失败且允许重试。 该状态只控制刷新图标和“重新上传”文案；组件不会自动重试。 | - |

### TUploadLayout

上传文件的布局方式。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| grid | TUploadLayout | - | 宫格布局。 | - |
| list | TUploadLayout | - | 列表布局。 | - |

### TUploadVariant

上传项形状。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| square | TUploadVariant | - | 圆角方形。 | - |
| circle | TUploadVariant | - | 圆形。 | - |

### TUploadMediaType

可选择的上传媒体类型。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| image | TUploadMediaType | - | 图片。 | - |
| video | TUploadMediaType | - | 视频。 | - |

### TUploadValidationError

上传文件校验错误。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| maxFiles | TUploadValidationError | - | 超出最大文件数量。 | - |
| fileSize | TUploadValidationError | - | 文件大小超出限制。 | - |

### TUploadPicker

自定义文件选择器。

#### 回调参数

无参数。

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Future<List<TUploadFile>> | - | 文件选择完成时提供选择的文件列表；空列表表示没有新增文件。 | - |

### TUploadThemeData

TUpload 组件级 ThemeExtension。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| addIconSize | double? | - | 网格添加图标尺寸；null 时为 28 逻辑像素。 | 否 |
| alignment | WrapAlignment? | - | 网格 Wrap 对齐方式；null 时为 WrapAlignment.start。 | 否 |
| backgroundColor | Color? | - | 启用项背景色；null 时使用 bgColorSecondaryContainer Token。 | 否 |
| borderRadius | double? | - | 方形上传项圆角，单位为逻辑像素；null 时使用 radiusDefault Token，圆形变体不使用该值。 | 否 |
| disabledBackgroundColor | Color? | - | 禁用添加项背景色；null 时使用 bgColorComponentDisabled Token。 | 否 |
| disabledForegroundColor | Color? | - | 禁用添加项前景色；null 时使用 textColorDisabled Token。 | 否 |
| disabledMaskColor | Color? | - | 有图片预览且处于 ready/success 的禁用文件遮罩色；null 时亮色使用 textColorAnti、暗色使用 fontGray1，alpha 均为 0.6。 | 否 |
| foregroundColor | Color? | - | 启用项前景色；null 时使用 textColorPlaceholder Token。 | 否 |
| itemSize | double? | - | 网格上传项的宽高，单位为逻辑像素；显式值固定；默认至少 80，并随内置文件名和状态文字增长。 | 否 |
| overlayColor | Color? | - | 上传中/失败状态的遮罩色；null 时使用 fontGray3 Token。 | 否 |
| removeButtonColor | Color? | - | 移除按钮背景色；null 时使用 textColorDisabled Token。 | 否 |
| removeButtonSize | double? | - | 移除按钮宽高；null 时为 20 逻辑像素。 | 否 |
| removeIconSize | double? | - | 移除图标尺寸；null 时为 16 逻辑像素。 | 否 |
| runSpacing | double? | - | 网格项纵向间距；null 时使用全局 spacer Token。列表项间距由全局 spacer1 决定。 | 否 |
| spacing | double? | - | 网格项横向间距；null 时使用全局 spacer Token。 | 否 |
| statusIconSize | double? | - | 上传状态图标尺寸；null 时为 24 逻辑像素。 | 否 |
| statusTextStyle | TextStyle? | - | 状态文案样式；null 时使用反色前景色与 fontBodySmall，字号最终回退 12。 | 否 |
| variant | TUploadVariant? | - | 上传项形状；null 时使用圆角方形。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [推荐/慎用示例](#推荐-慎用示例)

### 何时使用

当需要进行图片上传时使用。

### 组件搭配使用

##### 通常用于图片上传，点击上传按钮可唤起[动作面板](<../反馈/ActionSheet 动作面板.md>)，供用户选择不同渠道进行新的上传。

![](https://tdesign.gtimg.com/site/design/mobile-guide/upload/upload-1.png)

---

##### 点击已经上传的图片可跳转[图片预览](<../数据展示/ImageViewer 图片预览.md>)，让用户对已上传的图片进行快速查看。

![](https://tdesign.gtimg.com/site/design/mobile-guide/upload/upload-2.png)

### 推荐/慎用示例

##### 若上传的文件有尺寸、格式、数量限制，推荐在文案中进行明确标识。

![](https://tdesign.gtimg.com/site/design/mobile-guide/upload/upload-3.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

---

##### 上传特定证件图片，特别是涉及到证件正反面时，推荐结合图示进行上传指引，更加直观。

![](https://tdesign.gtimg.com/site/design/mobile-guide/upload/upload-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)
