import 'package:flutter/material.dart';
import 'package:resume_app/utils/global.dart';

import '../../../../utils/color.dart';
import '../component/text_box.dart';

class ReferencePage extends StatefulWidget {
  const ReferencePage({super.key});

  @override
  State<ReferencePage> createState() => _ReferencePageState();
}

class _ReferencePageState extends State<ReferencePage> {
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
          "Reference",
          style: TextStyle(fontWeight: FontWeight.w500, color: Offwhite),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ...List.generate(referencelist.length,(index)=> Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all( width: 0.5,
                          color: Colors.black38,),borderRadius:BorderRadius.circular(15)
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
                                  ndefaulttext("Reference ${index+1}"),
                                  IconButton(onPressed: () {
                                    setState(() {
                                      if(referencelist.length>1)
                                      {
                                        referencelist.removeAt(index);
                                      }
                                    });
                                  }, icon: Icon(Icons.delete_outline_rounded,color: Colors.deepPurple,))
                                ],
                              ),

                            ),
                            defaulttext("Referee's Name"),
                            textfiledudf(hint: "Jhone Mark", prefix:Icons.person, isphone: false, isAddress: false, txtController: referencelist[index]['rename']),
                            SizedBox(height: 15,),
                            defaulttext("Job title"),
                            textfiledudf(hint: "Manager", prefix:Icons.work_history, isphone: false, isAddress: false, txtController: referencelist[index]['rejob']),
                            SizedBox(height: 15,),
                            defaulttext("Company Name"),
                            textfiledudf(hint: "Microsoft", prefix:Icons.percent, isphone: false, isAddress: false, txtController: referencelist[index]['recom']),
                            SizedBox(height: 15,),
                            defaulttext("Email"),
                            textfiledudf(hint: "JhoneMark@gmail.com", prefix:Icons.email, isphone: false, isAddress: false, txtController: referencelist[index]['reemail']
                            ),
                            SizedBox(height: 15,),
                            defaulttext("Phone"),
                            textfiledudf(hint: "2659453666", prefix:Icons.phone, isphone: true, isAddress: false, txtController: referencelist[index]['rephone']
                            ),
                            SizedBox(height: 15,),
                          ]
                      ),
                    ),
                  ),
                ),),
                Container(height: 100,),
                SizedBox(height: 30,)

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
                    referencelist.add({
                      'rename':TextEditingController(),
                      'rejob':TextEditingController(),
                      'recom':TextEditingController(),
                      'reemail':TextEditingController(),
                      'rephone':TextEditingController(),
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
              GestureDetector(
                onTap: () {

                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(

                      behavior: SnackBarBehavior.floating,
                      content: Text(
                        'Data Saved Successfully!',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );

                },child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                  decoration: BoxDecoration(
                      color: buttoncolor, borderRadius: BorderRadius.circular(12)),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Save",
                        style: TextStyle(color: Offwhite, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
