import 'package:flutter/material.dart';
import 'package:hello_world/Model/Event.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hello_world/Network/NetworkProvider.dart';
import 'package:hello_world/View/EventScreen/SearchEvent/SearchEventScreen.dart';
import 'package:hello_world/View/FilterScreen/FilterScreen.dart';
import 'EventCell.dart';
import 'EventDetailScreen/EventDetailScreen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  List<Event> list = List();
  var isLoading = false;
  var total = 0;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    list = [];
    await getHttp();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    if (list.length < total && total != 0) {
      getHttp();
    }
    _refreshController.loadComplete();
  }

  navigationTo(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => page),
    );
  }

  Future<void> getHttp() async {
    setState(() {
      isLoading = true;
    });
    try {
      Response response = await NetworkProvider.shared.get(
        "/events",
        queryParameters: {
          "offset": list.length,
          "limit": 20,
        },
      );
      print(response.data.toString());
      if (response.statusCode == 200) {
        list += (response.data["data"]["events"] as List)
            .map((item) => new Event.fromJson(item))
            .toList();
        total = (response.data["data"]["total"]);
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
            "イベント",
            style: TextStyle(
              color: Color.fromRGBO(16, 47, 143, 1),
              fontFamily: "M_PLUS_Rounded_1c",
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
          ),
          leading: IconButton(
            icon: Image(
              image: AssetImage('Assets/ic_search.png'),
              width: 28,
              height: 28,
              fit: BoxFit.contain,
            ),
            onPressed: () {
              navigationTo(SearchEventScreen());
            },
          ),
          actions: [
            IconButton(
              icon: Image(
                image: AssetImage('Assets/ic_options.png'),
                width: 28,
                height: 28,
                fit: BoxFit.contain,
              ),
              onPressed: () {
                navigationTo(FilterEventScreen());
              },
            )
          ],
        ),
        body: isLoading && total == 0
            ? Center(
                child: SpinKitCircle(
                  color: Color.fromRGBO(16, 47, 143, 1),
                  size: 60.0,
                ),
              )
            : Container(
                color: Color.fromRGBO(247, 247, 255, 1),
                child: SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  header: ClassicHeader(),
                  footer: ClassicFooter(),
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,

                  // enableLoadingWhenFailed: true,
                  // hideFooterWhenNotFull: false,
                  // enableBallisticLoad: true,

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
              ),
      ),
    );
  }
}
