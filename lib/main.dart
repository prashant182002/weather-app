import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/weather_page.dart';

import 'models/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<DataProvider>(
      create: (context) => DataProvider(), // Provide an instance of your data model
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: customTheme,
      color: Colors.black,
      home: WeatherPage(),
    );
  }
}
