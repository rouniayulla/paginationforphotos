import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:project1/main.dart';
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:lottie/lottie.dart';

late bool isweb = false;

class webviewPage extends StatefulWidget {
  const webviewPage({super.key});

  @override
  State<webviewPage> createState() => _webviewPageState();
}

class _webviewPageState extends State<webviewPage> {
  late final WebViewController controller;
  late final WebViewController controller1;
  double progress = 0;
  bool isError = false;
  bool isLoad = true;
  var msg;
  bool isPop = true;
  bool mountes = true;
  bool isprocess = true;
  String Url = "https://flutter.dev";

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..addJavaScriptChannel("myChannel",
          onMessageReceived: (JavaScriptMessage message) {
        setMessage(message.message);
      })
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            this.progress = progress / 100;
          },
          onPageStarted: (String url) {
            setState(() {
              isLoad = true;
              isError = false;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              deleteTabs(controller);

              isLoad = false;
            });
          },
          onUrlChange: (UrlChange Url) {},
          onWebResourceError: (WebResourceError error) {
            setState(() {
              isLoad = false;
              isError = true;
            });
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
          mybox!.get("token") == null
              ? Uri.parse(
                  "https://yesforonlineservices.sy/idbook/webview/view/pages/ads_center")
              : Uri.parse(
                  "https://yesforonlineservices.sy/idbook/webview/view"),
          method: LoadRequestMethod.post,
          headers: {
            'Authorization': mybox!.get("token"),
            'Api-Key': mybox!.get("key"),
          },
          body: Uint8List.fromList(
              utf8.encode("uid=6drQ8AbB&lang=ar&isMobile=true")));

    controller1 = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..addJavaScriptChannel("Mychannel",
          onMessageReceived: (JavaScriptMessage message) {
        setMessage(message.message);
      })
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            this.progress = progress / 100;
          },
          onPageStarted: (String url) {
            setState(() {
              isLoad = true;
              isError = false;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              deleteTabs(controller1);
            });
          },
          onUrlChange: (UrlChange Url) {},
          onWebResourceError: (WebResourceError error) {
            setState(() {
              isLoad = false;
              isError = true;
            });
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
          Uri.parse(
              "https://yesforonlineservices.sy/idbook/webview/view/pages/ads_center"),
          method: LoadRequestMethod.post,
          headers: {
            'Authorization':
                'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3llc2Zvcm9ubGluZXNlcnZpY2VzLnN5LyIsImF1ZCI6Imh0dHBzOi8veWVzZm9yb25saW5lc2VydmljZXMuc3kvIiwiaWF0IjoxNjk0MjQ2ODk5LCJuYmYiOjE2OTQyNDY4OTksImV4cCI6MTY5NTExMDg5OSwiZGF0YSI6eyJpZCI6IjZkclE4QWJCIiwibW9iaWxlIjoiMDk5MzI1MDQzOCJ9fQ.GwxJlFMExpi-kzmt4Z81GcCKtu6LsxmVixGoYTSelRU',
            'Api-Key': 'BQLCODE',
          },
          body: Uint8List.fromList(
              utf8.encode("uid=6drQ8AbB&lang=ar&isMobile=true")));
  }

  @override
  bool isyES = false;
  setMessage(String jsMes) {
    if (mounted) {
      setState(() {
      
        msg = jsonDecode(jsMes);
        
      });
    }
  }

  processMessage(WebViewController con) async {
  
    await controller1.runJavaScript(''' 
  var v=document.querySelector('div.Ads-center-container.ar-direction');
  var btnElements = v.querySelector('div.tabs');
  var buttonClick=btnElements.querySelectorAll("button");
  var array=[];
  buttonClick.forEach(e=>{
array.push(e);
  });
    array[1].click();
  ''');
  }

  injectJavascript(WebViewController con, int i) async {
    if (i == 0) {
      await controller.runJavaScript(''' 
  var div=document.querySelector('div.ads-center-cards');
  var btnElements = div.querySelectorAll('form.ads-center-card');
  var btnList = [];
  var mapH1=[];
  var all=[];
  var btnContent='';
  btnElements.forEach(function(btnElement) {
   btnContent = btnElement.querySelector('button');
  btnList.push(btnContent);
});
btnList[0].click();
  ''');
      await controller1.runJavaScript(''' 
  var div=document.querySelector('div.ads-center-cards');
  var btnElements = div.querySelectorAll('form.ads-center-card');
  var btnList = [];
  var mapH1=[];
  var all=[];
  var btnContent='';
  btnElements.forEach(function(btnElement) {
   btnContent = btnElement.querySelector('button');
  btnList.push(btnContent);
});
btnList[0].click();
  ''');
    } else if (i == 1)
      await controller.runJavaScript(''' 
  var div=document.querySelector('div.ads-center-cards');
  var btnElements = div.querySelectorAll('form.ads-center-card');
  var btnList = [];
  var mapH1=[];
  var all=[];
  var btnContent='';
  btnElements.forEach(function(btnElement) {
   btnContent = btnElement.querySelector('button');
  btnList.push(btnContent);
});
btnList[1].click();
  ''');
    else
      await controller.runJavaScript(''' 
  var div=document.querySelector('div.ads-center-cards');
  var btnElements = div.querySelectorAll('form.ads-center-card');
  var btnList = [];
  var mapH1=[];
  var all=[];
  var btnContent='';
  btnElements.forEach(function(btnElement) {
   btnContent = btnElement.querySelector('button');
  btnList.push(btnContent);
});
btnList[2].click();
  ''');

    isyES = true;
  }

  deleteTabs(WebViewController con) async {
    
    await controller.runJavaScript(''' 
  var v=document.querySelector('div.Ads-center-container');
  var btnElements = v.querySelector('div.tabs');
  btnElements.style.display = 'none';
   
  ''');
    await controller1.runJavaScript(''' 
  var v=document.querySelector('div.Ads-center-container');
  var btnElements = v.querySelector('div.tabs');
  btnElements.style.display = 'none';
   
  ''');
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          // for saty in  App
          controller.goBack();

          return false;
        } else {
          // leave App

          return true;
        }
      },
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: !isPop
                  ? AppBar(
                      title: Center(child: Text('IDBOOK Example')),
                      backgroundColor: const Color.fromARGB(255, 133, 127, 73),
                      bottom: const TabBar(
                        tabs: [
                          Tab(icon: Icon(Icons.message)),
                          Tab(icon: Icon(Icons.hourglass_top)),
                        ],
                      ),
                    )
                  : null,
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bk.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: isPop ? 60 : 0),
                    Offstage(
                      offstage: !isPop,
                      child: Lottie.asset('assets/add.json'),
                    ),
                    SizedBox(height: 4),
                    Offstage(
                      offstage: !isPop,
                      child: Container(
                        margin: EdgeInsets.only(left: 50, right: 50, top: 100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await injectJavascript(controller, 0);
                                  await Future.delayed(Duration(seconds: 2));
                                  await processMessage(controller1);

                                  await Future.delayed(Duration(seconds: 1));
                                  setState(() {
                                    isPop = false;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.add,
                                          color: Colors.yellow, size: 30),
                                      Text("New Message",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 40, 112, 148),
                                              fontSize: 16)),
                                    ],
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromARGB(0, 121, 120, 151)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: BorderSide(color: Colors.grey)),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await injectJavascript(controller, 1);
                                  await Future.delayed(Duration(seconds: 3));
                                  setState(() {
                                    isPop = false;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.add,
                                          color: Colors.yellow, size: 30),
                                      SizedBox(width: 6),
                                      Text("New Ads",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 40, 112, 148),
                                              fontSize: 16)),
                                    ],
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: BorderSide(color: Colors.grey)),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await injectJavascript(controller, 3);
                                  await Future.delayed(Duration(seconds: 3));
                                  setState(() {
                                    isPop = false;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.add,
                                          color: Colors.yellow, size: 30),
                                      SizedBox(width: 4),
                                      Text("New Post",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 40, 112, 148),
                                              fontSize: 16)),
                                    ],
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: BorderSide(color: Colors.grey)),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Offstage(
                        offstage: isPop,
                        child: TabBarView(
                          children: [
                            WebViewWidget(controller: controller),
                            Offstage(
                                offstage: !isprocess,
                                child: WebViewWidget(controller: controller1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
