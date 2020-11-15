import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:restoran_app_dicoding/ui/page/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isFirstTime', false);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/image/onboard/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Diet",
          body: "Cari resto penunjang diet?",
          image: _buildImage('diet'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Makan Bareng",
          body: "Cari Tempat makan malam bareng si doi? ",
          image: _buildImage('eating_together'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Special Event",
          body: "Atau rekomendasi untuk acara spesial?",
          image: _buildImage('special_event'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Pencari Cita Rasa",
          body: "Bosen makan itu-itu aja ?",
          image: _buildImage('tasting'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Chef Ternama",
          body: "Pengen ngerasain makanan chef handal?",
          footer: Text('Banyak Rekomendasi Restorant di Resto APP '),
          image: _buildImage('chef'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
