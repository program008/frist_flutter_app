import 'package:flutter/material.dart';

class PointerEventRoute extends StatefulWidget {
  @override
  _PointerEventRoute createState() => _PointerEventRoute();
}

class _PointerEventRoute extends State<PointerEventRoute> {
  //定义一个状态，保存当前指针位置
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("原始指令事件处理"),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.blue)),
                ),
                onPointerDown: (event) => print("down0"),
              ),
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                  child: Center(child: Text("左上角200*100范围内非文本区域点击")),
                ),
                onPointerDown: (event) => print("down1"),
                //behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
              )
            ],
          ),
          Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 150.0)),
                child: Center(child: Text("Box A")),
              ),
              //behavior: HitTestBehavior.opaque,
              onPointerDown: (event) => print("down A")),
          Listener(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 300.0,
              height: 150.0,
              child: Text(_event?.toString() ?? "",
                  style: TextStyle(color: Colors.white)),
            ),
            onPointerDown: (PointerDownEvent event) {
              print('手势按下${event.toString()} 压力：${event.pressure}');
              setState(() => _event = event);
            },
            onPointerMove: (PointerMoveEvent event) {
              print('手势移动${event.toString()}  压力：${event.pressure}');
              setState(() => _event = event);
            },
            onPointerUp: (PointerUpEvent event) {
              print('手势抬起${event.toString()} 压力：${event.pressure}');
              setState(() => _event = event);
            },
          ),

          //忽略PointerEvent  IgnorePointer和AbsorbPointer
          Listener(
            child: AbsorbPointer(
              child: Listener(
                child: Container(
                  color: Colors.red,
                  width: 200.0,
                  height: 100.0,
                ),
                onPointerDown: (event)=>print("in"),
              ),
            ),
            onPointerDown: (event)=>print("up"),
          )
        ],
      ),
    );
  }
}
