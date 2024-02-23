import 'package:donation/core/consts/route.dart';
import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/services/service_locator.dart';
import 'package:donation/core/widgets/custom_button_icon.dart';
import 'package:donation/core/widgets/text_field.dart';
import 'package:donation/core/widgets/text_form_field.dart';
import 'package:donation/features/add_info_page/presentation/view_model/add_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/repo/add_info_repo_implementation.dart';

class AddInfoSection extends StatelessWidget {
  const AddInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder(
      init: AddInfoController(
        addInfoRepo: getIt.get<AddInfoRepoImplementation>(),
      ),
      builder: (cont) => Column(
        children: [
          ///add number of pieces
          CustomTextFormField(
            hint: StringsEn.numberOfPieces.tr,
            onChanged: (String? value) => cont.changeNofPieces(value!),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          ///add address
          CustomTextField(
            hint: cont.totalAddress.isEmpty
                ? StringsEn.address.tr
                : cont.totalAddress.tr,
            readOnly: true,
            perfixIcon: IconButton(
              onPressed: () => Get.toNamed(enterAddressPath),
              icon: const Icon(Icons.location_on),
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          ///select date - time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(StringsEn.deliveryTime.tr, style: AppConsts.style14),
                  CustomButtonIcon(
                    widget: cont.selectedTime == null
                        ? Icon(
                            Icons.timer,
                            color: AppConsts.grey,
                            size: size.height * .05.h,
                          )
                        : Text(
                            cont.selectedTime!.format(context).tr,
                          ),
                    onTap: () => cont.selectTimeFunc(context),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(StringsEn.deliveryDate.tr, style: AppConsts.style14),
                  CustomButtonIcon(
                    widget: cont.selectedDate == null
                        ? Icon(
                            Icons.date_range,
                            color: AppConsts.grey,
                            size: size.height * .05.h,
                          )
                        : Text(
                            DateFormat(StringsEn.dateFormat)
                                .format(cont.selectedDate!)
                                .tr,
                          ),
                    onTap: () => cont.selectDateFunc(context),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
