import 'package:donation/core/consts/style.dart';
import 'package:donation/core/services/service_locator.dart';
import 'package:donation/features/auth_donate_clothes/data/auth_repo/auth_repo_implementation.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view/widgets/login_donate_body.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view_model/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginDonateView extends StatelessWidget {
  const LoginDonateView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      LoginController(
        authRepo: getIt.get<AuthRepoImplementation>(),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppConsts.white,
          ),
        ),
        backgroundColor: AppConsts.mainColor,
      ),
      body: const LoginDonateBody(),
    );
  }
}
