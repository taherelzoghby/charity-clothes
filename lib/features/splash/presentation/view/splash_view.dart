import 'dart:async';

import 'package:donation/core/consts/route.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/features/splash/presentation/view/widgets/splash_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed(bottomNavPath),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppConsts.mainColor,
      body: SplashBody(),
    );
  }
}
