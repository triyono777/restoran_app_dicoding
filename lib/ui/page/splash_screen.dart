import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:restoran_app_dicoding/ui/page/home_page.dart';
import 'package:restoran_app_dicoding/ui/page/onboard_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splashScreen';
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      screenFunction: () async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        if (sharedPreferences.getBool('isFirstTime') == false) {
          return HomePage();
        } else {
          return OnBoardingPage();
        }
      },

      splash: 'assets/logo/logo.png',
//      nextScreen: OnBoardingPage(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
