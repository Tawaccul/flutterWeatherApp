import 'package:flutter/material.dart';
import 'package:helloworld/models/forecastDaily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<weatherForecast>? snapshot;

  const TempView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot?.data?.list;
    var icon = forecastList?[0].getIconUrl();
    var temp = forecastList?[0].temp?.day?.toStringAsFixed(0);
    var description = forecastList?[0].weather?[0].description?.toUpperCase();
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(icon!, scale: 0.4, color: Colors.black54),
        SizedBox(
          height: 20,
        ),
        Column(
          children: <Widget>[
            Text(
              '$temp *C',
              style: TextStyle(fontSize: 54, color: Colors.black54),
            ),
            Text(
              '$description',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            )
          ],
        )
      ],
    ));
  }
}
