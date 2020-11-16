import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoran_app_dicoding/const/const.dart';
import 'package:restoran_app_dicoding/controller/db_controller.dart';
import 'package:restoran_app_dicoding/controller/restaurant_controller.dart';
import 'package:restoran_app_dicoding/ui/page/detail_restaurat.dart';
import 'package:restoran_app_dicoding/ui/page/home_page.dart';
import 'package:restoran_app_dicoding/ui/page/splash_screen.dart';

void main() {
  runApp(MyApp());
}

Widget getErrorWidget(FlutterErrorDetails error) {
  return Scaffold(
    body: Container(
      color: Colors.red,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Terjadi error",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Hubungi pengembang aplikasi",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "error message : ${error.exception}",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = getErrorWidget;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RestaurantController()),
        ChangeNotifierProvider(create: (_) => DBController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Restaurant App',
        theme: ThemeData(
          buttonTheme: ButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          primaryColor: primaryColor,
          accentColor: secondaryColor,
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: myTextTheme,
          appBarTheme: AppBarTheme(
            textTheme: myTextTheme.apply(bodyColor: Colors.black),
            elevation: 0,
          ),
        ),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (ctx) => SplashScreen(),
          HomePage.routeName: (ctx) => HomePage(),
          DetailRestaurantPage.routeName: (ctx) => DetailRestaurantPage(
                restaurant: ModalRoute.of(ctx).settings.arguments,
              ),
        },
      ),
    );
  }
}
