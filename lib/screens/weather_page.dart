import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/window.dart';
import 'package:weather_app/models/provider.dart';
import '../models/services/weather_service.dart';
import '../utils/themes.dart';
// import '../widgets/divider.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider=Provider.of(context);
    WeatherService weatherService = WeatherService(dataProvider);
    EdgeInsetsGeometry customMargin = EdgeInsets.all(4.0);
    ThemeData customTheme=customNoonTheme;
    String windowImage='assets/noon.jfif';
    DateTime now = DateTime.now();
    //logic for custom theme changes according to time
    print(now);
    if(dataProvider.weather!=null) {
      DateTime? sunset=dataProvider.weather!.sunset;
      DateTime? sunrise=dataProvider.weather!.sunrise;
      Duration? difference1 = sunrise?.difference(now);
      Duration? difference2 = sunset?.difference(now);
      print(sunrise);
      print(sunset);

      if (difference1?.inHours == 1 && difference1!.inMinutes % 60 == 0 ||
          difference1?.inHours == 0 && difference1!.inMinutes <= 60) {
        customTheme = customMorningTheme;
        windowImage='assets/morning.jfif';
      }
      else if (difference2?.inHours == 1 && difference2!.inMinutes % 60 == 0 ||
          difference2?.inHours == 0 && difference2!.inMinutes <= 60) {
        customTheme = customEveningTheme;
        windowImage='assets/evening.jfif';
      }
      else if (now.hour >= sunset!.hour && now.minute>sunset.minute || now.hour<sunrise!.hour){
        print("...");
        customTheme=customNightTheme;
        windowImage='assets/night.jfif';
      }
    }
    print(customTheme.primaryColor);
    return Scaffold(
      backgroundColor: customTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: customTheme.backgroundColor,
        leading: Icon(
            Icons.menu,
          color: Colors.white,
        ),
        title: Text('Your Window',style: customTheme.textTheme.headlineLarge,),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Window(dataProvider: dataProvider, weatherService: weatherService, windowImage: windowImage, customTheme: customTheme,),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: BottomAppBar(
          height: MediaQuery.of(context).size.height*0.08,
          color: customTheme.cardColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(child: IconButton(icon: Icon( Icons.home,color: customTheme.primaryColor,), onPressed: () {  },),),
              Expanded(child: IconButton(color: customTheme.primaryColor ,icon: Icon(Icons.stay_current_portrait_sharp), onPressed: () {  },),),
              // Expanded(child: new Text('')),
              Expanded(child: IconButton(icon: Icon(Icons.bookmark_border_outlined,color: customTheme.primaryColor ,), onPressed: () {  },),),
              Expanded(child: IconButton(icon: Icon(Icons.person,color: customTheme.primaryColor, ), onPressed: () {  },),),
            ],
          ),
        ),
      ),
    );
  }
}
