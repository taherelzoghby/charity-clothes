// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:donation/core/consts/assets.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/features/add_info_page/presentation/view/widgets/bootom_sheet_widget.dart';
import 'package:donation/features/add_info_page/presentation/view_model/add_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddImageSection extends StatefulWidget {
  const AddImageSection({super.key});

  @override
  State<AddImageSection> createState() => _AddImageSectionState();
}

class _AddImageSectionState extends State<AddImageSection> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddInfoController>();
    return AspectRatio(
      aspectRatio: AppConsts.aspect13on10,
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
          decoration: AppConsts.decorationAddImage,
          child: Center(
            child: Obx(
              () => controller.image.value.isEmpty
                  ? Padding(
                      padding: AppConsts.padding40,
                      child: AspectRatio(
                        aspectRatio: AppConsts.aspect16on14,
                        child: Image.asset(
                          AppAssets.addImage,
                          color: AppConsts.mainColor,
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: AppConsts.radius15,
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
