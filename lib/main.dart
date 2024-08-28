import 'package:flutter/material.dart';
import 'package:resume_app/utils/routes.dart';

void main()
{
  runApp(ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
