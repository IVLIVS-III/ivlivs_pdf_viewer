import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import "package:pdfrx/pdfrx.dart" as pdfrx;

/// A basic cross-platform PDF viewer.
///
/// Native: Wrapper of [pdfrx.PdfViewer.data].
/// Web:    Renders the browser's built-in PDF viewer in an iframe.
interface class IPdfViewer {
  const IPdfViewer({
    required this.data,
    required this.sourceName,
  });

  final Uint8List data;
  final String sourceName;
}

class PdfViewer extends StatelessWidget implements IPdfViewer {
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
