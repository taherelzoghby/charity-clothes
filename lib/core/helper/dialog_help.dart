import 'package:donation/core/consts/style.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<dynamic> customDialog({
  required String title,
  required String textConfirm,
  required void Function() onConfirm,
  required void Function() onCancel,
  Widget content = const Center(),
}) {
  return Get.defaultDialog(
    titlePadding: EdgeInsets.all(15.sp),
    title: title,
    content: content,
    titleStyle: AppConsts.style18.copyWith(color: AppConsts.black),
    onConfirm: onConfirm,
    onCancel: onCancel,
    confirmTextColor: AppConsts.mainColor,
    buttonColor: AppConsts.white,
    textConfirm: textConfirm,
  );
}
