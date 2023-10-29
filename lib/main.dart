import 'package:donation/core/consts/route.dart';
import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/helper/cache_helper.dart';
import 'package:donation/core/services/middleware.dart';
import 'package:donation/core/services/service_locator.dart';
import 'package:donation/core/translations/translate.dart';
import 'package:donation/core/widgets/photo_view.dart';
import 'package:donation/features/add_info_page/presentation/view/add_info_page.dart';
import 'package:donation/features/add_info_page/presentation/view/enter_address_page.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view/confirm_otp.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view/login_donate.dart';
import 'package:donation/features/gNavBar/presentation/view/nav_view.dart';
import 'package:donation/features/order_tracking/presentation/view/order_details.dart';
import 'package:donation/features/splash/presentation/view/splash_view.dart';
import 'package:donation/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
          getPages: [
            GetPage(
              name: splashPath,
              page: () => const SplashView(),
            ),
            GetPage(
              name: bottomNavPath,
              page: () => const GnavView(),
            ),
            GetPage(
              name: loginDonatePath,
              page: () => const LoginDonateView(),
              middlewares: [
                AuthMiddleware(),
              ],
            ),
            GetPage(
              name: addInfoViewPath,
              page: () => const AddInfoView(),
            ),
            GetPage(
              name: enterAddressPath,
              page: () => const EnterAddressPage(),
            ),
            GetPage(
              name: confirmOtpPath,
              page: () => const ConfirmOtpView(),
            ),
            GetPage(
              name: orderDetailsPath,
              page: () => const OrderDetailsView(),
            ),
            GetPage(
              name: imageViewPath,
              page: () => const ImageView(),
            ),
          ],
        );
      },
    );
  }
}
