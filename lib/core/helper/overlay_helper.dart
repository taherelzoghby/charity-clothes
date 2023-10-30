import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/helper/snack_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverlayHelper {
  static final Map<int, OverlayEntry?> lastOverlays = {};

  static const int defaultDuration = 5;
  static Color successColor = AppConsts.grey;
  static Color errorColor = AppConsts.red;
  static Color infoColor = const Color(0xffE3ECF7);
  static Color warningColor = AppConsts.red.withOpacity(.5);
  static Color generalColor = const Color(0xFFEEEDF2);

  static void showSuccessToast(BuildContext context, String text,
      {int seconds = 10}) {
    showSnackBar(
      StringsEn.success.tr, text,
      context: context,
      color: successColor,
      //iconSVG: AssetImages.success,
      durationInSeconds: seconds,
    );
  }

  static void showGeneralToast(
      BuildContext context, String title, String message,
      {int seconds = 10, VoidCallback? onTap}) {
    showSnackBar(
      title,
      message,
      context: context,
      color: generalColor,
      //iconSVG: AssetImages.infoIcon,
      onTap: onTap,
      durationInSeconds: seconds,
    );
  }

  static void showErrorToast(BuildContext context, String text,
      {int seconds = 10}) {
    showSnackBar(
      StringsEn.error.tr, text,
      context: context,
      color: errorColor,
      //iconSVG: AssetImages.errorIcon,
      durationInSeconds: seconds,
    );
  }

  static void showInfoToast(BuildContext context, String text,
      {int seconds = 10}) {
    showSnackBar(
      StringsEn.information.tr, text,
      context: context,
      color: infoColor,
      //iconSVG: AssetImages.infoIcon,
      durationInSeconds: seconds,
    );
  }

  static void showWarningToast(BuildContext context, String text,
      {int seconds = 10}) {
    showSnackBar(
      StringsEn.warning.tr, text,
      context: context,
      color: warningColor,
      //iconSVG: AssetImages.warning,
      durationInSeconds: seconds,
    );
  }

  // progress methods
  // layer index 1 is preserved for the progress indicator
}
