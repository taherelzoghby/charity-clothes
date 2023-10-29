// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donation/core/services/firebase/firebase_auth/delete_account.dart';
import 'package:donation/core/services/firebase/firebase_auth/sign_out.dart';
import 'package:donation/core/services/firebase/firebase_auth/signin_phone.dart';
import 'package:donation/core/services/firebase/firestore/firestore.dart';
import 'package:donation/features/connect_us/data/auth_repo/auth_connect_us_repo.dart';

class AuthConnectUsRepoImplementation extends AuthConnectUsRepo {
  SignOutPhone signOutPhone;
  DeleteAccount deleteAccount;
  FireStore fireStore;
  SignInPhone signInPhone;

  AuthConnectUsRepoImplementation({
    required this.signOutPhone,
    required this.deleteAccount,
    required this.fireStore,
    required this.signInPhone,
  });

  @override
  Future<void> signOutWithPhone() async {
    try {
      await signOutPhone.signOut();
    } catch (error) {
      print(error);
    }
  }

  @override
  Future<void> deleteAccountWithPhone({
    required void Function(String, int?) codeSent,
  }) async {
    try {
      await deleteAccount.deleteAccountWithPhone(codeSent: codeSent);
    } catch (error) {
      print(error);
    }
  }

  @override
  Future<void> deleteAllProducts() async {
    try {
      await fireStore.deleteProducts();
    } catch (error) {
      print(error);
    }
  }

  @override
  Future<bool> verifyOtp({required String otp, required String verId}) async {
    try {
      return await signInPhone.verifyOtp(otp: otp, verId: verId);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future deleteAcc() async {
    try {
      await deleteAccount.deleteAccount();
    } catch (error) {
      print(error);
    }
  }
}
