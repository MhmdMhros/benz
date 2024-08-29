// ignore_for_file: avoid_print

import 'dart:io';

import 'package:benz/generated/l10n.dart';
import 'package:benz/models/car_model/car_model.dart';
import 'package:benz/models/service_model/service_model.dart';
import 'package:benz/modules/layout_module/layout_screen.dart';
import 'package:benz/shared/components.dart';
import 'package:benz/shared/constants.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

class PrintScreen extends StatefulWidget {
  final CarModel carModel;
  final List<ServiceModel> serviceModelList;
  PrintScreen(
      {super.key, required this.carModel, required this.serviceModelList});
  @override
  State<PrintScreen> createState() => _PrintScreenState();
}

class _PrintScreenState extends State<PrintScreen> {
  final _commentController = TextEditingController();

  void printInvoice() {
    final comment = _commentController.text;

    printWidget(
      carModel: widget.carModel,
      services: widget.serviceModelList,
      comment: comment,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
          onPressed: () {
            currentIndexScreen = 0;
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LayoutScreen(isAdmin: isAdmin)),
            );
          },
        ),
      ),
      body: Container(
        color: backgroundColor,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextFormField to add a comment
            TextFormField(
              maxLines: 3,
              controller: _commentController,
              decoration: InputDecoration(
                hintText: S.of(context).print_enterComment,
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: mainColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: mainColor),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 172, 13, 2)),
                ),
              ),

              inputFormatters: [
                LengthLimitingTextInputFormatter(264), // Limit to 10 characters
              ],
              // Allows multiline comments
            ),
            SizedBox(height: 20),
            // MaterialButton to print the invoice
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                height: MediaQuery.of(context).size.height * .08,
                decoration: BoxDecoration(
                  color: appNameColor,
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * .02),
                ),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * .02)),
                  onPressed: printInvoice,
                  child: Text(
                    S.of(context).print_printInvoice,
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * .015,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> printWidget({
    required CarModel carModel,
    required List<ServiceModel> services,
    required String comment,
  }) async {
    final doc = pw.Document();

    // Load the custom font
    final fontData =
        await rootBundle.load("assets/fonts/Cairo-VariableFont_slnt,wght.ttf");
    final font = pw.Font.ttf(fontData);
    final ttf = pw.Font.ttf(fontData.buffer.asByteData());

    // Load the logo
    final logoData =
        await rootBundle.load('assets/images/Logo-removebg-preview.png');
    final logoImage = pw.MemoryImage(logoData.buffer.asUint8List());

    // Calculate total price of services
    final double totalPrice = services.fold(0, (sum, item) => sum + item.price);

    // Assuming all services have the same start date
    final String startDate = services.isNotEmpty ? services[0].startDate : '';

    // Define maximum services per page
    const int maxServicesPerPage = 8;

    // Determine how many pages are needed
    final int pageCount = (services.length / maxServicesPerPage).ceil();

    for (int pageIndex = 0; pageIndex < pageCount; pageIndex++) {
      // Adjust the number of services per page dynamically
      final currentServices = services
          .skip(pageIndex * maxServicesPerPage)
          .take(maxServicesPerPage)
          .toList();

      doc.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Container(
              width: double.infinity,
              height: double.infinity,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  if (pageIndex == 0) ...[
                    pw.Row(
                      children: [
                        pw.Image(logoImage, width: 70),
                        pw.SizedBox(width: 10),
                        pw.Column(children: [
                          pw.Text('BENZ SERVICE CENTER',
                              style: pw.TextStyle(
                                  fontSize: 26,
                                  fontWeight: pw.FontWeight.bold,
                                  font: ttf)),
                          pw.Row(
                            children: [
                              pw.Text(
                                '01144556478',
                                style: pw.TextStyle(
                                  fontSize: 14,
                                  font: ttf,
                                ),
                              ),
                              pw.SizedBox(width: 5),
                              pw.Directionality(
                                textDirection: pw.TextDirection.rtl,
                                child: pw.Text(
                                  'أ/ احمد مصطفى',
                                  style: pw.TextStyle(
                                    fontSize: 14,
                                    font: ttf,
                                  ),
                                ),
                              ),
                              pw.SizedBox(width: 15),
                              pw.Text(
                                '01010619046',
                                style: pw.TextStyle(
                                  fontSize: 14,
                                  font: ttf,
                                ),
                              ),
                              pw.SizedBox(width: 5),
                              pw.Directionality(
                                textDirection: pw.TextDirection.rtl,
                                child: pw.Text(
                                  'م/ كريم عشماوى',
                                  style: pw.TextStyle(
                                    fontSize: 14,
                                    font: ttf,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          pw.Row(
                            children: [],
                          ),
                        ])
                      ],
                    ),
                    pw.SizedBox(height: 20),
                    pw.Directionality(
                      textDirection: pw.TextDirection.ltr,
                      child: pw.Text('Car Number:   ${carModel.carNumber}',
                          style: pw.TextStyle(fontSize: 16, font: font)),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Directionality(
                      textDirection: pw.TextDirection.rtl,
                      child: pw.Text('Car Model:   ${carModel.carModel}',
                          style: pw.TextStyle(fontSize: 16, font: ttf)),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Directionality(
                      textDirection: pw.TextDirection.rtl,
                      child: pw.Text('Owner Name:   ${carModel.ownerName}',
                          style: pw.TextStyle(fontSize: 16, font: ttf)),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Directionality(
                      textDirection: pw.TextDirection.rtl,
                      child: pw.Text('Phone Number:   ${carModel.phoneNumber}',
                          style: pw.TextStyle(fontSize: 16, font: ttf)),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Row(
                      children: [
                        pw.Directionality(
                          textDirection: pw.TextDirection.rtl,
                          child: carModel.mileage != 0
                              ? pw.Text('Mileage:   ${carModel.mileage}',
                                  style: pw.TextStyle(fontSize: 16, font: ttf))
                              : pw.Text('Mileage:   _',
                                  style: pw.TextStyle(fontSize: 16, font: ttf)),
                        ),
                        pw.SizedBox(width: 30),
                        pw.Directionality(
                          textDirection: pw.TextDirection.rtl,
                          child: pw.Text(
                              'Total:   ${totalPrice.toStringAsFixed(2)}',
                              style: pw.TextStyle(fontSize: 16, font: ttf)),
                        ),
                        pw.SizedBox(width: 30),
                        pw.Directionality(
                          textDirection: pw.TextDirection.rtl,
                          child: pw.Text('Date:   $startDate',
                              style: pw.TextStyle(fontSize: 16, font: ttf)),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 5),
                    if (comment.isNotEmpty) ...[
                      pw.Text(
                        'Comment:',
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          font: ttf,
                        ),
                      ),
                      pw.Directionality(
                        textDirection: pw.TextDirection.rtl,
                        child: pw.Text(
                          comment,
                          style: pw.TextStyle(fontSize: 10, font: ttf),
                          maxLines: 2,
                          // This will add "..." if text overflows
                        ),
                      ),
                    ],
                    if (comment.isEmpty) ...[
                      pw.Text('Comment:',
                          style: pw.TextStyle(
                              fontSize: 16,
                              fontWeight: pw.FontWeight.bold,
                              font: ttf)),
                    ],
                    pw.SizedBox(height: 10),
                  ],
                  pw.Table(
                    border:
                        pw.TableBorder.all(width: 1, color: PdfColors.black),
                    children: [
                      pw.TableRow(
                        children: [
                          pw.Padding(
                            padding: pw.EdgeInsets.all(8),
                            child: pw.Text('Service Name',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold, font: ttf)),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.all(8),
                            child: pw.Text('Price',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold, font: ttf)),
                          ),
                          pw.Padding(
                            padding: pw.EdgeInsets.all(8),
                            child: pw.Text('Mileage Change When',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold, font: ttf)),
                          ),
                        ],
                      ),
                      ...currentServices.map(
                        (service) => pw.TableRow(
                          children: [
                            pw.Padding(
                              padding: pw.EdgeInsets.all(8),
                              child: pw.Directionality(
                                textDirection: pw.TextDirection.rtl,
                                child: pw.Text(service.name,
                                    style: pw.TextStyle(font: ttf)),
                              ),
                            ),
                            pw.Padding(
                              padding: pw.EdgeInsets.all(8),
                              child: pw.Text(service.price.toStringAsFixed(2),
                                  style: pw.TextStyle(font: ttf)),
                            ),
                            pw.Padding(
                              padding: pw.EdgeInsets.all(8),
                              child: pw.Text(
                                  service.mileageChangeWhen +
                                              carModel.mileage !=
                                          0
                                      ? (service.mileageChangeWhen +
                                              carModel.mileage)
                                          .toStringAsFixed(2)
                                      : '_',
                                  style: pw.TextStyle(font: ttf)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
    }

    final pdfBytes = await doc.save();

    // Create the folder on the desktop
    const String folderPath = 'BenzInvoices';
    final Directory folder = Directory(folderPath);

    if (!await folder.exists()) {
      await folder.create(recursive: true);
    }

    // Save the PDF file in the folder
    final String filePath =
        '$folderPath/\u200E${carModel.carNumber} \u200E${DateFormat('yyyy-MM-dd', 'en_US').format(DateTime.now())}.pdf';
    final File file = File(filePath);

    await file.writeAsBytes(pdfBytes);

    print('PDF saved at: $filePath');

    await Printing.sharePdf(
      bytes: pdfBytes,
      filename:
          '\u200E${carModel.carNumber} \u200E${DateFormat('yyyy-MM-dd', 'en_US').format(DateTime.now())}.pdf',
    );
  }
}
