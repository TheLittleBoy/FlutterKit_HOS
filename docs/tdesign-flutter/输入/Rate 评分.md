# Rate 评分

> 用于对某行为或事物进行打分。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/rate)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 实心评分

```dart
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:tdesign_flutter/tdesign_flutter.dart';

class RateBasicExample extends StatelessWidget {
  const RateBasicExample({super.key});

  Widget _buildBasic(BuildContext context) => const TCell(
    title: Text('实心评分'),
    note: RateBasicExampleStatefulRate(initialValue: 3),
  );

  @override
  Widget build(BuildContext context) {
    return _buildBasic(context);
  }
}

class RateBasicExampleStatefulRate extends StatefulWidget {
  const RateBasicExampleStatefulRate({
    super.key,
    required this.initialValue,
    this.count = 5,
    this.allowHalf = false,
    this.icon,
    this.texts,
  });
  final double initialValue;
  final int count;
  final bool allowHalf;
  final TRateIconBuilder? icon;
  final List<String>? texts;

  @override
  State<RateBasicExampleStatefulRate> createState() =>
      RateBasicExampleStatefulRateState();
}

class RateBasicExampleStatefulRateState
    extends State<RateBasicExampleStatefulRate> {
  late double value = widget.initialValue;

  @override
  Widget build(BuildContext context) => TRate(
    value: value,
    count: widget.count,
    allowHalf: widget.allowHalf,
    icon: widget.icon,
    texts: widget.texts,
    onChanged: (next) => setState(() => value = next),
  );
}
```

##### 自定义评分

```dart
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:tdesign_flutter/tdesign_flutter.dart';

class RateCustomExample extends StatelessWidget {
  const RateCustomExample({super.key});

  Widget _buildCustom(BuildContext context) => TCell(
    title: const Text('自定义评分'),
    note: RateCustomExampleStatefulRate(
      initialValue: 3,
      icon: (filled) => Icon(
        TIcons.thumb_up,
        color: filled
            ? context.tTheme.warningColor5
            : context.tTheme.bgColorComponent,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _buildCustom(context);
  }
}

class RateCustomExampleStatefulRate extends StatefulWidget {
  const RateCustomExampleStatefulRate({
    super.key,
    required this.initialValue,
    this.count = 5,
    this.allowHalf = false,
    this.icon,
    this.texts,
  });
  final double initialValue;
  final int count;
  final bool allowHalf;
  final TRateIconBuilder? icon;
  final List<String>? texts;

  @override
  State<RateCustomExampleStatefulRate> createState() =>
      RateCustomExampleStatefulRateState();
}

class RateCustomExampleStatefulRateState
    extends State<RateCustomExampleStatefulRate> {
  late double value = widget.initialValue;

  @override
  Widget build(BuildContext context) => TRate(
    value: value,
    count: widget.count,
    allowHalf: widget.allowHalf,
    icon: widget.icon,
    texts: widget.texts,
    onChanged: (next) => setState(() => value = next),
  );
}
```

##### 第三方图标评分

```dart
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:tdesign_flutter/tdesign_flutter.dart';

class RateThirdPartyIconExample extends StatelessWidget {
  const RateThirdPartyIconExample({super.key});

  Widget _buildThirdPartyIcon(BuildContext context) => TCell(
    title: const Text('第三方图标'),
    note: RateThirdPartyIconExampleStatefulRate(
      initialValue: 3,
      icon: (filled) =>
          Icon(filled ? CupertinoIcons.heart_fill : CupertinoIcons.heart),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _buildThirdPartyIcon(context);
  }
}

class RateThirdPartyIconExampleStatefulRate extends StatefulWidget {
  const RateThirdPartyIconExampleStatefulRate({
    super.key,
    required this.initialValue,
    this.count = 5,
    this.allowHalf = false,
    this.icon,
    this.texts,
  });
  final double initialValue;
  final int count;
  final bool allowHalf;
  final TRateIconBuilder? icon;
  final List<String>? texts;

  @override
  State<RateThirdPartyIconExampleStatefulRate> createState() =>
      RateThirdPartyIconExampleStatefulRateState();
}

class RateThirdPartyIconExampleStatefulRateState
    extends State<RateThirdPartyIconExampleStatefulRate> {
  late double value = widget.initialValue;

  @override
  Widget build(BuildContext context) => TRate(
    value: value,
    count: widget.count,
    allowHalf: widget.allowHalf,
    icon: widget.icon,
    texts: widget.texts,
    onChanged: (next) => setState(() => value = next),
  );
}
```

##### 自定义评分数量

```dart
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:tdesign_flutter/tdesign_flutter.dart';

class RateCountExample extends StatelessWidget {
  const RateCountExample({super.key});

  Widget _buildCount(BuildContext context) => const TCell(
    title: Text('自定义评分数量'),
    note: RateCountExampleStatefulRate(initialValue: 2, count: 3),
  );

  @override
  Widget build(BuildContext context) {
    return _buildCount(context);
  }
}

class RateCountExampleStatefulRate extends StatefulWidget {
  const RateCountExampleStatefulRate({
    super.key,
    required this.initialValue,
    this.count = 5,
    this.allowHalf = false,
    this.icon,
    this.texts,
  });
  final double initialValue;
  final int count;
  final bool allowHalf;
  final TRateIconBuilder? icon;
  final List<String>? texts;

  @override
  State<RateCountExampleStatefulRate> createState() =>
      RateCountExampleStatefulRateState();
}

class RateCountExampleStatefulRateState
    extends State<RateCountExampleStatefulRate> {
  late double value = widget.initialValue;

  @override
  Widget build(BuildContext context) => TRate(
    value: value,
    count: widget.count,
    allowHalf: widget.allowHalf,
    icon: widget.icon,
    texts: widget.texts,
    onChanged: (next) => setState(() => value = next),
  );
}
```

##### 带描述评分

```dart
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:tdesign_flutter/tdesign_flutter.dart';

class RateShowTextExample extends StatelessWidget {
  const RateShowTextExample({super.key});

  Widget _buildShowText(BuildContext context) => Column(
    children: [
      const RateShowTextExampleRateRow(
        title: '带描述评分',
        rate: RateShowTextExampleStatefulRate(
          initialValue: 3,
          texts: ['1分', '2分', '3分', '4分', '5分'],
        ),
      ),
      SizedBox(height: context.tTheme.spacer2),
      const RateShowTextExampleRateRow(
        title: '带描述评分',
        rate: RateShowTextExampleStatefulRate(
          initialValue: 3,
          texts: ['极差', '失望', '一般', '满意', '惊喜'],
        ),
      ),
      SizedBox(height: context.tTheme.spacer2),
      const RateShowTextExampleRateRow(
        title: '带描述评分',
        rate: RateShowTextExampleStatefulRate(
          initialValue: 0,
          texts: ['极差', '失望', '一般', '满意', '惊喜'],
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return _buildShowText(context);
  }
}

class RateShowTextExampleRateRow extends StatelessWidget {
  const RateShowTextExampleRateRow({
    super.key,
    required this.title,
    required this.rate,
  });

  final String title;
  final Widget rate;

  @override
  Widget build(BuildContext context) => Container(
    height: 48,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    color: context.tTheme.bgColorContainer,
    child: Row(
      children: [
        SizedBox(width: 100, child: TText(title)),
        const Spacer(),
        rate,
      ],
    ),
  );
}

class RateShowTextExampleStatefulRate extends StatefulWidget {
  const RateShowTextExampleStatefulRate({
    super.key,
    required this.initialValue,
    this.count = 5,
    this.allowHalf = false,
    this.icon,
    this.texts,
  });
  final double initialValue;
  final int count;
  final bool allowHalf;
  final TRateIconBuilder? icon;
  final List<String>? texts;

  @override
  State<RateShowTextExampleStatefulRate> createState() =>
      RateShowTextExampleStatefulRateState();
}

class RateShowTextExampleStatefulRateState
    extends State<RateShowTextExampleStatefulRate> {
  late double value = widget.initialValue;

  @override
  Widget build(BuildContext context) => TRate(
    value: value,
    count: widget.count,
    allowHalf: widget.allowHalf,
    icon: widget.icon,
    texts: widget.texts,
    onChanged: (next) => setState(() => value = next),
  );
}
```

#### 组件状态

##### `RateActionExample`

```dart
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:tdesign_flutter/tdesign_flutter.dart';

class RateActionExample extends StatelessWidget {
  const RateActionExample({super.key});

  Widget _buildAction(BuildContext context) => const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RateActionExampleRateGroupLabel('只可选全星时'),
      TCell(
        title: Text('点击或滑动'),
        note: RateActionExampleStatefulRate(initialValue: 3),
      ),
      RateActionExampleRateGroupLabel('只可选半星时', top: 24),
      TCell(
        title: Text('点击或滑动'),
        note: RateActionExampleStatefulRate(initialValue: 3, allowHalf: true),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return _buildAction(context);
  }
}

class RateActionExampleRateGroupLabel extends StatelessWidget {
  const RateActionExampleRateGroupLabel(this.text, {super.key, this.top = 8});
  final String text;
  final double top;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.fromLTRB(16, top, 16, 16),
    child: TText(
      text,
      font: context.tTheme.fontBodyMedium,
      style: TextStyle(color: context.tTheme.textColorSecondary),
    ),
  );
}

class RateActionExampleStatefulRate extends StatefulWidget {
  const RateActionExampleStatefulRate({
    super.key,
    required this.initialValue,
    this.count = 5,
    this.allowHalf = false,
    this.icon,
    this.texts,
  });
  final double initialValue;
  final int count;
  final bool allowHalf;
  final TRateIconBuilder? icon;
  final List<String>? texts;

  @override
  State<RateActionExampleStatefulRate> createState() =>
      RateActionExampleStatefulRateState();
}

class RateActionExampleStatefulRateState
    extends State<RateActionExampleStatefulRate> {
  late double value = widget.initialValue;

  @override
  Widget build(BuildContext context) => TRate(
    value: value,
    count: widget.count,
    allowHalf: widget.allowHalf,
    icon: widget.icon,
    texts: widget.texts,
    onChanged: (next) => setState(() => value = next),
  );
}
```

#### 组件样式

##### 评分大小

```dart
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:tdesign_flutter/tdesign_flutter.dart';

class RateSizeExample extends StatelessWidget {
  const RateSizeExample({super.key});

  Widget _buildSize(BuildContext context) => Column(
    children: [
      TCell(
        title: const Text('大尺寸 24'),
        note: Theme(
          data: Theme.of(
            context,
          ).mergeExtension(const TRateThemeData(iconSize: 24)),
          child: const RateSizeExampleStatefulRate(initialValue: 3),
        ),
      ),
      SizedBox(height: context.tTheme.spacer2),
      TCell(
        title: const Text('小尺寸 20'),
        note: Theme(
          data: Theme.of(
            context,
          ).mergeExtension(const TRateThemeData(iconSize: 20)),
          child: const RateSizeExampleStatefulRate(initialValue: 3),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return _buildSize(context);
  }
}

class RateSizeExampleStatefulRate extends StatefulWidget {
  const RateSizeExampleStatefulRate({
    super.key,
    required this.initialValue,
    this.count = 5,
    this.allowHalf = false,
    this.icon,
    this.texts,
  });
  final double initialValue;
  final int count;
  final bool allowHalf;
  final TRateIconBuilder? icon;
  final List<String>? texts;

  @override
  State<RateSizeExampleStatefulRate> createState() =>
      RateSizeExampleStatefulRateState();
}

class RateSizeExampleStatefulRateState
    extends State<RateSizeExampleStatefulRate> {
  late double value = widget.initialValue;

  @override
  Widget build(BuildContext context) => TRate(
    value: value,
    count: widget.count,
    allowHalf: widget.allowHalf,
    icon: widget.icon,
    texts: widget.texts,
    onChanged: (next) => setState(() => value = next),
  );
}
```

##### 评分风格

```dart
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:tdesign_flutter/tdesign_flutter.dart';

class RateColorExample extends StatelessWidget {
  const RateColorExample({super.key});

  Widget _buildColor(BuildContext context) => Column(
    children: [
      TCell(
        title: const Text('填充评分'),
        note: Theme(
          data: Theme.of(context).mergeExtension(
            const TRateThemeData(
              starColor: Color(0xFFF96102),
              inactiveStarColor: Color(0xFFBBBBBB),
            ),
          ),
          child: const RateColorExampleStatefulRate(
            initialValue: 3,
            allowHalf: true,
          ),
        ),
      ),
      SizedBox(height: context.tTheme.spacer2),
      TCell(
        title: const Text('线描评分'),
        note: Theme(
          data: Theme.of(context).mergeExtension(
            TRateThemeData(starColor: context.tTheme.warningColor5),
          ),
          child: RateColorExampleStatefulRate(
            initialValue: 3,
            icon: (filled) => Icon(
              filled ? TIcons.star_filled : TIcons.star,
              color: filled
                  ? context.tTheme.warningColor5
                  : context.tTheme.bgColorComponent,
            ),
          ),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return _buildColor(context);
  }
}

class RateColorExampleStatefulRate extends StatefulWidget {
  const RateColorExampleStatefulRate({
    super.key,
    required this.initialValue,
    this.count = 5,
    this.allowHalf = false,
    this.icon,
    this.texts,
  });
  final double initialValue;
  final int count;
  final bool allowHalf;
  final TRateIconBuilder? icon;
  final List<String>? texts;

  @override
  State<RateColorExampleStatefulRate> createState() =>
      RateColorExampleStatefulRateState();
}

class RateColorExampleStatefulRateState
    extends State<RateColorExampleStatefulRate> {
  late double value = widget.initialValue;

  @override
  Widget build(BuildContext context) => TRate(
    value: value,
    count: widget.count,
    allowHalf: widget.allowHalf,
    icon: widget.icon,
    texts: widget.texts,
    onChanged: (next) => setState(() => value = next),
  );
}
```

#### 特殊样式

##### 竖向带描述评分

```dart
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:tdesign_flutter/tdesign_flutter.dart';

class RateVerticalExample extends StatelessWidget {
  const RateVerticalExample({super.key});

  Widget _buildVertical(BuildContext context) => Container(
    key: const ValueKey('rate-vertical-container'),
    padding: EdgeInsets.all(context.tTheme.spacer2),
    color: context.tTheme.bgColorContainer,
    child: const Center(child: RateVerticalExampleVerticalRate()),
  );

  @override
  Widget build(BuildContext context) {
    return _buildVertical(context);
  }
}

class RateVerticalExampleVerticalRate extends StatefulWidget {
  const RateVerticalExampleVerticalRate({super.key});
  @override
  State<RateVerticalExampleVerticalRate> createState() =>
      RateVerticalExampleVerticalRateState();
}

class RateVerticalExampleVerticalRateState
    extends State<RateVerticalExampleVerticalRate> {
  static const _texts = ['非常糟糕', '有些糟糕', '可以尝试', '服务很棒', '推荐前往'];
  double value = 4;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Theme(
        data: Theme.of(
          context,
        ).mergeExtension(const TRateThemeData(iconSize: 30)),
        child: TRate(
          value: value,
          onChanged: (next) => setState(() => value = next),
        ),
      ),
      const SizedBox(height: 12),
      TText(
        _texts[value.ceil().clamp(1, _texts.length) - 1],
        font: value > 3 ? context.tTheme.fontBodyLarge : null,
        style: TextStyle(
          color: value > 3 ? context.tTheme.warningColor5 : null,
        ),
      ),
    ],
  );
}
```

## API

1. [TRate](#trate)
2. [TRateIconBuilder](#trateiconbuilder)
3. [TRateThemeData](#tratethemedata)

### TRate

#### 构造方法

##### TRate

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| allowHalf | bool | false | 是否允许半星。 | 否 |
| count | int | 5 | 评分项数量，必须大于 0。 | 否 |
| icon | TRateIconBuilder? | - | 自定义评分图标。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| onChanged | ValueChanged<double>? | - | 评分变更回调；为 null 时禁用。 | 否 |
| onChangeEnd | ValueChanged<double>? | - | 结束交互时触发；指针取消时以当前受控值结束。 | 否 |
| onChangeStart | ValueChanged<double>? | - | 开始交互时触发；同一次指针或语义交互只触发一次。 | 否 |
| showValueIndicator | bool | true | 是否在整星点击、长按以及拖动评分时显示当前值提示。 默认为 true。半星点击的精确选择浮层不受此参数控制。 | 否 |
| texts | List<String>? | - | 各评分对应的辅助文案。 为 null 时不显示辅助文案；非 null 时显示。当当前评分 没有对应文案时，显示本地化的“未评分”。 | 否 |
| value | double | - | 受控评分值，必须位于 0 到 count 之间；父组件需在 onChanged 中更新该值。 | 是 |

### TRateIconBuilder

自定义评分图标构建器。

位置参数：`filled`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| filled | bool | - | 是否构建选中图标；半星由组件裁剪选中图标实现。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Widget | - | 指定选中状态的评分图标。 | - |

### TRateThemeData

TRate 组件级 ThemeExtension。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| iconGap | double? | - | 图标间距。 null 时使用 spacer Token。 | 否 |
| iconSize | double? | - | 图标尺寸。 null 时使用 spacer3 Token。 | 否 |
| inactiveStarColor | Color? | - | 未选中星标颜色。 | 否 |
| overlayBoxShadow | List<BoxShadow>? | - | 当前值提示与半星选择浮层阴影。 null 时使用 shadow1 Token；该 Token 缺失时无阴影。 | 否 |
| starColor | Color? | - | 选中星标颜色。 null 时使用 warningColor5 Token。 | 否 |
| textGap | double? | - | 图标与文案间距。 null 时使用 spacer2 Token。 | 否 |
| textStyle | TextStyle? | - | 文案样式。 | 否 |
| textWidth | double? | - | 文案宽度。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [组件搭配使用](#组件搭配使用)
3. [常见用法](#常见用法)
4. [推荐/慎用示例](#推荐-慎用示例)

### 何时使用

当需要对某行为/事物进行简单的星级评定时使用。

### 组件搭配使用

##### 通常结合多行文本框、标签使用，常见于评论场景，用户对某事物进行星级评定后，可选择预设的文本标签、或在文本框中撰写内容来进行更详细的评价。

![](https://tdesign.gtimg.com/site/design/mobile-guide/rate/rate-1.png)

### 常见用法

##### 在较为严谨的评论场景，通常结合辅助文字，帮助用户更好地理解每个星级的含义，避免个体的打分标准不统一。

![](https://tdesign.gtimg.com/site/design/mobile-guide/rate/rate-2.png)

### 推荐/慎用示例

##### 可结合业务场景自定义评分图标，如使用品牌的icon，增强品牌透出，但不建议使用过于复杂的图形作为评分图标。

![](https://tdesign.gtimg.com/site/design/mobile-guide/rate/rate-3.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/rate/rate-4.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)

---

##### 在同一个评论场景中，评分机制应保持一致，不建议将半星、整星的评分机制混用。

![](https://tdesign.gtimg.com/site/design/mobile-guide/rate/rate-5.png)
![](https://tdesign.gtimg.com/site/doc/bad.png)
