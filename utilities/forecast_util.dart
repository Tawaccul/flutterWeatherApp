import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormatedDate(DateTime date) {
    return DateFormat('EEEE, MMM d, y').format(date);
  }

  static getItem(IconData iconData, int value, String units) {
    return Column(
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.black45,
          size: 28,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '$value',
          style: TextStyle(fontSize: 20, color: Colors.black54),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '$units',
          style: TextStyle(fontSize: 15, color: Colors.black87),
        ),
      ],
    );
  }
}
