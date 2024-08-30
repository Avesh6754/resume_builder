import 'package:flutter/material.dart';
import 'package:resume_app/screens/Pdf_Screen/pdf_view.dart';

import 'package:resume_app/screens/home/home_screen.dart';
import 'package:resume_app/screens/home/section/Activities_Pages/activities.dart';
import 'package:resume_app/screens/home/section/Add_Info/add_info.dart';
import 'package:resume_app/screens/home/section/Certificate_Pages/certificate_page.dart';
import 'package:resume_app/screens/home/section/Language_Page/language_page.dart';
import 'package:resume_app/screens/home/section/Project_Page/project.dart';
import 'package:resume_app/screens/home/section/Strength_Page/strength_page.dart';

import '../screens/Onboarding_screen/onboarding_page.dart';
import '../screens/Splash_screen/splash_screen.dart';
import '../screens/home/section/Education_Page/education.dart';
import '../screens/home/section/Experience_Page/experience.dart';
import '../screens/home/section/Objective_Page/objective.dart';
import '../screens/home/section/Personal/personal.dart';
import '../screens/home/section/Reference_Page/reference.dart';
import '../screens/home/section/Skills_Page/skill_page.dart';
import '../screens/home/section/section_page.dart';

Map<String,Widget Function(BuildContext context)> routes={
  '/':(context)=> SplashScreen(),
  '/onborad':(context)=> OnbordingPage(),
  '/home':(context)=> HomeScreen(),
  '/section':(context)=> SectionPage(),
  '/personal':(context)=> PersonalPage(),
  '/edu':(context)=> EducationPage(),
  '/exp':(context)=> ExperiencePage(),
  '/skill':(context)=> SkillsPage(),
  '/obj':(context)=> ObjectivePage(),
  '/ref':(context)=> ReferencePage(),
  '/project':(context)=> Project(),
  '/active':(context)=> Activities(),
  '/Addinfo':(context)=> AddInfo(),
  '/lan':(context)=> LanguagePage(),
  '/ste':(context)=> StrengthPage(),
  '/cert':(context)=> CertificatePage(),
  '/pdf':(context)=> PdfView(),
};