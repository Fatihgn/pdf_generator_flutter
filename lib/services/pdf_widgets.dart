import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

class PdfWidgets {
  text_headline(pw.Context context, String text, double fontsize, Font font) {
    return pw.Text(
      text,
      textScaleFactor: fontsize,
      style: pw.TextStyle(fontWeight: pw.FontWeight.bold, font: font),
    );
  }

  text_answer(pw.Context context, String text, double fontsize, Font font) {
    return pw.Text(
      text,
      textScaleFactor: fontsize,
      style: pw.TextStyle(font: font),
    );
  }
}
