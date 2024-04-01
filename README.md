A basic cross-platform PDF viewer.

On native platforms, [`pdfrx`](https://pub.dev/packages/pdfrx) is used.

On the web, the browser's built-in PDF viewer is used.

## Features

Providing a basic performance-conscious PDF viewer for Flutter.

## Getting started

```dart
import "package:ivlivs_pdf_viewer/ivlivs_pdf_viewer.dart";
```

## Usage

```dart
const Uint8List pdfData = ...;

const pdfViewer = PdfViewer(
    data: pdfData,
    sourceName: "my-doc.pdf",
);
```
