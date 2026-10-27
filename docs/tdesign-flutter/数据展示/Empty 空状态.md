# Empty 空状态

> 用于空状态时的占位提示。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/empty)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 图标空状态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class IconEmptyExample extends StatelessWidget {
  const IconEmptyExample({super.key});

  Widget _iconEmpty(BuildContext context) {
    return const TEmpty(emptyText: '描述文字');
  }

  @override
  Widget build(BuildContext context) {
    return _iconEmpty(context);
  }
}
```

##### 自定义图片空状态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ImageEmptyExample extends StatelessWidget {
  const ImageEmptyExample({super.key});

  Widget _imageEmpty(BuildContext context) {
    return TEmpty(
      image: SizedBox.square(
        dimension: 120,
        child: Container(
          decoration: BoxDecoration(
            color: context.tTheme.bgColorSecondaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const TImage(src: 'assets/img/empty.png', fit: BoxFit.contain),
        ),
      ),
      emptyText: '描述文字',
    );
  }

  @override
  Widget build(BuildContext context) {
    return _imageEmpty(context);
  }
}
```

##### 带操作空状态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class OperationEmptyExample extends StatelessWidget {
  const OperationEmptyExample({super.key});

  Widget _operationEmpty(BuildContext context) {
    return TEmpty(
      emptyText: '描述文字',
      operation: TButton(
        size: TButtonSize.large,
        colorPreset: TButtonColorPreset.primary,
        onPressed: () {},
        child: const Text('操作按钮'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _operationEmpty(context);
  }
}
```

## API

1. [TEmpty](#tempty)
2. [TEmptyThemeData](#temptythemedata)

### TEmpty

#### 构造方法

##### TEmpty

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| emptyText | String? | - | 描述文字。 | 否 |
| icon | IconData? | TIcons.info_circle_filled | 默认图标；image 非空时不显示，显式 null 仍回退为 info_circle_filled。 | 否 |
| image | Widget? | - | 自定义图片或插画；优先于 `icon`。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| operation | Widget? | - | 描述下方的操作内容，通常为按钮。 | 否 |

### TEmptyThemeData

空态组件级 ThemeExtension

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| emptyTextColor | Color? | - | 描述文字颜色 未配置时使用 textColorPlaceholder Token。 | 否 |
| emptyTextFont | Font? | - | 描述文字字号 未配置时使用 fontBodyMedium Token。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [组件搭配使用](#组件搭配使用)

### 何时使用

当页面或模块数据为空时使用。

### 与页面布局相关

##### 用于整个页面或某个独立模块的状态展示，在页面、模块内居中。

![](https://tdesign.gtimg.com/site/design/mobile-guide/empty/empty-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/empty/empty-2.png)

### 组件搭配使用

##### 空状态与[步骤条](<../导航/Steps 步骤条.md>)组合使用，通过步骤展示提示用户如何新建/添加。

![](https://tdesign.gtimg.com/site/design/mobile-guide/empty/empty-3.png)

---

##### 空状态与[按钮](<../基础/Button 按钮.md>)组合使用，引导用户直接新建/添加。

![](https://tdesign.gtimg.com/site/design/mobile-guide/empty/empty-4.png)
