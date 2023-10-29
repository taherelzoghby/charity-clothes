abstract class AuthRepo {
  ///sign in with phone number
  Future<void> signIn({
    required String phoneNumber,
    required String name,
    required void Function(String, int?) codeSent,
  });

  ///verify Otp
  Future<bool> verifyOtp({required String otp, required String verId});
}
