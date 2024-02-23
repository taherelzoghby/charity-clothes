// ignore_for_file: body_might_complete_normally_nullable, implementation_imports

import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/helper/cache_helper.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../consts/route.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (CacheHelper.getData(key: StringsEn.id) != null) {
      return const RouteSettings(name: addInfoViewPath);
    }
  }
}
