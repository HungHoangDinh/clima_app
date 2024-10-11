
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import '../services/weather.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

   @override
  void initState() {
    super.initState();
    getLocation();
  }
  Future<void> getLocation() async {

     WeatherModel weatherModel=new WeatherModel();
     var deco=await weatherModel.getLocation();
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return LocationScreen(localWeather: deco,);
      }));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
