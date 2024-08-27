import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewOnApp extends StatefulWidget {
  final String? Link;

  WebViewOnApp({this.Link});

  @override
  _WebViewOnAppState createState() => _WebViewOnAppState();
}

class _WebViewOnAppState extends State<WebViewOnApp> {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://www.origami.life/dashboard.php',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
      ),
    );
  }
}