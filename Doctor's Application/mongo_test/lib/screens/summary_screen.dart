import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  late WebViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
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
        title: Text(
          'Summarize',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () async {
                    final messenger = ScaffoldMessenger.of(context);
                    if (await controller.canGoBack()) {
                      await controller.goBack();
                    } else {
                      messenger.showSnackBar(
                          SnackBar(content: Text('No Back History Found')));
                      return;
                    }
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              IconButton(
                  onPressed: () async {
                    final messenger = ScaffoldMessenger.of(context);
                    if (await controller.canGoForward()) {
                      await controller.goForward();
                    } else {
                      messenger.showSnackBar(
                          SnackBar(content: Text('No forward History Found')));
                      return;
                    }
                  },
                  icon: Icon(Icons.arrow_forward_ios)),
              IconButton(
                icon: Icon(Icons.replay),
                onPressed: () {
                  controller.reload();
                },
              )
            ],
          )
        ],
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
