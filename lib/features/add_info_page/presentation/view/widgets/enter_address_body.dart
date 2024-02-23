import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/services/service_locator.dart';
import 'package:donation/core/widgets/customButton.dart';
import 'package:donation/core/widgets/text_form_field.dart';
import 'package:donation/features/add_info_page/data/repo/add_info_repo_implementation.dart';
import 'package:donation/features/add_info_page/presentation/view/widgets/current_position_widget.dart';
import 'package:donation/features/add_info_page/presentation/view/widgets/map_view.dart';
import 'package:donation/features/add_info_page/presentation/view_model/add_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EnterAddressBody extends StatefulWidget {
  const EnterAddressBody({super.key});

  @override
  State<EnterAddressBody> createState() => _EnterAddressBodyState();
}

class _EnterAddressBodyState extends State<EnterAddressBody> {
  @override
  void initState() {
    Get.put(
      AddInfoController(addInfoRepo: getIt.get<AddInfoRepoImplementation>()),
    );
    super.initState();
  }

  final cont = Get.find<AddInfoController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          ///map
          AspectRatio(
            aspectRatio: AppConsts.aspect16on14,
            child: Container(
              decoration: AppConsts.decorationMapView,
              child: const GoogleMapBody(),
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect40on1),

          ///current position
          GetBuilder<AddInfoController>(
            init: AddInfoController(
              addInfoRepo: getIt.get<AddInfoRepoImplementation>(),
            ),
            builder: (controller) => CurrentPositionWidget(
              currentPosition: controller.currentPos!,
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect40on1),

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
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          ///Enter the address in detail
          CustomTextFormField(
            maxLines: 3,
            hint: StringsEn.addresSDetail.tr,
            onChanged: (value) => cont.changeAddressDetails(value!),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),

          ///Confirm address
          Padding(
            padding: AppConsts.mainPadding,
            child: AspectRatio(
              aspectRatio: AppConsts.aspectRatioButtonAuth,
              child: CustomButton(
                text: StringsEn.confirmAddress.tr,
                onTap: () => cont.confirmAddress(),
              ),
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),
        ],
      ),
    );
  }
}
