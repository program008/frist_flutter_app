import 'package:flutter/material.dart';

class InputBoxAndForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _selectionController = new TextEditingController();
    _selectionController.text = "hello world!";
    _selectionController.selection = TextSelection(
        baseOffset: 2, extentOffset: _selectionController.text.length);

    TextEditingController _nameController = TextEditingController();
    _nameController.addListener(() {
      print('_nameController ${_nameController.text}');
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("输入框和表单"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            //表单
            FormTestRoute(),
            TextField(
              //autofocus: true,
              maxLength: 10,
              maxLengthEnforced: true,
              controller: _selectionController,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.people)),
              onChanged: (value) {
                print('输入框onChanged()--->' + value);
              },
              onSubmitted: (value) {
                print('输入框onSubmitted()--->' + value);
              },
              onEditingComplete: () {
                print('输入完成');
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)),
              maxLength: 10,
              maxLengthEnforced: false,
              obscureText: true,
              controller: _nameController,
              onEditingComplete: () {
                print('onEditingComplete()--->' + _nameController.text);
              },
            ),
            //FocusTestRoute(),
            Theme(
                data: Theme.of(context).copyWith(
                    hintColor: Colors.grey[200], //定义下划线颜色
                    inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(color: Colors.grey), //定义label字体样式
                        hintStyle: TextStyle(
                            color: Colors.grey, fontSize: 14.0) //定义提示文本样式
                        )),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          labelText: "用户名",
                          hintText: "用户名或邮箱",
                          prefixIcon: Icon(Icons.person)),
                      cursorColor: Colors.red,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "密码",
                          hintText: "您的登录密码",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 13.0)),
                      obscureText: true,
                    )
                  ],
                )),
            Container(
              child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "电子邮件地址",
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder.none //隐藏下划线
                      )),
              decoration: BoxDecoration(
                  // 下滑线浅灰色，宽度1像素
                  border: Border(
                      bottom: BorderSide(color: Colors.grey[200], width: 1.0))),
            ),
          ],
        ),
      ),
    );
  }
}

///控制焦点
class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => new _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    focusNode1.addListener(() {
      print("是否获取焦点${focusNode1.hasFocus}");
    });
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: focusNode1, //关联focusNode1
            decoration: InputDecoration(labelText: "input1"),
          ),
          TextField(
            focusNode: focusNode2, //关联focusNode2
            decoration: InputDecoration(labelText: "input2"),
          ),
          Builder(
            builder: (ctx) {
              return Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("移动焦点"),
                    onPressed: () {
                      //将焦点从第一个TextField移到第二个TextField
                      // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                      // 这是第二种写法
                      if (null == focusScopeNode) {
                        focusScopeNode = FocusScope.of(context);
                      }
                      focusScopeNode.requestFocus(focusNode2);
                    },
                  ),
                  RaisedButton(
                    child: Text("隐藏键盘"),
                    onPressed: () {
                      // 当所有编辑框都失去焦点时键盘就会收起
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

//表单

class FormTestRoute extends StatefulWidget {
  @override
  _FormTestRouteState createState() => new _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      //title: "Form Test",
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          key: _formKey, //设置globalKey，用于后面获取FormState
          autovalidate: true, //开启自动校验
          child: Column(
            children: <Widget>[
              TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      icon: Icon(Icons.person)),
                  // 校验用户名
                  validator: (v) {
                    return v.trim().length > 0 ? null : "用户名不能为空";
                  }),
              TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      icon: Icon(Icons.lock)),
                  obscureText: true,
                  //校验密码
                  validator: (v) {
                    return v.trim().length > 5 ? null : "密码不能少于6位";
                  }),
              // 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
//                    Expanded(
//                      child: RaisedButton(
//                        padding: EdgeInsets.all(15.0),
//                        child: Text("登录"),
//                        color: Theme
//                            .of(context)
//                            .primaryColor,
//                        textColor: Colors.white,
//                        onPressed: () {
//                          //在这里不能通过此方式获取FormState，context不对
//                          //print(Form.of(context));
//
//                          // 通过_formKey.currentState 获取FormState后，
//                          // 调用validate()方法校验用户名密码是否合法，校验
//                          // 通过后再提交数据。
//                          if((_formKey.currentState as FormState).validate()){
//                            //验证通过提交数据
//                          }
//                        },
//                      ),
//                    ),
                    Expanded(
                      child: Builder(builder: (context) {
                        return RaisedButton(
                            padding: EdgeInsets.all(15.0),
                            child: Text("登录"),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: () {
                              //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                              if (Form.of(context).validate()) {
                                //验证通过提交数据
                              }
                            });
                      }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
