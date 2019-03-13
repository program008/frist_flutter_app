import 'package:flutter/material.dart';

class GridViewRoute2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("纵轴固定数量的gridview"),
      ),
      body: GridView(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120.0, childAspectRatio: 2.0 //宽高比为2
            ),
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast),
          Icon(Icons.free_breakfast),
        ],
      ),
    );
  }
}

//GridView.extent
