import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OurPlanBody extends StatelessWidget {
  const OurPlanBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.padding8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          ///app name
          Text(
            '${StringsEn.appName.tr} ',
            style: AppConsts.style16Green.copyWith(fontSize: 30.sp),
            textAlign: TextAlign.center,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///over vision
              Text(
                '${StringsEn.overVision.tr} : ',
                style: AppConsts.styleError.copyWith(),
              ),
              Text(
                '${StringsEn.vision.tr} : ',
                style: AppConsts.style16,
              ),
              const Divider(),

              ///our plan
              Text(
                '${StringsEn.ourPlan.tr} : ',
                style: AppConsts.styleError.copyWith(),
              ),
              Text(
                '${StringsEn.plan.tr} : ',
                style: AppConsts.style16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
