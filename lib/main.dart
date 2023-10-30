
import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/helper/cache_helper.dart';
import 'package:donation/core/services/service_locator.dart';
import 'package:donation/core/translations/translate.dart';
import 'package:donation/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/consts/routesPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///init firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ///init cacheHelper(shared preferences)
  await CacheHelper.init();

  ///setup service locator (get it)
  setupServiceLocator();

  ///run app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 851),
      builder: (context, widget) {
        return GetMaterialApp(
          title: StringsEn.appName,
          locale: CacheHelper.getData(key: StringsEn.language) == null
              ? const Locale('en')
              : Locale(CacheHelper.getData(key: StringsEn.language)),
          translations: Translate(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          getPages:routes,
        );
      },
    );
  }
}
