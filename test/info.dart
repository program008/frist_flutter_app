class Info {

  /**
   * name : "John Smith"
   * email : "john@example.com"
   */

  String name;
  String email;

  static Info fromMap(Map<String, dynamic> map) {
    Info info = new Info();
    info.name = map['name'];
    info.email = map['email'];
    return info;
  }

  static List<Info> fromMapList(dynamic mapList) {
    List<Info> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}
