import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:frist_flutter_app/basic/basic_widget.dart';
import 'package:frist_flutter_app/basic/basic_widget_button.dart';
import 'package:frist_flutter_app/basic/basic_widget_image.dart';
import 'package:frist_flutter_app/basic/basic_widget_input_box_form.dart';
import 'package:frist_flutter_app/basic/basic_widget_switch_checkbox.dart';
import 'package:frist_flutter_app/container/container_widget_constrainedbox.dart';
import 'package:frist_flutter_app/container/container_widget_container.dart';
import 'package:frist_flutter_app/container/container_widget_decoratedbox.dart';
import 'package:frist_flutter_app/container/container_widget_padding.dart';
import 'package:frist_flutter_app/container/container_widget_scaffold.dart';
import 'package:frist_flutter_app/container/container_widget_transform.dart';
import 'package:frist_flutter_app/function/function_widget_inherited_widget.dart';
import 'package:frist_flutter_app/function/function_widget_theme.dart';
import 'package:frist_flutter_app/function/function_widget_willpopscope.dart';
import 'package:frist_flutter_app/layout/layout_widget_flex.dart';
import 'package:frist_flutter_app/layout/layout_widget_row_column.dart';
import 'package:frist_flutter_app/layout/layout_widget_stack.dart';
import 'package:frist_flutter_app/layout/layout_widget_wrap_flow.dart';
import 'package:frist_flutter_app/listener/listener_eventbus_page_a.dart';
import 'package:frist_flutter_app/listener/listener_gesture__recognizer.dart';
import 'package:frist_flutter_app/listener/listener_gesture_conflict.dart';
import 'package:frist_flutter_app/listener/listener_gesture_content.dart';
import 'package:frist_flutter_app/listener/listener_gesture_detector.dart';
import 'package:frist_flutter_app/listener/listener_gesture_drag.dart';
import 'package:frist_flutter_app/listener/listener_gesture_drag_vertical.dart';
import 'package:frist_flutter_app/listener/listener_geture_scale.dart';
import 'package:frist_flutter_app/listener/listener_pointer_event.dart';
import 'package:frist_flutter_app/scroll/scroll_widget_controller.dart';
import 'package:frist_flutter_app/scroll/scroll_widget_controller2.dart';
import 'package:frist_flutter_app/scroll/scroll_widget_custom_scroll.dart';
import 'package:frist_flutter_app/scroll/scroll_widget_gridview1.dart';
import 'package:frist_flutter_app/scroll/scroll_widget_gridview2.dart';
import 'package:frist_flutter_app/scroll/scroll_widget_gridview3.dart';
import 'package:frist_flutter_app/scroll/scroll_widget_listview.dart';
import 'package:frist_flutter_app/scroll/scroll_widget_listview2.dart';
import 'package:frist_flutter_app/scroll/scroll_widget_listview3.dart';
import 'package:frist_flutter_app/scroll/scroll_widget_single_child_scroll_view.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //应用名称
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      //注册路由
      routes: {
        "new_page": (context) => NewRoute(),
        "new_page2": (context) => EchoRoute("hello world"),
      },
      //应用首页路由
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              // Column is also layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
                FlatButton(
                  child: Text("open a new route"),
                  textColor: Colors.blue,
                  onPressed: () {
                    //Navigator.pushNamed(context, "new_page");
                    //Navigator.pushNamed(context, "new_page2");
//                Navigator.push(context, MaterialPageRoute(builder: (context) {
//                  return NewRoute();
//                }));

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return EchoRoute("上一个界面点击 $_counter 次");
                    }));
                  },
                ),
                RandomWordWidget(),
                //文本，文字样式
                FlatButton(
                  child: Text("Text Style"),
                  textColor: Colors.red,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TextSytle2();
                    }));
                  },
                ),
                //按钮
                RaisedButton(
                  child: Text("按钮"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ButtonWidget();
                    }));
                  },
                ),
                //图片及ICON
                FlatButton(
                  child: Text("图片及ICON"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ImageDemo();
                    }));
                  },
                ),
                FlatButton(
                  child: Text("单选框和复选框"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SwitchAndCheckBoxTestRoute();
                    }));
                  },
                ),

                //输入框和表单
                FlatButton(
                  child: Text("输入框和表单"),
                  textColor: Colors.red,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return InputBoxAndForm();
                    }));
                  },
                ),

                //布局类 row column
                FlatButton(
                  child: Text("布局类Row,Column"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LayoutRowColumn();
                    }));
                  },
                ),

                //弹性布局 flex
                FlatButton(
                  child: Text("弹性布局Flex"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FlexDemo();
                    }));
                  },
                ),
                //流式布局 wrap flow
                FlatButton(
                  child: Text("流式布局Wrap , Flow"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return WrapFlowDemo();
                    }));
                  },
                ),

                //Stack 和绝对布局
                FlatButton(
                  child: Text("Stack 和绝对布局"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return StackDemo();
                    }));
                  },
                ),

                //padding
                FlatButton(
                  child: Text("容器类widget Padding"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PaddingTestRoute();
                    }));
                  },
                ),

                //ConstrainedBox和SizedBox
                FlatButton(
                  child: Text("布局限制类容器ConstrainedBox和SizedBox"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ConstrainedBoxDemo();
                    }));
                  },
                ),
                //装饰容器类DecoratedBox
                FlatButton(
                  child: Text("装饰容器类DecoratedBox"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DecoratedBoxDemo();
                    }));
                  },
                ),

                //Transform变换
                FlatButton(
                  child: Text("Transform变换"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TransformDemo();
                    }));
                  },
                ),

                //Container
                FlatButton(
                  child: Text("Container"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ContainerDemo();
                    }));
                  },
                ),

                //Scaffold
                FlatButton(
                  child: Text("Scaffold"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ScaffoldRoute();
                    }));
                  },
                ),

                //SingleChildScrollViewTestRoute
                FlatButton(
                  child: Text("SingleChildScrollView"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SingleChildScrollViewTestRoute();
                    }));
                  },
                ),

                //ListViewTestRoute
                FlatButton(
                  child: Text("ListViewTestRoute"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ListViewTestRoute();
                    }));
                  },
                ),
                //InfiniteListView
                FlatButton(
                  child: Text("InfiniteListView"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return InfiniteListView();
                    }));
                  },
                ),

                //添加固定表头
                FlatButton(
                  child: Text("添加固定表头"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ListViewRoute3();
                    }));
                  },
                ),

                //纵轴固定数量的gridview
                FlatButton(
                  child: Text("纵轴固定数量的gridview"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GridViewRoute1();
                    }));
                  },
                ),

                //纵轴子元素为固定长度的gridview
                FlatButton(
                  child: Text("纵轴子元素为固定长度的gridview"),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return GridViewRoute2();
                    }));
                  },
                ),
                //gridview
                FlatButton(
                  child: Text("纵轴固定数量的gridview2"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GridViewRoute3();
                    }));
                  },
                ),

                //CustomScrollView
                FlatButton(
                  child: Text("CustomScrollView"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CustomScrollViewTestRoute();
                    }));
                  },
                ),


                //ScrollControllerTestRoute
                FlatButton(
                  child: Text("滚动控制"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return ScrollControllerTestRoute();
                        }));
                  },
                ),

                //ScrollNotificationTestRoute
                FlatButton(
                  child: Text("ScrollNotificationTestRoute"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return ScrollNotificationTestRoute();
                        }));
                  },
                ),

                //WillPopScopeTestRoute
                FlatButton(
                  child: Text("WillPopScopeTestRoute"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return WillPopScopeTestRoute();
                        }));
                  },
                ),


                //InheritedWidgetTestRoute
                FlatButton(
                  child: Text("InheritedWidgetTestRoute"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return InheritedWidgetTestRoute();
                        }));
                  },
                ),

                //ThemeTestRoute
                FlatButton(
                  child: Text("ThemeTestRoute"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return ThemeTestRoute();
                        }));
                  },
                ),

                //Pointer 事件处理
                FlatButton(
                  child: Text("Pointer事件处理"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return PointerEventRoute();
                        }));
                  },
                ),

                //手势检测
                FlatButton(
                  child: Text("手势检测(点击，双击，长按)"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return GestureDetectorTestRoute();
                        }));
                  },
                ),


                //_Drag 事件处理
                FlatButton(
                  child: Text("拖动(任意方向)"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return DragRoute();
                        }));
                  },
                ),

                //_Drag 事件处理
                FlatButton(
                  child: Text("拖动(单一方向)"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return DragVerticalRoute();
                        }));
                  },
                ),

                //缩放 事件处理
                FlatButton(
                  child: Text("缩放"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return ScaleTestRoute();
                        }));
                  },
                ),

                //GestureRecognizerTestRoute
                FlatButton(
                  child: Text("GestureRecognizerTestRoute"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return GestureRecognizerTestRoute();
                        }));
                  },
                ),

                //手势竞争
                FlatButton(
                  child: Text("手势竞争"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return BothDirectionTestRoute();
                        }));
                  },
                ),

                //手势冲突
                FlatButton(
                  child: Text("手势冲突"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return GestureConflictTestRoute();
                        }));
                  },
                ),

                //事件总线 A界面
                FlatButton(
                  child: Text("事件总线 A界面"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return PageA();
                        }));
                  },
                ),

              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RandomWordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pairWord = WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(pairWord.toString()),
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new route"),
      ),
      body: Center(
        child: Text("this is new route"),
      ),
    );
  }
}

class EchoRoute extends StatelessWidget {
  EchoRoute(this.tip);

  final String tip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Echo route"),
      ),
      body: Center(
        //回显tip内容
        child: Text(tip),
      ),
    );
  }
}
