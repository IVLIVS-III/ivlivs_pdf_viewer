import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:ivlivs_pdf_viewer/src/pdf_viewer/stub.dart';
import "package:pdfrx/pdfrx.dart" as pdfrx;

/// A basic cross-platform PDF viewer.
///
/// Native: Wrapper of [pdfrx.PdfViewer.data].
/// Web:    Renders the browser's built-in PDF viewer in an iframe.
class PdfViewer extends StatelessWidget implements IPdfViewer {
  /// Creates a basic cross-platform PDF viewer.
  const PdfViewer({
    super.key,
    required this.data,
    required this.sourceName,
  });

  @override
  final Uint8List data;

  @override
  final String sourceName;

  @override
  Widget build(BuildContext context) =>
      pdfrx.PdfViewer.data(data, sourceName: sourceName);
}
