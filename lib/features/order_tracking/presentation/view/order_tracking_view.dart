import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/services/service_locator.dart';
import 'package:donation/features/order_tracking/data/repo/order_tracking_repo_implementation.dart';
import 'package:donation/features/order_tracking/presentation/view/widgets/order_tracking_body.dart';
import 'package:donation/features/order_tracking/presentation/view_model/order_tracing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderTrackingView extends StatefulWidget {
  const OrderTrackingView({super.key});

  @override
  State<OrderTrackingView> createState() => _OrderTrackingViewState();
}

class _OrderTrackingViewState extends State<OrderTrackingView> {
  @override
  void initState() {
    Get.put(
      OrderTrackingController(
        orderTrackingRepo: getIt.get<OrderTrackingRepoImplementation>(),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringsEn.track.tr,
          style: AppConsts.style18,
        ),
        centerTitle: true,
        backgroundColor: AppConsts.mainColor,
      ),
      body: const SafeArea(
        child: OrderTrackingBody(),
      ),
    );
  }
}
