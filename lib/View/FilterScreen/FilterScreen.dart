import 'package:flutter/material.dart';

class FilterEventScreen extends StatefulWidget {
  @override
  _FilterEventScreenState createState() => _FilterEventScreenState();
}

class _FilterEventScreenState extends State<FilterEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "検索条件",
          style: TextStyle(
            color: Color.fromRGBO(16, 47, 143, 1),
            fontFamily: "M_PLUS_Rounded_1c",
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
        ),
        actions: [
          FlatButton(
            child: Text(
              "リセット",
              style: TextStyle(
                color: Color.fromRGBO(68, 114, 196, 1),
                fontFamily: "M_PLUS_Rounded_1c",
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            // Row(
            //   children: [],
            //   title: Text("エリア"),
            //   leading: Image(
            //     image: AssetImage("Assets/ic_map.png"),
            //     width: 24,
            //     height: 24,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
