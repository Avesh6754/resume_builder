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
                            color: Colors.black12,
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
                                        textfiledudf(
                                            hint: "dd/mm/yy",
                                            prefix: Icons.date_range,
                                            isphone: false,
                                            isAddress: false,
                                            txtController: experiencelist[index]['start']),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        defaulttext("End Date"),
                                        textfiledudf(
                                            hint: "dd/mm/yy",
                                            prefix: Icons.date_range,
                                            isphone: false,
                                            isAddress: false,
                                            txtController: experiencelist[index]['end']),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
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
                )
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
              Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: buttoncolor,
                    borderRadius: BorderRadius.circular(12)),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
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
