import 'dart:io';

import 'package:bill_generator_flutter/input.dart';
import 'package:bill_generator_flutter/save.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'E Mail',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.0),
                ),
                // enabledBorder: OutlineInputBorder(
                // borderSide: BorderSide(color: Colors.black, width: 1.0),
                // ),
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Company Name'),
            ),
            item(),
            item(),
            item(),
            item(),
            item(),
            item(),
            ElevatedButton(onPressed: _createPDF, child: Text("Generate Bill"))
          ],
        ),
      ),
    );
  }

  Future<void> _createPDF() async {
    final PdfDocument document = PdfDocument();
    document.pages.add().graphics.drawString(
        'Hello World!', PdfStandardFont(PdfFontFamily.helvetica, 12),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(0, 0, 150, 20));
    List<int> bytes = document.save();
    document.dispose();

    sl(bytes, 'Output.pdf');
  }
}
