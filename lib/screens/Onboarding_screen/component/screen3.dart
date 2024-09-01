
import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/image/reume3.png'),
        Text('Easily Share',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
        Text('Easily share resume on\n     different platform',style: TextStyle(fontSize: 15),),

      ],
    );
  }
}
