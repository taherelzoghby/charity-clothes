import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/services/service_locator.dart';
import 'package:donation/core/widgets/customButton.dart';
import 'package:donation/core/widgets/text_form_field.dart';
import 'package:donation/features/add_info_page/data/repo/add_info_repo_implementation.dart';
import 'package:donation/features/add_info_page/presentation/view/widgets/map_view.dart';
import 'package:donation/features/add_info_page/presentation/view_model/add_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EnterAddressBody extends StatelessWidget {
  const EnterAddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      AddInfoController(
        addInfoRepo: getIt.get<AddInfoRepoImplementation>(),
      ),
    );
    final cont = Get.find<AddInfoController>();
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: ListView(
        children: [
          ///map
          Container(
            height: size.height * .35,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: AppConsts.mainColor,
              ),
            ),
            child: const GoogleMapBody(),
          ),
          SizedBox(height: size.height * .01.h),

          ///current position
          GetBuilder<AddInfoController>(
            init: AddInfoController(
              addInfoRepo: getIt.get<AddInfoRepoImplementation>(),
            ),
            builder: (controller) => Container(
              height: size.height * .05.h,
              width: size.width * .75.w,
              decoration: AppConsts.decorationNormal,
              child: Center(
                child: Text(
                  controller.currentPos!,
                  style: AppConsts.style18,
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * .01.h),

          ///Apartment number - special marque
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hint: StringsEn.apartmentNumber.tr,
                  onChanged: (value) => cont.changeApartmentNumber(value!),
                ),
              ),
              SizedBox(width: size.width * .025.w),
              Expanded(
                child: CustomTextFormField(
                  hint: StringsEn.specialMarque.tr,
                  onChanged: (value) => cont.changeSpecialMarque(value!),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * .05.h),

          ///Enter the address in detail
          CustomTextFormField(
            maxLines: 3,
            hint: StringsEn.addresSDetail.tr,
            onChanged: (value) => cont.changeAddressDetails(value!),
          ),
          SizedBox(height: size.height * .05),

          ///Confirm address
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: AspectRatio(
              aspectRatio: (.5 / .07).sp,
              child: CustomButton(
                text: StringsEn.confirmAddress.tr,
                onTap: () => cont.confirmAddress(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
