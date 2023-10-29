import 'package:donation/core/helper/overlay_helper.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

Future<bool> handleLocationPermission(BuildContext context) async {
  bool serviceEnabled;
  // bool? settings;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    //OverlayHelper.showWarningToast(Get.overlayContext!, 'location disable');
    return false;
  }
  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // ignore: use_build_context_synchronously
      OverlayHelper.showWarningToast(
        Get.overlayContext!,
        'Location permissions are denied',
      );
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    // ignore: use_build_context_synchronously

    OverlayHelper.showWarningToast(
      Get.overlayContext!,
      'Location permissions are permanently denied, we cannot request permissions.',
    );
    return false;
  }
  return true;
}
//
// void _openLocationPermissionSettings() async {
//   final PackageInfo packageInfo = await PackageInfo.fromPlatform();
//   final isPermissionGranted = await Permission.location.status.isGranted;
//
//   if (!isPermissionGranted) {
//     // Location permission is not granted. Display a message or handle the error.
//     // For example:
//     // ScaffoldMessenger.of(context).showSnackBar(
//     //   SnackBar(content: Text('Location permission is required.')),
//     // );
//     return;
//   }
//
//   if (packageInfo.packageName == 'com.android.settings') {
//     // Open the location permission settings on Android.
//     await PermissionHandler().openAppSettings();
//   } else {
//     // Open the app settings on iOS.
//     await PermissionHandler().openSettings();
//   }
// }}
