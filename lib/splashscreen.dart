import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tictactoen/homepage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1e327e),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(15)),
            AnimatedTextKit(animatedTexts: [
              WavyAnimatedText('Tic Tac Toe',
                  textStyle: GoogleFonts.pacifico(
                    color: Colors.white,
                    fontSize: 40,
                  ))
            ]),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 50.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 70.0,
                      fontFamily: 'Bebas Neue',
                      color: Colors.white,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ScaleAnimatedText('X', duration: Duration(seconds: 1)),
                        ScaleAnimatedText('O',
                            duration: Duration(milliseconds: 500)),
                        ScaleAnimatedText('X', duration: Duration(seconds: 1)),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
              ),
              flex: 2,
            ),
            Expanded(child: Container())
          ],
        )));
  }
}
