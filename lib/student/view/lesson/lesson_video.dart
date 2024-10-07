import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

import 'package:hcmue/student/view/widgets/appbar.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

class LessonVideoPage extends StatefulWidget {
  const LessonVideoPage({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  State<LessonVideoPage> createState() => _LessonVideoPageState();
}

class _LessonVideoPageState extends State<LessonVideoPage> {
  late final WebViewController _controller;
  bool isFullScreen = false;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.videoUrl))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
  }

  void enterFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  }

  void exitFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: isFullScreen
            ? null
            : PreferredSize(
                preferredSize: const Size.fromHeight(60.0),
                child: customAppBar(
                  title: 'Danh sách bài học',
                  style: openSansRegularStyle(fontSize: 20.0, color: white),
                ),
              ),
        body: Stack(
          children: <Widget>[
            WebViewWidget(controller: _controller),
            Positioned(
              top: 260.0,
              right: 20.0,
              child: FloatingActionButton(
                backgroundColor: Colors.black.withOpacity(0.2),
                onPressed: () {
                  isFullScreen ? exitFullScreen() : enterFullScreen();
                  setState(() {
                    isFullScreen = !isFullScreen;
                  });
                },
                child: Icon(
                  isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                  color: white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
