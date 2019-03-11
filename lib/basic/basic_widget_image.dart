import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";
    return Scaffold(
      appBar: AppBar(title: Text("图片及ICON")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/everyday.png"),
              width: 100,
            ),
            Image.asset(
              "assets/images/zumzf.png",
              width: 100,
            ),

            Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
            ),

            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 100.0,
            ),

            //使用Material Design字体图标

            Text(
              icons,
              style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24.0,
                  color: Colors.green),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.accessible, color: Colors.green,),
                Icon(Icons.error, color: Colors.green,),
                Icon(Icons.fingerprint, color: Colors.green,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(MyIcons.niupai, color: Colors.purple,),
                Icon(MyIcons.jitui, color: Colors.green,),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyIcons {
  //icon-niupai
  static const IconData niupai = const IconData(
  0xe614,
  fontFamily: 'myIcon',
  matchTextDirection: true
  );

  static const IconData jitui = const IconData(
  0xe620,
  fontFamily: 'myIcon',
  matchTextDirection: true
  );
}
