import 'package:flutter/cupertino.dart';
import 'package:weather/weather.dart';

import 'data/api.dart';



class DataProvider extends ChangeNotifier{

  Weather? weather;
  void changeWeather(Weather w){
    weather=w;
    print(weather!.temperature);
    notifyListeners();
  }
  // void changeweather
}