import 'package:flutter/material.dart';
import 'package:project1/hiveWithWebview.dart';
import 'package:project1/home.dart';
import 'package:project1/home_clone.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Box? mybox;
Future<Box> openBox(String BoxName) async{
  if(!Hive.isBoxOpen(BoxName)){
    Hive.init((await getApplicationDocumentsDirectory()).path );
    
  }
  return await Hive.openBox(BoxName);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  mybox=await openBox("myBox");
  mybox!.put("key",'BQLCODE' );
  mybox!.put("token",'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3llc2Zvcm9ubGluZXNlcnZpY2VzLnN5LyIsImF1ZCI6Imh0dHBzOi8veWVzZm9yb25saW5lc2VydmljZXMuc3kvIiwiaWF0IjoxNjk0MjQ2ODk5LCJuYmYiOjE2OTQyNDY4OTksImV4cCI6MTY5NTExMDg5OSwiZGF0YSI6eyJpZCI6IjZkclE4QWJCIiwibW9iaWxlIjoiMDk5MzI1MDQzOCJ9fQ.GwxJlFMExpi-kzmt4Z81GcCKtu6LsxmVixGoYTSelRU');
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Your App Name',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: webviewPage(),
      );
    
  }
}
