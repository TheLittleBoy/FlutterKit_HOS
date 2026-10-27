import 'package:flutter_test/flutter_test.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import 'package:flutter_kit/core/design_system/theme/color.dart' as app_color;
import 'package:flutter_kit/core/design_system/theme/shadows.dart'
    as app_shadow;
import 'package:flutter_kit/core/design_system/theme/shape.dart' as app_shape;
import 'package:flutter_kit/core/design_system/theme/size.dart' as app_size;
import 'package:flutter_kit/core/design_system/theme/type.dart' as app_type;

import '../../support/test_environment.dart';

/// 颜色、尺寸、形状、阴影和字体语义 Getter 映射测试。
void main() {
  setUp(initializeCoreTestEnvironment);
  tearDown(resetCoreTestEnvironment);

  testWidgets('表驱动验证全部主题语义 Getter', (WidgetTester tester) async {
    late List<List<Object?>> mappings;
    await tester.pumpWidget(
      buildCoreTestApp(
        home: Builder(
          builder: (BuildContext context) {
            final TThemeData theme = context.tTheme;
            mappings = <List<Object?>>[
              <Object?>[app_color.primary, theme.brandColor],
              <Object?>[app_color.primaryLight, theme.brandColorLight],
              <Object?>[app_color.primaryDark, theme.brandColorActive],
              <Object?>[app_color.primaryDisabled, theme.brandColorDisabled],
              <Object?>[app_color.primaryFocus, theme.brandColorFocus],
              <Object?>[app_color.primaryActive, theme.brandColorActive],
              <Object?>[app_color.success, theme.successColor],
              <Object?>[app_color.successLight, theme.successColorLight],
              <Object?>[app_color.successDisabled, theme.successColorDisabled],
              <Object?>[app_color.successFocus, theme.successColorFocus],
              <Object?>[app_color.successActive, theme.successColorActive],
              <Object?>[app_color.warning, theme.warningColor],
              <Object?>[app_color.warningLight, theme.warningColorLight],
              <Object?>[app_color.warningDisabled, theme.warningColorDisabled],
              <Object?>[app_color.warningFocus, theme.warningColorFocus],
              <Object?>[app_color.warningActive, theme.warningColorActive],
              <Object?>[app_color.error, theme.errorColor],
              <Object?>[app_color.errorLight, theme.errorColorLight],
              <Object?>[app_color.errorDisabled, theme.errorColorDisabled],
              <Object?>[app_color.errorFocus, theme.errorColorFocus],
              <Object?>[app_color.errorActive, theme.errorColorActive],
              <Object?>[app_color.backgroundPage, theme.bgColorPage],
              <Object?>[app_color.backgroundContainer, theme.bgColorContainer],
              <Object?>[
                app_color.backgroundContainerActive,
                theme.bgColorContainerActive,
              ],
              <Object?>[
                app_color.backgroundSecondaryContainer,
                theme.bgColorSecondaryContainer,
              ],
              <Object?>[
                app_color.backgroundSecondaryContainerActive,
                theme.bgColorSecondaryContainerActive,
              ],
              <Object?>[app_color.backgroundComponent, theme.bgColorComponent],
              <Object?>[
                app_color.backgroundComponentActive,
                theme.bgColorComponentActive,
              ],
              <Object?>[
                app_color.backgroundComponentDisabled,
                theme.bgColorComponentDisabled,
              ],
              <Object?>[app_color.textPrimary, theme.textColorPrimary],
              <Object?>[app_color.textSecondary, theme.textColorSecondary],
              <Object?>[app_color.textPlaceholder, theme.textColorPlaceholder],
              <Object?>[app_color.textDisabled, theme.textColorDisabled],
              <Object?>[app_color.textAnti, theme.textColorAnti],
              <Object?>[app_color.textBrand, theme.textColorBrand],
              <Object?>[app_color.textLink, theme.textColorLink],
              <Object?>[app_color.borderLevel1, theme.borderLevel1Color],
              <Object?>[app_color.borderLevel2, theme.borderLevel2Color],
              <Object?>[app_size.spacer4, 4.0],
              <Object?>[app_size.spacer8, 8.0],
              <Object?>[app_size.spacer12, 12.0],
              <Object?>[app_size.spacer16, 16.0],
              <Object?>[app_size.spacer24, 24.0],
              <Object?>[app_size.spacer32, 32.0],
              <Object?>[app_size.spacer40, 40.0],
              <Object?>[app_size.spacer48, 48.0],
              <Object?>[app_size.spacer64, 64.0],
              <Object?>[app_size.spacer96, 96.0],
              <Object?>[app_size.spacer160, 160.0],
              <Object?>[app_shape.radiusSmall, theme.radiusSmall],
              <Object?>[app_shape.radiusDefault, theme.radiusDefault],
              <Object?>[app_shape.radiusLarge, theme.radiusLarge],
              <Object?>[app_shape.radiusExtraLarge, theme.radiusExtraLarge],
              <Object?>[app_shape.radiusRound, theme.radiusRound],
              <Object?>[app_shape.radiusCircle, theme.radiusCircle],
              <Object?>[app_shadow.shadowBase, theme.shadow1],
              <Object?>[app_shadow.shadowMiddle, theme.shadow2],
              <Object?>[app_shadow.shadowTop, theme.shadow3],
              <Object?>[app_type.fontDisplayLarge, theme.fontDisplayLarge],
              <Object?>[app_type.fontDisplayMedium, theme.fontDisplayMedium],
              <Object?>[app_type.fontHeadlineLarge, theme.fontHeadlineLarge],
              <Object?>[app_type.fontHeadlineMedium, theme.fontHeadlineMedium],
              <Object?>[app_type.fontHeadlineSmall, theme.fontHeadlineSmall],
              <Object?>[
                app_type.fontTitleExtraLarge,
                theme.fontTitleExtraLarge,
              ],
              <Object?>[app_type.fontTitleLarge, theme.fontTitleLarge],
              <Object?>[app_type.fontTitleMedium, theme.fontTitleMedium],
              <Object?>[app_type.fontTitleSmall, theme.fontTitleSmall],
              <Object?>[app_type.fontBodyLarge, theme.fontBodyLarge],
              <Object?>[app_type.fontBodyMedium, theme.fontBodyMedium],
              <Object?>[app_type.fontBodySmall, theme.fontBodySmall],
              <Object?>[app_type.fontBodyExtraSmall, theme.fontBodyExtraSmall],
              <Object?>[app_type.fontMarkLarge, theme.fontMarkLarge],
              <Object?>[app_type.fontMarkMedium, theme.fontMarkMedium],
              <Object?>[app_type.fontMarkSmall, theme.fontMarkSmall],
              <Object?>[app_type.fontMarkExtraSmall, theme.fontMarkExtraSmall],
              <Object?>[app_type.fontLinkLarge, theme.fontLinkLarge],
              <Object?>[app_type.fontLinkMedium, theme.fontLinkMedium],
              <Object?>[app_type.fontLinkSmall, theme.fontLinkSmall],
            ];
            return const SizedBox();
          },
        ),
      ),
    );

    for (final List<Object?> mapping in mappings) {
      expect(mapping.first, mapping.last);
    }

    expect(app_type.fontBodyExtraLarge?.size, 18);
    expect(app_type.fontBodyExtraLarge?.height, 26 / 18);
  });

  testWidgets('语义形状、阴影、边距和字重返回完整对象', (WidgetTester tester) async {
    late List<Object?> values;
    await tester.pumpWidget(
      buildCoreTestApp(
        home: Builder(
          builder: (BuildContext context) {
            values = <Object?>[
              app_shape.smallRoundedShape,
              app_shape.defaultRoundedShape,
              app_shape.largeRoundedShape,
              app_shape.extraLargeRoundedShape,
              app_shape.roundShape,
              app_shape.circleShape,
              app_shadow.cardShadow,
              app_shadow.popupShadow,
              app_shadow.overlayShadow,
              app_shadow.buttonShadow,
              app_size.pagePadding,
              app_size.pageVerticalPadding,
              app_size.cardPadding,
              app_size.listItemPadding,
              app_size.formItemSpacer,
              app_size.buttonHorizontalSpacer,
              app_size.textIconSpacer,
              app_type.fontWeightRegular,
              app_type.fontWeightMedium,
              app_type.fontWeightBold,
            ];
            return const SizedBox();
          },
        ),
      ),
    );

    expect(values, everyElement(isNotNull));
    expect(app_size.spaceDivider, 0.5);
    expect(app_size.spaceIndicator, 2);
  });
}
