import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/features/gNavBar/presentation/view_model/gnav_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GnavBar extends StatelessWidget {
  const GnavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<GButton> tabs = [
      GButton(
        icon: Icons.info,
        text: StringsEn.ourPlan.tr,
      ),
      GButton(
        icon: Icons.public,
        text: StringsEn.orderTrack.tr,
      ),
      GButton(
        icon: Icons.home,
        text: StringsEn.home.tr,
      ),
      GButton(
        icon: Icons.phone,
        text: StringsEn.connectUs.tr,
      ),
    ];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: GetBuilder<GnavController>(
        init: GnavController(),
        builder: (controller) {
          return GNav(
            selectedIndex: controller.currentIndex,
            onTabChange: (int index) => controller.onPageChanged(index),
            tabBorderRadius: 20.sp,
            curve: Curves.bounceIn,
            duration: const Duration(milliseconds: 900),
            color: AppConsts.black,
            activeColor: AppConsts.sWhite,
            iconSize: 30,
            tabBackgroundColor: AppConsts.mainColor,
            tabs: tabs,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            textStyle: AppConsts.styleGnavText,
          );
        },
      ),
    );
  }
}
