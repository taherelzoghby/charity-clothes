import 'package:donation/core/consts/assets.dart';
import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/widgets/customButton.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view/widgets/section_otp.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view_model/login_controller.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view_model/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ConfirmOtpBody extends StatelessWidget {
  const ConfirmOtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cont = Get.find<OtpController>();
    final contLogin = Get.find<LoginController>();
    Map<String, String?> data = Get.arguments;
    return Obx(
      () => ModalProgressHUD(
        progressIndicator: const CircularProgressIndicator(
          color: AppConsts.mainColor,
        ),
        inAsyncCall: cont.isLoading.value||contLogin.isLoadingOtp.value,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * .1.h),

                ///done image
                SvgPicture.asset(
                  AppAssets.done,
                  fit: BoxFit.fill,
                  height: size.height * .2.h,
                ),
                SizedBox(height: size.height * .1.h),

                ///section otp
                const SectionOtp(),

                ///resend code
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringsEn.dontReceiveCode.tr,
                      style: AppConsts.style15,
                    ),
                    TextButton(
                      onPressed: () => contLogin.resendOtp(),
                      child: Text(
                        StringsEn.resend.tr,
                        style: AppConsts.style16.copyWith(
                          color: AppConsts.mainColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: size.height * .01.h),

                ///verify button
                SizedBox(
                  height: size.height * .05.h,
                  width: size.width * .4.w,
                  child: CustomButton(
                    text: StringsEn.verify.tr,
                    onTap: () => cont.verifyLogin(
                      verId: data[StringsEn.verId]!,
                      name: data[StringsEn.name]!,
                      phone: data[StringsEn.phoneNumber]!,
                    ),
                  ),
                ),
                SizedBox(height: size.height * .2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
