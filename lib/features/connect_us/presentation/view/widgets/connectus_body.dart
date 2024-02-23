import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/widgets/customButton.dart';
import 'package:donation/features/connect_us/presentation/view/widgets/SectionNumbers.dart';
import 'package:donation/features/connect_us/presentation/view_model/connect_us_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SectionSocialNetwork.dart';

class ConnectUsBody extends StatefulWidget {
  const ConnectUsBody({super.key});

  @override
  State<ConnectUsBody> createState() => _ConnectUsBodyState();
}

class _ConnectUsBodyState extends State<ConnectUsBody> {
  final cont = Get.find<ConnectUsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        children: [
          ///phone numbers
          const SectionNumbers(),

          ///social network
          const SectionSocialNetwork(),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          ///check if have account or not ?

          Obx(
            () => cont.haveAccount.value
                ? Column(
                    children: [
                      ///sign out account button
                      AspectRatio(
                        aspectRatio: AppConsts.aspectRatioButtonAuth,
                        child: Padding(
                          padding: AppConsts.padding10V25H,
                          child: CustomButton(
                            text: StringsEn.signOut.tr,
                            onTap: () => cont.readyToSignOut(),
                            background: AppConsts.white,
                            isBorder: true,
                            styleText: AppConsts.style14,
                          ),
                        ),
                      ),
                      const AspectRatio(aspectRatio: AppConsts.aspect40on1),

                      ///delete account button
                      AspectRatio(
                        aspectRatio: AppConsts.aspectRatioButtonAuth,
                        child: Padding(
                          padding: AppConsts.padding10V25H,
                          child: CustomButton(
                            text: StringsEn.deleteAccount.tr,
                            onTap: () => cont.readyToDeleteAccount(),
                            background: AppConsts.red.withOpacity(.8),
                            isBorder: true,
                            styleText: AppConsts.style14
                                .copyWith(color: AppConsts.sWhite),
                          ),
                        ),
                      )
                    ],
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
