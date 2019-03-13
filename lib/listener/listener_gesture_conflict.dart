import 'package:flutter/material.dart';

class GestureConflictTestRoute extends StatefulWidget {
  @override
  GestureConflictTestRouteState createState() {
    // TODO: implement createState
    return GestureConflictTestRouteState();
  }
}

class GestureConflictTestRouteState extends State<GestureConflictTestRoute> {
  double _left = 0.0;
  double _leftB = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("手势冲突"),
        ),
        body:
            /* Stack(
            children: <Widget>[
              Positioned(
                left: _left,
                child: GestureDetector(
                  child: CircleAvatar(child: Text("A")),
                  //要拖动和点击的widget
                  onHorizontalDragUpdate: (DragUpdateDetails details) {
                    setState(() {
                      _left += details.delta.dx;
                    });
                  },
                  onHorizontalDragEnd: (details) {
                    print("onHorizontalDragEnd");
                  },
                  onTapDown: (details) {
                    print("down");
                  },
                  onTapUp: (details) {
                    print("up");
                  },
                ),
              )
            ],
          ),*/

            // 手势冲突只是手势级别的，而手势是对原始指针的语义化的识别，所以在遇到复杂的冲突场景时，
            // 都可以通过Listener直接识别原始指针事件来解决冲突。
            Stack(
          children: <Widget>[
            Positioned(
              top: 80.0,
              left: _leftB,
              child: Listener(
                onPointerDown: (details) {
                  print("down");
                },
                onPointerUp: (details) {
                  //会触发
                  print("up");
                },
                child: GestureDetector(
                  child: CircleAvatar(child: Text("B")),
                  onHorizontalDragUpdate: (DragUpdateDetails details) {
                    setState(() {
                      _leftB += details.delta.dx;
                    });
                  },
                  onHorizontalDragEnd: (details) {
                    print("onHorizontalDragEnd");
                  },
                ),
              ),
            )
          ],
        ));
  }
}
