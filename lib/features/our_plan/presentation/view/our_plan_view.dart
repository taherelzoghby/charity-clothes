import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/features/our_plan/presentation/view/widgets/our_plan_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OurPlanView extends StatelessWidget {
  const OurPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConsts.mainColor,
        title: Text(
          StringsEn.ourPlan.tr,
          style: AppConsts.style18,
        ),
        centerTitle: true,
      ),
      body: const OurPlanBody(),
    );
  }
}
