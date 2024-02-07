import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UploadReportPage extends StatefulWidget {
  const UploadReportPage({super.key});

  @override
  State<UploadReportPage> createState() => _UploadReportPageState();
}

class _UploadReportPageState extends State<UploadReportPage> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://textsummarybitnbuild-93yc6gqtddsfxvjfwfaywc.streamlit.app/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'UPLOAD',
              style: TextStyle(
                // fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              ),
            ),
            Text(
              ' REPORT',
              style: TextStyle(
                // fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFA957F3),
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
