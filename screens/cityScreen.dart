import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                cursorColor: Colors.blueGrey[800],
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Enter Name Of City',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.black87,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.black87,
                      size: 50,
                    )),
                onChanged: (value) => cityName = value,
              ),
            ),
          ),
          TextButton(
            child: Text(
              'Get Weather',
              style: TextStyle(fontSize: 30),
            ),
            onPressed: () {
              Navigator.pop(context, cityName);
            },
          )
        ]),
      ),
    );
  }
}
