import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../ivlivs_pdf_viewer.dart';

class FuturePdfViewer extends StatelessWidget {
  const FuturePdfViewer({
    super.key,
    required this.future,
    required this.sourceName,
    this.loader,
    this.errorBuilder,
  });

  final Future<Uint8List> future;
  final String sourceName;
  final Widget? loader;
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
