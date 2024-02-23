import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/features/order_tracking/presentation/view/widgets/order_details_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

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
        title: Text(
          StringsEn.orderDetails.tr,
          style: AppConsts.style18,
        ),
        centerTitle: true,
        backgroundColor: AppConsts.grey,
      ),
      body: const SafeArea(
        child: OrderDetailsBody(),
      ),
    );
  }
}
