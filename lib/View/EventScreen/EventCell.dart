import 'package:flutter/material.dart';
import 'package:hello_world/Model/Event.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EventCell extends StatefulWidget {
  const EventCell({
    Key key,
    this.event,
  }) : super(key: key);

  final Event event;

  @override
  _EventCellState createState() => _EventCellState();
}

class _EventCellState extends State<EventCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(24, 20, 24, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Container(
            height: 327,
            child: Image(
              image: CachedNetworkImageProvider(widget.event.iconPath),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.event.title2 + "\n" + widget.event.title3,
                  style: TextStyle(
                    color: Color.fromRGBO(68, 114, 196, 1),
                    fontFamily: "M_PLUS_Rounded_1c",
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      widget.event.holdingArea + ": ",
                      style: TextStyle(
                        color: Color.fromRGBO(97, 109, 117, 1),
                        fontFamily: "M_PLUS_Rounded_1c",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      DateFormat('HH:mm').format(widget.event.startAt) +
                          " ~ " +
                          DateFormat('HH:mm').format(widget.event.endAt),
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "M_PLUS_Rounded_1c",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "男性:",
                      style: TextStyle(
                        color: Color.fromRGBO(97, 109, 117, 1),
                        fontFamily: "M_PLUS_Rounded_1c",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      widget.event.maleAgeFrom.toString() +
                          "歳 ~ " +
                          widget.event.maleAgeTo.toString() +
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
                      "￥" + widget.event.maleOriginPrice.toString(),
                      style: TextStyle(
                        color: Color.fromRGBO(255, 194, 39, 1),
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
                        color: Color.fromRGBO(97, 109, 117, 1),
                        fontFamily: "M_PLUS_Rounded_1c",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      widget.event.femaleAgeFrom.toString() +
                          "歳 ~ " +
                          widget.event.femaleAgeTo.toString() +
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
                      "￥" + widget.event.femaleOriginPrice.toString(),
                      style: TextStyle(
                        color: Color.fromRGBO(255, 194, 39, 1),
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
        ],
      ),
    );
  }
}
