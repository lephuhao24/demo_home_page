import 'package:flutter/material.dart';
import 'Cell/ContentCellViewModel.dart';
import 'Cell/HomeContentCell.dart';

class ContentHome extends StatelessWidget {
  const ContentHome({
    Key key,
    @required this.cellViewModels,
  }) : super(key: key);

  final List<HomeContentCellViewModel> cellViewModels;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
          child: Text(
            "ビギナーズガイド",
            style: TextStyle(
              fontFamily: "M_PLUS_Rounded_1c",
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          alignment: Alignment.centerLeft,
        ),
        for (var i = 0; i < cellViewModels.length; i++)
          HomeContentCell(i: i, cellViewModels: cellViewModels),
      ],
    );
  }
}
