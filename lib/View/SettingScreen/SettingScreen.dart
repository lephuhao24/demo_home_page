import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: true,
        top: false,
        child: Scaffold(
          backgroundColor: Color.fromRGBO(247, 247, 255, 1),
          appBar: AppBar(
            title: Text(
              "通知設定",
              style: TextStyle(
                color: Color.fromRGBO(16, 47, 143, 1),
                fontFamily: "M_PLUS_Rounded_1c",
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
            ),
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 8),
                    ListTile(
                      tileColor: Colors.white,
                      onTap: () {
                        setState(() {
                          isSwitched = !isSwitched;
                          print(isSwitched);
                        });
                      },
                      title: Text(
                        "運用からのお知らせ",
                        style: TextStyle(
                          color: Color.fromRGBO(97, 109, 117, 1),
                          fontFamily: "M_PLUS_Rounded_1c",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      trailing: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            print(isSwitched);
                          });
                        },
                        activeTrackColor: Color.fromRGBO(68, 114, 196, 1),
                        activeColor: Color.fromRGBO(16, 47, 143, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
