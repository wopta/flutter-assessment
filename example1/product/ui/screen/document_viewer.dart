import 'dart:convert';
import 'dart:io';

import 'package:filosofia/filosofia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wopta/product/data/product_repository.dart';

class DocumentViewer extends StatefulWidget {
  final String documentId;
  final String documentName;

  const DocumentViewer(
      {required this.documentId, required this.documentName, Key? key})
      : super(key: key);

  @override
  State<DocumentViewer> createState() => _DocumentViewerState();
}

class _DocumentViewerState extends State<DocumentViewer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File>(
      future: context
          .read<ProductRepository>()
          .fetchDocumentAsBase64(widget.documentId)
          .then((documentAsBase64) async {
        final directory = await getApplicationDocumentsDirectory();
        final document = File('${directory.path}/${widget.documentName}');
        final bytes = base64.decode(documentAsBase64);
        return document.writeAsBytes(bytes);
      }),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          final file = snapshot.data!;
          return FilosofiaScaffold(
            appBar: AppBar(
              title: Text(widget.documentName),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Share.shareXFiles([XFile(file.path)]);
                  },
                  icon: const Icon(Icons.share),
                )
              ],
            ),
            body: PdfView(
              path: file.path,
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return FilosofiaScaffold(
            appBar: AppBar(
              title: Text(widget.documentName),
              centerTitle: true,
            ),
            body: const Center(
              child: FilosofiaCircularIndicator(),
            ),
          );
        }
        return FilosofiaScaffold(
          appBar: AppBar(
            title: Text(widget.documentName),
            centerTitle: true,
          ),
          body: const Center(
            child: FilosofiaCircularIndicator(),
          ),
        );
      },
    );
  }
}
