import 'dart:convert';
import 'info.dart';
import 'user.dart';

void main() {
  //test1();
  //test2();
  test3();
}

void test1() {
  //一个JSON格式的用户列表字符串
  String jsonStr = '[{"name":"Jack"},{"name":"Rose"}]';
//将JSON字符串转为Dart对象(此处是List)
  List items = json.decode(jsonStr);
//输出第一个用户的姓名
  print(items[1]["name"]);
}

void test2() {
  String jsonstr = '{"name": "John Smith","email": "john@example.com"}';
  Map usermap = json.decode(jsonstr);
  var user = User.fromJson(usermap);
  print('${user.name} --> ${user.email}');

  print('${json.encode(user)}');
}

void test3() {
  String jsonstr = '{"name": "John Smith","email": "john@example.com"}';
  var map = new JsonDecoder().convert(jsonstr);
  var userinfo = Info.fromMap(map);
  print('${userinfo.name}-->${userinfo.email}');
}
