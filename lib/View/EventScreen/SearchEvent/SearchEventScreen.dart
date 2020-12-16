import 'package:flutter/material.dart';
import 'package:hello_world/Model/Event.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hello_world/Network/NetworkProvider.dart';
import 'package:hello_world/View/EventScreen/EventDetailScreen/EventDetailScreen.dart';
import '../EventCell.dart';

class SearchEventScreen extends StatefulWidget {
  @override
  _SearchEventScreenState createState() => _SearchEventScreenState();
}

class _SearchEventScreenState extends State<SearchEventScreen> {
  List<Event> list = List();
  bool isLoading = false;
  TextEditingController _filter = TextEditingController();

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    _filter = new TextEditingController();
    // getHttp();
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
      Response response = await NetworkProvider.shared.get(
        "/events",
        queryParameters: {"title": _filter.text},
      );
      print(response.data.toString());
      if (response.statusCode == 200) {
        list = (response.data["data"]["events"] as List)
            .map((item) => new Event.fromJson(item))
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
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        top: false,
        child: Scaffold(
            appBar: AppBar(
              title: Container(
                height: 44,
                alignment: Alignment.centerLeft,
                child: TextFormField(
                  controller: _filter,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(111, 120, 126, 0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                          style: BorderStyle.solid),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                          style: BorderStyle.solid),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                          style: BorderStyle.solid),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                          style: BorderStyle.solid),
                    ),
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: 'キーワード検索',
                  ),
                  onEditingComplete: () {
                    getHttp();
                  },
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
                : GestureDetector(
                    onTap: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    },
                    child: Container(
                      color: Color.fromRGBO(247, 247, 255, 1),
                      child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int row) {
                            return GestureDetector(
                              onTap: () {
                                navigationTo(
                                  EventDetail(idEvent: list[row].id.toString()),
                                );
                              },
                              child: EventCell(event: list[row]),
                            );
                          }),
                    ),
                  )));
  }
}
