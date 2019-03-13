import 'package:flutter/material.dart';

class GridViewRoute1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("纵轴固定数量的gridview"),
      ),
      body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6, //横轴三个子widget
              childAspectRatio: 1.0, //宽高比为1时，子widget
              //mainAxisSpacing: 20,
              //crossAxisSpacing: 20
          ),
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast),
            Icon(Icons.free_breakfast),
            Icon(Icons.free_breakfast),
            Icon(Icons.free_breakfast)
          ]),
    );
  }
}

//GridView.count
