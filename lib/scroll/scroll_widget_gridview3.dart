import 'package:flutter/material.dart';

class GridViewRoute3 extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => new _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<GridViewRoute3> {
  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GridviewRoute3"),),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //每行三列
              childAspectRatio: 1.0, //显示区域宽高相等
              //crossAxisSpacing: 20,
              //mainAxisSpacing: 20
          ),
          itemCount: _icons.length,
          itemBuilder: (context, index) {
            //如果显示到最后一个并且Icon总数小于200时继续获取数据
            if (index == _icons.length - 1 && _icons.length < 200) {
              _retrieveIcons();
            }
            //return Icon(_icons[index]);
            return Item("项目$index", _icons[index]);

          }),
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}

class Item extends StatelessWidget {
  Item(this.text, this.icon);
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50),
      child: Column(
        children: <Widget>[
          Icon(icon,color: Colors.red,),
          Text(text),
        ],
      ),
    );
  }
}
