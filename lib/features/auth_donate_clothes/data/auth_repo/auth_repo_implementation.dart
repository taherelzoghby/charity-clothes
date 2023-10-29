import 'package:donation/core/services/firebase/firebase_auth/signin_phone.dart';
import 'package:donation/features/auth_donate_clothes/data/auth_repo/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo {
  SignInPhone signInPhone;

  AuthRepoImplementation({required this.signInPhone});

  @override
  Future<void> signIn({
    required String phoneNumber,
    required String name,
    required void Function(String, int?) codeSent,
  }) async {
    try {
      return await signInPhone.sendOtpWithPhone(
        phoneNumber: phoneNumber,
        name: name,
        codeSent: codeSent,
      );
    } catch (error) {
      throw Exception(error.toString());
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
}
