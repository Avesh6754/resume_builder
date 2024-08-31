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

Future<Uint8List> pdfGenerator() async{
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
  pdf.addPage(pw.Page(
    margin: pw.EdgeInsets.zero,
    pageFormat: PdfPageFormat.a4,
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
              mainAxisSize: pw.MainAxisSize.min,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'CONTACT',
                  style: pw.TextStyle(
                      color: PdfColors.white,
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 20),
                ),
                pw.SizedBox(height: 5),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(
                      height: 33,
                      width: 33,
                      alignment: pw.Alignment.center,
                      padding: const pw.EdgeInsets.all(9),
                      margin: const pw.EdgeInsets.only(top: 10, right: 10),
                      decoration: const pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                          color: PdfColors.orange),
                      child: pw.Image(icon1),
                    ),
                    pw.Expanded(
                      child: pw.Text(
                        profilelist[0]['address'].text,
                        style: const pw.TextStyle(
                            color: PdfColors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(
                      height: 33,
                      width: 33,
                      alignment: pw.Alignment.center,
                      padding: const pw.EdgeInsets.all(9),
                      margin: const pw.EdgeInsets.only(top: 10, right: 10),
                      decoration: const pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                          color:  PdfColors.orange),
                      child: pw.Image(icon2),
                    ),
                    pw.Expanded(
                      child: pw.Text(
                        profilelist[0]['phone'].text,
                        style: const pw.TextStyle(
                            color: PdfColors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(
                      height: 33,
                      width: 33,
                      alignment: pw.Alignment.center,
                      padding: const pw.EdgeInsets.all(9),
                      margin: const pw.EdgeInsets.only(top: 10, right: 10),
                      decoration: const pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                          color:  PdfColors.orange),
                      child: pw.Image(icon3),
                    ),
                    pw.Expanded(
                      child: pw.Text(
                        profilelist[0]['email'].text,
                        style: const pw.TextStyle(
                            color: PdfColors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(
                      height: 33,
                      width: 33,
                      alignment: pw.Alignment.center,
                      padding: const pw.EdgeInsets.all(9),
                      margin: const pw.EdgeInsets.only(top: 10, right: 10),
                      decoration: const pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                          color: PdfColors.orange),
                      child: pw.Image(icon4),
                    ),
                    pw.Expanded(
                      child: pw.Text(
                        profilelist[0]['indian'].text,
                        style: const pw.TextStyle(
                            color: PdfColors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(
                      height: 33,
                      width: 33,
                      alignment: pw.Alignment.center,
                      padding: const pw.EdgeInsets.all(9),
                      margin: const pw.EdgeInsets.only(top: 10, right: 10),
                      decoration: const pw.BoxDecoration(
                        shape: pw.BoxShape.circle,
                        color: PdfColors.orange,
                      ),
                      child: pw.Image(icon5),
                    ),
                    pw.Expanded(
                      child: pw.Text(
                        profilelist[0]['dob'].text,
                        style: const pw.TextStyle(
                            color: PdfColors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 2),
                pw.Divider(
                  color:  PdfColors.orange,
                  thickness: 1,
                ),
                pw.Text(
                  'SKILLS',
                  style: pw.TextStyle(
                      color: PdfColors.white,
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 20),
                ),
                pw.SizedBox(height: 2),
                ...List.generate(
                  skilllist.length,
                      (index) => pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 5),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          skilllist[index].text,
                          style: const pw.TextStyle(
                              color: PdfColors.white, fontSize: 16),
                        ),
                        pw.Text(
                          '${SliderRange[index].toInt()}% ',
                          style: const pw.TextStyle(
                              color: PdfColors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                pw.Divider(
                  color:  PdfColors.orange,
                  thickness: 1,
                ),
                pw.Text(
                  'LANGUAGE',
                  style: pw.TextStyle(
                      color: PdfColors.white,
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 20),
                ),
                pw.SizedBox(height: 2),
                ...List.generate(
                  languagelist.length,
                      (index) => pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 5),
                    child: pw.Text(
                      languagelist[index].text,
                      style: const pw.TextStyle(
                          color: PdfColors.white, fontSize: 16),
                    ),
                  ),
                ),
                pw.Divider(
                  color: PdfColors.orange,
                  thickness: 1,
                ),
                pw.Text(
                  'ACHIEVEMENTS',
                  style: pw.TextStyle(
                      color: PdfColors.white,
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 20),
                ),
                pw.SizedBox(height: 2),
                ...List.generate(
                  certificatelist.length,
                      (index) => pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 5),
                    child: pw.Text(
                      '${certificatelist[index]['name'].text}\n${certificatelist[index]['description'].text}',
                      style: const pw.TextStyle(
                          color: PdfColors.white, fontSize: 16),
                    ),
                  ),
                ),
                pw.Divider(
                  color:  PdfColors.orange,
                  thickness: 1,
                ),
                pw.Text(
                  'STRENGTH',
                  style: pw.TextStyle(
                      color: PdfColors.white,
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 20),
                ),
                pw.SizedBox(height: 2),
                ...List.generate(
                  strengthlist.length,
                      (index) => pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 5),
                    child: pw.Text(
                      strengthlist[index].text,
                      style: const pw.TextStyle(
                          color: PdfColors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //------------------------------------------->todo Name And JobTitle
          pw.Align(
            alignment: pw.Alignment.topRight,
            child: pw.Container(
              height: 125,
              width: 460,
              padding: const pw.EdgeInsets.fromLTRB(83, 10, 0, 0),
              margin: const pw.EdgeInsets.only(top: 45),
              decoration: const pw.BoxDecoration(
                color: PdfColors.orange
              ),
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      profilelist[0]['name'].text,
                      style: pw.TextStyle(
                          color: PdfColors.white,
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 40),
                    ),
                    pw.SizedBox(height: 8),
                    pw.Text(
                      profilelist[0]['job'].text,
                      style: const pw.TextStyle(
                          color: PdfColors.white, fontSize: 25),
                    ),
                  ]),
            ),
          ),
          //------------------------------------------>todo Profile Image
          pw.Container(
            height: 170,
            width: 170,
            alignment: pw.Alignment.center,
            margin: const pw.EdgeInsets.only(top: 22, left: 20),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(
                color: PdfColors.orange,
                width: 5,
              ),
              color:  PdfColors.orange,
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
              margin: const pw.EdgeInsets.only(left: 248, top: 190),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'ABOUT ME ',
                    style: pw.TextStyle(
                        color: const PdfColor.fromInt(0xff181818),
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 20),
                  ),
                  pw.SizedBox(height: 6),
                  pw.Text(
                    txtaddinfo.text,
                    style: const pw.TextStyle(
                        color:  PdfColors.orange, fontSize: 16),
                  ),
                  pw.SizedBox(height: 1),
                  pw.Divider(
                    thickness: 2.5,
                    color:  PdfColors.orange,
                  ),
                  pw.SizedBox(height: 1),
                  pw.Text(
                    'EDUCATION',
                    style: pw.TextStyle(
                        color: const PdfColor.fromInt(0xff181818),
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 20),
                  ),
                  pw.SizedBox(height: 7),

                  pw.SizedBox(height: 1.2),
                  pw.Divider(
                    thickness: 2.5,
                    color: PdfColors.orange,
                  ),
                  pw.SizedBox(height: 1.2),
                  pw.Text(
                    'WORK EXPERIENCE',
                    style: pw.TextStyle(
                        color: const PdfColor.fromInt(0xff181818),
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 20),
                  ),
                  pw.SizedBox(height: 6),
                  pw.SizedBox(height: 1.2),
                  pw.Divider(
                    thickness: 2.5,
                    color: PdfColors.orange,
                  ),
                  pw.SizedBox(height: 1.2),
                  pw.Text(
                    'PROJECTS',
                    style: pw.TextStyle(
                        color: const PdfColor.fromInt(0xff181818),
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 20),
                  ),
                  pw.SizedBox(height: 6),
                  // tod
                  pw.SizedBox(height: 1.2),
                  pw.Divider(
                    thickness: 2.5,
                    color:  PdfColors.orange,
                  ),
                  pw.SizedBox(height: 1.2),
                  pw.Text(
                    'REFERENCE',
                    style: pw.TextStyle(
                        color: const PdfColor.fromInt(0xff181818),
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 20),
                  ),
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
                            style: const pw.TextStyle(
                                color: PdfColor.fromInt(0xff181818),
                                fontSize: 15.4),
                          ),
                          pw.SizedBox(height: 1.2),
                          pw.Text(
                            '  ${referencelist[index]['rejob'].text}',
                            style: const pw.TextStyle(
                                color: PdfColor.fromInt(0xff181818),
                                fontSize: 15.4),
                          ),
                          pw.SizedBox(height: 1.2),
                          pw.Text(
                            '  ${referencelist[index]['recom'].text}',
                            style: const pw.TextStyle(
                                color: PdfColor.fromInt(0xff181818),
                                fontSize: 15.4),
                          ),
                          pw.SizedBox(height: 1.2),
                          pw.Text(
                            '  ${referencelist[index]['reemail'].text}',
                            style: const pw.TextStyle(
                                color: PdfColor.fromInt(0xff181818),
                                fontSize: 15.4),
                          ),
                          pw.SizedBox(height: 1.2),
                          pw.Text(
                            '  ${referencelist[index]['rephone'].text}',
                            style: const pw.TextStyle(
                                color: PdfColor.fromInt(0xff181818),
                                fontSize: 15.4),
                          ),
                        ],
                      ),
                    ),
                  ),
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

pw.Container txtpdf({required String name})
{
  return pw.Container(
    height: 35,
    width: 150,

    alignment: pw.Alignment.center,
    decoration: pw.BoxDecoration(
      border: pw.Border.all(color: pdforange, width: 0.5),
    ),
    child: pw.Text(
      "$name",
      style: pw.TextStyle(
          color: pdfwhite,
          fontSize: 15,
          fontWeight: pw.FontWeight.normal),
    ),
  );
}