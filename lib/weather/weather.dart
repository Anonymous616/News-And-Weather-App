import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:http/http.dart" as http;
import "dart:convert";
import 'package:weatherApp/main.dart';
import 'package:geolocator/geolocator.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  var temp;
  var desc;
  var current;
  var humid;
  var windSpeed;

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  Future getWeather() async {
    http.Response response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=Mumbai&units=metric&appid=c39159286573bff522b1f20388b3af75");
    var result = jsonDecode((response.body));
    if (mounted) {
      setState(() {
        this.temp = result["main"]["temp"];
        this.desc = result["weather"][0]["description"];
        this.current = result["weather"][0]["main"];
        this.humid = result["main"]["humidity"];
        this.windSpeed = result["wind"]["speed"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backColor,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Currently in Mumbai",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    temp != null ? temp.toString() + "\u00B0" : "Loading",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    current != null ? current.toString() : "Loading",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.thermometerHalf,
                      color: textColor,
                    ),
                    title: Text(
                      "Temperature",
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                    trailing: Text(
                      temp != null ? temp.toString() + "\u00B0" : "Loading",
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.cloud,
                      color: textColor,
                    ),
                    title: Text(
                      "Weather",
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                    trailing: Text(
                      desc != null ? desc.toString() : "Loading",
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.sun,
                      color: textColor,
                    ),
                    title: Text(
                      "Humidity",
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                    trailing: Text(
                      humid != null ? humid.toString() : "Loading",
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.wind,
                      color: textColor,
                    ),
                    title: Text(
                      "Wind Speed",
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                    trailing: Text(
                      windSpeed != null ? windSpeed.toString() : "Loading",
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
