import 'package:get/get.dart';

class MyController extends GetxController {
  var isLoad = false.obs;
  var isError = false.obs;
  void changeisLoad(bool newValue) {
    isLoad.value = newValue;
  }
   void changeisError(bool newValue) {
    isError.value = newValue;
  }
}

