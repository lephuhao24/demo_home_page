import 'package:flutter/material.dart';
import 'package:hello_world/View/EventScreen/EventList.dart';
import 'package:hello_world/View/HomeScreen/Home.dart';
import 'package:hello_world/View/NoticeScreen/NoticeList.dart';
import 'package:hello_world/View/SettingScreen/SettingScreen.dart';
import 'package:hello_world/icons/icon_tabbar_icons.dart';

class TabContainerBottom extends StatefulWidget {
  TabContainerBottom({Key key}) : super(key: key);

  @override
  _TabContainerBottomState createState() => _TabContainerBottomState();
}

class _TabContainerBottomState extends State<TabContainerBottom> {
  int tabIndex = 0;
  List<Widget> listScreens;
  @override
  void initState() {
    super.initState();
    listScreens = [
      Home(),
      EventList(),
      NoticeList(),
      SettingScreen(),
    ];
  }

//  @override
//  bool get wantKeepAlive =>
//      true; //by default it will be null, change it to true.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.white,
      ),
      home: Scaffold(
        body: listScreens[tabIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Color.fromRGBO(16, 47, 143, 1),
            unselectedItemColor: Color.fromRGBO(159, 165, 143, 1),
            backgroundColor: Colors.white,
            currentIndex: tabIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              setState(() {
                tabIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(IconTabbar.homeduotone),
                label: 'ホーム',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconTabbar.eventdisable),
                label: 'イベント',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconTabbar.bellduotone),
                label: 'お知らせ',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconTabbar.settingdisablecopy),
                label: '設定',
              ),
            ]),
        // backgroundColor: Colors.white,
      ),
    );
  }
}
