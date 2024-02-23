import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view_model/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SectionOtp extends StatefulWidget {
  const SectionOtp({super.key});

  @override
  State<SectionOtp> createState() => _SectionOtpState();
}

class _SectionOtpState extends State<SectionOtp> {
  final cont = Get.find<OtpController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: cont.formKey,
      child: Padding(
        padding: AppConsts.mainPadding,
        child: PinCodeTextField(
          appContext: context,
          pastedTextStyle: AppConsts.pastedTextStyle,
          length: 6,
          animationType: AnimationType.fade,
          validator: (v) {
            if (v!.length < 6) {
              return StringsEn.validator.tr;
            } else {
              return null;
            }
          },
          pinTheme: PinTheme(
            activeColor: AppConsts.mainColor,
            selectedColor: AppConsts.mainColor,
            inactiveColor: AppConsts.mainColor.withOpacity(.5),
            shape: PinCodeFieldShape.box,
            borderRadius: AppConsts.radius5,
            fieldHeight: size.height * .055.h,
            fieldWidth: size.width * .1.w,
            activeFillColor: AppConsts.sWhite,
          ),
          cursorColor: AppConsts.mainColor,
          animationDuration: const Duration(milliseconds: 300),
          errorAnimationController: cont.errorController,
          controller: cont.textEditingController,
          keyboardType: TextInputType.number,
          onCompleted: (v) {
            debugPrint("Completed");
          },
          onChanged: (value) => cont.onChanged(value),
          onSubmitted: (value) => cont.onSubmtted(value),
          beforeTextPaste: (text) {
            debugPrint("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ),
      ),
    );
  }
}
