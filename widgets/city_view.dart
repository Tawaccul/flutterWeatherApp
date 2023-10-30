import 'package:flutter/material.dart';
import 'package:helloworld/models/forecastDaily.dart';
import 'package:helloworld/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<weatherForecast>? snapshot;
  const CityView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot?.data?.list?[0].dt;
    var city = snapshot?.data?.city?.name;
    var country = snapshot?.data?.city?.country;

    var formatedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList! * 1000);

    return Container(
      child: Column(children: <Widget>[
        Text(
          '$city, $country',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Text(
          '${Util.getFormatedDate(formatedDate)}',
          style: TextStyle(fontSize: 15),
        )
      ]),
    );
  }
}
