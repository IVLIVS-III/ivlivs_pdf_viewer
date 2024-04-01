import "dart:typed_data";

import "package:flutter/material.dart";

/// A basic cross-platform PDF viewer.
class PdfViewer extends StatefulWidget {
  const PdfViewer({
    super.key,
    required this.data,
    required this.sourceName,
  });

  final Uint8List data;
  final String sourceName;

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
