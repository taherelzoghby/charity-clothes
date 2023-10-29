import 'package:get/get.dart';

class HomeController extends GetxController {
  final index = 0.obs;
  carsoulChanged(int ind) {
    index.value = ind;
  }
}
