import 'package:flutter/material.dart';
import 'package:resume_app/utils/global.dart';

import '../../../../utils/color.dart';
import '../component/text_box.dart';

class ObjectivePage extends StatefulWidget {
  const ObjectivePage({super.key});

  @override
  State<ObjectivePage> createState() => _ObjectivePageState();
}

class _ObjectivePageState extends State<ObjectivePage> {
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
            "Objective",
            style: TextStyle(fontWeight: FontWeight.w500, color: Offwhite),
          ),
        ),
        body: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
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
                                    padding: const EdgeInsets.only(top: 2,bottom: 15),
                                    child: ndefaulttext("Objective")
                                ),
                                textfiledudf(
                                    hint: "Describe your objective",
                                    prefix: Icons.workspace_premium,
                                    isphone: false,
                                    isAddress: true,
                                    txtController: txtobjective),
                                SizedBox(height: 15,)
                              ]),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
              ),])
    );
  }
}
