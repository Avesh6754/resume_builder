import 'package:flutter/material.dart';

import '../../../../utils/color.dart';
import '../../../../utils/global.dart';
import '../component/text_box.dart';

class CertificatePage extends StatefulWidget {
  const CertificatePage({super.key});

  @override
  State<CertificatePage> createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
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
          "Certificate & Award",
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
                  certificatelist.length,
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
                                  ndefaulttext("Certificate & Award ${index + 1}"),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (certificatelist.length > 1) {
                                            certificatelist.removeAt(index);
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
                                hint: "Flutter Certificate",
                                prefix: Icons.credit_card_outlined,
                                isphone: false,
                                isAddress: false,
                                txtController: certificatelist[index]['name']),
                            SizedBox(height: 15,),
                            textfiledudf(
                                hint: "Description",
                                prefix: Icons.description,
                                isphone: false,
                                isAddress: true,
                                txtController: certificatelist[index]['description']),
                            SizedBox(height: 15,),
                          ],),
                      ),
                    ),
                  ),
                ),Container(height: 100,),
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
                      certificatelist.add({
                        'name':TextEditingController(),
                        'description':TextEditingController(),
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
