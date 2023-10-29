import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/widgets/customButton.dart';
import 'package:donation/features/connect_us/presentation/view/widgets/SectionNumbers.dart';
import 'package:donation/features/connect_us/presentation/view_model/connect_us_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'SectionSocialNetwork.dart';

class ConnectUsBody extends StatelessWidget {
  const ConnectUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cont = Get.find<ConnectUsController>();
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ///phone numbers
        const SectionNumbers(),

        ///social network
        const SectionSocialNetwork(),
        SizedBox(height: size.height * .02.w),

        ///check if have account or not ?

        Obx(
          () => cont.haveAccount.value
              ? Column(
                  children: [
                    ///sign out account button
                    SizedBox(
                      height: size.height * .05.h,
                      width: size.width * .5.w,
                      child: CustomButton(
                        text: StringsEn.signOut.tr,
                        onTap: () => cont.readyToSignOut(),
                        background: AppConsts.white,
                        isBorder: true,
                        styleText: AppConsts.style14,
                      ),
                    ),
                    SizedBox(height: size.height * .01.w),

                    ///delete account button
                    SizedBox(
                      height: size.height * .05.h,
                      width: size.width * .5.w,
                      child: CustomButton(
                        text: StringsEn.deleteAccount.tr,
                        onTap: () => cont.readyToDeleteAccount(),
                        background: AppConsts.red.withOpacity(.8),
                        isBorder: true,
                        styleText:
                            AppConsts.style14.copyWith(color: AppConsts.sWhite),
                      ),
                    )
                  ],
                )
              : Container(),
        ),
      ],
    );
  }
}
