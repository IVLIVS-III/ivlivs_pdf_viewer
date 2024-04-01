import "dart:typed_data";

import "package:flutter/material.dart";
import "package:pdfrx/pdfrx.dart" as pdfrx;

/// A basic cross-platform PDF viewer.
///
/// Wrapper of [pdfrx.PdfViewer.data].
class PdfViewer extends StatelessWidget {
  const PdfViewer({
    super.key,
    required this.data,
    required this.sourceName,
  });

  final Uint8List data;
  final String sourceName;

  @override
  Widget build(BuildContext context) =>
      pdfrx.PdfViewer.data(data, sourceName: sourceName);
}
