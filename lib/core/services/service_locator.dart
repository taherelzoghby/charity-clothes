import 'package:donation/core/services/firebase/firebase_auth/auth_firebase.dart';
import 'package:donation/core/services/firebase/firebase_auth/delete_account.dart';
import 'package:donation/core/services/firebase/firebase_auth/sign_out.dart';
import 'package:donation/core/services/firebase/firebase_auth/signin_phone.dart';
import 'package:donation/core/services/firebase/firebase_storage/firebase_storage.dart';
import 'package:donation/core/services/firebase/firestore/firestore.dart';
import 'package:donation/features/add_info_page/data/repo/add_info_repo_implementation.dart';
import 'package:donation/features/auth_donate_clothes/data/auth_repo/auth_repo_implementation.dart';
import 'package:donation/features/connect_us/data/auth_repo/auth_connect_us_repo_implementation.dart';
import 'package:donation/features/order_tracking/data/repo/order_tracking_repo_implementation.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  ///FireAuth
  getIt.registerSingleton<FireAuth>(FireAuth());

  ///Firestore
  getIt.registerSingleton<FireStore>(
    FireStore(
      auth: getIt.get<FireAuth>(),
    ),
  );

  ///FireStorage
  getIt.registerSingleton<FireStorage>(FireStorage());

  /// sign in phone
  getIt.registerSingleton<SignInPhone>(
    SignInPhone(
      fireAuth: getIt.get<FireAuth>(),
    ),
  );

  /// sign out phone
  getIt.registerSingleton<SignOutPhone>(
    SignOutPhone(
      fireAuth: getIt.get<FireAuth>(),
    ),
  );

  ///  auth repo implementation
  getIt.registerSingleton<AuthRepoImplementation>(
    AuthRepoImplementation(
      signInPhone: getIt.get<SignInPhone>(),
    ),
  );

  ///  delete account
  getIt.registerSingleton<DeleteAccount>(
    DeleteAccount(
      fireAuth: getIt.get<FireAuth>(),
    ),
  );

  ///  auth sign out repo implementation
  getIt.registerSingleton<AuthConnectUsRepoImplementation>(
    AuthConnectUsRepoImplementation(
      signOutPhone: getIt.get<SignOutPhone>(),
      deleteAccount: getIt.get<DeleteAccount>(),
      fireStore: getIt.get<FireStore>(),
      signInPhone: getIt.get<SignInPhone>(),
    ),
  );

  ///  order tracking  repo implementation
  getIt.registerSingleton<OrderTrackingRepoImplementation>(
    OrderTrackingRepoImplementation(
      fireStore: getIt.get<FireStore>(),
    ),
  );

  ///  add info  repo implementation
  getIt.registerSingleton<AddInfoRepoImplementation>(
    AddInfoRepoImplementation(
      fireStore: getIt.get<FireStore>(),
      fireStorage: getIt.get<FireStorage>(),
    ),
  );
}
