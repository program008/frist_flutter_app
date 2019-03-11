import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("按钮")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              child: Text("RaisedButton"),
              onPressed: (){
                print('点击了按钮1');
              },
            ),

            FlatButton(
              child: Text("FlatButton"),
              onPressed: (){
                print('点击了按钮2');
              },
            ),

            OutlineButton(
              child: Text("OutlineButton"),
              onPressed: (){
                print('点击了按钮3');
              },
            ),

            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: (){
                print('点击了按钮4');
              },
            ),

            RaisedButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () => {},
            ),

          ],
        ),
      ),
    );
  }
}
