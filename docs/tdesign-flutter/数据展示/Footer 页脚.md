# Footer 页脚

> 用于展示App的版权声明、联系信息、重要页面链接和其他相关内容等信息。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/footer)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 基础页脚

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class FooterExample extends StatelessWidget {
  const FooterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildFooter(context);
  }
}

Widget _buildFooter(BuildContext context) {
  return const TFooter(
    text: 'Copyright © 2019-2023 TDesign.All Rights Reserved.',
  );
}
```

##### 基础加链接页脚

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SingleLinkFooterExample extends StatelessWidget {
  const SingleLinkFooterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildSingleLinkFooter(context);
  }
}

Widget _buildSingleLinkFooter(BuildContext context) {
  TLink link(String text) => TLink(
    child: Text(text),
    colorPreset: TLinkColorPreset.primary,
    onPressed: () {},
  );
  return Column(
    children: [
      TFooter(
        links: [link('底部链接')],
        text: 'Copyright © 2019-2023 TDesign.All Rights Reserved.',
      ),
      const SizedBox(height: 24),
      TFooter(
        links: [link('底部链接'), link('底部链接')],
        text: 'Copyright © 2019-2023 TDesign.All Rights Reserved.',
      ),
    ],
  );
}
```

##### 品牌页脚

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class BrandFooterExample extends StatelessWidget {
  const BrandFooterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBrandFooter(context);
  }
}

Widget _buildBrandFooter(BuildContext context) {
  const logo = TImage(
    src: 'assets/img/t_brand.png',
    width: 104,
    height: 24,
    fit: BoxFit.contain,
    shape: TImageShape.square,
  );
  return const Column(
    children: [
      TFooter(
        text: 'Copyright © 2019-2023 TDesign.All Rights Reserved.',
        logo: logo,
      ),
      SizedBox(height: 24),
      TFooter(logo: logo),
    ],
  );
}
```

## API

1. [TFooter](#tfooter)
2. [TFooterThemeData](#tfooterthemedata)

### TFooter

#### 构造方法

##### TFooter

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| links | List<Widget> | const [] | 链接内容；仅在 logo 为空时展示，并与 text 组合。多个链接之间自动绘制分隔线。 | 否 |
| logo | Widget? | - | 品牌内容；可与 `text` 组合展示，非空时不展示 `links`。 | 否 |
| text | String | '' | 版权或说明文字；可与 links 或 logo 组合展示。 | 否 |

### TFooterThemeData

页脚组件级 ThemeExtension。

未配置 `height` 时，页脚按内容自然撑开；配置后才会约束外层高度。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| height | double? | - | 页脚外层高度。 默认值为 null，表示由 logo、链接或文字内容自然决定高度。 | 否 |

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [常见用法](#常见用法)

### 何时使用

当页面底部需要放置一些补充信息和链接时使用。

### 与页面布局相关

##### 页脚通常位于网站每个页面底部或主体内容下方的区域。

![](https://tdesign.gtimg.com/site/design/mobile-guide/footer/footer-1.png)

### 常见用法

##### 用于承载版权、隐私政策和使用条款等信息，它们是法律保护所需的。

![](https://tdesign.gtimg.com/site/design/mobile-guide/footer/footer-2.png)

---

##### 用于承载网站、产品的联系方式，便于用户在页脚查找联系信息或查找获得客户支持的方式。

![](https://tdesign.gtimg.com/site/design/mobile-guide/footer/footer-3.png)

---

##### 用于承载网站导航。

![](https://tdesign.gtimg.com/site/design/mobile-guide/Ffooter/footer-4.png)

---

##### 用于承载相关公司/品牌列表，让用户能认知合作或者旗下的品牌/公司，并提供找到他们的方式。

![](https://tdesign.gtimg.com/site/design/mobile-guide/footer/footer-5.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/footer/footer-6.png)
