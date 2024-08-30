import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_app/utils/color.dart';
import 'package:resume_app/utils/global.dart';

import '../../../../utils/color.dart';

import '../component/text_box.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  GlobalKey<FormState> fromkey = GlobalKey<FormState>();

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
          "Personal Details",
          style: TextStyle(fontWeight: FontWeight.w500, color: Offwhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 8),
        child: SingleChildScrollView(
          child: Form(
            key: fromkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                defaulttext("Photo "),
                GestureDetector(
                  onTap: () async {
                    XFile? image = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    setState(() {
                      imagefile = File(image!.path);
                    });
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: buttoncolor,
                      backgroundImage:
                          imagefile != null ? FileImage(imagefile!) : null,
                      child: Icon(
                        (imagefile != null) ? null : Icons.person,
                        color: Offwhite,
                        size: 100,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(buttoncolor)),
                        onPressed: () async {
                          XFile? img = await imagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            imagefile = File(img!.path);
                          });
                        },
                        child: Text(
                          "Change",
                          style: TextStyle(color: Offwhite),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(buttoncolor)),
                        onPressed: () {
                          setState(() {
                            imagefile = null;
                          });
                        },
                        child: Text(
                          "Remove",
                          style: TextStyle(color: Offwhite),
                        )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                defaulttext("Name"),
                textfiledudf(
                    hint: 'Jhone Mark',
                    isAddress: false,
                    isphone: false,
                    prefix: Icons.person,
                    txtController: txtname),
                SizedBox(
                  height: 15,
                ),
                defaulttext("Designation"),
                textfiledudf(
                    hint: 'Project Manager',
                    isAddress: false,
                    isphone: false,
                    prefix: Icons.work,
                    txtController: txtdesignation),
                SizedBox(
                  height: 15,
                ),
                defaulttext("Email"),
                textfiledudf(
                    hint: 'Jhonemark@gamil.com',
                    isAddress: false,
                    isphone: false,
                    prefix: Icons.mail,
                    txtController: txtemail),
                SizedBox(
                  height: 15,
                ),
                defaulttext("DOB"),
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
                        txtDob.text = birthDate;
                      }
                    });
                  },
                  child: AbsorbPointer(
                    absorbing: true,
                    child: TextField(

                      controller: txtDob,
                      autofocus: false,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: Colors.deepPurple,
                          ),
                          border: OutlineInputBorder(),
                        hintText: 'ex: 03-06-1998',
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
                SizedBox(
                  height: 15,
                ),
                defaulttext("Address"),
                textfiledudf(
                    hint: 'A/204 Los angaloes,newyok',
                    isAddress: true,
                    isphone: false,
                    prefix: Icons.location_on_sharp,
                    txtController: txtaddress),
                SizedBox(
                  height: 15,
                ),
                defaulttext("Phone"),
                textfiledudf(
                    hint: '8090215569',
                    isAddress: false,
                    isphone: true,
                    prefix: Icons.phone,
                    txtController: txtphone),
                SizedBox(
                  height: 15,
                ),
                defaulttext("Gender"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Radio(
                      value: 'Male',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                    Text(
                      "Male",
                      style: TextStyle(fontSize: 15),
                    ),
                    Radio(
                        value: 'Female',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        }),
                    Text("Female", style: TextStyle(fontSize: 15)),
                    Radio(
                        value: 'Other',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        }),
                    Text("Other", style: TextStyle(fontSize: 15)),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                defaulttext("Nationality"),
                textfiledudf(
                    hint: 'Indian',
                    isAddress: false,
                    isphone: false,
                    prefix: Icons.flag,
                    txtController: txtindian),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (fromkey.currentState!.validate() && imagefile != null) {
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
          }
        },child: Container(
          height: 50,
          width: double.infinity,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: buttoncolor, borderRadius: BorderRadius.circular(12)),
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
    );
  }
}
