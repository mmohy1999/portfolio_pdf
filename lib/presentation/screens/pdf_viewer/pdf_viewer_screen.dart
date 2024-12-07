import 'dart:io';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatelessWidget {
  const PdfViewerScreen({super.key, required this.file});
 final File file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pdf Viewer'),
        actions: [
          IconButton(onPressed: ()async {
            XFile xFile = XFile(file.path);
            await Share.shareXFiles([xFile]);

          }, icon: const Icon(Icons.share)),
          const SizedBox(width: 2,),
          IconButton(onPressed: () {
            save(context,file);
          }, icon: const Icon(Icons.download)),
          const SizedBox(width: 10,),
        ]
      ),
      body: SfPdfViewer.file(file),
    );
  }

  save(BuildContext context,File pdf)async{
    Directory downloadsDirectory = Directory('/storage/emulated/0/Download');
    String downloadsPath = downloadsDirectory.path;
    String path = '$downloadsPath/${DateTime.now().microsecond.toString()}.pdf';
    File file = File(path);
    print(file.path);
    await file.writeAsBytes(await pdf.readAsBytes());
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('File Saved on Download Folder')));
  }
}
