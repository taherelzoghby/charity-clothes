import 'package:donation/core/helper/connectivity.dart';
import 'package:donation/core/services/service_locator.dart';
import 'package:donation/core/widgets/no_connection_widget.dart';
import 'package:donation/features/gNavBar/presentation/view/widgets/gnav.dart';
import 'package:donation/features/gNavBar/presentation/view_model/gnav_controller.dart';
import 'package:donation/features/home/presentation/view/home_view.dart';
import 'package:donation/features/order_tracking/data/repo/order_tracking_repo_implementation.dart';
import 'package:donation/features/order_tracking/presentation/view/order_tracking_view.dart';
import 'package:donation/features/order_tracking/presentation/view_model/order_tracing_controller.dart';
import 'package:donation/features/our_plan/presentation/view/our_plan_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../connect_us/presentation/view/connectus_view.dart';

class GnavView extends StatefulWidget {
  const GnavView({super.key});

  @override
  State<GnavView> createState() => _GnavViewState();
}

class _GnavViewState extends State<GnavView> {
  final connect = Get.put(ConnectionStatusSingleton());

  ///screens
  static const List<Widget> widgets = [
    OurPlanView(),
    OrderTrackingView(),
    HomeView(),
    ConnectUsView(),
  ];

  @override
  void initState() {
    ///init OrderTrackingController
    Get.put(
      OrderTrackingController(
        orderTrackingRepo: getIt.get<OrderTrackingRepoImplementation>(),
      ),
    );

    Get.put(GnavController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GnavController>(
        init: GnavController(),
        builder: (cont) => Obx(
          () => connect.connectivity.value == 0
              ? const NoConnectionWidget()
              : widgets[cont.currentIndex],
        ),
      ),
      bottomNavigationBar: const GnavBar(),
    );
  }
}
