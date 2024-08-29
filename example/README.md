# `ivlivs_pdf_viewer` example

```dart
import "package:flutter/src/services/asset_bundle.dart";
import "../ivlivs_pdf_viewer.dart";

String sourceName = "sample.pdf";

Uint8List data = (await rootBundle.load("assets/$sourceName")).buffer.asUint8List();

PdfViewer(
  sourceName: sourceName,
  data: data,
);
```
