// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:donation/core/consts/assets.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/features/add_info_page/presentation/view/widgets/bootom_sheet_widget.dart';
import 'package:donation/features/add_info_page/presentation/view_model/add_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddImageSection extends StatelessWidget {
  const AddImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddInfoController>();
    return AspectRatio(
      aspectRatio: (2 / 1.5).sp,
      child: InkWell(
        onTap: () {
          Get.bottomSheet(
            BottomSheetWidget(
              onTapGallery: () {
                controller.pickedPhotoFromGallery();
                Get.back();
              },
              onTapCamera: () {
                controller.pickedPhotoFromCamera();
                Get.back();
              },
            ),
            backgroundColor: AppConsts.sWhite.withOpacity(.7),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            border: Border.all(
              color: AppConsts.mainColor,
            ),
          ),
          child: Center(
            child: Obx(
              () => controller.image.value.isEmpty
                  ? AspectRatio(
                      aspectRatio: (1 / .5).sp,
                      child: Image.asset(
                        AppAssets.addImage,
                        color: AppConsts.mainColor,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.file(
                        File(controller.image.value),
                        fit: BoxFit.fill,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
