// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/helper/cache_helper.dart';
import 'package:donation/features/auth_donate_clothes/data/auth_repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:donation/core/consts/route.dart';
import 'package:donation/core/helper/overlay_helper.dart';
import 'package:donation/features/auth_donate_clothes/data/auth_repo/auth_repo_implementation.dart';

class OtpController extends GetxController {
  AuthRepo authRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController;
  TextEditingController textEditingController = TextEditingController();
  String? code;

  OtpController({required this.authRepo});

  final isLoading = false.obs;

  @override
  void onInit() {
    errorController = StreamController<ErrorAnimationType>();
    super.onInit();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  onChanged(value) {
    debugPrint(value);
    code = value;
    update();
  }

  onSubmtted(value) {
    debugPrint(value);
    code = value;
    update();
  }

  verifyLogin({
    required String verId,
    required String name,
    required String phone,
  }) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      try {
        // conditions for validating
        if (code!.length != 6) {
          errorController!.add(
            ErrorAnimationType.shake,
          );
        } else {
          ///verify otp
          await authRepo.verifyOtp(otp: code!, verId: verId);
          print("id : $verId");

          ///save data
          await CacheHelper.saveData(key: StringsEn.id, value: verId);
          await CacheHelper.saveData(key: StringsEn.name, value: name);
          await CacheHelper.saveData(key: StringsEn.phoneNumber, value: phone);

          ///navigate to Home
          Get.offAllNamed(bottomNavPath);
        }
      } catch (e) {
        OverlayHelper.showWarningToast(
          Get.overlayContext!,
          'error occurred',
        );
      }
      isLoading.value = false;
    }
  }
}
