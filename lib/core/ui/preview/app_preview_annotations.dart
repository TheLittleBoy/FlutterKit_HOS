import 'package:flutter/widgets.dart' show Size;

export 'package:flutter/widget_previews.dart' show Preview;
export 'app_preview.dart'
    show buildAppPreviewTheme, wrapAppComponentPreview, wrapAppScreenPreview;

/// 应用 Widget Preview 公共参数。
///
/// 页面和组件通过 `@Preview` 注解引用这些尺寸、主题与包装配置，
/// 保证预览环境与应用运行时一致，并兼容不同 Flutter SDK 的预览 API。

/// 组件预览尺寸
const Size componentPreviewSize = Size.fromWidth(375);

/// 手机页面预览尺寸
const Size phonePreviewSize = Size(375, 812);

/// 平板页面预览尺寸
const Size tabletPreviewSize = Size(1280, 800);

/// 折叠屏页面预览尺寸
const Size foldablePreviewSize = Size(840, 840);
