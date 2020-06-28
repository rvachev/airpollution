import 'dart:ui';

import 'package:airpollution/entities/Pollution.dart';
import 'package:airpollution/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  final Pollution _pollution;

  CustomBottomSheet({@required Pollution pollution}) : _pollution = pollution;

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  int pollutionIndex;
  dynamic co;
  dynamic no2;
  dynamic o3;
  dynamic pm10;
  dynamic pm25;
  dynamic so2;
  double deviceWidth;

  TextStyle smallDigitsStyle = TextStyle(fontSize: 9.0);

  @override
  void initState() {
    try {
      pollutionIndex = widget._pollution.data.aqi;
      co = widget._pollution.data.iaqi.co.v;
      no2 = widget._pollution.data.iaqi.no2.v;
      o3 = widget._pollution.data.iaqi.o3.v;
      pm10 = widget._pollution.data.iaqi.pm10.v;
      pm25 = widget._pollution.data.iaqi.pm25.v;
    } catch (ex) {
      print(ex);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 50.0,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                    color: getColorByIndex(pollutionIndex),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ]),
                child: Center(
                    child: Text(
                  '$pollutionIndex',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(color: Colors.grey),
                defaultColumnWidth: FixedColumnWidth((deviceWidth - 125) / 6),
                children: <TableRow>[
                  TableRow(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Center(child: Text('CO',)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Center(child: Row(
                        children: <Widget>[
                          Text('NO'),
                          Text('2', style: smallDigitsStyle,)
                        ],
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Center(child: Row(
                        children: <Widget>[
                          Text('O'),
                          Text('3', style: smallDigitsStyle,)
                        ],
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Center(child: Row(
                        children: <Widget>[
                          Text('PM'),
                          Text('10', style: smallDigitsStyle,)
                        ],
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Center(child: Row(
                        children: <Widget>[
                          Text('PM'),
                          Text('2.5', style: smallDigitsStyle,)
                        ],
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Center(child: Row(
                        children: <Widget>[
                          Text('SO'),
                          Text('2', style: smallDigitsStyle)
                        ],
                      )),
                    )
                  ]),
                  TableRow(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Center(child: Text('${co != null ? co : '?'}')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Center(child: Text('${no2 != null ? no2 : '?'}')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Center(child: Text('${o3 != null ? o3 : '?'}')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child:
                          Center(child: Text('${pm10 != null ? pm10 : '?'}')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child:
                          Center(child: Text('${pm25 != null ? pm25 : '?'}')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Center(child: Text('${so2 != null ? so2 : '?'}')),
                    )
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
