# dart root class Object 介绍

```
The base class for all Dart objects.

Because Object is the root of the Dart class hierarchy, every other Dart class is a subclass of Object.

When you define a class, you should override toString to return a string describing an instance of that class. You might also need to define hashCode and operator ==, as described in the Implementing map keys section of the library tour.
```
以上为官方文档介绍。
可以看到所有的dart 对象都继承自Object类。
在实际的开发过程中，我们会创建一些数据类型，比如把服务端的数据转换成可用的model or entity。

#### 创建一个user对象

```dart
class User {
  String id;
  String username;
  DateTime birthday;
  int sex;
  
  User({this.id, this.username, this.birthday, this.sex = 1});
}
```

#### 重写基类的方法
一般来说，有一下3个方法可以根据需求重写：`int get hashCode()`，`String toString()`，`bool operator ==(other)`

##### hashCode方法

```dart
@override
  int get hashCode => id.hashCode ^ username.hashCode ^ birthday.hashCode ^ sex.hashCode;
```
hasCode用来判断2个对象是否相同。
如果一个子类重写了hashCode方法，那么它必须重写`*operator ==*`方法

##### toString方法

```dart
  @override
  String toString() {
    return 'User{id:$id, username:$username, birthday:$birthday, sex:$sex}';
  }
```
toString方法类似于iOS中的description方法，用于描述对象。

##### operator ==方法

```dart
  @override
  bool operator ==(other) {
    return identical(this, other) ||
      other is User && runtimeType == other.runtimeType &&
      id == other.id && username == other.username &&
      birthday == other.birthday && sex == other.sex;
  }
```
==方法用于比较2个对象是否相同，内存地址一致。
首先使用dart内置函数`identical`比较2个对象是否相同（个人猜想比较的是内存地址）。如果不同，则比较是否是同一个类，runtimeType是否相同，一次比较对象的各个属性。





