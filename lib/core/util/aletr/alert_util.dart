import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../localization/common/common_keys.dart';

/// TDesign 对话框工具
///
/// 统一展示反馈、确认、输入和图片类型对话框。
class AlertUtil {
  /// 反馈类对话框
  ///
  /// [content] 对话框内容。
  /// [title] 可选对话框标题。
  static void showFeedbackDialog(String content, {String? title}) {
    showGeneralDialog(
      context: Get.context!,
      pageBuilder:
          (
            BuildContext buildContext,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return TConfirmDialog(
              title: title ?? CommonKeys.tip.tr,
              content: content,
              showCloseButton: true,
              buttonText: CommonKeys.confirm.tr,
            );
          },
    );
  }

  /// 确认类对话框
  ///
  /// [content] 对话框内容。
  /// [title] 可选对话框标题。
  /// [rightBtnAction] 可选确认按钮回调。
  static void showConfirmDialog(
    String content, {
    String? title,
    VoidCallback? rightBtnAction,
  }) {
    showGeneralDialog(
      context: Get.context!,
      pageBuilder:
          (
            BuildContext buildContext,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return TDialog(
              title: Text(title ?? CommonKeys.tip.tr),
              content: Text(content),
              showCloseButton: true,
              actions: [
                TDialogAction(
                  variant: TButtonVariant.text,
                  child: Text(CommonKeys.cancel.tr),
                ),
                TDialogAction(
                  variant: TButtonVariant.text,
                  role: TDialogActionRole.primary,
                  onPressed: rightBtnAction,
                  child: Text(CommonKeys.confirm.tr),
                ),
              ],
            );
          },
    );
  }

  /// 输入类对话框
  ///
  /// [content] 对话框内容。
  /// [title] 可选对话框标题。
  /// [hintText] 可选输入提示文本。
  /// [onConfirm] 输入确认回调。
  static Future<void> showInputDialog(
    String content, {
    String? title,
    String? hintText,
    required void Function(String value) onConfirm,
  }) async {
    final TextEditingController textController = TextEditingController();
    await showGeneralDialog(
      context: Get.context!,
      pageBuilder:
          (
            BuildContext buildContext,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return TDialog(
              title: Text(title ?? CommonKeys.tip.tr),
              showCloseButton: true,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(content),
                  const SizedBox(height: 16),
                  TInput(
                    controller: textController,
                    hintText: hintText ?? CommonKeys.inputTitle.tr,
                  ),
                ],
              ),
              actions: [
                TDialogAction(
                  variant: TButtonVariant.text,
                  child: Text(CommonKeys.cancel.tr),
                ),
                TDialogAction(
                  variant: TButtonVariant.text,
                  role: TDialogActionRole.primary,
                  onPressed: () => onConfirm(textController.text),
                  child: Text(CommonKeys.confirm.tr),
                ),
              ],
            );
          },
    );
    textController.dispose();
  }

  /// 带图片的对话框
  ///
  /// [content] 对话框内容。
  /// [image] 对话框图片。
  /// [title] 可选对话框标题。
  static void showImageDialog(
    String content, {
    required Image image,
    String? title,
  }) {
    showGeneralDialog(
      context: Get.context!,
      pageBuilder:
          (
            BuildContext buildContext,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return TDialog(
              title: Text(title ?? CommonKeys.tip.tr),
              showCloseButton: true,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 16,
                children: [image, Text(content)],
              ),
            );
          },
    );
  }
}
