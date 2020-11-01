import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color primaryColor = Color(0xFF931a25);
final Color secondaryColor = Color(0xFFe97171);
final Color accentColor = Color(0xFFffcb8e);

final TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.quicksand(fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.quicksand(fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.quicksand(fontSize: 46, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.quicksand(fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.quicksand(fontSize: 23, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.quicksand(fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.quicksand(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.quicksand(fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.quicksand(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.quicksand(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.quicksand(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.quicksand(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

final String baseUrl = 'https://restaurant-api.dicoding.dev';
final String list = baseUrl + '/list';
final String detail = baseUrl + '/detail/';
final String search = baseUrl + '/search?q=';
final String review = baseUrl + '/review';
final String imageSmall = baseUrl + '/images/small/';
final String imageMedium = baseUrl + '/images/medium/';
final String imageLarge = baseUrl + '/images/large/';
