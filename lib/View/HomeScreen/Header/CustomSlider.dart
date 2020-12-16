import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomSlider extends StatefulWidget {
  final List<String> images;
  final int pageShowing = 0;

  CustomSlider({
    Key key,
    this.images,
    pageShowing,
  }) : super(key: key);

  @override
  _CustomSlider createState() => new _CustomSlider();
}

class _CustomSlider extends State<CustomSlider> {
  int index = 0;

  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 203,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                this.index = index;
              });
            },
          ),
          items: widget.images.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image(
                    image: AssetImage(i),
                    fit: BoxFit.fill,
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < widget.images.length; i++)
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 4, right: 4),
                child: Container(
                  width: 24,
                  height: 4,
                  decoration: BoxDecoration(
                    color: i == index
                        ? Color.fromRGBO(255, 194, 39, 1)
                        : Color.fromRGBO(208, 207, 247, 1),
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                  ),
                ),
              )
          ],
        )
      ],
    );
  }
}
