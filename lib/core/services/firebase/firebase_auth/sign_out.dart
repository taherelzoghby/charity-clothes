// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donation/core/services/firebase/firebase_auth/auth_firebase.dart';

class SignOutPhone {
  FireAuth fireAuth;
  SignOutPhone({required this.fireAuth});
  String? verificationId;

  ///signOut
  signOut() async {
    await fireAuth.firebaseAuth.signOut();
  }
}
