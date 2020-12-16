import 'package:flutter/material.dart';

/// This is the stateless widget that the main application instantiates.
class LinearBackgroundWidget extends StatelessWidget {
  final Color colorBegin;
  final Color colorEnd;
  final BorderRadius radius;
  LinearBackgroundWidget({
    this.colorBegin,
    this.colorEnd,
    this.radius,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment
              .bottomCenter, // 10% of the width, so there are ten blinds.
          colors: [
            this.colorBegin,
            this.colorEnd,
          ], // red to yellow
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
    );
  }
}
