import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfViewScreen extends StatelessWidget {
  final String url;

  const PdfViewScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(url);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: PDF(
              enableSwipe: true,
              swipeHorizontal: false,
              autoSpacing: false,
              pageFling: false,
              nightMode: true,
              onError: (error) {
                print(error.toString());
              },
              onPageError: (page, error) {
                print('$page: ${error.toString()}');
              },
              onPageChanged: (int page, int total) {
                print('page change: $page/$total');
              },
            ).cachedFromUrl(
              url,
              placeholder: (progress) => Center(
                child: CircularProgressIndicator(
                ),
              ),
              errorWidget: (error) => Center(child: Text(error.toString())),
            ),
          ),
        ],
      ),
    );
  }
}
