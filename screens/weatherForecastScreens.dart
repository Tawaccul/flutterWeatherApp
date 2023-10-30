import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:helloworld/api/weather_api.dart';
import 'package:helloworld/models/forecastDaily.dart';
import 'package:helloworld/screens/cityScreen.dart';
import 'package:helloworld/widgets/bottom_view_list.dart';
import 'package:helloworld/widgets/city_view.dart';
import 'package:helloworld/widgets/datail_view.dart';
import 'package:helloworld/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  final locationWeather;

  WeatherForecastScreen({this.locationWeather});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<weatherForecast>? forecastObject;
  String _cityName = 'Moscow';

  @override
  void initState() {
    super.initState();

    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }

    // forecastObject?.then((weather) {
    //   print(weather?.list?[0]?.weather?[0]?.main);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('openweathermap'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
          icon: Icon(Icons.my_location),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                var tappedName = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return CityScreen();
                }));
                if (tappedName != null) {
                  setState(() {
                    _cityName = tappedName;
                    forecastObject = WeatherApi().fetchWeatherForecast(
                        cityName: _cityName, isCity: true);
                  });
                }
              },
              icon: Icon(Icons.location_city)),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: FutureBuilder<weatherForecast>(
              future: forecastObject,
              builder: (ctx, snapShot) {
                if (snapShot.hasData) {
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      CityView(
                        snapshot: snapShot,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TempView(
                        snapshot: snapShot,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      DetailView(
                        snapshot: snapShot,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      BottomListView(
                        snapshot: snapShot,
                      )
                    ],
                  );
                } else {
                  return Center(
                      child: Text(
                    'City not found\nPlease, enter correct city',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
