Name your widget: PdfView 

pub.dev package: https://pub.dev/packages/flutter_pdfview](https://pub.dev/packages/syncfusion_flutter_pdfviewer

Parameters:

docUrl (str) = PDF URL

pageNr (int) = Page Number

docName (str) = Document Name

Pubspec Dependencies: syncfusion_flutter_pdfviewer: ^21.2.3

Add this code in Web Publishing > Custom Headers: 

<script src="//cdnjs.cloudflare.com/ajax/libs/pdf.js/2.4.456/pdf.min.js"></script>
<script type="text/javascript">
   pdfjsLib.GlobalWorkerOptions.workerSrc = "//cdnjs.cloudflare.com/ajax/libs/pdf.js/2.4.456/pdf.worker.min.js";
</script>
