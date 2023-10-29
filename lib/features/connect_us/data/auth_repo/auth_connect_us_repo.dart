abstract class AuthConnectUsRepo {
  ///sign out with phone number
  Future<void> signOutWithPhone();

  ///delete account with phone number
  Future<void> deleteAccountWithPhone({
    required void Function(String, int?) codeSent,
  });

  ///delete account
  Future deleteAcc();

  ///delete all products
  Future<void> deleteAllProducts();

  ///verify Otp
  Future<bool> verifyOtp({required String otp, required String verId});
}
