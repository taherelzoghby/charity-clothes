import 'package:donation/features/gNavBar/presentation/view_model/home_controller.dart';
import 'package:donation/features/home/presentation/view/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    ///init HomeController
    Get.put(HomeController());
    return const Scaffold(
      body: HomeBody(),
    );
  }
}
