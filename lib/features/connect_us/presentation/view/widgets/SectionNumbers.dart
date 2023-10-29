import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/features/connect_us/presentation/view/widgets/TileLauncherUrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionNumbers extends StatelessWidget {
  const SectionNumbers({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringsEn.enterPhone.tr,
            style: AppConsts.style16.copyWith(color: AppConsts.mainColor),
          ),
          const TileLauncherUrl(
            icon: Icons.phone,
            value: StringsEn.phoneNum,
          ),
          const TileLauncherUrl(
            icon: Icons.phone,
            value: StringsEn.phoneNum,
          ),
          const TileLauncherUrl(
            icon: Icons.phone,
            value: StringsEn.phoneNum,
          ),
        ],
      ),
    );
  }
}
