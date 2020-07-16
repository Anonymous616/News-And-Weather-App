import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'weather/weather.dart';
import 'package:weatherApp/news/News.dart';

Color backColor = Colors.white;
Color foreColor = Colors.grey[900];
Color textColor = Colors.black;

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Weather App",
        home: Home(),
      ),
    );

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var now = new DateTime.now();

  List<Widget> _widgets;

  @override
  void initState() {
    super.initState();
    _widgets = [Weather(), News()];
    // this.themePicker();
  }

  // void themePicker() {
  //   int currHour = this.now.hour;
  //   print(currHour);

  //   setState(() {
  //     if (currHour >= 5 && currHour < 12) {
  //       backColor = Colors.blue;

  //       textColor = Colors.white;
  //     }
  //     if (currHour >= 12 && currHour < 17) {
  //       backColor = Colors.orangeAccent;
  //       foreColor = Colors.orange[800];
  //       textColor = Colors.white;
  //     }
  //     if (currHour >= 18 && currHour < 21) {
  //       backColor = Colors.orangeAccent[400];
  //       foreColor = Colors.orange[800];
  //       textColor = Colors.white;
  //     }
  //     if (currHour >= 21 && currHour < 5) {
  //       backColor = Colors.black;
  //       foreColor = Colors.grey[900];
  //       textColor = Colors.white;
  //     }
  //   });
  // }

  int index = 0;
  tapped(int tappedIndex) {
    setState(() {
      index = tappedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backColor,
        elevation: 0.0,
      ),
      backgroundColor: backColor,
      body: _widgets[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: foreColor,
          primaryColor: Colors.white,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: new TextStyle(color: Colors.grey[600]),
              ),
        ),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: tapped,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.wb_sunny,
              ),
              title: Text('Weather'),
            ),
            BottomNavigationBarItem(
              icon: new FaIcon(FontAwesomeIcons.newspaper),
              title: Text('News'),
            ),
          ],
        ),
      ),
    );
  }
}
