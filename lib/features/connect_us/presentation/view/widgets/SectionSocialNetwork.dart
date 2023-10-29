import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/features/connect_us/presentation/view/widgets/TileLauncherUrl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SectionSocialNetwork extends StatelessWidget {
  const SectionSocialNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringsEn.socialNetwork.tr,
            style: AppConsts.style16.copyWith(color: AppConsts.mainColor),
          ),
          const TileLauncherUrl(
            icon: Icons.email,
            value: StringsEn.gmail,
          ),
          const TileLauncherUrl(
            icon: Icons.facebook,
            value: StringsEn.facebook,
          ),
          const TileLauncherUrl(
            icon: FontAwesomeIcons.instagram,
            value: StringsEn.instgram,
          ),
          const TileLauncherUrl(
            icon: FontAwesomeIcons.twitter,
            value: StringsEn.twitter,
          ),
        ],
      ),
    );
  }
}
