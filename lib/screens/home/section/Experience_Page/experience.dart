import 'package:flutter/material.dart';
import 'package:resume_app/utils/global.dart';

import '../../../../utils/color.dart';
import '../component/text_box.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
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
          "Experience",
          style: TextStyle(fontWeight: FontWeight.w500, color: Offwhite),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ...List.generate(
                  experiencelist.length,
                      (index) => Padding(
                    padding:
                    const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: Colors.black38,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(top: 2, left: 5, right: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    ndefaulttext("Experience ${index + 1}"),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (experiencelist.length > 1) {
                                              experiencelist.removeAt(index);
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          Icons.delete_outline_rounded,
                                          color: Colors.deepPurple,
                                        ))
                                  ],
                                ),
                              ),
                              defaulttext("Company"),
                              textfiledudf(
                                  hint: "Microsoft",
                                  prefix: Icons.apartment_rounded,
                                  isphone: false,
                                  isAddress: false,
                                  txtController: experiencelist[index]['company']),
                              SizedBox(
                                height: 15,
                              ),
                              defaulttext("Job title"),
                              textfiledudf(
                                  hint: "Team Leader",
                                  prefix: Icons.work_history,
                                  isphone: false,
                                  isAddress: false,
                                  txtController: experiencelist[index]['job']),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 150,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        defaulttext("Start Date"),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() async {
                                              DateTime? datePicked = await showDatePicker(
                                                  barrierColor: Colors.black54,
                                                  context: context,
                                                  firstDate: DateTime(1900),
                                                  initialDate: DateTime.now(),
                                                  lastDate: DateTime.now());
                                              if (datePicked != null) {
                                                var birthDate =
                                                    '${datePicked.day}/${datePicked.month}/${datePicked.year}';;
                                                experiencelist[index]['start'].text = birthDate;
                                              }
                                            });
                                          },
                                          child: AbsorbPointer(
                                            absorbing: true,
                                            child: TextField(

                                              controller:   experiencelist[index]['start'],
                                              autofocus: false,
                                              decoration: InputDecoration(
                                                  prefixIcon: Icon(
                                                    Icons.calendar_today,
                                                    color: Colors.deepPurple,
                                                  ),
                                                  border: OutlineInputBorder(),
                                                  hintText: '05/06/1998',
                                                  hintStyle: TextStyle(color: Colors.black26),
                                                  errorBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(12),
                                                      borderSide: BorderSide(color: Colors.red, width: 2)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(12),
                                                      borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(12),
                                                      borderSide: BorderSide(color: secondary, width: 1))

                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  (isend==false)? Container(
                                    width: 150,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        defaulttext("End Date"),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() async {
                                              DateTime? datePicked = await showDatePicker(
                                                  barrierColor: Colors.black54,
                                                  context: context,
                                                  firstDate: DateTime(1900),
                                                  initialDate: DateTime.now(),
                                                  lastDate: DateTime.now());
                                              if (datePicked != null) {
                                                var birthDate =
                                                    '${datePicked.day}/${datePicked.month}/${datePicked.year}';
                                                experiencelist[index]['end'].text = birthDate;
                                              }
                                            });
                                          },
                                          child: AbsorbPointer(
                                            absorbing: true,
                                            child: TextField(

                                              controller:  experiencelist[index]['end'],
                                              autofocus: false,
                                              decoration: InputDecoration(
                                                  prefixIcon: Icon(
                                                    Icons.calendar_today,
                                                    color: Colors.deepPurple,
                                                  ),
                                                  border: OutlineInputBorder(),
                                                  hintText: '08/09/1998',
                                                  hintStyle: TextStyle(color: Colors.black26),
                                                  errorBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(12),
                                                      borderSide: BorderSide(color: Colors.red, width: 2)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(12),
                                                      borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(12),
                                                      borderSide: BorderSide(color: secondary, width: 1))

                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ):Container()
                                ],
                              ),

                  CheckboxListTile(title: Text("Present"),value: isend, onChanged: (value) {
                    setState(() {
                      isend=value!;
                    });
                  },),

                              defaulttext("Details"),
                              textfiledudf(
                                  hint: "Job description",
                                  prefix: Icons.description,
                                  isphone: false,
                                  isAddress: true,
                                  txtController: experiencelist[index]['detail']),
                              SizedBox(
                                height: 15,
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
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
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Offwhite,
                    border: Border.all(color: buttoncolor, width: 2),
                    borderRadius: BorderRadius.circular(12)),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      experiencelist.add({
                        'company': TextEditingController(),
                        'job': TextEditingController(),
                        'start': TextEditingController(),
                        'end': TextEditingController(),
                        'detail':TextEditingController(),
                      });
                    });
                  },
                  child: Text(
                    "Add +",
                    style: TextStyle(color: secondary, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
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
                  margin: EdgeInsets.only(left: 10, right: 10,bottom: 10),
                  decoration: BoxDecoration(
                      color: buttoncolor,
                      borderRadius: BorderRadius.circular(12)),
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
