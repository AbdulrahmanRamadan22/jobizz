import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfViewScreen extends StatefulWidget {
  final String pdfUrl;
  const PdfViewScreen({super.key, required this.pdfUrl});

  @override
  State<PdfViewScreen> createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  PDFViewController? controller;
  int currentPage = 0;
  int totalPages = 0;
  bool isReady = false;

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF View'),
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: () {
              if (currentPage > 0) {
                controller?.setPage(currentPage - 1);
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              if (currentPage < totalPages - 1) {
                controller?.setPage(currentPage + 1);
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          PDF(
            // Disable horizontal scrolling for better vertical reading
            swipeHorizontal: false,
            // Disable page fling for better control
            pageFling: false,
            // Enable page snap for better navigation
            pageSnap: true,
            // Fit policy to fill width (makes text larger)
            fitPolicy: FitPolicy.WIDTH,
            // Enable swipe for page navigation
            enableSwipe: true,
            // Prevent auto spacing
            autoSpacing: false,
            // Default page
            defaultPage: 0,
            // Callbacks
            onRender: (pages) {
              setState(() {
                totalPages = pages!;
                isReady = true;
              });
            },
            onPageChanged: (page, total) {
              setState(() {
                currentPage = page!;
              });
            },
            onViewCreated: (PDFViewController pdfViewController) {
              controller = pdfViewController;
            },
            onError: (error) {
              print('PDF Error: $error');
            },
            onPageError: (page, error) {
              print('PDF Page Error: $page: $error');
            },
          ).cachedFromUrl(
            widget.pdfUrl,
            placeholder: (progress) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 16),
                  Text('Loading PDF... $progress %'),
                  const SizedBox(height: 8),
                  const Text('Preparing large font display...'),
                ],
              ),
            ),
            errorWidget: (dynamic error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading PDF',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    error.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          // Page indicator
          if (isReady)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${currentPage + 1} / $totalPages',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      // Navigation buttons
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            mini: true,
            heroTag: "first_page",
            onPressed: () {
              controller?.setPage(0);
            },
            child: const Icon(Icons.first_page),
          ),
          FloatingActionButton(
            mini: true,
            heroTag: "prev_page",
            onPressed: () {
              if (currentPage > 0) {
                controller?.setPage(currentPage - 1);
              }
            },
            child: const Icon(Icons.chevron_left),
          ),
          FloatingActionButton(
            mini: true,
            heroTag: "next_page",
            onPressed: () {
              if (currentPage < totalPages - 1) {
                controller?.setPage(currentPage + 1);
              }
            },
            child: const Icon(Icons.chevron_right),
          ),
          FloatingActionButton(
            mini: true,
            heroTag: "last_page",
            onPressed: () {
              if (totalPages > 0) {
                controller?.setPage(totalPages - 1);
              }
            },
            child: const Icon(Icons.last_page),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
