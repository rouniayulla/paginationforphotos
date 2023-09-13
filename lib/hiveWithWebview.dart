import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:project1/getxWithWebview.dart';
import 'package:project1/main.dart';
import 'dart:convert';

import 'package:webview_flutter/webview_flutter.dart';

class HiveWithWebview extends StatelessWidget {
  HiveWithWebview({super.key});
  final controllerGetx = Get.put(MyController());

  @override
  int i=0;
  Widget build(BuildContext context) {
    late final WebViewController controller;
    final isLoad = controllerGetx.isLoad.value;
    final isError = controllerGetx.isError.value;
    print("//");
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..addJavaScriptChannel("myChannel",
          onMessageReceived: (JavaScriptMessage message) {})
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            controllerGetx.changeisLoad( false);
            print("/////////////");
            print(controllerGetx.isLoad.value);
          },
          onPageFinished: (String url) {
            controllerGetx.changeisLoad( true);
          },
          onUrlChange: (UrlChange Url) {},
          onWebResourceError: (WebResourceError error) {
            print("/////////////////////////");
            controllerGetx.changeisError(true);
            
            
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
          mybox!.get("token") != null
              ? Uri.parse(
                  "https://yesforonlineservices.sy/idbook/webview/view/pages/ads_center")
              : Uri.parse(
                  "https://yesforonlineservices.sy/idbook/webview/view"),
          method: LoadRequestMethod.post,
          headers: {
            'Authorization': mybox!.get("token", defaultValue: ""),
            'Api-Key': mybox!.get("key"),
          },
          body: Uint8List.fromList(
              utf8.encode("uid=6drQ8AbB&lang=ar&isMobile=true")));

    return Scaffold(
        body:
        Obx(() =>
         Stack(
          children:[
        
          if( controllerGetx.isLoad.value == true&&controllerGetx.isError.value == false )  WebViewWidget(controller: controller),
            if( controllerGetx.isLoad.value == false &&controllerGetx.isError.value == false)
                 Center(child: CircularProgressIndicator()),
            if( controllerGetx.isError.value == true ) Center(child: Text("No Internet"))
          ]
        ))
       );
  }
}
