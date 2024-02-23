import 'package:donation/core/consts/assets.dart';
import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/widgets/customButton.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view/widgets/section_otp.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view_model/login_controller.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view_model/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ConfirmOtpBody extends StatefulWidget {
  const ConfirmOtpBody({super.key});

  @override
  State<ConfirmOtpBody> createState() => _ConfirmOtpBodyState();
}

class _ConfirmOtpBodyState extends State<ConfirmOtpBody> {
  Map<String, String?> data = {};
  final cont = Get.find<OtpController>();
  final contLogin = Get.find<LoginController>();

  @override
  void initState() {
    data = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        progressIndicator: const CircularProgressIndicator(
          color: AppConsts.mainColor,
        ),
        inAsyncCall: cont.isLoading.value || contLogin.isLoadingOtp.value,
        child: Padding(
          padding: AppConsts.mainPadding,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///done image
                  Padding(
                    padding: AppConsts.mainPadding,
                    child: AspectRatio(
                      aspectRatio: AppConsts.aspect13on10,
                      child: SvgPicture.asset(AppAssets.done, fit: BoxFit.fill),
                    ),
                  ),
                  const AspectRatio(aspectRatio: AppConsts.aspect16on2),

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
                  const AspectRatio(aspectRatio: AppConsts.aspect16on1),

                  ///verify button
                  Padding(
                    padding: AppConsts.paddingH50,
                    child: AspectRatio(
                      aspectRatio: AppConsts.aspectRatioButtonAuth,
                      child: CustomButton(
                        text: StringsEn.verify.tr,
                        onTap: () => cont.verifyLogin(
                          verId: data[StringsEn.verId]!,
                          name: data[StringsEn.name]!,
                          phone: data[StringsEn.phoneNumber]!,
                        ),
                      ),
                    ),
                  ),
                  const AspectRatio(aspectRatio: AppConsts.aspect16on1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
