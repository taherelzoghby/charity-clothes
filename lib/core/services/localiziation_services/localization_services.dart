import 'package:donation/core/consts/route.dart';
import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/helper/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationsServices extends GetxService {
  final lang = ''.obs;

  ///init
  Future<LocalizationsServices> init() async {
    await CacheHelper.init();
    lang.value = CacheHelper.getData(key: StringsEn.language) ?? 'en';
    return this;
  }

  ///change locale
  changeLocale(String language) {
    lang.value = language;
    Locale locale = Locale(language);
    Get.updateLocale(locale);
    CacheHelper.saveData(key: StringsEn.language, value: language);

    ///back
    Get.offAllNamed(bottomNavPath);
  }
}
