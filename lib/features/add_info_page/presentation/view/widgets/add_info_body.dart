import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/widgets/customButton.dart';
import 'package:donation/core/widgets/loading_widget.dart';
import 'package:donation/features/add_info_page/presentation/view/widgets/add_image_section.dart';
import 'package:donation/features/add_info_page/presentation/view/widgets/add_info_section.dart';
import 'package:donation/features/add_info_page/presentation/view_model/add_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddInfoBody extends StatelessWidget {
  const AddInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cont = Get.find<AddInfoController>();
    return Obx(
      () => cont.isLoadingSubmitted.value
          ? const LoadingWidget()
          : Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Form(
                key: cont.formKey,
                child: ListView(
                  children: [
                    ///select Image from Phone
                    const AddImageSection(),
                    SizedBox(height: size.height * .04.h),

                    /// add info
                    const AddInfoSection(),
                    SizedBox(height: size.height * .04.h),

                    ///submit
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: AspectRatio(
                        aspectRatio: (.5 / .07).sp,
                        child: CustomButton(
                          text: StringsEn.submit.tr,
                          onTap: () => cont.addToFirebase(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
