import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/provider.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/services/weather_service.dart';
// import 'package:weather_app/utils/themes.dart';

class Window extends StatefulWidget {
  final WeatherService weatherService;
  final DataProvider dataProvider;
  final String windowImage;
  final ThemeData customTheme;
  const Window({Key? key, required this.weatherService, required this.dataProvider, required this.windowImage, required this.customTheme, }) : super(key: key);

  @override
  State<Window> createState() => _WindowState();
}

class _WindowState extends State<Window> {
  @override
  void initState() {
    widget.weatherService.weatherEvent();
    super.initState();
  }

  Widget getWeatherIcon(int? cc) {

    int code=00;
    if(cc!=null){
       code==cc;
    }
    if( code>= 200 && code< 300) {
      return Image.asset(
          'assets/1.png'
      );
    }
    else if( code>= 300 && code< 400) {
      return Image.asset(
          'assets/2.png'
      );
    }
    else if( code>= 500 && code< 600) {
      return Image.asset(
          'assets/3.png'
      );
    }
    else if( code>= 600 && code< 700) {
      return Image.asset(
          'assets/4.png'
      );
    }
    else if( code>= 700 && code< 800) {
      return Image.asset(
          'assets/5.png'
      );
    }
    else if( code== 800) {
      return Image.asset(
          'assets/6.png'
      );
    }
    else if( code>= 800 && code< 804) {
      return Image.asset(
          'assets/7.png'
      );
    }
    else {
      return Image.asset(
          'assets/7.png'
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // if(widget.dataProvider.weather!=null)
    ThemeData customTheme=widget.customTheme;
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.height*0.8 ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), // Set border radius (optional)
          image: DecorationImage(
            image: AssetImage(widget.windowImage),
              fit: BoxFit.cover
          ),
        ),
        // color: customTheme.primaryColor,
        child: widget.dataProvider.weather!=null?Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height*0.6,
                width: MediaQuery.of(context).size.width*0.8,
                child: getWeatherIcon(widget.dataProvider.weather?.weatherConditionCode)
            ),
            Text(widget.dataProvider.weather!.weatherMain!.toUpperCase(),style: TextStyle(
                color: customTheme.primaryColor,
                fontSize: customTheme.textTheme.headlineLarge?.fontSize,
                fontWeight: customTheme.textTheme.headlineLarge?.fontWeight
            )),
            Text('${widget.dataProvider.weather?.temperature!.celsius!.round()}°C',
                style: TextStyle(
                    color: customTheme.primaryColor,
                    fontSize: customTheme.textTheme.headlineMedium?.fontSize,
                    fontWeight: customTheme.textTheme.headlineMedium?.fontWeight
                )),
            Text('📍 ${widget.dataProvider.weather?.areaName}',
                style: TextStyle(
                    color: customTheme.primaryColor,
                    fontSize: customTheme.textTheme.headlineSmall?.fontSize,
                    fontWeight: customTheme.textTheme.headlineSmall?.fontWeight
                )),
            Text(DateFormat('EEEE dd •').add_jm().format(widget.dataProvider.weather!.date!),style: TextStyle(
              color: customTheme.textTheme.bodyMedium?.color,
              fontWeight: customTheme.textTheme.bodyMedium?.fontWeight
            ),)
          ],
        ):CircularProgressIndicator(),
      ),
    );
  }
}

