// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously

import 'dart:async';

import 'package:donation/core/consts/route.dart';
import 'package:donation/core/widgets/dialog.dart';
import 'package:donation/core/widgets/dialog_otp.dart';
import 'package:donation/features/auth_donate_clothes/data/auth_repo/auth_repo.dart';
import 'package:donation/features/connect_us/data/auth_repo/auth_connect_us_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/helper/cache_helper.dart';
import 'package:donation/core/helper/dialog_help.dart';
import 'package:donation/core/helper/overlay_helper.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConnectUsController extends GetxController {
  AuthConnectUsRepo authConnectUsRepo;
  AuthRepo authRepo;

  ConnectUsController({
    required this.authConnectUsRepo,
    required this.authRepo,
  });

  final haveAccount = false.obs;
  final isLoading = false.obs;
  final isLoadingDialogOtp = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController;
  String? code;

  ///on changed otp
  onChangedOtp(String value) => code = value;

  ///on submitted otp
  onSubmttedOtp(String value) => code = value;

  String currentLang = CacheHelper.getData(key: StringsEn.language) == null ||
          CacheHelper.getData(key: StringsEn.language) == 'en'
      ? 'en'
      : 'ar';

  ///change language
  changeLanguage({required String code}) async {
    currentLang = code;
    Locale locale = Locale(code);
    Get.updateLocale(locale);
    await CacheHelper.saveData(key: StringsEn.language, value: code);

    ///back
    Get.offAllNamed(bottomNavPath);
    update();
  }

  ///remove cache
  removeCache() async {
    ///remove id
    await CacheHelper.removeData(key: StringsEn.id);

    ///remove name
    await CacheHelper.removeData(key: StringsEn.name);

    ///remove phone number
    await CacheHelper.removeData(key: StringsEn.phoneNumber);
  }

  ///check if have account or not?
  chechIfHaveAccount() {
    CacheHelper.getData(key: StringsEn.id) != null
        ? haveAccount.value = true
        : haveAccount.value = false;
  }

  ///ready to delete account
  readyToDeleteAccount() {
    customDialog(
      title: StringsEn.doYouWantDeleteAcccount.tr,
      onConfirm: () => receiveOtpDialog(),
      onCancel: () => Get.back(),
      textConfirm: StringsEn.ok.tr,
    );
  }

  ///ready to sign out
  readyToSignOut() {
    customDialog(
      title: StringsEn.doYouWantSignOut.tr,
      onConfirm: () => signOutWithPhone(),
      onCancel: () => Get.back(),
      textConfirm: StringsEn.ok.tr,
    );
  }

  ///We need to verify your number first.You will receive the OTP once you click Submit
  receiveOtpDialog() {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialogWidget(
          contentText: StringsEn.weNeedToVerifyYourNumberFirst.tr,
          confirmFunction: () => deleteMobilePhone(),
          declineFunction: () {
            Get.back();
            Get.back();
          },
          confirmText: StringsEn.submit.tr,
          cancelText: StringsEn.cancel.tr,
        );
      },
    );
  }

  ///verify Otp to delete
  deleteMobilePhone() async {
    isLoading.value = true;
    try {
      await authConnectUsRepo.deleteAccountWithPhone(
        codeSent: (String verId, [int? forceCodeResend]) async {
          Get.back();
          isLoading.value = false;
          return showDialog(
            context: Get.context!,
            builder: (BuildContext context) {
              return DialogOtp(
                id: verId,
                name: CacheHelper.getData(key: StringsEn.name),
                phone: CacheHelper.getData(key: StringsEn.phoneNumber),
              );
            },
          );
        },
      );
    } catch (e) {
      isLoading.value = false;
      OverlayHelper.showWarningToast(
        Get.overlayContext!,
        StringsEn.someThingOccur.tr,
      );
    }
  }

  verifyDeleteAccount({
    required String verId,
    required String name,
    required String phone,
  }) async {
    if (formKey.currentState!.validate()) {
      isLoadingDialogOtp.value = true;
      try {
        // conditions for validating
        if (code!.length != 6) {
          errorController!.add(
            ErrorAnimationType.shake,
          );
        } else {
          ///verify otp
          await authRepo.verifyOtp(otp: code!, verId: verId);

          ///delete products
          await authConnectUsRepo.deleteAllProducts();

          ///delete account
          await authConnectUsRepo.deleteAcc();

          removeCache();

          ///navigate to otp screen
          Get.offAllNamed(bottomNavPath);
          OverlayHelper.showSuccessToast(
            Get.overlayContext!,
            StringsEn.accountDeletedSuccessfully.tr,
          );
        }
      } catch (e) {
        OverlayHelper.showWarningToast(
          Get.overlayContext!,
          StringsEn.someThingOccur.tr,
        );
      }
      isLoadingDialogOtp.value = false;
    }
  }

  ///sign out with phone
  signOutWithPhone() async {
    try {
      await authConnectUsRepo.signOutWithPhone();

      ///remove all cache (id-phone-name)
      removeCache();
      chechIfHaveAccount();
      OverlayHelper.showSuccessToast(
        Get.overlayContext!,
        StringsEn.signoutSuccess.tr,
      );

      ///navigate to otp screen
      Get.offAllNamed(bottomNavPath);
    } catch (e) {
      OverlayHelper.showWarningToast(
        Get.overlayContext!,
        StringsEn.someThingOccur.tr,
      );
    }
  }

  @override
  void onInit() {
    chechIfHaveAccount();
    super.onInit();
  }

  @override
  void onClose() {
    errorController!.close();
    super.onClose();
  }
}
