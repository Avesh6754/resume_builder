import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_app/utils/color.dart';
import 'package:resume_app/utils/global.dart';

import '../../utils/global.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({super.key});

  @override
  State<OnbordingPage> createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
              child: Text("Skip")),
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentpage = value;
              });
            },
            itemCount: onbordinglist.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    onbordinglist[index]['image'],
                    fit: BoxFit.cover,
                  ),
                  Text(
                    '${onbordinglist[index]['title']}',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600,color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${onbordinglist[index]['description']}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Colors.black),
                  ),
                ],
              );
            },
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                (currentpage == onbordinglist.length - 1)
                    ? ElevatedButton(onPressed: () {}, child: Text("Continue"))
                    : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(onbordinglist.length, (index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: 10,
                        width: (index == currentpage) ? 20 : 15,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == currentpage)
                                ? Colors.deepPurpleAccent
                                : Colors.grey),
                      );
                    }))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
