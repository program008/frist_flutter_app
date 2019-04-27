import 'package:flutter/material.dart';
import 'package:frist_flutter_app/basic/basic_list_del.dart';
import 'package:frist_flutter_app/basic/detail_screen_page.dart';
import 'package:frist_flutter_app/basic/home_screen.dart';
import 'package:frist_flutter_app/net/net_get_data.dart';
import 'package:transparent_image/transparent_image.dart';
//import "package:cached_network_image/cached_network_image.dart";

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
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Image.asset("assets/images/evn_face_photo.jpg")),
                    Expanded(
                        child: Image.asset("assets/images/evn_face_photo.jpg")
                    ,flex: 2,),
                    Expanded(
                        child: Image.asset("assets/images/evn_face_photo.jpg")),
                  ],
                ),

                Row(
                  //mainAxisSize: MainAxisSize.max,
                  children: [
                    new Icon(Icons.star, color: Colors.green[500]),
                    new Icon(Icons.star, color: Colors.green[500]),
                    new Icon(Icons.star, color: Colors.green[500]),
                    new Icon(Icons.star, color: Colors.black),
                    new Icon(Icons.star, color: Colors.black),
                  ],
                ),
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
                Image.network(
                  'https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true',
                ),
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image:
                      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556096476683&di=9005bdfcb54e90b49f4a7a00e8e71dcf&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F20182%2F21%2F2018221142159_MZ33z.jpeg',
                ),
//                CachedNetworkImage(
//                  placeholder: new CircularProgressIndicator(),
//                  imageUrl:
//                      'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
//                )

//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Icon(Icons.accessible, color: Colors.green,),
//                Icon(Icons.error, color: Colors.green,),
//                Icon(Icons.fingerprint, color: Colors.green,),
//              ],
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Icon(MyIcons.niupai, color: Colors.purple,),
//                Icon(MyIcons.jitui, color: Colors.green,),
//              ],
//            )

                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MyApp(
                        items: new List<String>.generate(
                            20, (i) => "Item ${i + 1}"),
                      );
                    }));
                  },
                  child: Text("实现滑动关闭"),
                ),

                //返回上一个界面
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("返回上一个界面"),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TodosScreen(
                        todos: new List.generate(
                          20,
                          (i) => new Todo(
                                'Todo $i',
                                'A description of what needs to be done for Todo $i',
                              ),
                        ),
                      );
                    }));
                  },
                  child: Text("给新界面传值"),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return new HomeScreen();
                    }));
                  },
                  child: Text("从新页面返回数据给上一个页面"),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return new MyAppNet();
                    }));
                  },
                  child: Text("从互联网获取数据"),
                ),
              ],
            ),
          ),
        ));
  }
}

class MyIcons {
  //icon-niupai
  static const IconData niupai =
      const IconData(0xe614, fontFamily: 'myIcon', matchTextDirection: true);

  static const IconData jitui =
      const IconData(0xe620, fontFamily: 'myIcon', matchTextDirection: true);
}
