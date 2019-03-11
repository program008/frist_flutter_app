import 'package:flutter/material.dart';

class TextSytle2 extends StatelessWidget {
  //声明文本样式
  final textSytle1 = TextStyle(fontFamily: 'FlameanteRoma');
  final textSytle2 = TextStyle(fontFamily: 'LatoBold');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文本及样式"),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hello world",
              textAlign: TextAlign.center,
            ),
            Text(
              "Hello world! I'm Jack. " * 5,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Hello world" * 10,
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
            ),

            Text(
              "Hello world",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  height: 1.2,
                  fontFamily: "Courier",
                  background: new Paint()..color = Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid),
            ),
            //显示富文本格式的文本
            Text.rich(TextSpan(children: [
              TextSpan(text: "Home: "),
              TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(color: Colors.blue),
                //recognizer: _tapRecognizer
              ),
            ])),

            //使用默认字体
            DefaultTextStyle(
              //1.设置文本默认样式
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("hello world"),
                  Text("I am Jack"),
                  Text(
                    "I am Jack",
                    style: TextStyle(
                        inherit: false, //2.不继承默认样式
                        color: Colors.grey),
                  ),
                ],
              ),
            ),

            //使用文本样式

            Text(
              "use the font for this text",
              style: textSytle1,
            ),

            Text(
              "use the font for this text",
              style: textSytle2,
            ),
          ],
        ),
      ),
    );
  }
}
