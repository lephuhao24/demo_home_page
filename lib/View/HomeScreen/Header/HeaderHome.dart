import 'package:flutter/material.dart';
import 'ContentHeaderHome.dart';
import '../LinearViewBackground.dart';

class HeaderHome extends StatefulWidget {
  const HeaderHome({
    Key key,
    @required this.heightColumn,
    @required GlobalKey<State<StatefulWidget>> keyColumnSize,
    @required this.images,
  })  : _keyColumnSize = keyColumnSize,
        super(key: key);

  final double heightColumn;
  final GlobalKey<State<StatefulWidget>> _keyColumnSize;
  final List<String> images;

  @override
  _HeaderHomeState createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: widget.heightColumn + 24,
              child: LinearBackgroundWidget(
                colorBegin: Color.fromRGBO(235, 255, 220, 1),
                colorEnd: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 297,
            child: LinearBackgroundWidget(
              colorBegin: Color.fromRGBO(33, 68, 176, 1),
              colorEnd: Color.fromRGBO(0, 26, 107, 1),
              radius: BorderRadius.only(bottomLeft: Radius.circular(48)),
            ),
          ),
        ),
        SafeArea(
          child: ContentHeaderHome(
              keyColumnSize: widget._keyColumnSize, images: widget.images),
        ),
      ],
    );
  }
}
