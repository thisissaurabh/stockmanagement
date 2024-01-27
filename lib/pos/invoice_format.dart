// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart';
//
// class PDF extends StatefulWidget {
//   const PDF({super.key});
//
//   @override
//   State<PDF> createState() => _PDFState();
// }
//
// class _PDFState extends State<PDF> {
//
//   Future<void> _createPDF() async {
//     //Create a PDF document.
//     final PdfDocument document = PdfDocument();
//     //Add page to the PDF
//     final PdfPage page = document.pages.add();
//     //Get page client size
//     final Size pageSize = page.getClientSize();
//     //Draw rectangle
//     page.graphics.drawRectangle(
//         bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
//         pen: PdfPen(PdfColor(142, 170, 219, 255)));
//     //Generate PDF grid.
//     final PdfGrid grid = getGrid();
//     //Draw the header section by creating text element
//     final PdfLayoutResult result = drawHeader(page, pageSize, grid);
//     //Draw grid
//     drawGrid(page, grid, result);
//     //Add invoice footer
//     drawFooter(page, pageSize);
//     //Save and launch the document
//     final List<int> bytes = document.save();
//     //Dispose the document.
//     document.dispose();
//     //Save and launch file.
//     SaveFilehelper.saveAndOpenFile(bytes);
//   }
//
//   PdfLayoutResult drawHeader(PdfPage page, Size pageSize, PdfGrid grid) {
//     //Draw rectangle
//     page.graphics.drawRectangle(
//         brush: PdfSolidBrush(PdfColor(91, 126, 215, 255)),
//         bounds: Rect.fromLTWH(0, 0, pageSize.width - 115, 90));
//     //Draw string
//     page.graphics.drawString(
//         'INVOICE', PdfStandardFont(PdfFontFamily.helvetica, 30),
//         brush: PdfBrushes.white,
//         bounds: Rect.fromLTWH(25, 0, pageSize.width - 115, 90),
//         format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));
//
//     page.graphics.drawRectangle(
//         bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 90),
//         brush: PdfSolidBrush(PdfColor(65, 104, 205)));
//
//     //Create PDF grid and return
//     PdfGrid getGrid() {
//       //Create a PDF grid
//       final PdfGrid grid = PdfGrid();
//       //Secify the columns count to the grid.
//       grid.columns.add(count: 5);
//       //Create the header row of the grid.
//       final PdfGridRow headerRow = grid.headers.add(1)[0];
//       //Set style
//       headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
//       headerRow.style.textBrush = PdfBrushes.white;
//       headerRow.cells[0].value = 'Product Id';
//       headerRow.cells[0].stringFormat.alignment = PdfTextAlignment.center;
//       headerRow.cells[1].value = 'Product Name';
//       headerRow.cells[2].value = 'Price';
//       headerRow.cells[3].value = 'Quantity';
//       headerRow.cells[4].value = 'Total';
//       addProducts('CA-1098', 'AWC Logo Cap', 8.99, 2, 17.98, grid);
//       addProducts('LJ-0192', 'Long-Sleeve Logo Jersey,M', 49.99, 3, 149.97, grid);
//       addProducts('So-B909-M', 'Mountain Bike Socks,M', 9.5, 2, 19, grid);
//       addProducts('LJ-0192', 'Long-Sleeve Logo Jersey,M', 49.99, 4, 199.96, grid);
//       addProducts('FK-5136', 'ML Fork', 175.49, 6, 1052.94, grid);
//       addProducts('HL-U509', 'Sports-100 Helmet,Black', 34.99, 1, 34.99, grid);
//       //Apply the grid built-in style.
//       grid.applyBuiltInStyle(PdfGridBuiltInStyle.listTable4Accent5);
//       grid.columns[1].width = 200;
//       for (int i = 0; i < headerRow.cells.count; i++) {
//         headerRow.cells[i].style.cellPadding =
//             PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
//       }
//       for (int i = 0; i < grid.rows.count; i++) {
//         final PdfGridRow row = grid.rows[i];
//         for (int j = 0; j < row.cells.count; j++) {
//           final PdfGridCell cell = row.cells[j];
//           if (j == 0) {
//             cell.stringFormat.alignment = PdfTextAlignment.center;
//           }
//           cell.style.cellPadding =
//               PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
//         }
//       }
//       return grid;
//     }
//
// //Create row for the grid.
//     void addProducts(String productId, String productName, double price,
//         int quantity, double total, PdfGrid grid) {
//       PdfGridRow row = grid.rows.add();
//       row.cells[0].value = productId;
//       row.cells[1].value = productName;
//       row.cells[2].value = price.toString();
//       row.cells[3].value = quantity.toString();
//       row.cells[4].value = total.toString();
//     }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("apl"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             MaterialButton(
//               onPressed: _createPDF,
//               color: Colors.blue,
//               child: Text(
//                 'Generate PDF',
//                 style: TextStyle(color: Colors.white),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
