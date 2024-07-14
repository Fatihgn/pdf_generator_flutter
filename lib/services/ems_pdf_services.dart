import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:teklif_siparis_project/models/cari_model.dart';
import 'package:teklif_siparis_project/models/company.dart';
import 'package:teklif_siparis_project/models/product_model.dart';
import 'package:teklif_siparis_project/services/pdf_widgets.dart';

class EmsPdfService {
  Future<Uint8List> generateEMSPDF(
      Cari cari, Company company, List<ProductModel> products) async {
    double toplam = products.fold(0, (previousValue, element) {
      return previousValue + element.total;
    });
    double kdv = products.fold(0, (previousValue, element) {
      return previousValue + element.kdv;
    });

    print("Toplam: $toplam");
    final pdf = pw.Document();
    PdfWidgets pdfWidgets = PdfWidgets();
    final fontNormal = await PdfGoogleFonts.robotoFlexRegular();
    final fontBlack = await PdfGoogleFonts.robotoBlack();
    DateTime now = DateTime.now();
    String formattedDate = '${now.day}.${now.month}.${now.year}';

    pdf.addPage(pw.MultiPage(
      margin: const pw.EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) => [
        pw.Partitions(children: [
          pw.Partition(
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                      width: 250,
                      child: pdfWidgets.text_headline(
                          context, company.name, 1.8, fontBlack),
                    ),
                    pw.Container(
                      width: 270,
                      padding: const pw.EdgeInsets.only(left: 30),
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pdfWidgets.text_headline(
                                context, company.name, 0.6, fontBlack),
                            pw.Row(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pdfWidgets.text_headline(
                                      context, "Adres  :", 0.6, fontBlack),
                                  pw.Container(
                                      padding:
                                          const pw.EdgeInsets.only(left: 8),
                                      width: 175,
                                      child: pdfWidgets.text_answer(context,
                                          company.address, 0.6, fontNormal)),
                                ]),
                            pw.Row(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Container(
                                      width: 125,
                                      child: pw.Row(children: [
                                        pdfWidgets.text_headline(context,
                                            "Tel       :", 0.6, fontBlack),
                                        pw.Container(
                                            padding: const pw.EdgeInsets.only(
                                                left: 8),
                                            width: 175,
                                            child: pdfWidgets.text_answer(
                                                context,
                                                company.phone,
                                                0.6,
                                                fontNormal)),
                                      ])),
                                  pw.Container(
                                      width: 125,
                                      child: pw.Row(
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            pdfWidgets.text_headline(context,
                                                "Fax       :", 0.6, fontBlack),
                                            pw.Container(
                                                padding:
                                                    const pw.EdgeInsets.only(
                                                        left: 8),
                                                width: 90,
                                                child: pdfWidgets.text_answer(
                                                    context,
                                                    company.fax,
                                                    0.6,
                                                    fontNormal)),
                                          ])),
                                ]),
                            pw.Row(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Container(
                                      width: 125,
                                      child: pw.Row(
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            pdfWidgets.text_headline(context,
                                                "Vergi D:", 0.6, fontBlack),
                                            pw.Container(
                                                padding:
                                                    const pw.EdgeInsets.only(
                                                        left: 8),
                                                width: 90,
                                                child: pdfWidgets.text_answer(
                                                    context,
                                                    company.taxOffice,
                                                    0.6,
                                                    fontNormal)),
                                          ])),
                                  pw.Container(
                                      width: 125,
                                      child: pw.Row(
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            pdfWidgets.text_headline(context,
                                                "Vergi No:", 0.6, fontBlack),
                                            pw.Container(
                                                padding:
                                                    const pw.EdgeInsets.only(
                                                        left: 8),
                                                width: 85,
                                                child: pdfWidgets.text_answer(
                                                    context,
                                                    company.taxNumber,
                                                    0.6,
                                                    fontNormal)),
                                          ])),
                                ])
                          ]),
                    ),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Divider(),
                pw.SizedBox(height: 10),
                pw.Row(children: [
                  pw.Spacer(),
                  pdfWidgets.text_headline(
                      context, formattedDate, 0.8, fontBlack),
                ]),
                pw.SizedBox(height: 5),
                pdfWidgets.text_headline(
                    context, cari.incharge, 0.8, fontBlack),
                pw.SizedBox(height: 20),
                pdfWidgets.text_headline(
                    context,
                    "İstemiş olduğunuz ürünlere ait fiyat aşağıdaki verilmiştir.",
                    0.8,
                    fontBlack),
                pw.SizedBox(height: 10),
                pw.TableHelper.fromTextArray(
                  border: pw.TableBorder.all(),
                  cellAlignment: pw.Alignment.centerLeft,
                  cellAlignments: {
                    0: pw.Alignment.centerLeft,
                    1: pw.Alignment.centerRight,
                    2: pw.Alignment.centerRight,
                    3: pw.Alignment.centerRight,
                  },
                  headerStyle: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      font: fontBlack,
                      fontSize: 9),
                  cellStyle: pw.TextStyle(
                    font: fontNormal,
                    fontSize: 9,
                  ),
                  columnWidths: {
                    0: const pw.FlexColumnWidth(),
                    1: const pw.FixedColumnWidth(70),
                    2: const pw.FixedColumnWidth(70),
                    3: const pw.FixedColumnWidth(70),
                  },
                  headers: ["Ürün Adı", "Miktar", "Fiyat", "Toplam"],
                  data: List<List<String>>.generate(
                    products.length,
                    (row) => List<String>.generate(
                      4,
                      (col) => products[row].getIndex(col),
                    ),
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Row(children: [
                  pw.Spacer(),
                  pw.Container(
                      width: 170,
                      child: pw.Column(
                        children: [
                          pw.Row(children: [
                            pdfWidgets.text_headline(
                                context, "Toplam:", 0.8, fontBlack),
                            pw.Spacer(),
                            pdfWidgets.text_headline(context,
                                toplam.toStringAsFixed(2), 0.8, fontNormal)
                          ]),
                          pw.Row(children: [
                            pdfWidgets.text_headline(
                                context, "Kdv:", 0.8, fontBlack),
                            pw.Spacer(),
                            pdfWidgets.text_headline(context,
                                kdv.toStringAsFixed(2), 0.8, fontNormal)
                          ]),
                          pw.Row(children: [
                            pdfWidgets.text_headline(
                                context, "Genel Toplam:", 0.8, fontBlack),
                            pw.Spacer(),
                            pdfWidgets.text_headline(
                                context,
                                (kdv + toplam).toStringAsFixed(2),
                                0.8,
                                fontNormal)
                          ])
                        ],
                      )),
                ]),
                pw.SizedBox(height: 20),
              ]))
        ])
      ],
    ));
    return pdf.save();
  }

  Future<void> savePdfFile(String fileName, Uint8List bytleList) async {
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/$fileName.pdf";
    final file = File(filePath);
    await file.writeAsBytes(bytleList);
    await OpenFile.open(filePath);
  }
}
