// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donation/core/helper/cache_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:donation/core/consts/route.dart';
import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/helper/overlay_helper.dart';
import 'package:donation/core/services/firebase/firebase_auth/auth_firebase.dart';

class SignInPhone {
  FireAuth fireAuth;

  SignInPhone({required this.fireAuth});

  String? verificationId;
  int? resendTokens;

  ///sign in with phone number
  Future<void> sendOtpWithPhone({
    required String phoneNumber,
    required String name,
    required void Function(String, int?) codeSent,
  }) async {
    try {
      await fireAuth.firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await fireAuth.firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Verification failed: ${e.message}');
          if (e.code == 'invalid-phone-number') {
            OverlayHelper.showWarningToast(
              Get.overlayContext!,
              StringsEn.providedNumIsNotValid.tr,
            );
          } else {
            OverlayHelper.showWarningToast(Get.overlayContext!, e.message!);
          }
        },
        codeSent: codeSent,
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      OverlayHelper.showWarningToast(
        Get.overlayContext!,
        StringsEn.someThingOccur.tr,
      );
    }
  }

  ///verify otp
  Future<bool> verifyOtp({required String otp, required String verId}) async {
    // Update the UI - wait for the user to enter the SMS code
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verId,
      smsCode: otp,
    );

    // Sign the user in (or link) with the credential
    UserCredential credUser =
        await fireAuth.firebaseAuth.signInWithCredential(credential);
    return credUser.user == null ? false : true;
  }
}
