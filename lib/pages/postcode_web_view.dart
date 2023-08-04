import 'dart:ui' as ui;
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_web_daum_postcode/model/postcode.dart';

class PostcodeWebView extends StatefulWidget {
  const PostcodeWebView({super.key});

  @override
  State<PostcodeWebView> createState() => _PostcodeWebViewState();
}

class _PostcodeWebViewState extends State<PostcodeWebView> {
  @override
  void initState() {
    super.initState();

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'postcode',
      (int viewId) => html.IFrameElement()
        ..style.width = '100%'
        ..style.height = '100%'
        ..src = 'assets/postcode.html'
        ..style.border = 'none',
    );

    html.window.onMessage.listen((event) {
      var data = Map<String, dynamic>.from(event.data);
      PostcodeModel postcode = PostcodeModel.fromJson(data);
      Navigator.pop(context, postcode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Postcode'),
      ),
      body: HtmlElementView(
        viewType: 'postcode',
      ),
    );
  }
}
