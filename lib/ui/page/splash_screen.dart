import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:restoran_app_dicoding/ui/page/home_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splashScreen';
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/logo/logo.png',
      nextScreen: HomePage(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
