import 'package:donation/features/gNavBar/presentation/view_model/home_controller.dart';
import 'package:donation/features/home/presentation/view/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    ///init HomeController
    Get.put(HomeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HomeBody(),
      ),
    );
  }
}
