import 'package:flutter/material.dart';

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print('createState()');
    return _SwitchAndCheckBoxTestRouteState();
  }
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("单选框和复选框")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("单选框$_switchSelected 复选框$_checkboxSelected"),
            Switch(
              value: _switchSelected, //当前状态
              onChanged: (value) {
                //重新构建页面
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
            Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.red, //选中时的颜色
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
