import "dart:typed_data";

import "package:flutter/material.dart";

/// A basic cross-platform PDF viewer.
class PdfViewer extends StatelessWidget {
  const PdfViewer({
    super.key,
    required this.data,
    required this.sourceName,
  });

  final Uint8List data;
  final String sourceName;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
