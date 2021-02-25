
import 'package:flutter/material.dart';
import 'package:themealdb/app/network/network_const.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  @override
  _WebviewPageState createState() => _WebviewPageState();

}

  class _WebviewPageState extends State<WebviewPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0x00000000),
        elevation: 0,
        title: Text('Webview'),
      ),
      body: WebView(
        initialUrl: urlMeal,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
