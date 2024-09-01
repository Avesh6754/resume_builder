import 'package:flutter/material.dart';
class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/image/reume2.png'),
        Text('In short time',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
        Text('Create a professional resume\n    in less than 5 minutes',style: TextStyle(fontSize: 15),),
      ],
    );
  }
}
