import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resume_app/utils/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 3),(timer) {
      Navigator.of(context).pushReplacementNamed('/onborad');
    },);
    return Scaffold(
      backgroundColor: secondary,
      body: Column(
        children: [
          Spacer(),
          Center(
            child: Image.asset('assets/image/resume4-removebg-preview.png'),
          ),
          Text(' Resume Builder',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 28,color: Offwhite),),
          Spacer(flex: 6,),
        ],
      ),
    );
  }
}
