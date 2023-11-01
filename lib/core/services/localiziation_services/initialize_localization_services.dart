import 'package:donation/core/services/localiziation_services/localization_services.dart';
import 'package:get/get.dart';

initLocaliziationServices() async {
  await Get.putAsync(() => LocalizationsServices().init());
}
