import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PredictPage extends StatefulWidget {
  const PredictPage({super.key});

  @override
  State<PredictPage> createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  late WebViewController controller;
  final storagePermission = Permission.storage;
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

  void _loadUrl() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final file = await FilePicker.platform.pickFiles();
      if (file != null) {
        final filePath = file.files.single.path;
        final url =
            'https://textsummarybitnbuild-93yc6gqtddsfxvjfwfaywc.streamlit.app/?file=$filePath';
        controller.loadRequest(Uri.parse(url));
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PREDICT ',
              style: TextStyle(
                // fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              ),
            ),
            Text(
              'DIAGNOSIS',
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
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:mongo_test/widgets/my_web_view.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:permission_handler/permission_handler.dart';

// class PredictPage extends StatefulWidget {
//   const PredictPage({Key? key}) : super(key: key);

//   @override
//   State<PredictPage> createState() => _PredictPageState();
// }

// class _PredictPageState extends State<PredictPage> {
//   late WebViewController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       );
//     _loadUrl();
//   }

//   void _loadUrl() async {
//     final status = await Permission.storage.request();
//     if (status.isGranted) {
//       final file = await FilePicker.platform.pickFiles();
//       if (file != null) {
//         final filePath = file.files.single.path;
//         final url =
//             'https://textsummarybitnbuild-93yc6gqtddsfxvjfwfaywc.streamlit.app/?file=$filePath';
//         controller.loadRequest(Uri.parse(url));
//       }
//     } else {
//       // Handle permission denied
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'PREDICT ',
//               style: TextStyle(
//                 // fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'Inter',
//               ),
//             ),
//             Text(
//               'DIAGNOSIS',
//               style: TextStyle(
//                 // fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFFA957F3),
//                 fontFamily: 'Inter',
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: WebViewWidget(controller: controller),
//     );
//   }
// }
