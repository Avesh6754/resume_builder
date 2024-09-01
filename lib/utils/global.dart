import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


List onbordinglist=[

  {
    'image':'assets/image/reume2.png',
    'title':"In short  time",
    'description':"Create a professional resume\n in less than 5 minutes"
  },
  {
    'image':'assets/image/reume1.png',
    'title':"Multiple templates",
    'description':"Select and personalize from\n available templates"
  },
  {
    'image':'assets/image/reume3.png',
    'title':"Easily Share",
    'description':"Easily share resume on\n different platform"
  }
];
//onboarding
PageController pageController=PageController();

int currentpage=0;

// TextEditingController txtname=TextEditingController();
// TextEditingController txtdesignation=TextEditingController();
// TextEditingController txtemail=TextEditingController();
// TextEditingController txtphone=TextEditingController();
// TextEditingController txtaddress=TextEditingController();
// TextEditingController txtDob=TextEditingController();
// TextEditingController txtindian=TextEditingController();

List profilelist=[
  {
    'name':TextEditingController(),
    'job':TextEditingController(),
    'email':TextEditingController(),
    'phone':TextEditingController(),
    'address':TextEditingController(),
    'indian':TextEditingController(),
    'dob':TextEditingController(),
  }
];

String gender='Male';

ImagePicker imagePicker=ImagePicker();
File? imagefile;


const String defaultProfileImageUrl =
    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";

//Eduction
TextEditingController txtschool=TextEditingController();
TextEditingController txtdegree=TextEditingController();
TextEditingController txtyear=TextEditingController();
TextEditingController txtgrade=TextEditingController();

List edu=[{'school':TextEditingController(),
  'degree':TextEditingController(),
  'grade':TextEditingController(),
  'year':TextEditingController(),}];

//expperience

TextEditingController txtcompany=TextEditingController();
TextEditingController txtrole=TextEditingController();
TextEditingController txtdeatil=TextEditingController();
TextEditingController txtstart=TextEditingController();
TextEditingController txtend=TextEditingController();

List experiencelist=[{ 'company': TextEditingController(),
  'job': TextEditingController(),
  'start': TextEditingController(),
  'end': TextEditingController(),
  'detail':TextEditingController(),}];
bool isend=false;

//Skill
List skilllist=[
  txtskill
];
bool checkSkill = false;
double slider = 1;
List SliderRange = [slider.toDouble()];
var level=1;
TextEditingController txtskill=TextEditingController();

//objective

TextEditingController txtobjective=TextEditingController();
//refernce
List referencelist=[
  {
    'rename':TextEditingController(),
    'rejob':TextEditingController(),
    'recom':TextEditingController(),
    'reemail':TextEditingController(),
    'rephone':TextEditingController(),
  }
];

TextEditingController txtrename=TextEditingController();
TextEditingController txtjobtitle=TextEditingController();
TextEditingController txtrecomapny=TextEditingController();
TextEditingController txtremail=TextEditingController();
TextEditingController txtrphone=TextEditingController();

//project

List projectlist=[
  {
    'name':TextEditingController(),
    'description':TextEditingController(),
  }
];

TextEditingController txtprojectname=TextEditingController();
TextEditingController txtprojectdescriptio=TextEditingController();

//activities

List activitieslist=[txtactivitiename];

TextEditingController txtactivitiename=TextEditingController();

// add info


TextEditingController txtaddinfo=TextEditingController();

//certificate

List certificatelist=[
  {
    'name':TextEditingController(),

  }
];

TextEditingController txtcertificatename=TextEditingController();


//language

List languagelist=[txtlanguagename];

TextEditingController txtlanguagename=TextEditingController();

List strengthlist=[txtstrengthname];

TextEditingController txtstrengthname=TextEditingController();



