import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:resume_app/utils/color.dart';
import '../../utils/global.dart';

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
          pdfFileName: '${txtname.text} resume',
          build: (format) => pdfGenerator()),
    );
  }
}

Future<Uint8List> pdfGenerator() {
  final pdf = pw.Document();
  // profileImage = pw.MemoryImage(fileImage!.readAsBytesSync());
  // pw.Image(profileImage),
  pdf.addPage(pw.Page(
    margin: pw.EdgeInsets.zero,
    pageFormat: PdfPageFormat.a4,
    build: (context) {
      return pw.Row(children: [
        pw.Expanded(
          child: pw.Container(
            color: pdfblack,
            child: pw.Column(
              children: [
                pw.SizedBox(height: 20),
                pw.Container(
                  height: 150,
                  width: 150,
                  margin: pw.EdgeInsets.all(10),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(color: pdforange, width: 0.3),
                    image: pw.DecorationImage(
                      image: pw.MemoryImage(
                        imagefile!.readAsBytesSync(),
                      ),
                    ),
                  ),
                ),
                pw.SizedBox(height: 20),
                txtpdf(name: "Contact Me"),
                txtpdf(name: "Skills"),
                txtpdf(name: "Languages"),

              ],
            ),
          ),
        ),
        pw.Expanded(
          flex: 2,
          child: pw.Container(color: pdfwhite),
        ),
      ]);
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