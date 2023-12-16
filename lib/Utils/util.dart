import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Util{
  static Color themeColor =Color(0xff706CFF);
}

//FCM token store
setAccessToken(String data) async {
  print("access_token:" + data);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('access_token', data);
}

Future<String> getAccessToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('access_token') != null &&  prefs.getString('access_token')!.isNotEmpty
      ? prefs.getString('access_token').toString() : "";
}

Widget loaderWidget() {
  return Center(
    child: CircularProgressIndicator(),
  );
}