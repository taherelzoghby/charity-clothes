import 'package:get/get.dart';

class GnavController extends GetxController {
  int currentIndex = 2;
  onPageChanged(int index) {
    currentIndex = index;
    update();
  }
}
