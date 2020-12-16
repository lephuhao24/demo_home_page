import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hello_world/Model/Event.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:hello_world/Network/NetworkProvider.dart';
import 'package:intl/intl.dart';

class EventDetail extends StatefulWidget {
  final String idEvent;
  const EventDetail({
    Key key,
    this.idEvent,
  }) : super(key: key);

  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  Event event = Event();
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
        "/event-detail",
        queryParameters: {"event_id": widget.idEvent},
      );
      print(response.data.toString());
      if (response.statusCode == 200) {
        event = new Event.fromJson(response.data["data"]);
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
    initializeDateFormatting("ja_JP");
    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        top: false,
        child: Scaffold(
            body: isLoading
                ? Center(
                    child: SpinKitCircle(
                      color: Color.fromRGBO(16, 47, 143, 1),
                      size: 60.0,
                    ),
                  )
                : SingleChildScrollView(
                    child: Container(
                        color: Color.fromRGBO(247, 247, 255, 1),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Image(
                                    image: CachedNetworkImageProvider(
                                        event.iconPath),
                                    height: 375,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SafeArea(
                                  child: Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.4)),
                                    margin: EdgeInsets.only(left: 12),
                                    padding: EdgeInsets.only(left: 6),
                                    child: BackButton(),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (event.title1 != "")
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color:
                                            Color.fromRGBO(250, 135, 92, 0.2),
                                      ),
                                      child: Text(
                                        event.title1,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(250, 135, 92, 1),
                                          fontFamily: "M_PLUS_Rounded_1c",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  SizedBox(height: 12),
                                  Text(
                                    event.title2 + "\n" + event.title3,
                                    style: TextStyle(
                                      color: Color.fromRGBO(68, 114, 196, 1),
                                      fontFamily: "M_PLUS_Rounded_1c",
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Text(
                                        event.holdingArea + ": ",
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(97, 109, 117, 1),
                                          fontFamily: "M_PLUS_Rounded_1c",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        DateFormat.MMMEd('ja_JP')
                                                .format(event.startAt) +
                                            DateFormat(' HH:mm')
                                                .format(event.startAt) +
                                            " ~ " +
                                            DateFormat('HH:mm')
                                                .format(event.endAt),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "M_PLUS_Rounded_1c",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color.fromRGBO(255, 194, 39, 0.06),
                                      border: Border.all(
                                        color: Color.fromRGBO(255, 194, 39, 1),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "男性:",
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    97, 109, 117, 1),
                                                fontFamily: "M_PLUS_Rounded_1c",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              event.maleAgeFrom.toString() +
                                                  "歳 ~ " +
                                                  event.maleAgeTo.toString() +
                                                  "歳",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "M_PLUS_Rounded_1c",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Text(
                                              "￥" +
                                                  event.maleOriginPrice
                                                      .toString(),
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 194, 39, 1),
                                                fontFamily: "M_PLUS_Rounded_1c",
                                                fontWeight: FontWeight.w900,
                                                fontSize: 16,
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "女性: ",
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    97, 109, 117, 1),
                                                fontFamily: "M_PLUS_Rounded_1c",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              event.femaleAgeFrom.toString() +
                                                  "歳 ~ " +
                                                  event.femaleAgeTo.toString() +
                                                  "歳",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "M_PLUS_Rounded_1c",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Text(
                                              "￥" +
                                                  event.femaleOriginPrice
                                                      .toString(),
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 194, 39, 1),
                                                fontFamily: "M_PLUS_Rounded_1c",
                                                fontWeight: FontWeight.w900,
                                                fontSize: 16,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 24),
                                    height: 1,
                                    color: Color.fromRGBO(231, 232, 234, 1),
                                  ),
                                  Text(
                                    "イベントの内容",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "M_PLUS_Rounded_1c",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    event.description,
                                    style: TextStyle(
                                      color: Color.fromRGBO(97, 109, 117, 1),
                                      fontFamily: "M_PLUS_Rounded_1c",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 24),
                                  Text(
                                    "イベントの内容",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "M_PLUS_Rounded_1c",
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    event.joinCondition,
                                    style: TextStyle(
                                      color: Color.fromRGBO(97, 109, 117, 1),
                                      fontFamily: "M_PLUS_Rounded_1c",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  )));
  }
}
