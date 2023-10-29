import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/services/service_locator.dart';
import 'package:donation/features/order_tracking/data/repo/order_tracking_repo_implementation.dart';
import 'package:donation/features/order_tracking/presentation/view/widgets/order_tracking_body.dart';
import 'package:donation/features/order_tracking/presentation/view_model/order_tracing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderTrackingView extends StatelessWidget {
  const OrderTrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      OrderTrackingController(
        orderTrackingRepo: getIt.get<OrderTrackingRepoImplementation>(),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringsEn.track.tr,
          style: AppConsts.style18,
        ),
        centerTitle: true,
        backgroundColor: AppConsts.mainColor,
      ),
      body: const OrderTrackingBody(),
    );
  }
}
