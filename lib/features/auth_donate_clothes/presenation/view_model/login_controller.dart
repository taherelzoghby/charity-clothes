import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:donation/core/helper/overlay_helper.dart';
import 'package:donation/features/auth_donate_clothes/data/auth_repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/consts/route.dart';
import '../../../../core/consts/strings.dart';

class LoginController extends GetxController {
  AuthRepo authRepo;

  LoginController({required this.authRepo});

  final isLoading = false.obs;
  final isLoadingOtp = false.obs;
  int? resendTokens;
  String? verificationId;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? name;
  String? phone;
  CountryCode? selectedCountry;
  String initialCountry = '+20';

  ///selected country
  selectedCo(CountryCode c) {
    selectedCountry = c;
    print(selectedCountry!.dialCode);
    update();
  }

  /// saved phone
  onSavedPhone(String value) {
    phone = value;
    update();
  }

  ///saved name
  onSavedName(String value) {
    name = value;
    update();
  }

  ///sign in with phone number
  signInWithPhone() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      try {
        ///sign in with phone number
        await authRepo.signIn(
          phoneNumber: "+20$phone",
          name: name!,
          codeSent: (String verId, [int? forceCodeResend]) async {
            verificationId = verId;
            resendTokens = forceCodeResend;

            Get.offAllNamed(
              confirmOtpPath,
              arguments: {
                StringsEn.verId: verificationId,
                StringsEn.phoneNumber: "+20$phone",
                StringsEn.name: name,
              },
            );
            isLoading.value = false;
          },
        );

        print("sign in with phone success");
      } catch (error) {
        OverlayHelper.showWarningToast(
          Get.overlayContext!,
          error.toString(),
        );
        isLoading.value = false;
      }
    }
  }

  ///resend otp
  resendOtp() async {
    try {
      isLoadingOtp.value = true;
      await authRepo.signIn(
        phoneNumber: "+20$phone",
        name: name!,
        codeSent: (String verId, [int? forceCodeResend]) async {
          verificationId = verId;
          resendTokens = forceCodeResend;

          ///navigate to otp screen with data(id-phone-name)
          Get.offAllNamed(
            confirmOtpPath,
            arguments: {
              StringsEn.verId: verificationId,
              StringsEn.phoneNumber: "+20$phone",
              StringsEn.name: name,
            },
          );

          isLoadingOtp.value = false;
        },
      );
    } catch (error) {
      OverlayHelper.showWarningToast(
        Get.overlayContext!,
        error.toString(),
      );

      isLoadingOtp.value = false;
    }
  }
}
