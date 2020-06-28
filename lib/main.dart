import 'package:airpollution/bloc/BlocProvider.dart';
import 'package:airpollution/bloc/PollutionBloc.dart';
import 'package:airpollution/repositories/PollutionRepository.dart';
import 'package:airpollution/screens/HomeScreen.dart';
import 'package:airpollution/screens/InfoScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final pollutionRepository = PollutionRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      onGenerateRoute: _routes,
    );
  }

  Route _routes(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        {
          return MaterialPageRoute(
              builder: (context) => BlocProvider(
                    bloc: PollutionBloc(
                      pollutionRepository: PollutionRepository(),
                    ),
                    child: HomeScreen(),
                  ));
        }
      case '/info':
        {
          return MaterialPageRoute(builder: (context) => InfoScreen());
        }
    }
  }
}
