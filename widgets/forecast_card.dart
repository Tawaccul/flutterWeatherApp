import 'package:flutter/material.dart';
import 'package:helloworld/utilities/forecast_util.dart';
import 'package:intl/intl.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data.list;
  DateTime date =
      DateTime.fromMicrosecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormatedDate(date);
  var dayOfWeek = '';
  var icon = forecastList[index].getIconUrl();
  dayOfWeek = DateFormat('EEEE').format(date);

  var tempMin = forecastList[index].temp.min.toStringAsFixed(0);

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            dayOfWeek,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('$tempMin *C',
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                  ),
                  Image.network(
                    icon,
                    scale: 1.2,
                    color: Colors.white,
                  )
                ],
              )
            ],
          )
        ],
      )
    ],
  );
}
