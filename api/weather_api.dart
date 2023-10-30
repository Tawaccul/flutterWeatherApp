import 'package:helloworld/models/forecastDaily.dart';
import 'package:helloworld/utilities/constants.dart';
import 'package:helloworld/utilities/locations.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';

class WeatherApi {
  Future<weatherForecast> fetchWeatherForecast(
      {String? cityName, bool? isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String?> parameters;

    if (isCity == true) {
      var queryParametrs = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName
      };
      parameters = queryParametrs;
    } else {
      var queryParametrs = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString()
      };
      parameters = queryParametrs;
    }
    ;

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parameters);

    log('request ${uri.toString()}');

    var response = await http.get(uri);

    print('response ${response?.body}');

    if (response.statusCode == 200) {
      return weatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error!');
    }
  }
}
