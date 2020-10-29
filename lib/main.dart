import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/ui/page/detail_restaurat.dart';
import 'package:restoran_app_dicoding/ui/page/home_page.dart';

void main() {
  runApp(MyApp());
}

Widget getErrorWidget(FlutterErrorDetails error) {
  return Container(
    color: Colors.red,
    width: double.infinity,
    child: Center(
      child: Text(
        "Terjadi error pada data",
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = getErrorWidget;
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (ctx) => HomePage(),
        DetailRestaurantPage.routeName: (ctx) => DetailRestaurantPage(),
      },
    );
  }
}
