import 'package:donation/core/consts/assets.dart';
import 'package:donation/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: AppConsts.paddingH50,
      child: Column(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on14),
          AspectRatio(
            aspectRatio: AppConsts.aspect13on9,
            child: Image.asset(
              AppAssets.logo,
              fit: BoxFit.fill,
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),
          LinearProgressIndicator(
            backgroundColor: AppConsts.secondColor,
            color: AppConsts.sWhite,
            minHeight: size.height * .003.h,
          ),
        ],
      ),
    );
  }
}
