import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/helper/Size_page.dart';

class Pdfview extends StatelessWidget {
  final String pdfUrl;
  const Pdfview({required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        titleSpacing: -10,

        title: Padding(
          padding: EdgeInsets.only(left: screenWidth(context,dividedBy: 30)),
          child: custom_header(text: "Document"),
        ),
      ),
      body: PDFView(
        filePath: pdfUrl,
        // You can use either filePath or url to load the PDF
        // url: 'https://www.example.com/path-to-your-pdf.pdf',
        onPageChanged: (page, total) {
          print('page change: $page/$total');
        },
        onViewCreated: (PDFViewController pdfViewController) {
          // you can use the controller to interact with the PDF view
          // e.g. jump to a specific page: pdfViewController.setPage(page)
        },
        onPageError: (page, error) {
          print('error on page $page: $error');
        },
      ),
    );
  }
}
