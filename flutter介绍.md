# flutter介绍
### What is flutter?
> flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 flutter可以与现有的代码一起工作。在全世界，flutter正在被越来越多的开发者和组织使用，并且flutter是完全免费、开源的。

### flutter和React-Native、Weex这样的动态化框架有什么不同？
React-Native、Weex核心是通过Javascript开发，执行时需要Javascript解释器，UI是通过原生控件渲染。flutter与用于构建移动应用程序的其它大多数框架不同，因为flutter既不使用WebView，也不使用操作系统的原生控件。 相反，flutter使用自己的高性能渲染引擎来绘制widget。flutter使用C、C ++、Dart和Skia（2D渲染引擎）构建。在IOS上，flutter引擎的C/C ++代码使用LLVM编译，任何Dart代码都是AOT编译为本地代码的，flutter应用程序使用本机指令集运行（不涉及解释器）。而在Android下，flutter引擎的C/C ++代码是用Android的NDK编译的，任何Dart代码都是AOT编译成本地代码的，flutter应用程序依然使用本机指令集运行（不涉及解释器）。因此，flutter能达到原生应用一样的性能。

### flutter用什么语言开发?
flutter使用**Dart**语言作为其开发。

# flutter安装
### 各平台安装指南链接
[官方安装指南](https://flutter.io/get-started/install/)，这里更新最快，更全更新。
[flutter中文网安装指南](https://flutterchina.club/get-started/install/)，涉及到网络环境问题，可以在这里配置一下，使用国内的镜像资源。
### 个人为示例的安装介绍（纯iOS开发，Mac环境）
1. 新建文件夹==flutterDEV==，下载SDK archive到该文件夹，打开terminator至该文件夹。
2. 添加flutter工具到系统路径：
```
export PATH=`pwd`/flutter/bin:$PATH
```
3. 运行flutter doctor：
```flutter doctor
```
4. 结果查看：

 ╔════════════════════════════════════════════════════════════════════════════╗
  ║ WARNING: your installation of Flutter is 41 days old.                      ║
  ║                                                                            ║
  ║ To update to the latest version, run "flutter upgrade".                    ║
  ╚════════════════════════════════════════════════════════════════════════════╝



  ╔════════════════════════════════════════════════════════════════════════════╗
  ║                 Welcome to Flutter! - https://flutter.io                   ║
  ║                                                                            ║
  ║ The Flutter tool anonymously reports feature usage statistics and crash    ║
  ║ reports to Google in order to help Google contribute improvements to       ║
  ║ Flutter over time.                                                         ║
  ║                                                                            ║
  ║ Read about data we send with crash reports:                                ║
  ║ https://github.com/flutter/flutter/wiki/Flutter-CLI-crash-reporting        ║
  ║                                                                            ║
  ║ See Google's privacy policy:                                               ║
  ║ https://www.google.com/intl/en/policies/privacy/                           ║
  ║                                                                            ║
  ║ Use "flutter config --no-analytics" to disable analytics and crash         ║
  ║ reporting.                                                                 ║
  ╚════════════════════════════════════════════════════════════════════════════╝

Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel beta, v0.5.1, on Mac OS X 10.13.5 17F77, locale en-CN)
[✗] Android toolchain - develop for Android devices
    ✗ Unable to locate Android SDK.
      Install Android Studio from: https://developer.android.com/studio/index.html
      On first launch it will assist you in installing the Android SDK components.
      (or visit https://flutter.io/setup/#android-setup for detailed instructions).
      If Android SDK has been installed to a custom location, set $ANDROID_HOME to that location.
[!] iOS toolchain - develop for iOS devices (Xcode 9.4.1)
    ✗ Missing Xcode dependency: Python module "six".
      Install via 'pip install six' or 'sudo easy_install six'.
    ✗ libimobiledevice and ideviceinstaller are not installed. To install, run:
        brew install --HEAD libimobiledevice
        brew install ideviceinstaller
    ✗ ios-deploy not installed. To install:
        brew install ios-deploy
    ! CocoaPods out of date (1.5.0 is recommended).
        CocoaPods is used to retrieve the iOS platform side's plugin code that responds to your plugin usage on the Dart side.
        Without resolving iOS dependencies with CocoaPods, plugins will not work on iOS.
        For more info, see https://flutter.io/platform-plugins
      To upgrade:
        brew upgrade cocoapods
        pod setup
[✗] Android Studio (not installed)
[✓] Connected devices (1 available)

### iOS相关依赖安装
iOS相关确实比较好安装，基本按照诊断走一遍就差不多了，不再详细说明。
### Android相关安装
* 安装Android Studio，从官网链接下载。[传送门](https://developer.android.com/studio/index.html)
* 安装完成，第一次运行，完成配置。会自动下载最新的Android sdk，Android SDK Platform-Tools, and Android SDK Build-Tools。
* 同意license：`flutter doctor --android-licenses`
* 新建一个项目并打开，IDE会下载相关组件，完成后，我们需要配置安卓模拟器。
* Android Studio>Tools>Android>AVD Manager and select Create Virtual Device。选择一个device，Next。
* 为要模拟的Android版本选择一个或多个系统映像，然后选择 Next. 建议使用 x86 或 x86_64 image。
* 在 Emulated Performance下, 选择 Hardware - GLES 2.0 以启用 硬件加速。
* 验证AVD配置是否正确，然后选择 Finish。

### 更新环境变量
1. 打开(或创建) $HOME/.bash_profile. 文件路径和文件名可能在您的机器上不同.
2. 添加以下行并更改[PATH_TO_FLUTTER_GIT_DIRECTORY]为克隆Flutter的git repo的路径:


```
export PUB_HOSTED_URL=https://pub.flutter-io.cn //国内用户需要设置
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn //国内用户需要设置
export PATH= PATH_TO_FLUTTER_GIT_DIRECTORY/flutter/bin:$PATH

```
运行 source $HOME/.bash_profile 刷新当前终端窗口.

```
注意: 如果你使用的是zsh，终端启动时 ~/.bash_profile 将不会被加载，解决办法就是修改 ～/.zshrc ，在其中添加：source ～/.bash_profile
```
通过运行flutter/bin命令验证目录是否在已经在PATH中:

```
echo $PATH
```

### flutter IDE配置
flutter可以使用Android Studio, IntelliJ, or VS Code来编写。
选择使用Android Studio和IntelliJ IDEA需要安装：**Flutter和Dart插件**

* `Flutter`插件： 支持Flutter开发工作流 (运行、调试、热重载等).
* `Dart`插件： 提供代码分析 (输入代码时进行验证、代码补全等).

安装方法：
1. 启动Android Studio。
2. 打开插件首选项 (Preferences>Plugins on macOS, File>Settings>Plugins on Windows & Linux)。
3. 选择 Browse repositories…, 选择 Flutter 插件并点击 install。
4. 重启Android Studio

### flutter创建项目

## flutter 组件
flutter中UI组件都是集成自widget。
widget有可变和可不变2种：
* `StatefulWidget` and State, for widgets that can build differently several times over their lifetime.
* `StatelessWidget`, for widgets that always build the same way given a particular configuration and ambient state.

一般来说我们会继承`extends`以上2个类来编写自定义组件。

## StatelessWidget

```Dart
class GreenFrog extends StatelessWidget {
  const GreenFrog({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(color: const Color(0xFF2DBD3A));
  }
}
```

Normally widgets have more constructor arguments, each of which corresponds to a final property. The next example shows the more generic widget Frog which can be given a color and a child:


```Dart
class Frog extends StatelessWidget {
  const Frog({
    Key key,
    this.color: const Color(0xFF2DBD3A),
    this.child,
  }) : super(key: key);

  final Color color;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new Container(color: color, child: child);
  }
}
```
因为不可变的特性，所以初始化参数传入时，对应的属性应该加上`final`。

## StatefulWidget
可变的UI组件。具体实现上比不可变widget复杂一点。

```Dart
class YellowBird extends StatefulWidget {
  const YellowBird({ Key key }) : super(key: key);

  @override
  _YellowBirdState createState() => new _YellowBirdState();
}

class _YellowBirdState extends State<YellowBird> {
  @override
  Widget build(BuildContext context) {
    return new Container(color: const Color(0xFFFFE306));
  }
}
```
以上YellowBird继承自StatefulWidget，重写了createState方法，返回一个State类。
State用于管理该widget中state变化。具体核心代码，UI组织存在于State类的具体实现中。

The next example shows the more generic widget Bird which can be given a color and a child, and which has some internal state with a method that can be called to mutate it:

```Dart
class Bird extends StatefulWidget {
  const Bird({
    Key key,
    this.color: const Color(0xFFFFE306),
    this.child,
  }) : super(key: key);

  final Color color;

  final Widget child;

  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<Bird> {
  double _size = 1.0;

  void grow() {
    setState(() { _size += 0.1; });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: widget.color,
      transform: new Matrix4.diagonal3Values(_size, _size, 1.0),
      child: widget.child,
    );
  }
}
```
状态的变更，通过setState方法
这点和wx小程序类似（setData）。


