import 'package:airpollution/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  TextStyle textStyle = TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Information',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                  color: getColorByIndex(0),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Center(
                  child: Text(
                '0 - 50',
                style: TextStyle(color: Colors.white, fontSize: 50.0),
              )),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Text(
              'Air quality is considered satisfactory, and air pollution poses little or no risk.',
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                  color: getColorByIndex(51),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Center(
                  child: Text(
                '50 - 100',
                style: TextStyle(color: Colors.white, fontSize: 50.0),
              )),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Text(
                'Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution.',
                textAlign: TextAlign.center,
                style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                  color: getColorByIndex(101),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Center(
                  child: Text(
                '100 - 150',
                style: TextStyle(color: Colors.white, fontSize: 50.0),
              )),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Text(
              'Members of sensitive groups may experience health effects. The general public is not likely to be affected.',
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                  color: getColorByIndex(151),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Center(
                  child: Text(
                '150 - 200',
                style: TextStyle(color: Colors.white, fontSize: 50.0),
              )),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Text(
              'Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects.',
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                  color: getColorByIndex(201),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Center(
                  child: Text(
                '200 - 300',
                style: TextStyle(color: Colors.white, fontSize: 50.0),
              )),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Text(
              '	Health warnings of emergency conditions. The entire population is more likely to be affected.',
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                  color: getColorByIndex(301),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Center(
                  child: Text(
                '> 300',
                style: TextStyle(color: Colors.white, fontSize: 50.0),
              )),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Text(
              'Health alert: everyone may experience more serious health effects.',
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          )
        ],
      ),
    );
  }
}
