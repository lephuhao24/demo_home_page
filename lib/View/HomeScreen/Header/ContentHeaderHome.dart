import 'package:flutter/material.dart';
import 'CustomSlider.dart';

class ContentHeaderHome extends StatefulWidget {
  const ContentHeaderHome({
    Key key,
    @required GlobalKey<State<StatefulWidget>> keyColumnSize,
    @required this.images,
  })  : _keyColumnSize = keyColumnSize,
        super(key: key);

  final GlobalKey<State<StatefulWidget>> _keyColumnSize;
  final List<String> images;

  @override
  _ContentHeaderHomeState createState() => _ContentHeaderHomeState();
}

class _ContentHeaderHomeState extends State<ContentHeaderHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      key: widget._keyColumnSize,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 11),
            child: Container(
              width: 178,
              height: 25,
              child: Image(image: AssetImage('Assets/mostParty.png')),
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(28, 15, 28, 20),
          child: Text(
            "毎月、約5000人の方にご参加いただいております。完全着席型でゆっくりお話が可能なスタイルの街コンを開催しております。",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(208, 207, 247, 1),
              fontFamily: "M_PLUS_Rounded_1c",
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
        CustomSlider(images: widget.images),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Image(
                  image: AssetImage('Assets/line.png'),
                  height: 40,
                  width: 40,
                ),
              ),
              Expanded(
                child: Text(
                  """LINE@限定クーポンでお得にパーティーにご参加いただけます！
期間限定情報もあるのでお見逃しなく！""",
                  style: TextStyle(
                    fontFamily: "M_PLUS_Rounded_1c",
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(97, 109, 117, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: RaisedButton(
              child: Text("男性はこちら"),
              onPressed: () {},
              color: Color.fromRGBO(16, 47, 143, 1),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: RaisedButton(
              child: Text("女性はこちら"),
              onPressed: () {},
              color: Colors.white,
              textColor: Color.fromRGBO(16, 47, 143, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: BorderSide(
                    width: 1,
                    color: Color.fromRGBO(16, 47, 143, 1),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
