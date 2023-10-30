import 'package:flutter/material.dart';
import 'package:helloworld/models/forecastDaily.dart';
import 'package:helloworld/widgets/bottom_view_list.dart';
import 'package:helloworld/widgets/forecast_card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<weatherForecast>? snapshot;
  const BottomListView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '7-days forecast'.toUpperCase(),
          style: TextStyle(
              fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                    width: MediaQuery.of(context).size.width / 2.7,
                    height: 160,
                    color: Colors.black87,
                    child: forecastCard(snapshot!, index),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    width: 8,
                  ),
              itemCount: snapshot!.data!.list!.length),
        )
      ],
    );
  }
}
