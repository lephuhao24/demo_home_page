import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hello_world/Model/Notice.dart';
import 'package:hello_world/Network/NetworkProvider.dart';
import 'package:intl/intl.dart';

class NoticeDetail extends StatefulWidget {
  final String idNotice;
  const NoticeDetail({
    Key key,
    this.idNotice,
  }) : super(key: key);

  @override
  _NoticeDetailState createState() => _NoticeDetailState();
}

class _NoticeDetailState extends State<NoticeDetail> {
  Notice notice = Notice();
  var isLoading = false;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void getHttp() async {
    setState(() {
      isLoading = true;
    });
    try {
      Response response = await NetworkProvider.shared.get(
        "/notice-detail",
        queryParameters: {"notice_id": widget.idNotice},
      );
      print(response.data.toString());
      if (response.statusCode == 200) {
        notice = new Notice.fromJson(response.data["data"]);
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
        bottom: false,
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
              leading: BackButton(
                
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
                    width: double.infinity,
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notice.title,
                          style: TextStyle(
                            color: Color.fromRGBO(68, 114, 196, 1),
                            fontFamily: "M_PLUS_Rounded_1c",
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          DateFormat('yyyy/MM/dd HH:mm')
                              .format(notice.createdAt),
                          style: TextStyle(
                            color: Color.fromRGBO(255, 194, 39, 1),
                            fontFamily: "M_PLUS_Rounded_1c",
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          notice.content,
                          style: TextStyle(
                            color: Color.fromRGBO(97, 109, 117, 1),
                            fontFamily: "M_PLUS_Rounded_1c",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ))));
  }
}
