import 'package:get/get.dart';

class ScreenController extends GetxController {
  RxInt selectedIndex = 0.obs;

  changeScreen(int index) {
    selectedIndex.value = index;
  }
}
