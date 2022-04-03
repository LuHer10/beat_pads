import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:beat_pads/screen_home/_screen_home.dart';

import 'package:beat_pads/shared/_shared.dart';
import 'package:beat_pads/services/_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showClickToContinue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Listener(
        onPointerDown: (_) {
          Navigator.pushReplacement(
            context,
            TransitionUtils.fade(HomeScreen()),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: RiveAnimation.asset(
                  'assets/anim/doggo3.riv',
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'BeatPads',
                      speed: const Duration(milliseconds: 250),
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(
                        fontSize: 52.0,
                        fontFamily: 'Righteous',
                        letterSpacing: 4.0,
                        fontWeight: FontWeight.bold,
                      ),
                      colors: [
                        Palette.cadetBlue.color,
                        Palette.lightPink.color,
                        Palette.darkGrey.color,
                        Palette.yellowGreen.color,
                      ],
                    ),
                  ],
                  isRepeatingAnimation: false,
                  onFinished: () => setState(() {
                    showClickToContinue = true;
                  }),
                ),
              ),
              Expanded(
                flex: 1,
                child: showClickToContinue
                    ? AnimatedTextKit(
                        isRepeatingAnimation: true,
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText(
                            'Tap To Continue',
                            duration: Duration(milliseconds: 1400),
                            textStyle: TextStyle(color: Colors.black),
                          ),
                        ],
                      )
                    : Text(""),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
