import 'package:benz/models/car_model/car_model.dart';
import 'package:benz/models/service_model/service_model.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class PrintScreen extends StatefulWidget {
  CarModel carModel;
  List<ServiceModel> serviceModelList;
  PrintScreen(
      {super.key, required this.carModel, required this.serviceModelList});
  @override
  State<PrintScreen> createState() => _PrintScreenState();
}

class _PrintScreenState extends State<PrintScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.carModel.carNumber);
    print(widget.serviceModelList.length);
    return Container();
  }

  void printWidget() async {
    final doc = pw.Document();

    doc.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Container(
            width: double.infinity,
            height: double.infinity,
            color: PdfColors.grey,
            padding: pw.EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 100.0,
            ),
            child: pw.Column(
              children: [
                pw.Text('Car Number', style: pw.TextStyle(fontSize: 16)),
                pw.SizedBox(height: 20),
                pw.Text('Car Model', style: pw.TextStyle(fontSize: 16)),
                pw.SizedBox(height: 20),
                pw.Text('Owner Name', style: pw.TextStyle(fontSize: 16)),
                pw.SizedBox(height: 20),
                pw.Text('Phone Number', style: pw.TextStyle(fontSize: 16)),
                pw.SizedBox(height: 20),
                pw.Text('Mileage', style: pw.TextStyle(fontSize: 16)),
                pw.SizedBox(height: 100),
                pw.Container(
                  width: double.infinity,
                  height: 50,
                  decoration: pw.BoxDecoration(
                    color: PdfColors.blue,
                    borderRadius: pw.BorderRadius.circular(10),
                  ),
                  child: pw.Center(
                    child: pw.Text(
                      'Add Car',
                      style: pw.TextStyle(
                        fontSize: 18,
                        color: PdfColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    final pdfBytes = await doc.save();

    await Printing.sharePdf(
      bytes: pdfBytes,
      filename: 'car_details.pdf',
    );
  }
}
