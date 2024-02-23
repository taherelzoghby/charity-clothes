import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/widgets/customButton.dart';
import 'package:donation/core/widgets/loading_widget.dart';
import 'package:donation/features/add_info_page/presentation/view/widgets/add_image_section.dart';
import 'package:donation/features/add_info_page/presentation/view/widgets/add_info_section.dart';
import 'package:donation/features/add_info_page/presentation/view_model/add_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddInfoBody extends StatefulWidget {
  const AddInfoBody({super.key});

  @override
  State<AddInfoBody> createState() => _AddInfoBodyState();
}

class _AddInfoBodyState extends State<AddInfoBody> {
  final cont = Get.find<AddInfoController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => cont.isLoadingSubmitted.value
          ? const LoadingWidget()
          : Form(
              key: cont.formKey,
              child: Padding(
                padding: AppConsts.mainPadding,
                child: ListView(
                  children: [
                    const AspectRatio(aspectRatio: AppConsts.aspect16on1),

                    ///select Image from Phone
                    const AddImageSection(),
                    const AspectRatio(aspectRatio: AppConsts.aspect16on1),

                    /// add info
                    const AddInfoSection(),
                    const AspectRatio(aspectRatio: AppConsts.aspect16on2),

                    ///submit
                    Padding(
                      padding: AppConsts.mainPadding,
                      child: AspectRatio(
                        aspectRatio: AppConsts.aspectRatioButtonAuth,
                        child: CustomButton(
                          text: StringsEn.submit.tr,
                          onTap: () => cont.addToFirebase(),
                        ),
                      ),
                    ),
                    const AspectRatio(aspectRatio: AppConsts.aspect16on2),
                  ],
                ),
              ),
            ),
    );
  }
}
