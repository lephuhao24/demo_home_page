import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hello_world/Model/Notice.dart';
import 'package:hello_world/View/NoticeScreen/NoticeDetail.dart';
import 'package:intl/intl.dart';
import 'package:hello_world/Network/NetworkProvider.dart';

class NoticeList extends StatefulWidget {
  @override
  _NoticeListState createState() => _NoticeListState();
}

class _NoticeListState extends State<NoticeList> {
  List<Notice> list = List();
  var isLoading = false;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  navigationTo(Widget page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  void getHttp() async {
    setState(() {
      isLoading = true;
    });
    try {
      Response response = await NetworkProvider.shared.get("/notices");
      print(response.data.toString());
      if (response.statusCode == 200) {
        list = (response.data["data"] as List)
            .map((item) => new Notice.fromJson(item))
            .toList();
      } else {
        Fluttertoast.showToast(
            msg: "Can not load data." + response.statusMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 14.0);
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: "Can not load data:" + e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.0);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: true,
        top: false,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "お知らせ",
                style: TextStyle(
                  color: Color.fromRGBO(16, 47, 143, 1),
                  fontFamily: "M_PLUS_Rounded_1c",
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                ),
              ),
            ),
            body: isLoading
                ? Center(
                    child: SpinKitCircle(
                      color: Color.fromRGBO(16, 47, 143, 1),
                      size: 60.0,
                    ),
                  )
                : Container(
                    color: Color.fromRGBO(247, 247, 255, 1),
                    child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int row) {
                          // return Text(list[row].title);
                          return ListTile(
                            onTap: () {
                              navigationTo(
                                NoticeDetail(idNotice: list[row].id.toString()),
                              );
                            },
                            title: Text(
                              list[row].title,
                              style: TextStyle(
                                color: Color.fromRGBO(97, 109, 117, 1),
                                fontFamily: "M_PLUS_Rounded_1c",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            trailing: Text(
                              DateFormat('HH:mm').format(list[row].createdAt),
                              style: TextStyle(
                                color: Color.fromRGBO(97, 109, 117, 1),
                                fontFamily: "M_PLUS_Rounded_1c",
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                              ),
                            ),
                          );
                        }),
                  )));
  }
}
