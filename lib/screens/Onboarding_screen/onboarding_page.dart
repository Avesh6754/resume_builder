import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_app/screens/Onboarding_screen/component/screen1.dart';
import 'package:resume_app/screens/Onboarding_screen/component/screen2.dart';
import 'package:resume_app/screens/Onboarding_screen/component/screen3.dart';
import 'package:resume_app/utils/color.dart';
import 'package:resume_app/utils/global.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/global.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({super.key});

  @override
  State<OnbordingPage> createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> {
  PageController pageController = PageController();
  String button='Skip';
  int currentpage=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgcolor,
        body: Stack(
          children: [
            PageView(
              controller: pageController,

              onPageChanged: (index){
                currentpage=index;
                setState(() {
                  if(index==2)
                  {
                    button='Finish';
                  }else{
                    button='Skip';
                  }
                });
              },
              children: [Screen1(), Screen2(), Screen3()],
            ),
            Container(
              alignment: Alignment(0, 0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/home');

                  }, child: Text("$button")),
                  SmoothPageIndicator(controller: pageController, count: 3),
                  (currentpage!=2)?
                  TextButton(onPressed: () {
                    pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                  }, child: Text("Next")):TextButton(onPressed: () {

                  }, child: Text("")),

                ],
              ),
            )
          ],
        ));
  }
}
