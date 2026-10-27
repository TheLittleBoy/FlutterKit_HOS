# DropdownMenu 下拉菜单

> 用于移动端页面内容的排序和多维筛选。

> 来源：[TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/components/dropdown-menu)
> 归档时间：2026-10-27

## 示例

### 引入

在 tdesign_flutter/tdesign_flutter.dart 中有所有组件的路径。

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';
```

### 代码演示

#### 组件类型

##### 单选下拉菜单

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DropdownMenuSortingExample extends StatefulWidget {
  const DropdownMenuSortingExample({super.key});

  static const productOptions = <TDropdownMenuOption<String>>[
    TDropdownMenuOption(value: 'all', label: '全部产品'),
    TDropdownMenuOption(value: 'new', label: '最新产品'),
    TDropdownMenuOption(value: 'hot', label: '最火产品'),
    TDropdownMenuOption(value: 'disabled', label: '禁用选项', disabled: true),
  ];

  @override
  State<DropdownMenuSortingExample> createState() =>
      _DropdownMenuSortingExampleState();
}

class _DropdownMenuSortingExampleState
    extends State<DropdownMenuSortingExample> {
  var _product = 'hot';
  var _sorter = 'default';

  Widget _sorting(BuildContext context) {
    return TDropdownMenu(
      items: [
        TDropdownMenuItem(
          label: switch (_product) {
            'new' => '最新产品',
            'hot' => '最火产品',
            _ => '全部产品',
          },
          panelBuilder: (context, controller) =>
              TDropdownSingleSelectPanel<String>(
                controller: controller,
                value: _product,
                options: DropdownMenuSortingExample.productOptions,
                onChanged: (value) => setState(() => _product = value),
              ),
        ),
        TDropdownMenuItem(
          label: _sorter == 'default' ? '默认排序' : '价格从高到低',
          panelBuilder: (context, controller) =>
              TDropdownSingleSelectPanel<String>(
                controller: controller,
                value: _sorter,
                options: const [
                  TDropdownMenuOption(value: 'default', label: '默认排序'),
                  TDropdownMenuOption(value: 'price', label: '价格从高到低'),
                ],
                onChanged: (value) => setState(() => _sorter = value),
              ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _sorting(context);
  }
}
```

##### 分栏下拉菜单

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DropdownMenuMultipleExample extends StatefulWidget {
  const DropdownMenuMultipleExample({super.key});

  @override
  State<DropdownMenuMultipleExample> createState() =>
      _DropdownMenuMultipleExampleState();
}

class _DropdownMenuMultipleExampleState
    extends State<DropdownMenuMultipleExample> {
  var _singleColumn = <String>{'option-1'};
  var _doubleColumn = <String>{'option-1'};
  var _tripleColumn = <String>{'option-1'};

  Widget _multiple(BuildContext context) {
    TDropdownMenuItem menuItem(
      String label,
      int columns,
      Set<String> selected,
      ValueChanged<Set<String>> onConfirm,
    ) {
      return TDropdownMenuItem(
        label: label,
        panelBuilder: (context, controller) =>
            TDropdownMultiSelectPanel<String>(
              controller: controller,
              options: categoryOptions,
              values: selected,
              columns: columns,
              onConfirm: onConfirm,
            ),
      );
    }

    return TDropdownMenu(
      items: [
        menuItem('单列多选', 1, _singleColumn, (values) {
          setState(() => _singleColumn = values);
        }),
        menuItem('双列多选', 2, _doubleColumn, (values) {
          setState(() => _doubleColumn = values);
        }),
        menuItem('三列多选', 3, _tripleColumn, (values) {
          setState(() => _tripleColumn = values);
        }),
      ],
    );
  }

  static const categoryOptions = <TDropdownMenuOption<String>>[
    TDropdownMenuOption(value: 'option-1', label: '选项名称'),
    TDropdownMenuOption(value: 'option-2', label: '选项名称'),
    TDropdownMenuOption(value: 'option-3', label: '选项名称'),
    TDropdownMenuOption(value: 'option-4', label: '选项名称'),
    TDropdownMenuOption(value: 'option-5', label: '选项名称'),
    TDropdownMenuOption(value: 'option-6', label: '选项名称'),
    TDropdownMenuOption(value: 'option-7', label: '选项名称'),
    TDropdownMenuOption(value: 'option-8', label: '选项名称'),
    TDropdownMenuOption(value: 'option-9', label: '选项名称'),
    TDropdownMenuOption(value: 'option-10', label: '选项名称'),
    TDropdownMenuOption(value: 'option-11', label: '选项名称'),
    TDropdownMenuOption(value: 'option-12', label: '选项名称'),
    TDropdownMenuOption(value: 'option-13', label: '禁用选项', disabled: true),
    TDropdownMenuOption(value: 'option-14', label: '禁用选项', disabled: true),
    TDropdownMenuOption(value: 'option-15', label: '禁用选项', disabled: true),
  ];

  @override
  Widget build(BuildContext context) {
    return _multiple(context);
  }
}
```

#### 组件状态

##### 禁用状态

```dart
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DropdownMenuDisabledExample extends StatelessWidget {
  const DropdownMenuDisabledExample({super.key});

  Widget _disabled(BuildContext context) {
    return TDropdownMenu(
      items: [
        TDropdownMenuItem(
          label: '禁用菜单',
          enabled: false,
          panelBuilder: (context, controller) => const SizedBox.shrink(),
        ),
        TDropdownMenuItem(
          label: '禁用菜单',
          enabled: false,
          panelBuilder: (context, controller) => const SizedBox.shrink(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _disabled(context);
  }
}
```

## API

### TDropdownMenu

#### 构造方法

##### TDropdownMenu

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| animationDuration | Duration? | - | 展开、关闭及切换动画时长。 未指定时为 200ms。系统禁用动画时始终使用零时长。 | 否 |
| closeOnOverlayTap | bool | true | 点击外部区域是否关闭面板，默认 true；不依赖遮罩是否绘制。 | 否 |
| controller | TDropdownMenuController? | - | 外部筛选栏控制器；为空时由组件创建和释放内部控制器。 外部控制器由调用方释放，应只绑定一个筛选栏。 | 否 |
| items | List<TDropdownMenuItem> | - | 按顺序展示的筛选触发项和对应面板。 | 是 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| onClosed | TDropdownMenuClosedCallback? | - | 面板关闭流程完成后回调，携带筛选项下标和关闭原因。 | 否 |
| onOpened | ValueChanged<int>? | - | 面板打开动画完成后回调，参数为筛选项下标。 | 否 |
| placement | TDropdownMenuPlacement | TDropdownMenuPlacement.auto | 面板展开方向，默认 auto，根据上下可用空间决定。 | 否 |
| scrollable | bool | false | 筛选栏是否支持横向滚动，默认 false。 | 否 |
| showOverlay | bool | true | 是否绘制外部区域遮罩，默认 true。 | 否 |
| useRootOverlay | bool | false | 是否使用根 Overlay，默认 false。 | 否 |

### TDropdownMenuOption

类型参数：`T`

下拉筛选面板中的不可变选项。

#### 构造方法

##### TDropdownMenuOption

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| disabled | bool | false | 是否禁用该选项，默认 false；禁用选项不能通过点击提交。 | 否 |
| group | String? | - | 多选面板中的分组标题；为空时归入无标题分组。 | 否 |
| label | String | - | 选项显示文案。 | 是 |
| value | T | - | 选项对应的业务值，用于选中判断和提交回调。 | 是 |

### TDropdownSingleSelectPanel

类型参数：`T`

单选筛选面板。选择有效选项后立即提交并关闭。

#### 构造方法

##### TDropdownSingleSelectPanel

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| controller | TDropdownMenuPanelController | - | 当前面板的局部控制器；选择后用它关闭面板。 | 是 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| maxHeight | double? | - | 滚动主体的最大高度；默认 280dp。 | 否 |
| onChanged | ValueChanged<T> | - | 点击启用选项时提交其业务值，然后请求关闭面板；由使用方更新 `value`。 | 是 |
| options | List<TDropdownMenuOption<T>> | - | 按显示顺序排列的选项。 | 是 |
| value | T? | - | 受控选中值；为空时不主动指定选中项。 | 是 |

### TDropdownMultiSelectPanel

类型参数：`T`

多选筛选面板。

`values` 表示已提交值，每次打开时用于初始化草稿。选项点击只更新面板内部草稿，
点击确认后才通过 `onConfirm` 提交。
打开期间 `values` 变化时，尚未修改的草稿会同步；已有修改的草稿保留用户编辑。
未确认即关闭会丢弃草稿，再次打开时使用最新的 `values`。

#### 构造方法

##### TDropdownMultiSelectPanel

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| columns | int | 1 | 每行选项列数，默认 1；支持 1 至 3 列。 | 否 |
| controller | TDropdownMenuPanelController | - | 当前面板的局部控制器，用于确认或取消时关闭面板。 | 是 |
| key | Key? | - | 组件标识，用于区分或保留组件状态。 | 否 |
| maxHeight | double? | - | 面板最大高度；默认滚动主体最多 280dp，底部操作区另计。 | 否 |
| onConfirm | ValueChanged<Set<T>> | - | 点击确认时提交草稿集合，再请求关闭面板；由使用方更新 `values`。 | 是 |
| options | List<TDropdownMenuOption<T>> | - | 可选择的选项；`TDropdownMenuOption.group` 决定显示分组。 | 是 |
| values | Set<T> | - | 已提交的受控值集合；打开时初始化草稿，未确认关闭不会提交草稿。 | 是 |

### TDropdownMenuTriggerState

自定义触发项可读取的不可变状态。

#### 构造方法

##### TDropdownMenuTriggerState

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| enabled | bool | - | 当前触发项是否允许交互。 | 是 |
| index | int | - | 当前触发项在筛选栏中的下标。 | 是 |
| isOpen | bool | - | 当前触发项对应面板是否打开。 | 是 |
| toggle | VoidCallback | - | 切换当前面板开关状态的操作；禁用时不会打开面板。 | 是 |

### TDropdownMenuPanelController

当前面板可使用的局部控制器。

#### 属性

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| index | int | - | 当前面板所属筛选项的下标。 | - |

#### 实例方法

##### TDropdownMenuPanelController.close

位置参数：`reason`

请求关闭当前面板；`reason` 默认 cancel。返回的 Future 表示本次关闭请求处理结束。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| reason | TDropdownMenuCloseReason | TDropdownMenuCloseReason.cancel | 关闭原因，默认 cancel。 | 否 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Future<void> | - | 当前关闭请求处理完毕时完成；被新操作打断时也可能提前完成，不保证面板已经关闭。 | - |

### TDropdownMenuItem

一个筛选触发项及其对应面板。

#### 构造方法

##### TDropdownMenuItem

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| enabled | bool | true | 是否启用触发项，默认 true。 | 否 |
| flex | int | 1 | 非滚动且父级宽度有界时的宽度分配权重，默认 1，必须大于 0。 | 否 |
| label | String? | - | 默认触发项文案；使用 custom 构造时为空。 | 是 |
| panelBuilder | TDropdownMenuPanelBuilder | - | 面板构建器，接收当前面板的局部控制器。 | 是 |
| width | double? | - | 滚动模式或父级宽度无界时的触发项宽度，默认 112 逻辑像素； 非滚动且宽度有界时使用 `flex` 分配宽度，此字段不生效。 | 否 |

##### TDropdownMenuItem.custom

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| triggerBuilder | TDropdownMenuTriggerBuilder? | - | 自定义触发项构建器；默认构造时为空。 | 是 |
| panelBuilder | TDropdownMenuPanelBuilder | - | 面板构建器，接收当前面板的局部控制器。 | 是 |
| enabled | bool | true | 是否启用触发项，默认 true。 | 否 |
| flex | int | 1 | 非滚动且父级宽度有界时的宽度分配权重，默认 1，必须大于 0。 | 否 |
| width | double? | - | 滚动模式或父级宽度无界时的触发项宽度，默认 112 逻辑像素； 非滚动且宽度有界时使用 `flex` 分配宽度，此字段不生效。 | 否 |

#### 属性

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| triggerBuilder | TDropdownMenuTriggerBuilder? | - | 自定义触发项构建器；默认构造时为空。 | - |

### TDropdownMenuController

类型安全的下拉筛选栏控制器。

#### 构造方法

##### TDropdownMenuController

无参数。

#### 属性

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| isOpen | bool | - | 当前是否有打开的面板。 | - |
| openIndex | int? | - | 当前打开项的下标；没有打开的面板时为 null。 | - |

#### 实例方法

##### TDropdownMenuController.close

无参数。

关闭当前面板；未绑定筛选栏时不执行操作。Future 等待本次关闭请求处理结束。

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Future<void> | - | 当前关闭请求处理完毕时完成；未绑定或被后续操作打断时也会完成，不代表面板一定已经关闭。 | - |

##### TDropdownMenuController.open

位置参数：`index`

打开 `index` 对应面板；未绑定筛选栏时不执行操作。Future 等待本次打开请求处理结束。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| index | int | - | 目标筛选项下标，从 0 开始。 | 是 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Future<void> | - | 当前打开请求处理完毕时完成；未绑定、索引无效、项目禁用或请求被打断时也会完成，不代表一定打开成功。 | - |

##### TDropdownMenuController.toggle

位置参数：`index`

切换 `index` 对应面板；未绑定筛选栏时不执行操作。Future 等待本次切换请求处理结束。

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| index | int | - | 目标筛选项下标，从 0 开始。 | 是 |

###### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Future<void> | - | 当前切换请求处理完毕时完成；未绑定或请求无效、被打断时也会完成，不代表目标状态一定已达成。 | - |

### TDropdownMenuPlacement

下拉筛选面板相对筛选栏的展开位置。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| auto | TDropdownMenuPlacement | - | 根据触发栏上下可用空间自动选择展开方向。 | - |
| below | TDropdownMenuPlacement | - | 向触发栏下方展开。 | - |
| above | TDropdownMenuPlacement | - | 向触发栏上方展开。 | - |

### TDropdownMenuCloseReason

下拉筛选面板关闭的原因。

#### 枚举值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| selection | TDropdownMenuCloseReason | - | 单选面板提交选项后关闭。 | - |
| confirm | TDropdownMenuCloseReason | - | 多选面板确认草稿后关闭。 | - |
| cancel | TDropdownMenuCloseReason | - | 面板取消操作或局部控制器默认关闭。 | - |
| overlay | TDropdownMenuCloseReason | - | 点击面板外部区域触发关闭。 | - |
| back | TDropdownMenuCloseReason | - | 返回键或路由返回操作触发关闭。 | - |
| trigger | TDropdownMenuCloseReason | - | 再次点击当前触发项关闭。 | - |
| controller | TDropdownMenuCloseReason | - | 全局控制器请求关闭。 | - |
| switchItem | TDropdownMenuCloseReason | - | 切换到其他筛选项时关闭原面板。 | - |

### TDropdownMenuClosedCallback

下拉筛选面板关闭回调。

位置参数：`index, reason`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| index | int | - | 关闭面板对应的筛选项索引，从 0 开始。 | 是 |
| reason | TDropdownMenuCloseReason | - | 本次面板关闭的原因。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | void | - | 无返回值。 | - |

### TDropdownMenuPanelBuilder

默认触发项的面板构建器。

位置参数：`context, controller`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 筛选面板的构建上下文。 | 是 |
| controller | TDropdownMenuPanelController | - | 当前面板控制器，用于请求关闭该面板。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Widget | - | 当前筛选项的面板内容。 | - |

### TDropdownMenuTriggerBuilder

自定义触发项构建器。

位置参数：`context, state`

#### 回调参数

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| context | BuildContext | - | 筛选触发项的构建上下文。 | 是 |
| state | TDropdownMenuTriggerState | - | 当前触发项的状态及操作入口。 | 是 |

#### 返回值

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| 返回值 | Widget | - | 自定义筛选触发项内容。 | - |

### TDropdownThemeData

DropdownMenu 的组件级视觉与布局默认值。

#### 配置项

| 名称 | 类型 | 默认值 | 说明 | 必传 |
| --- | --- | --- | --- | --- |
| actionAreaPadding | EdgeInsetsGeometry? | - | 多选面板底部操作区内边距。 | 否 |
| actionGap | double? | - | 多选面板底部按钮之间的间距；为空时读取全局 spacer2。 | 否 |
| activeIconColor | Color? | - | 打开面板的触发项箭头颜色。 | 否 |
| activeTextStyle | TextStyle? | - | 打开面板的触发项文本样式。 | 否 |
| barBackgroundColor | Color? | - | 筛选栏背景色；为空时读取全局 bgColorContainer。 | 否 |
| barHeight | double? | - | 筛选栏高度；未配置时最小高度读取 size13，默认 48 逻辑像素。 | 否 |
| disabledIconColor | Color? | - | 禁用触发项箭头颜色。 | 否 |
| disabledOptionColor | Color? | - | 多列选项禁用背景色。 | 否 |
| disabledOptionTextStyle | TextStyle? | - | 禁用选项文本样式。 | 否 |
| disabledTextStyle | TextStyle? | - | 禁用触发项文本样式。 | 否 |
| dividerColor | Color? | - | 筛选栏底部分隔线颜色；为空时读取全局 componentStroke。 | 否 |
| iconColor | Color? | - | 默认触发项箭头颜色。 | 否 |
| iconSize | double? | - | 触发项箭头尺寸；未设置时读取 size7，默认 20 逻辑像素。 | 否 |
| optionBorderRadius | BorderRadius? | - | 多列选项圆角；为空时读取全局 radiusDefault。 | 否 |
| optionColor | Color? | - | 多列选项默认背景色。 | 否 |
| optionHeight | double? | - | 单选列表行高度，默认 56 逻辑像素。 | 否 |
| optionPadding | EdgeInsetsGeometry? | - | 选项内边距；为空时使用全局 spacer2 水平间距。 | 否 |
| optionTextStyle | TextStyle? | - | 选项默认文本样式。 | 否 |
| overlayColor | Color? | - | 遮罩颜色，包含透明度。未指定时为黑色 60%，动画按展开进度缩放透明度。 | 否 |
| panelBackgroundColor | Color? | - | 面板背景色；为空时读取全局 bgColorContainer。 | 否 |
| selectedOptionColor | Color? | - | 多列选项选中背景色。 | 否 |
| selectedOptionTextStyle | TextStyle? | - | 选中选项文本样式。 | 否 |
| textStyle | TextStyle? | - | 默认触发项文本样式。 | 否 |

## 设计指南

### 何时使用

当内容较多时，需要通过筛选快速定位某一类内容时使用。

### 常见用法

##### 常用于单个维度筛选或多个维度复合筛选的场景，可进行单选或多选。

![](https://tdesign.gtimg.com/site/design/mobile-guide/dropdown-menu/dropdown-menu-1.png)

![](https://tdesign.gtimg.com/site/design/mobile-guide/dropdown-menu/dropdown-menu-2.png)

### 推荐/慎用示例

##### 在单选的筛选场景内，建议将用户选择项替换标题显示于菜单面板内。

![](https://tdesign.gtimg.com/site/design/mobile-guide/dropdown-menu/dropdown-menu-3.png)
![](https://tdesign.gtimg.com/site/doc/good.png)

---

##### 当筛选维度为多选时，建议提供重置按钮，便于用户恢复到未筛选状态。

![](https://tdesign.gtimg.com/site/design/mobile-guide/dropdown-menu/dropdown-menu-4.png)
![](https://tdesign.gtimg.com/site/doc/good.png)
