import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:restoran_app_dicoding/ui/page/onboard_page.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splashScreen';
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/logo/logo.png',
      nextScreen: OnBoardingPage(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
