import 'package:flutter/material.dart';
import 'package:frist_flutter_app/listener/eventbus.dart';

class PageA extends StatefulWidget {
  @override
  _PageAState createState() {
    return _PageAState();
  }
}

class _PageAState extends State<PageA> {
  //EventBus bus = EventBus();
  String title = "hello world";

  @override
  Widget build(BuildContext context) {
    bus.on("login", (arg) {
      print("收到消息 ${arg.toString()}");
      setState(() {
        title = arg.toString();
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("pageA"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
              onPressed: () {
                bus.emit("login", "user name is toy");
              },
              child: Text("登录")),
          Text("登录信息$title")
        ],
      )),
    );
  }
}
