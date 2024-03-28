import 'package:weather/weather.dart';
import 'package:weather_app/models/provider.dart';
import '../data/api.dart';
import 'package:geolocator/geolocator.dart';


class WeatherService{
  final DataProvider dataProvider;
  WeatherService(this.dataProvider);
  void weatherEvent() async {
    print("called....................");
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best)
        .timeout(Duration(seconds: 100));
    WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

    try {
      Weather weather=await wf.currentWeatherByLocation(position.latitude,position.longitude);
      dataProvider.changeWeather(weather);
      // print(weather.weatherIcon);
      // print(weather.temperature!.celsius!.round());
    }catch(err){
      print("error");
    }

  }
}

// emit(WeatherBlocSuccess(weather));