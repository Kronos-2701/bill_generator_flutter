import 'dart:io';
import 'package:bill_generator_flutter/input.dart';
import 'package:bill_generator_flutter/mobile.dart';
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
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController items = TextEditingController();
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
              controller: name,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'E Mail',
              ),
            ),
            TextField(
              controller: phone,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: company,
              decoration: InputDecoration(labelText: 'Company Name'),
            ),
            item(),
            item(),
            item(),
            item(),
            item(),
            item(),
            ElevatedButton(onPressed: _createPDF, child: Text("Generate Bill")),
          ],
        ),
      ),
    );
  }

  Future<void> _createPDF() async {
    final PdfDocument document = PdfDocument();
    final PdfPageTemplateElement headerTemplate =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));
//Draw text in the header.
    headerTemplate.graphics.drawString(
        'This is page header', PdfStandardFont(PdfFontFamily.helvetica, 12),
        bounds: const Rect.fromLTWH(0, 15, 200, 20));
//Add the header element to the document.
    document.template.top = headerTemplate;
//Create a PDF page template and add footer content.
    final PdfPageTemplateElement footerTemplate =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));
//Draw text in the footer.
    footerTemplate.graphics.drawString(
        'This is page footer', PdfStandardFont(PdfFontFamily.helvetica, 12),
        bounds: const Rect.fromLTWH(0, 15, 200, 20));
//Set footer in the document.
    document.template.bottom = footerTemplate;
    final PdfPage page = document.pages.add();
    final Size pageSize = page.getClientSize();
    page.graphics.drawRectangle(
        bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
        pen: PdfPen(PdfColor(142, 170, 219, 255)));

    final PdfGrid grid = PdfGrid();
// Specify the grid column count.
    grid.columns.add(count: 3);
// Add a grid header row.
    final PdfGridRow headerRow = grid.headers.add(1)[0];
    headerRow.cells[0].value = 'Customer ID';
    headerRow.cells[1].value = 'Contact Name';
    headerRow.cells[2].value = 'Country';
// Set header font.
    headerRow.style.font =
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold);
// Add rows to the grid.
    PdfGridRow row = grid.rows.add();
    row.cells[0].value = 'ALFKI';
    row.cells[1].value = 'Maria Anders';
    row.cells[2].value = 'Germany';
// Add next row.
    row = grid.rows.add();
    row.cells[0].value = 'ANATR';
    row.cells[1].value = 'Ana Trujillo';
    row.cells[2].value = 'Mexico';
// Add next row.
    row = grid.rows.add();
    row.cells[0].value = 'ANTON';
    row.cells[1].value = 'Antonio Mereno';
    row.cells[2].value = 'Mexico';
// Set grid format.
    grid.style.cellPadding = PdfPaddings(left: 5, top: 5);
// Draw table in the PDF page.
    grid.draw(
        page: page,
        bounds: Rect.fromLTWH(
            0, 0, page.getClientSize().width, page.getClientSize().height));

    File('PDFTable.pdf').writeAsBytes(document.save());

    List<int> bytes = document.save();

    document.dispose();

    sl(bytes, 'PDFTable.pdf');
  }
}
