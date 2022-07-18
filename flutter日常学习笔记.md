# flutter日常学习笔记


### SingleChildScrollView使用场景？
实际开发过程中，我们可能有如下需求：一个view很长导致一整个屏幕放不下，但是又不想去使用ListView。

`When you have a list of children and do not require cross-axis shrink-wrapping behavior, for example a scrolling list that is always the width of the screen, consider ListView, which is vastly more efficient that a SingleChildScrollView containing a ListBody or Column with many children.`

##### Column配置SingleChildScrollView使用
Column Widget可以包含很多个子widget，当足够多的时候，可能屏幕太小，看不到了。这个时候可以用SingleChildScrollView warp Column。

```dart
new LayoutBuilder(
  builder: (BuildContext context, BoxConstraints viewportConstraints) {
    return SingleChildScrollView(
      child: new ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: viewportConstraints.maxHeight,
        ),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Container(
              // A fixed-height child.
              color: Colors.yellow,
              height: 120.0,
            ),
            new Container(
              // Another fixed-height child.
              color: Colors.green,
              height: 120.0,
            ),
          ],
        ),
      ),
    );
  },
)
```

### flutter中的下拉刷新 RefreshIndicator
RefreshIndicator用于可滑动（Scrollable）widget的下拉刷新。`onRefresh`方法用于松开开始刷新。
如果一个Scrollable因为高度不够，无法滑动。请设置 *physics* = AlwaysScrollableScrollPhysics

```dart
new ListView(
  physics: const AlwaysScrollableScrollPhysics(),
  children: ...
```
RefreshIndicator的child一般为ListView，CustomScrollView。

### Expanded使用
Expanded组件用于*Row*，*Column*，*Flex* Widget。
Expanded的主要作用是用于填充父组件（Row，Column，Flex）的“其余”空白区域。
一个Expanded组件***必须***是*Row*，*Column*，*Flex*的子widget，并且Expanded的child必须是 StatelessWidgets or StatefulWidgets。
一个最常用的场景是Expanded包裹Text组件，以为Text组件因文字不同，大小不确定。

just test yolo


