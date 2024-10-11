import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class NetworkHelper {
  final String latitude;
  final String longtitude;
  final String apikey;
  final String cityname;

  NetworkHelper(
      {required this.latitude, required this.longtitude, required this.apikey, required this.cityname});

  Future<dynamic> getData() async {
    Uri uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': latitude,
      'lon': longtitude,
      'appid': apikey,
      'units': 'metric'
    });
    Response response = await get(uri);
    if (response.statusCode == 200) {
      var data = response.body;
      dynamic deco = jsonDecode(data);

      return deco;
    } else {
      // Nếu xảy ra lỗi, in ra mã lỗi và trả về null
      print('Error: ${response.statusCode}');
      return null;
    }
  }
  Future<dynamic> getDataCity() async {
    Uri uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {

      'q':cityname,

      'appid': apikey,
      'units':'metric'
    });
    Response response=await get(uri);
    if(response.statusCode==200){
      var data=response.body;
      dynamic deco=jsonDecode(data);

      return deco;

    }else{

      // Nếu xảy ra lỗi, in ra mã lỗi và trả về null
      print('Error: ${response.statusCode}');
      return null;
    }
  }
}