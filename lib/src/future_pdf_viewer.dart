import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'pdf_viewer.dart';

/// A basic cross-platform PDF viewer.
/// Takes a future that will provide the PDF data.
///
/// Native: Wrapper of [pdfrx.PdfViewer.data].
/// Web:    Renders the browser's built-in PDF viewer in an iframe.
class FuturePdfViewer extends StatelessWidget {
  /// Creates a basic cross-platform PDF viewer.
  const FuturePdfViewer({
    super.key,
    required this.future,
    required this.sourceName,
    this.loader,
    this.errorBuilder,
  });

  /// The future that will provide the PDF data.
  final Future<Uint8List> future;

  /// The name of the source of the PDF data.
  final String sourceName;

  /// A widget to display while the PDF data is loading.
  final Widget? loader;

  /// A builder for the error widget.
  final Widget Function(BuildContext context, Object? error)? errorBuilder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return loader ?? const CircularProgressIndicator.adaptive();
        }

        final data = snapshot.data;

        if (snapshot.hasError || data == null) {
          final error = snapshot.error;
          final errorBuilder = this.errorBuilder;
          return errorBuilder?.call(context, error) ??
              Text("Error loading PDF: $error");
        }

        return PdfViewer(
          data: data,
          sourceName: sourceName,
        );
      },
    );
  }
}
