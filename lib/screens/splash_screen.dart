import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtypetapp/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //how to change status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    //how to make duration splashscreen
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    });
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/background.png'),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 42,
                  ),
                  Image.asset(
                    'assets/images/logo_bg.png',
                    height: 22,
                  ),
                  const SizedBox(
                    height: 73,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Helping you \nto keep ',
                        style: GoogleFonts.manrope(
                            fontSize: 24,
                            letterSpacing: 3.5 / 100,
                            height: 152 / 100,
                            color: const Color(0XFFDEE1FE)),
                        children: const [
                          TextSpan(
                            text: 'your bestie\n',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          TextSpan(text: 'stay healthy!')
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
