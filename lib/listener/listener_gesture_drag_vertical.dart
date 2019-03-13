import 'package:flutter/material.dart';

class DragVerticalRoute extends StatefulWidget {
  @override
  _DragVerticalState createState() => new _DragVerticalState();
}

class _DragVerticalState extends State<DragVerticalRoute> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("拖动(单一方向)"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            //top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              //垂直方向拖动事件
              /*onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                });
              },*/
              //水平方向拖动事件
              onHorizontalDragUpdate: (DragUpdateDetails details){
                setState(() {
                  _left += details.delta.dx;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
