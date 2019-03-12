import 'package:flutter/material.dart';

class ConstrainedBoxDemo extends StatelessWidget {
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.blue),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ConstrainedBox和SizedBox"),
        ),
        body:
            /*ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: double.infinity, //宽度尽可能大
            minHeight: 50.0 //最小高度为50像素
            ),
        child: Container(height: 8.0, child: redBox),
      ),*/

            /*SizedBox(
            width: 80.0,
            height: 80.0,
            child: redBox
        )*/
            //多重限制
            ConstrainedBox(
                constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
                  child: redBox,
                )));
  }
}

//UnconstrainedBox
/**
    ConstrainedBox(
    constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
    child: UnconstrainedBox( //“去除”父级限制
    child: ConstrainedBox(
    constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
    child: redBox,
    ),
    )
    )
 */
