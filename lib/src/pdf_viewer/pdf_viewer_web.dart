import "dart:js_interop";

import 'package:web/web.dart' as web;

import "dart:typed_data";

import "package:flutter/material.dart";

/// A basic cross-platform PDF viewer.
///
/// Renders the web browser's built-in PDF viewer in an iframe.
class PdfViewer extends StatefulWidget {
  PdfViewer({
    Key? key,
    required this.data,
    required this.sourceName,
  })  : super(key: key ?? ValueKey(data.hashCode));

  final Uint8List data;
  final String sourceName;

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  web.HTMLIFrameElement? _element;
  late final web.Blob _blob = web.Blob(
    // Note: See https://github.com/dart-lang/web/issues/180 for why this weird
    //       conversion is necessary.
    [widget.data.toJS].toJS,
    web.BlobPropertyBag(type: "application/pdf"),
  );
  late final String _blobUrl = web.URL.createObjectURL(_blob);

  void _setElementSize(double width, double height) {
    final element = _element;
    if (element == null) {
      return;
    }
    element.style.width = "${width}px";
    element.style.height = "${height}px";
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          _setElementSize(width, height);

          return HtmlElementView.fromTagName(
            key: ValueKey("HtmlElementView_$_blobUrl"),
            tagName: "iframe",
            onElementCreated: (element) {
              if (element is! web.HTMLIFrameElement) {
                return;
              }
              _element = element;
              element
                ..title = widget.sourceName
                ..src = _blobUrl;
              element.style.border = "none";
              _setElementSize(width, height);
            },
          );
        },
      );

  @override
  void dispose() {
    super.dispose();
    web.URL.revokeObjectURL(_blobUrl);
  }
}
