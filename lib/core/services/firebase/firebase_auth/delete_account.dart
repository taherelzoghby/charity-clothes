// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/helper/cache_helper.dart';
import 'package:donation/core/helper/overlay_helper.dart';
import 'package:donation/core/services/firebase/firebase_auth/auth_firebase.dart';

class DeleteAccount {
  FireAuth fireAuth;

  DeleteAccount({required this.fireAuth});

  ///delete account
  deleteAccount() async {
    User? user = fireAuth.firebaseAuth.currentUser;
    if (user != null) {
      // Delete the user account
      await user.delete();
      print('-------------User account deleted-----------------');
    } else {
      print('------------------User not found----------------');
    }
  }

  ///delete account with phone
  deleteAccountWithPhone({
    required void Function(String, int?) codeSent,
  }) async {
    print("${CacheHelper.getData(key: StringsEn.phoneNumber)}");
    try {
      await fireAuth.firebaseAuth.verifyPhoneNumber(
        phoneNumber: CacheHelper.getData(key: StringsEn.phoneNumber),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await fireAuth.firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Verification failed: ${e.message}');
        },
        codeSent: codeSent,
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      OverlayHelper.showWarningToast(Get.overlayContext!, e.toString());
    }
  }
}
