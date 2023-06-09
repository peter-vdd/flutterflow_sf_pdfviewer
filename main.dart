// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'dart:math';

class PdfView extends StatefulWidget {
  const PdfView({
    Key? key,
    this.width,
    this.height,
    this.docUrl,
    this.pageNr,
    this.docName,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? docUrl;
  final int? pageNr;
  final String? docName;

  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  late PdfViewerController _pdfViewerController;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  void didUpdateWidget(PdfView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pageNr != oldWidget.pageNr) {
      _pdfViewerController.jumpToPage(widget.pageNr ?? 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = (widget.docName ?? 'Preview');
    title = title.length > 50 ? title.substring(0, 50) + '...' : title;

    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        toolbarHeight: 28.0,
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14.0),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.zoom_in,
              color: Colors.white,
              size: 14.0,
            ),
            onPressed: () {
              _pdfViewerController.zoomLevel = 2;
            },
          ),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_up,
              color: Colors.white,
              size: 14.0,
            ),
            onPressed: () {
              _pdfViewerController.previousPage();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
              size: 14.0,
            ),
            onPressed: () {
              _pdfViewerController.nextPage();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        widget.docUrl ??
            'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
        key: _pdfViewerKey,
        controller: _pdfViewerController,
      ),
    );
  }
}
