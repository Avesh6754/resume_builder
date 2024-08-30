import 'package:flutter/material.dart';
import 'package:resume_app/utils/global.dart';

import '../../../../utils/color.dart';
import '../component/text_box.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
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
          "Skills",
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
                  skilllist.length,
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
                                  ndefaulttext("Skills ${index + 1}"),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (skilllist.length > 1) {
                                            skilllist.removeAt(index);
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
                            textfiledudf(
                                hint: "Communication",
                                prefix: Icons.workspace_premium,
                                isphone: false,
                                isAddress: false,
                                txtController: skilllist[index]),
                            SizedBox(height: 15,),
                            Text("Level ${SliderRange[index].toInt().toString()}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                            Slider(
                              activeColor: Colors.deepPurple,
                              inactiveColor: Colors.purple.shade100,
                              max: 100,
                              label: SliderRange[index].toInt().toString(),
                              divisions: 100,
                              value: SliderRange[index],
                              onChanged: (double value){
                                setState(() {
                                  SliderRange[index] = value;
                                });
                              },
                            ),
                          ],),
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
                      TextEditingController skillli=TextEditingController();
                      skilllist.add(skillli);
                      double slide=0;
                      SliderRange.add(slide.toDouble());
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
                },
                child: Container(
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
                      GestureDetector(

                        child: Text(
                          "Save",
                          style: TextStyle(color: Offwhite, fontSize: 20),
                        ),
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
