import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:resume_app/utils/color.dart';
import '../../utils/global.dart';
import '../home/section/Personal/personal.dart';

class PdfView extends StatefulWidget {
  const PdfView({super.key});

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
          pdfFileName: '${profilelist[0]['name'].text} resume',
          build: (format) => pdfGenerator()),
    );
  }
}

Future<Uint8List> pdfGenerator() async {
  final pdf = pw.Document();
  // profileImage = pw.MemoryImage(fileImage!.readAsBytesSync());
  // pw.Image(profileImage),
  final image = (imagefile != null)
      ? pw.MemoryImage(imagefile!.readAsBytesSync())
      : await imageFromAssetBundle('assets/image/nullimg.png');
  final icon1 = await imageFromAssetBundle('assets/image/icon1.png');
  final icon2 = await imageFromAssetBundle('assets/image/icon2.png');
  final icon3 = await imageFromAssetBundle('assets/image/icon3.png');
  final icon4 = await imageFromAssetBundle('assets/image/icon4.png');
  final icon5 = await imageFromAssetBundle('assets/image/icon5.png');
  pdf.addPage(pw. Page(
    margin: pw.EdgeInsets.zero,

    pageFormat: PdfPageFormat.a4 ,
    build: (context) {
      return pw.Stack(
        children: [
          //---------------------------->todo black Container
          pw.Container(
            height: 841.8,
            width: 230,
            padding: const pw.EdgeInsets.only(top: 210, left: 20, right: 5),
            decoration: const pw.BoxDecoration(
              color: PdfColors.black,
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                txtpdf(name: 'Contact'),
                pw.SizedBox(height: 5),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(
                      height: 30,
                      width: 30,
                      alignment: pw.Alignment.center,
                      padding: const pw.EdgeInsets.all(9),
                      margin: const pw.EdgeInsets.only(top: 10, right: 10),
                      decoration:
                          const pw.BoxDecoration(color: PdfColors.orange),
                      child: pw.Image(icon1),
                    ),
                    pw.Expanded(
                      child: pw.Text(
                        profilelist[0]['address'].text,
                        style: const pw.TextStyle(
                            color: PdfColors.white, fontSize: 13),
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(
                      height: 30,
                      width: 30,
                      alignment: pw.Alignment.center,
                      padding: const pw.EdgeInsets.all(9),
                      margin: const pw.EdgeInsets.only(top: 10, right: 10),
                      decoration:
                          const pw.BoxDecoration(color: PdfColors.orange),
                      child: pw.Image(icon2),
                    ),
                    pw.Expanded(
                      child: pw.Text(
                        profilelist[0]['phone'].text,
                        style: const pw.TextStyle(
                            color: PdfColors.white, fontSize: 13),
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(
                      height: 30,
                      width: 30,
                      alignment: pw.Alignment.center,
                      padding: const pw.EdgeInsets.all(9),
                      margin: const pw.EdgeInsets.only(top: 10, right: 10),
                      decoration:
                          const pw.BoxDecoration(color: PdfColors.orange),
                      child: pw.Image(icon3),
                    ),
                    pw.Expanded(
                      child: pw.Text(
                        profilelist[0]['email'].text,
                        style: const pw.TextStyle(
                            color: PdfColors.white, fontSize: 13),
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(
                      height: 30,
                      width: 30,
                      alignment: pw.Alignment.center,
                      padding: const pw.EdgeInsets.all(9),
                      margin: const pw.EdgeInsets.only(top: 10, right: 10),
                      decoration:
                          const pw.BoxDecoration(color: PdfColors.orange),
                      child: pw.Image(icon4),
                    ),
                    pw.Expanded(
                      child: pw.Text(
                        profilelist[0]['indian'].text,
                        style: const pw.TextStyle(
                            color: PdfColors.white, fontSize: 13),
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(
                      height: 30,
                      width: 30,
                      alignment: pw.Alignment.center,
                      padding: const pw.EdgeInsets.all(9),
                      margin: const pw.EdgeInsets.only(top: 10, right: 10),
                      decoration: const pw.BoxDecoration(
                        color: PdfColors.orange,
                      ),
                      child: pw.Image(icon5),
                    ),
                    pw.Expanded(
                      child: pw.Text(
                        profilelist[0]['dob'].text,
                        style: const pw.TextStyle(
                            color: PdfColors.white, fontSize: 13),
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 3),
                txtpdf(name: 'Skills'),
                pw.SizedBox(height: 2),
                ...List.generate(
                  skilllist.length,
                  (index) => pw.Column(children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(top: 5),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            skilllist[index].text,
                            style: const pw.TextStyle(
                                color: PdfColors.white, fontSize: 13),
                          ),
                          pw.Text(
                            '${SliderRange[index].toInt()}% ',
                            style: const pw.TextStyle(
                                color: PdfColors.white, fontSize: 13),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
                pw.SizedBox(height: 2),
                txtpdf(name: 'Language'),
                pw.SizedBox(height: 2),
                ...List.generate(
                  languagelist.length,
                  (index) => pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 5),
                    child: pw.Text(
                      languagelist[index].text,
                      style: const pw.TextStyle(
                          color: PdfColors.white, fontSize: 13),
                    ),
                  ),
                ),
                pw.SizedBox(height: 3),
                txtpdf(name: 'Certification'),
                pw.SizedBox(height: 2),
                ...List.generate(
                  certificatelist.length,
                  (index) => pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 5),
                    child: pw.Text(
                      '${certificatelist[index]['name'].text}',
                      style: const pw.TextStyle(
                          color: PdfColors.white, fontSize: 13),
                    ),
                  ),
                ),
                pw.SizedBox(height: 3),
                txtpdf(name: 'Strength'),
                pw.SizedBox(height: 2),
                ...List.generate(
                  strengthlist.length,
                  (index) => pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 5),
                    child: pw.Text(
                      strengthlist[index].text,
                      style: const pw.TextStyle(
                          color: PdfColors.white, fontSize: 13),
                    ),
                  ),
                ),
                pw.SizedBox(height: 3),
                txtpdf(name: 'Activities'),
                pw.SizedBox(height: 2),
                ...List.generate(
                  activitieslist.length,
                  (index) => pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 5),
                    child: pw.Text(
                      activitieslist[index].text,
                      style: const pw.TextStyle(
                          color: PdfColors.white, fontSize: 13),
                    ),
                  ),
                )
              ],
            ),
          ),
          //------------------------------------------->todo Name And JobTitle
          pw.Align(
            alignment: pw.Alignment.topRight,
            child: pw.Container(
              height: 110,
              width: 460,
              padding: const pw.EdgeInsets.fromLTRB(83, 10, 0, 0),
              margin: const pw.EdgeInsets.only(top: 45),
              decoration: const pw.BoxDecoration(color: PdfColors.orange),
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      profilelist[0]['name'].text,
                      style: pw.TextStyle(
                          color: PdfColors.white,
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 35),
                    ),
                    pw.SizedBox(height: 8),
                    pw.Text(
                      profilelist[0]['job'].text,
                      style: const pw.TextStyle(
                          color: PdfColors.white, fontSize: 20),
                    ),
                  ]),
            ),
          ),
          //------------------------------------------>todo Profile Image
          pw.Container(
            height: 150,
            width: 150,
            alignment: pw.Alignment.center,
            margin: const pw.EdgeInsets.only(top: 22, left: 20),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(
                color: PdfColors.orange,
                width: 5,
              ),
              color: PdfColors.orange,
              image: pw.DecorationImage(
                fit: pw.BoxFit.cover,
                image: image,
              ),
            ),
          ),
          pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Container(
              width: 600,
              padding: const pw.EdgeInsets.only(right: 5),
              margin: const pw.EdgeInsets.only(left: 248, top: 180),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  txtpdfDark(name: 'About Me'),
                  pw.SizedBox(height: 6),
                  pw.Text(
                    txtaddinfo.text,
                    style: const pw.TextStyle(
                        color: PdfColors.black, fontSize: 13),
                  ),
                  pw.SizedBox(height: 6),
                  txtpdfDark(name: 'Education'),
                  ...List.generate(
                    edu.length,
                    (index) => pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 6),
                        pw.Text(
                          '  ${edu[index]['school'].text}',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 13),
                        ),
                        pw.SizedBox(height: 1.2),
                        pw.Text(
                          '  ${edu[index]['degree'].text}',
                          style: const pw.TextStyle(
                              color: PdfColors.black, fontSize: 13),
                        ),
                        pw.SizedBox(height: 1.2),
                        pw.Text(
                          '  ${edu[index]['year'].text}',
                          style: const pw.TextStyle(
                              color: PdfColor.fromInt(0xff181818),
                              fontSize: 13),
                        ),
                        pw.SizedBox(height: 1.2),
                        pw.Text(
                          '  Grade - ${edu[index]['grade'].text}',
                          style: const pw.TextStyle(
                              color: PdfColors.black, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 7),

                  pw.SizedBox(height: 1.2),
                  txtpdfDark(name: 'Experience'),
                  ...List.generate(
                    experiencelist.length,
                    (index) => pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 6),
                        pw.Text(
                          '  ${experiencelist[index]['job'].text}',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 13),
                        ),
                        pw.SizedBox(height: 1.5),
                        pw.Text(
                          '  ${experiencelist[index]['company'].text}',
                          style: const pw.TextStyle(
                              color: PdfColors.black, fontSize: 13),
                        ),
                        pw.SizedBox(height: 1.5),
                        (isend == false)
                            ? pw.Text(
                                '  Start ${experiencelist[index]['start'].text} -\n  End ${experiencelist[index]['end'].text}',
                                style: const pw.TextStyle(
                                    color: PdfColors.black, fontSize: 13),
                              )
                            : pw.Text(
                                '  Start  ${experiencelist[index]['start'].text} \n  Present',
                                style: const pw.TextStyle(
                                    color: PdfColors.black, fontSize: 13),
                              ),
                        pw.SizedBox(height: 1.5),
                        pw.Text(
                          '  ${experiencelist[index]['detail'].text}',
                          style: const pw.TextStyle(
                              color: PdfColors.black, fontSize: 13),
                        ),
                      ],
                    ),
                  ),

                  pw.SizedBox(height: 6),

                  pw.SizedBox(height: 1.2),
                  txtpdfDark(name: 'Projects'),
                  ...List.generate(
                    projectlist.length,
                    (index) => pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 6),
                        pw.Text(
                          '  ${projectlist[index]['name'].text}',
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 13),
                        ),
                        pw.SizedBox(height: 1.2),
                       pw.Container(
                         width: double.infinity,
                         margin: pw.EdgeInsets.all(2),
                         child: 
                         pw.Text(
                           '  ${projectlist[index]['description'].text}',
                           style: const pw.TextStyle(
                               color: PdfColors.black, fontSize: 13),
                         ),
                       ),
                        pw.SizedBox(height: 1.2),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 6),
                  // tod
                  pw.SizedBox(height: 1.2),
                  txtpdfDark(name: 'Reference'),
                  pw.SizedBox(height: 6),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      referencelist.length,
                      (index) => pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(height: 1.2),
                          pw.Text(
                            '  ${referencelist[index]['rename'].text}',
                            style: pw.TextStyle(
                                color: PdfColor.fromInt(0xff181818),
                                fontSize: 13,fontWeight: pw.FontWeight.bold),
                          ),
                          pw.SizedBox(height: 1.2),
                          pw.Text(
                            '  ${referencelist[index]['rejob'].text}',
                            style: const pw.TextStyle(
                                color: PdfColor.fromInt(0xff181818),
                                fontSize: 13),
                          ),
                          pw.SizedBox(height: 1.2),
                          pw.Text(
                            '  ${referencelist[index]['recom'].text}',
                            style: const pw.TextStyle(
                                color: PdfColor.fromInt(0xff181818),
                                fontSize: 13),
                          ),
                          pw.SizedBox(height: 1.2),
                          pw.Text(
                            '  ${referencelist[index]['reemail'].text}',
                            style: const pw.TextStyle(
                                color: PdfColor.fromInt(0xff181818),
                                fontSize: 13),
                          ),
                          pw.SizedBox(height: 1.2),
                          pw.Text(
                            '  ${referencelist[index]['rephone'].text}',
                            style: const pw.TextStyle(
                                color: PdfColor.fromInt(0xff181818),
                                fontSize: 13),
                          ),
                          pw.SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ),
                  txtpdfDark(name: 'Objective'),
                  pw.SizedBox(height: 6),
                  pw.Text(
                    txtobjective.text,
                    style: const pw.TextStyle(
                        color: PdfColors.black, fontSize: 13),
                  ),
                  pw.SizedBox(height: 6),
                ],
              ),
            ),
          )
        ],
      );
    },
  ));
  return pdf.save();
}

pw.Container txtpdf({required String name}) {
  return pw.Container(
    height: 25,
    width: 150,
    alignment: pw.Alignment.center,
    decoration: pw.BoxDecoration(
      border: pw.Border.all(color: pdforange, width: 0.5),
    ),
    child: pw.Text(
      "$name",
      style: pw.TextStyle(
          color: pdfwhite, fontSize: 14, fontWeight: pw.FontWeight.bold),
    ),
  );
}

pw.Container txtpdfDark({required String name}) {
  return pw.Container(
    height: 25,
    width: double.infinity,
    alignment: pw.Alignment.center,
    decoration: pw.BoxDecoration(color: pdforange),
    child: pw.Text(
      "$name",
      style: pw.TextStyle(
          color: pdfwhite, fontSize: 14, fontWeight: pw.FontWeight.bold),
    ),
  );
}
