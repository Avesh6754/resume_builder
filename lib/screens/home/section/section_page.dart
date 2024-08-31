import 'package:flutter/material.dart';
import 'package:resume_app/utils/color.dart';
import 'package:resume_app/utils/global.dart';

class SectionPage extends StatefulWidget {
  const SectionPage({super.key});

  @override
  State<SectionPage> createState() => _SectionPageState();
}

class _SectionPageState extends State<SectionPage> {
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
              Icons.arrow_back_ios,
              color: Offwhite,
            )),
        title: Text(
          "Sections",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, color: Offwhite),
        ),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 280,
                width: double.infinity,
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black38, width: 0.7)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Sections",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: secondary),
                    ),
                    Wrap(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/personal');
                            },
                            child: mainmethod(
                              name: 'Personal',
                              id: Icons.person,
                              lead: Icons.arrow_circle_right_rounded,
                            )),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/edu');
                            },
                            child: mainmethod(
                              name: 'Education',
                              id: Icons.school,
                              lead: Icons.arrow_circle_right_rounded,
                            )),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/exp');
                            },
                            child: mainmethod(
                              name: 'Experience',
                              id: Icons.work_outlined,
                              lead: Icons.arrow_circle_right_rounded,
                            )),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/skill');
                            },
                            child: mainmethod(
                              name: 'Skills',
                              id: Icons.task_alt,
                              lead: Icons.arrow_circle_right_rounded,
                            )),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/obj');
                            },
                            child: mainmethod(
                              name: 'Objective',
                              id: Icons.wysiwyg_rounded,
                              lead: Icons.arrow_circle_right_rounded,
                            )),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/ref');
                            },
                            child: mainmethod(
                              name: 'Reference',
                              id: Icons.wysiwyg_rounded,
                              lead: Icons.arrow_circle_right_rounded,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 280,
                width: double.infinity,
                margin:
                    EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                decoration: BoxDecoration(
                    color:Colors.deepPurple.shade50,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black38, width: 0.7)),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "More Sections",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: secondary),
                      ),
                      Wrap(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/project');
                              },
                              child: sectionmethod(
                                name: 'Project',
                                id: Icons.rocket_launch,
                                lead: Icons.arrow_circle_right_rounded,
                              )),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/active');
                              },
                              child: sectionmethod(
                                name: 'Activities',
                                id: Icons.extension,
                                lead: Icons.arrow_circle_right_rounded,
                              )),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/Addinfo');
                              },
                              child: sectionmethod(
                                name: 'Add Info',
                                id: Icons.eco,
                                lead: Icons.arrow_circle_right_rounded,
                              )),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/lan');
                              },
                              child: sectionmethod(
                                name: 'Language',
                                id: Icons.g_translate,
                                lead: Icons.arrow_circle_right_rounded,
                              )),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/ste');
                              },
                              child: sectionmethod(
                                name: 'Strength',
                                id: Icons.energy_savings_leaf,
                                lead: Icons.arrow_circle_right_rounded,
                              )),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/cert');
                              },
                              child: sectionmethod(
                                name: 'Cetificate',
                                id: Icons.sticky_note_2,
                                lead: Icons.arrow_circle_right_rounded,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: buttoncolor, borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              onTap: () {
                if (txtname != null &&
                    txtemail != null &&
                    txtphone != null &&
                    txtaddress != null &&
                    imagefile != null) {
                  Navigator.of(context).pushNamed('/pdf');
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      surfaceTintColor: Colors.black,
                      backgroundColor: Offwhite,
                      actionsAlignment: MainAxisAlignment.center,
                      shadowColor: buttoncolor,
                      title: Text(
                        "Fill the required details in Resume",
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      ),
                      content: Text(
                        "Name : Jone Smith\nPhone : 688646344\nEmail : @gmail.com\nPhoto : Professional Photo\nAddress : Living Place",
                        style: TextStyle(color: Colors.black54),
                      ),
                      actions: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(buttoncolor)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Fill Missing Details",
                              style: TextStyle(color: Offwhite),
                            ))
                      ],
                    ),
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove_red_eye_rounded,
                    color: Offwhite,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "View CV",
                    style: TextStyle(color: Offwhite, fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget sectionmethod(
      {required String name, required var id, required var lead}) {
    return Container(
      height: 90,
      width: 90,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Offwhite,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.deepPurple.shade100, width: 0.7)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            id,
            size: 23,
            color: secondary,
          ),
          Text(
            "$name",
            style: TextStyle(
                fontSize: 15, color: secondary, fontWeight: FontWeight.w500),
          ),
          Icon(
            lead,
            size: 23,
            color: secondary,
          ),
        ],
      ),
    );
  }

  Widget mainmethod(
      {required String name, required var id, required var lead}) {
    return Container(
      height: 90,
      width: 90,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Offwhite,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.deepPurple.shade100, width: 0.7)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            id,
            size: 23,
            color: secondary,
          ),
          Text(
            "$name",
            style: TextStyle(
                fontSize: 15, color: secondary, fontWeight: FontWeight.w500),
          ),
          Icon(
            lead,
            size: 23,
            color: secondary,
          ),
        ],
      ),
    );
  }
}
