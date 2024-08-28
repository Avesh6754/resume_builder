import 'package:flutter/material.dart';

import 'package:resume_app/utils/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var myindex = 0;
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: secondary,
        title: Text(
          'Resume Builder',
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.bold, color: Offwhite),
        ),
      ),
      body: Column(
        children: [
          categoryudf(context, img:'assets/image/img_1.png' , name: 'Create New Resume', check: 1, button: 'Create', newname: 'Create a professional and modern\n         new CV in few minutes.'),
          categoryudf(context, img: 'assets/image/img_2.png', name: 'View Resume', check: 2, button: 'View', newname: 'Many HR approved templates, you\n can change color theme and text\nsizing according to your job need'),
          categoryudf(context,name: 'Edit Your Resume',button: 'Edit',check: 3,img: 'assets/image/img_3.png',newname: 'Edit your saved CVs information\n     by using easy CV builder'),
        ],
      ),
    );
  }

  Center categoryudf(BuildContext context,{required String img,required String name,required int check,required String button,required String newname}) {
    return Center(
      child: Container(
        height: 160,
        width: double.infinity,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: secondary),
        child: Row(

          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(img))),
            ),
            SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$name",
                  style: TextStyle(fontSize: 20, color: Offwhite),
                ),
                Text(
                    "$newname",
                    style: TextStyle(fontSize: 13, color: Offwhite)),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/section');
                    },
                    child: Text("$button"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
