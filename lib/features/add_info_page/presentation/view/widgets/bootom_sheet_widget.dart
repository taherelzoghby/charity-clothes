import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    Key? key,
    required this.onTapGallery,
    required this.onTapCamera,
  }) : super(key: key);
  final void Function() onTapGallery;
  final void Function() onTapCamera;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: AppConsts.aspect16on5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: size.width * .1.w),
          Padding(
            padding: AppConsts.padding35V,
            child: CustomButton(
              text: StringsEn.fromGallery.tr,
              onTap: onTapGallery,
            ),
          ),
          SizedBox(width: size.width * .1.w),
          Padding(
            padding: AppConsts.padding35V,
            child: CustomButton(
              text: StringsEn.fromCamera.tr,
              onTap: onTapCamera,
            ),
          ),
          SizedBox(width: size.width * .1.w),
        ],
      ),
    );
  }
}
