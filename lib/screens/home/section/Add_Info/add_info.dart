import 'package:flutter/material.dart';

import '../../../../utils/color.dart';
import '../../../../utils/global.dart';
import '../component/text_box.dart';

class AddInfo extends StatefulWidget {
  const AddInfo({super.key});

  @override
  State<AddInfo> createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {
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
          "Project",
          style: TextStyle(fontWeight: FontWeight.w500, color: Offwhite),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [Padding(
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
                                ndefaulttext("Add Info"),
                              ],
                            ),
                          ),
                          textfiledudf(
                              hint: "Hey ,I am a flutter developer..",
                              prefix: Icons.info_outlined,
                              isphone: false,
                              isAddress: true,
                              txtController: txtaddinfo),
                          SizedBox(height: 15,),
                        ],),
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
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Save",
                style: TextStyle(color: Offwhite, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    ]
    )
    );
  }
}
