import 'package:donation/core/consts/style.dart';
import 'package:donation/core/services/service_locator.dart';
import 'package:donation/features/auth_donate_clothes/data/auth_repo/auth_repo_implementation.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view/widgets/login_donate_body.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view_model/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginDonateView extends StatefulWidget {
  const LoginDonateView({super.key});

  @override
  State<LoginDonateView> createState() => _LoginDonateViewState();
}

class _LoginDonateViewState extends State<LoginDonateView> {
  @override
  void initState() {
    Get.put(
      LoginController(authRepo: getIt.get<AuthRepoImplementation>()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: const SafeArea(
        child: LoginDonateBody(),
      ),
    );
  }
}
