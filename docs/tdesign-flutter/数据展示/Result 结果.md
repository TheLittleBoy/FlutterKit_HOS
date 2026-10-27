# Result 结果

> 反馈结果状态。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/result)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 基础结果

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class BasicResultsExample extends StatelessWidget {
  const BasicResultsExample({super.key});

  Widget _buildBasicResults(BuildContext context) {
    return const Column(
      children: [
        TResult(status: TResultStatus.success, title: '成功状态'),
        SizedBox(height: 48),
        TResult(status: TResultStatus.error, title: '失败状态'),
        SizedBox(height: 48),
        TResult(status: TResultStatus.warning, title: '警示状态'),
        SizedBox(height: 48),
        TResult(title: '默认状态'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBasicResults(context);
  }
}
```

##### 带描述结果

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DescriptionResultsExample extends StatelessWidget {
  const DescriptionResultsExample({super.key});

  Widget _buildDescriptionResults(BuildContext context) {
    return const Column(
      children: [
        TResult(
          status: TResultStatus.success,
          title: '成功状态',
          description: '描述文字',
        ),
        SizedBox(height: 48),
        TResult(
          status: TResultStatus.error,
          title: '失败状态',
          description: '描述文字',
        ),
        SizedBox(height: 48),
        TResult(
          status: TResultStatus.warning,
          title: '警示状态',
          description: '描述文字',
        ),
        SizedBox(height: 48),
        TResult(title: '默认状态', description: '描述文字'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDescriptionResults(context);
  }
}
```

##### 自定义结果

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CustomResultExample extends StatelessWidget {
  const CustomResultExample({super.key});

  Widget _buildCustomResult(BuildContext context) {
    return TResult(
      icon: Image.asset('assets/img/illustration.png', height: 80),
      title: '自定义结果',
      description: '描述文字',
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCustomResult(context);
  }
}
```

##### 页面示例

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ResultPageExample extends StatelessWidget {
  const ResultPageExample({super.key});

  Widget _buildResultPageExample(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.tTheme.spacer2),
      child: SizedBox(
        width: double.infinity,
        child: TButton(
          key: const ValueKey('result-page-example'),
          size: TButtonSize.large,
          variant: TButtonVariant.outline,
          colorPreset: TButtonColorPreset.primary,
          child: const Text('页面示例'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => Scaffold(
                  body: SafeArea(
                    child: Column(
                      children: [
                        const TNavBar(title: TText('Result')),
                        const Expanded(
                          child: Center(
                            child: TResult(
                              status: TResultStatus.success,
                              title: '成功状态',
                              description: '描述文字',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: SizedBox(
                            width: double.infinity,
                            child: TButton(
                              key: const ValueKey('result-page-back'),
                              size: TButtonSize.large,
                              variant: TButtonVariant.outline,
                              colorPreset: TButtonColorPreset.primary,
                              child: const Text('返回'),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildResultPageExample(context);
  }
}
```

## API

1. [TResult](#tresult)
2. [TResultStatus](#tresultstatus)
3. [TResultThemeData](#tresultthemedata)

### TResult

#### 构造方法

##### TResult

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| description | String? | - | 描述文本，用于提供额外信息；为空时不占布局空间。 | 否 |
| icon | Widget? | - | 图标组件，用于在结果中显示一个图标 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| status | TResultStatus | TResultStatus.info | 当前结果状态，决定默认图标、颜色和无障碍语义，默认为 `TResultStatus.info`。 | 否 |
| title | String | '' | 标题文本，显示结果的主要信息，默认标题为空字符串 | 否 |

### TResultStatus

结果状态。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| info | TResultStatus | - | 默认信息状态。 | - |
| success | TResultStatus | - | 成功结果状态。 | - |
| warning | TResultStatus | - | 警告结果状态。 | - |
| error | TResultStatus | - | 错误结果状态。 | - |

### TResultThemeData

结果组件级 ThemeExtension

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| descriptionStyle | TextStyle? | - | 描述文字样式 未配置时使用 fontBodyMedium / textColorSecondary Token。 | 否 |
| iconSize | double? | - | 默认状态图标尺寸；自定义 icon 不使用该字段。 未配置时为 80 逻辑像素，必须大于 0。 | 否 |
| titleStyle | TextStyle? | - | 标题文字样式；默认使用 fontTitleMedium / textColorPrimary Token。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [常见用法](#常见用法)
3. [相似组件](#相似组件)

### 何时使用

当需要向用户展示操作后的结果反馈时使用。

### 常见用法

##### 任务本身在弹窗中进行或仅需要较为轻量的结果反馈时，可使用弹窗承载结果反馈。

![](https://tdesign.gtimg.com/site/design/mobile-guide/result/result-1.png)

---

##### 当任务结束并给予反馈后，需要推荐其他内容、任务、商品等给用户时，通常使用页面承载结果和推荐。

![](https://tdesign.gtimg.com/site/design/mobile-guide/result/result-2.png)

---

##### 当任务结果为失败时，通常会告知用户失败原因，甚至提供解决问题的操作。

![](https://tdesign.gtimg.com/site/design/mobile-guide/result/result-3.png)

---

##### 当前操作结束后，若还存在一系列用户需关注的流程进度，通常会结合步骤条将流程展示于结果页。

![](https://tdesign.gtimg.com/site/design/mobile-guide/result/result-4.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [空状态](<Empty 空状态.md>) | 当页面或模块数据为空时使用。 |
