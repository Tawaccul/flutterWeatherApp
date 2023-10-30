import 'package:helloworld/models/forecastDaily.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/utilities/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<weatherForecast>? snapshot;
  const DetailView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastListPressure = snapshot?.data?.list?[0].pressure;
    var pressure = forecastListPressure! * 0.750062;
    var forecastList = snapshot?.data?.list;
    var humidity = forecastList![0].humidity;
    var wind = forecastList![0].speed;

    return Container(
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Util.getItem(FontAwesomeIcons.thermometerThreeQuarters,
                pressure.round(), 'mm Hg'),
            Util.getItem(FontAwesomeIcons.wind, wind!.toInt(), 'm/s'),
            Util.getItem(FontAwesomeIcons.cloudRain, humidity!, '%'),
          ]),
    );
  }
}
