library ivlivs_pdf_viewer;

export "./src/pdf_viewer_base.dart"
if (dart.library.io) "./src/pdf_viewer_native.dart"
if (dart.library.html) "./src/pdf_viewer_web.dart";
