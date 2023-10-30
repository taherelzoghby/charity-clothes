import 'package:donation/core/consts/route.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view/login_donate.dart';
import 'package:donation/features/gNavBar/presentation/view/nav_view.dart';
import 'package:get/get.dart';

import 'package:donation/core/widgets/photo_view.dart';
import 'package:donation/features/add_info_page/presentation/view/add_info_page.dart';
import 'package:donation/features/add_info_page/presentation/view/enter_address_page.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view/confirm_otp.dart';
import 'package:donation/features/order_tracking/presentation/view/order_details.dart';
import 'package:donation/features/splash/presentation/view/splash_view.dart';
import '../services/middleware.dart';

List<GetPage<dynamic>> routes= [
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
];