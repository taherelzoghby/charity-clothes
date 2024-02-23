import 'package:donation/core/services/service_locator.dart';
import 'package:donation/features/auth_donate_clothes/data/auth_repo/auth_repo_implementation.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view/widgets/confirm_otp_body.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view_model/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmOtpView extends StatefulWidget {
  const ConfirmOtpView({super.key});

  @override
  State<ConfirmOtpView> createState() => _ConfirmOtpViewState();
}

class _ConfirmOtpViewState extends State<ConfirmOtpView> {
  @override
  void initState() {
    Get.lazyPut(
      () => OtpController(
        authRepo: getIt.get<AuthRepoImplementation>(),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ConfirmOtpBody(),
      ),
    );
  }
}
