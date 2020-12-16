import 'package:flutter/material.dart';

import 'ContentCellViewModel.dart';

class HomeContentCell extends StatelessWidget {
  const HomeContentCell({
    Key key,
    @required this.i,
    @required this.cellViewModels,
  }) : super(key: key);

  final int i;
  final List<HomeContentCellViewModel> cellViewModels;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
      child: Column(
        children: [
          if (i != 0)
            Column(
              children: [
                Container(
                  height: 1,
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(231, 232, 234, 1)),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 0, 12, 12),
                child: Text(
                  cellViewModels[i].number,
                  style: TextStyle(
                    fontFamily: "M_PLUS_Rounded_1c",
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(68, 114, 196, 1),
                    fontSize: 20,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromRGBO(218, 227, 243, 1),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cellViewModels[i].title,
                      style: TextStyle(
                        fontFamily: "M_PLUS_Rounded_1c",
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(68, 114, 196, 1),
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      cellViewModels[i].content,
                      style: TextStyle(
                        fontFamily: "M_PLUS_Rounded_1c",
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(97, 109, 117, 1),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
