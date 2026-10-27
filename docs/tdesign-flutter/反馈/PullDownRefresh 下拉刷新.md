# PullDownRefresh 下拉刷新

> 用于快速刷新页面信息，刷新可以是整页刷新也可以是页面的局部刷新。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/pull-down-refresh)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 顶部下拉刷新

##### 基础用法

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PullDownRefreshRefreshExample extends StatefulWidget {
  const PullDownRefreshRefreshExample({super.key});

  @override
  State<PullDownRefreshRefreshExample> createState() =>
      _PullDownRefreshRefreshExampleState();
}

class _PullDownRefreshRefreshExampleState
    extends State<PullDownRefreshRefreshExample> {
  Widget _buildRefresh(BuildContext context) {
    return SizedBox(
      height: 620,
      child: TPullDownRefresh(
        controller: _controller,
        // 下拉刷新回调
        onRefresh: () =>
            Future<void>.delayed(const Duration(milliseconds: 1500)),
        child: _buildOfficialDemoContent(context),
      ),
    );
  }

  final _controller = TPullDownRefreshController();

  Widget _buildOfficialDemoContent(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 28),
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            const TSkeleton.custom(
              layout: TSkeletonLayout(
                rows: [
                  [
                    TSkeletonBlock(
                      height: 171,
                      style: TSkeletonBlockStyle(borderRadius: 12),
                    ),
                  ],
                ],
              ),
              animation: TSkeletonAnimation.flashed,
            ),
            Positioned(
              top: 76,
              left: 0,
              right: 0,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _controller.refresh,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: TText(
                    PlatformUtil.isWeb ? '点击该区域演示 顶部下拉刷新' : '拖拽该区域演示 顶部下拉刷新',
                    textAlign: TextAlign.center,
                    font: context.tTheme.fontBodyLarge,
                    style: TextStyle(color: context.tTheme.textColorDisabled),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        for (var index = 0; index < 3; index++) ...[
          const PullDownRefreshRefreshExamplePullDownRefreshSkeletonRow(),
          if (index < 2) const SizedBox(height: 16),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildRefresh(context);
  }
}

class PullDownRefreshRefreshExamplePullDownRefreshSkeletonRow
    extends StatelessWidget {
  const PullDownRefreshRefreshExamplePullDownRefreshSkeletonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: PullDownRefreshRefreshExamplePullDownRefreshSkeletonCard(),
        ),
        SizedBox(width: 16),
        Expanded(
          child: PullDownRefreshRefreshExamplePullDownRefreshSkeletonCard(),
        ),
      ],
    );
  }
}

class PullDownRefreshRefreshExamplePullDownRefreshSkeletonCard
    extends StatelessWidget {
  const PullDownRefreshRefreshExamplePullDownRefreshSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSkeleton.custom(
      layout: TSkeletonLayout(
        rowSpacing: 8,
        rows: [
          [
            TSkeletonBlock(
              height: 164,
              style: TSkeletonBlockStyle(borderRadius: 12),
            ),
          ],
          [TSkeletonBlock.line()],
          [TSkeletonBlock.line(flex: 5), TSkeletonBlock.spacer(flex: 3)],
        ],
      ),
      animation: TSkeletonAnimation.flashed,
    );
  }
}
```

#### 自定义提示语

##### 通过 loadingTexts 自定义四个刷新阶段的提示语

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PullDownRefreshLoadingTextsExample extends StatefulWidget {
  const PullDownRefreshLoadingTextsExample({super.key});

  @override
  State<PullDownRefreshLoadingTextsExample> createState() =>
      _PullDownRefreshLoadingTextsExampleState();
}

class _PullDownRefreshLoadingTextsExampleState
    extends State<PullDownRefreshLoadingTextsExample> {
  Widget _buildLoadingTexts(BuildContext context) {
    return SizedBox(
      height: 300,
      child: TPullDownRefresh(
        loadingBarHeight: 70,
        maxBarHeight: 100,
        texts: const TPullDownRefreshTexts(
          pullToRefresh: '下拉即可刷新...',
          releaseToRefresh: '释放即可刷新...',
          refreshing: '加载中...',
          refreshComplete: '刷新成功',
        ),
        onRefresh: () {
          return Future<void>.delayed(const Duration(seconds: 1), () {
            setState(() {
              loadingTextsCount++;
            });
          });
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _demoHint(context, '下拉刷新'),
            const SizedBox(height: 16),
            _demoHint(context, '自定义提示语刷新次数：${loadingTextsCount}'),
          ],
        ),
      ),
    );
  }

  var loadingTextsCount = 0;

  Widget _demoHint(BuildContext context, String message) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.tTheme.bgColorContainer,
        borderRadius: BorderRadius.all(
          Radius.circular(context.tTheme.radiusLarge),
        ),
      ),
      child: TText(
        message,
        font: context.tTheme.fontBodyLarge,
        style: TextStyle(color: context.tTheme.textColorSecondary),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildLoadingTexts(context);
  }
}
```

#### 刷新超时

##### 通过 refreshTimeout 设置刷新超时时间

```dart
import 'dart:async';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PullDownRefreshTimeoutExample extends StatefulWidget {
  const PullDownRefreshTimeoutExample({super.key});

  @override
  State<PullDownRefreshTimeoutExample> createState() =>
      _PullDownRefreshTimeoutExampleState();
}

class _PullDownRefreshTimeoutExampleState
    extends State<PullDownRefreshTimeoutExample> {
  Widget _buildTimeout(BuildContext context) {
    return SizedBox(
      height: 300,
      child: TPullDownRefresh(
        refreshTimeout: const Duration(seconds: 1),
        onStateChanged: (state) {
          if (state == TPullDownRefreshState.timeout) {
            setState(() => _timeoutCount++);
            TToast.showText('已超时', context: context);
          }
        },
        onRefresh: () {
          // 模拟长时间未完成的刷新，等待超时回调。
          return Completer<void>().future;
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _demoHint(context, '下拉刷新'),
            const SizedBox(height: 16),
            _demoHint(context, '超时刷新次数：$_timeoutCount'),
          ],
        ),
      ),
    );
  }

  Widget _demoHint(BuildContext context, String message) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.tTheme.bgColorContainer,
        borderRadius: BorderRadius.all(
          Radius.circular(context.tTheme.radiusLarge),
        ),
      ),
      child: TText(
        message,
        font: context.tTheme.fontBodyLarge,
        style: TextStyle(color: context.tTheme.textColorSecondary),
      ),
    );
  }

  var _timeoutCount = 0;

  @override
  Widget build(BuildContext context) {
    return _buildTimeout(context);
  }
}
```

## API

1. [TPullDownRefresh](#tpulldownrefresh)
2. [TPullDownRefreshController](#tpulldownrefreshcontroller)
3. [TPullDownRefreshTexts](#tpulldownrefreshtexts)
4. [TPullDownRefreshState](#tpulldownrefreshstate)

### TPullDownRefresh

#### 构造方法

##### TPullDownRefresh

构造 `TPullDownRefresh`。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| child | Widget | - | 必填：滚动内容（对应官方默认 slot）。 必须为**有界且可滚动**的内容（如 `ListView` / `GridView` / `CustomScrollView`）。 `SizedBox` 等只能提供尺寸约束，不能把静态内容变成可滚动内容；若内容自身不可滚动， 下拉 / 触底手势仍无法生效，应将内容放入可滚动容器。 | 是 |
| controller | TPullDownRefreshController? | - | 外部主动刷新控制器。 通过 `TPullDownRefreshController.refresh` 从页面外部触发刷新。刷新完成时机 由 `onRefresh` 返回的 Future、异常或 `refreshTimeout` 共同决定；超时后 控制器 Future 也会完成，迟到的原始 Future 不会再次改变刷新状态。 刷新资源由组件管理；外部控制器无需也不提供 dispose （详见 `TPullDownRefreshController` 文档）。 | 否 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| loadingBarHeight | double? | - | Header 容器高度与触发阈值；默认至少 50，随内置文字增长。 显式值固定，必须大于 0。 | 否 |
| lowerThreshold | double | 50 | 距离底部多少逻辑像素时触发加载，默认 50，必须大于 0。 | 否 |
| maxBarHeight | double? | - | 最大下拉高度；默认至少 80，并覆盖默认增长后的 Header。 显式值固定，不得小于 loadingBarHeight；其值也限制默认 Header 的增长。 | 否 |
| onLoadMore | FutureOr<void> Function()? | - | 触底加载回调（对应官方 `scrolltolower` 事件）。 非空时自动启用，触底达到 `lowerThreshold` 时触发；Footer 本身不增加 TDesign 未定义的可见样式。 返回的 `Future` 完成后自动结束加载态。与 `onRefresh` 一致，本回调若同步 抛错或返回的 `Future` 失败， 加载任务会**正常结束（不悬挂）**，错误经 `FlutterError.reportError` 上报 （不吞掉）。若需在失败时做业务处理，请在回调内部自行 try/catch。 | 否 |
| onRefresh | FutureOr<void> Function()? | - | 下拉触发刷新回调（对应官方 `refresh` 事件）。 为空时禁用下拉刷新。返回的 Future 完成后自动展示完成态并复位。 若回调同步抛错或返回的 Future 失败，刷新任务会**正常结束（不悬挂）**， 错误通过 `FlutterError.reportError` 上报（不吞掉），但不会作为未捕获异常 中断 easy_refresh 的动画流程。若需在失败时做业务处理，请在回调内部自行 try/catch。 | 否 |
| onStateChanged | ValueChanged<TPullDownRefreshState>? | - | 刷新状态变化回调（对应官方 `change`/`onChange` 事件）。 值域为 `TPullDownRefreshState`。仅在状态**跳变**时回调（已去重）， 且通过异步调度触发，**不会**在 build 期间同步调用，可在回调中安全 `setState`。其中 `TPullDownRefreshState.timeout` 是一次性超时通知， 随后会收到 `TPullDownRefreshState.inactive`。 | 否 |
| refreshTimeout | Duration? | const Duration(milliseconds: 3000) | 刷新超时时长（**默认 3 秒**）；超过时长仍未完成 `onRefresh` 时自动结束刷新， 并通过 `onStateChanged` 上报 `TPullDownRefreshState.timeout`。 默认启用 3 秒超时；传入 `null` 可关闭超时。 `timeout` 是一次性状态通知，随后立即结束刷新并回到 `TPullDownRefreshState.inactive`，无专属渲染文案。超时后即使原始 `onRefresh` Future 迟到完成，也不会再次上报 `TPullDownRefreshState.done`。 必须为非负时长。 | 否 |
| successDuration | Duration | const Duration(milliseconds: 500) | 刷新完成提示的展示时长（默认 500ms，对齐官方 `successDuration`）。 必须为非负时长。 | 否 |
| texts | TPullDownRefreshTexts? | - | 四态提示语；为空时回退 l10n（默认中文与官方 `loadingTexts` 一致）。 | 否 |

### TPullDownRefreshController

`TPullDownRefresh` 的外部刷新控制器。

使用 Flutter 惯用的控制器模式，从页面外部通过 `refresh` 主动触发一次刷新。
返回的 Future 会在本次刷新成功、回调失败或超时复位后完成；它不返回业务结果。
回调异常仍由 `TPullDownRefresh` 通过 `FlutterError.reportError` 上报。

#### 生命周期（所有权）

刷新资源由 `TPullDownRefresh` 随挂载和卸载管理；本控制器不拥有
需要调用方释放的资源，因此无需也不提供公开 `dispose()`。

#### 构造方法

##### TPullDownRefreshController

无参数。

#### 实例方法

##### TPullDownRefreshController.refresh

无参数。

从页面外部主动触发一次下拉刷新。

`await refresh()` 表示这次刷新流程已经结束，不代表业务一定成功；
成功、回调失败和超时都会完成 Future。组件未挂载或未配置刷新回调
时，该方法立即完成。

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Future<void> | - | 刷新流程结束时完成；业务失败或超时也会完成，未挂载或无刷新回调时立即完成。 | - |

### TPullDownRefreshTexts

下拉刷新四态提示语。

覆盖「下拉刷新 / 松手刷新 / 正在刷新 / 刷新完成」四个阶段的文案。

#### 构造方法

##### TPullDownRefreshTexts

构造四态文案。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| pullToRefresh | String | - | 下拉未达阈值时的提示语（官方默认「下拉刷新」）。 | 是 |
| refreshComplete | String | - | 刷新完成时的提示语（官方默认「刷新完成」）。 | 是 |
| refreshing | String | - | 刷新进行中的提示语（官方默认「正在刷新」）。 | 是 |
| releaseToRefresh | String | - | 下拉已达阈值、松手即刷新的提示语（官方默认「松手刷新」）。 | 是 |

### TPullDownRefreshState

下拉刷新状态。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| inactive | TPullDownRefreshState | - | 未触发（初始 / 完成复位后）。 | - |
| dragging | TPullDownRefreshState | - | 下拉中，未达到触发阈值。 | - |
| ready | TPullDownRefreshState | - | 已达阈值、松手即触发刷新。 | - |
| refreshing | TPullDownRefreshState | - | 刷新进行中。 | - |
| done | TPullDownRefreshState | - | 刷新完成、展示完成态。 | - |
| timeout | TPullDownRefreshState | - | 刷新超时的一次性通知，随后回到 `TPullDownRefreshState.inactive`。 | - |

## 设计指南

1. [何时使用](#何时使用)
2. [与页面布局相关](#与页面布局相关)
3. [常见用法](#常见用法)
4. [相似组件](#相似组件)

### 何时使用

当需要对页面信息进行整体刷新或加载更多同类信息时使用。

### 与页面布局相关

##### 下拉刷新位于内容最上方；通常在页面最顶部或者选项卡、吸顶模块之下。

![](https://tdesign.gtimg.com/site/design/mobile-guide/pull-downre-fresh/pull-downre-fresh-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/pull-downre-fresh/pull-downre-fresh-2.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/pull-downre-fresh/pull-downre-fresh--3.png)

### 常见用法

##### 在推荐型信息流页面使用下拉刷新，对页面所有信息进行整体更新。

![](https://tdesign.gtimg.com/site/design/mobile-guide/pull-downre-fresh/pull-downre-fresh-4.png)

---

##### 在按时间排布型信息流页面使用下拉刷新，对未展示出来的最新内容进行加载。

![](https://tdesign.gtimg.com/site/design/mobile-guide/pull-downre-fresh/pull-downre-fresh-5.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/pull-downre-fresh/pull-downre-fresh-6.png)

### 相似组件

| 组件名 | 何时使用 |
| --- | --- |
| [加载](<Loading 加载.md>) | 当打开新页面或操作完成后，等待加载时使用。 |
