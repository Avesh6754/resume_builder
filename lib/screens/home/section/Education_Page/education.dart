import 'package:flutter/material.dart';
import 'package:resume_app/utils/global.dart';

import '../../../../utils/color.dart';
import '../component/text_box.dart';
class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: secondary,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Offwhite,
            )),
        title: Text(
          "Education",
          style: TextStyle(fontWeight: FontWeight.w500, color: Offwhite),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ...List.generate(edu.length,(index)=> Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5,color:Colors.black12,),borderRadius:BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2,left: 5,right: 5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ndefaulttext("Education ${index+1}"),
                                  IconButton(onPressed: () {
                                    setState(() {
                                      if(edu.length>1)
                                      {
                                        edu.removeAt(index);
                                      }
                                    });
                                  }, icon: Icon(Icons.delete_outline_rounded,color: Colors.deepPurple,))
                                ],
                              ),

                            ),
                            defaulttext("Degree/Course"),
                            textfiledudf(hint: "BCA", prefix:Icons.menu_book_outlined , isphone: false, isAddress: false, txtController: edu[index]['school']),
                            SizedBox(height: 15,),
                            defaulttext("School/University"),
                            textfiledudf(hint: "SSIU University", prefix:Icons.apartment, isphone: false, isAddress: false, txtController: edu[index]['degree']),
                            SizedBox(height: 15,),
                            defaulttext("Grade"),
                            textfiledudf(hint: "CGPA 8.5", prefix:Icons.percent, isphone: false, isAddress: false, txtController: edu[index]['grade']),
                            SizedBox(height: 15,),
                            defaulttext("Year"),
                            textfiledudf(hint: "2022", prefix:Icons.date_range, isphone: false, isAddress: false, txtController: edu[index]['year']
                            ),
                            SizedBox(height: 15,),
                          ]
                      ),
                    ),
                  ),
                ),)

              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                    color: Offwhite,
                    border: Border.all(color: buttoncolor,width: 2), borderRadius: BorderRadius.circular(12)),
                alignment: Alignment.center,
                child: GestureDetector(onTap: () {
                  setState(() {
                    edu.add({
                      'school':TextEditingController(),
                      'degree':TextEditingController(),
                      'grade':TextEditingController(),
                      'year':TextEditingController(),
                    });
                  });
                },
                  child: Text(
                    "Add +",
                    style: TextStyle(color:secondary, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                    color: buttoncolor, borderRadius: BorderRadius.circular(12)),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(onTap: () {

                      Navigator.of(context).pop();

                    },
                      child: Text(
                        "Save",
                        style: TextStyle(color: Offwhite, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
