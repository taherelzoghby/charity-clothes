// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:country_code_picker/country_code_picker.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/helper/code_picker.dart';
import 'package:donation/core/services/service_locator.dart';
import 'package:donation/core/widgets/text_form_field.dart';
import 'package:donation/features/auth_donate_clothes/data/auth_repo/auth_repo_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:donation/core/consts/assets.dart';
import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/widgets/customButton.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view_model/login_controller.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginDonateBody extends StatelessWidget {
  const LoginDonateBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.find<LoginController>();
    return Obx(
      () => ModalProgressHUD(
        progressIndicator: const CircularProgressIndicator(
          color: AppConsts.mainColor,
        ),
        inAsyncCall: controller.isLoading.value,
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 25.w,
            ),
            child: ListView(
              children: [
                SizedBox(height: size.height * .02),

                ///image
                SvgPicture.asset(
                  AppAssets.loginSvg,
                  fit: BoxFit.fill,
                  height: size.height * .4,
                ),
                SizedBox(height: size.height * .07),

                ///phone number field
                GetBuilder(
                  init: LoginController(
                    authRepo: getIt.get<AuthRepoImplementation>(),
                  ),
                  builder: (cont) => CustomTextFormField(
                    hint: StringsEn.phoneNumber.tr,
                    perfixText:
                        cont.selectedCountry?.dialCode ?? StringsEn.code.tr,
                    perfixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CodePickerWidget(
                        flagWidth: 25,
                        onChanged: (CountryCode value) =>
                            cont.selectedCo(value),
                        initialSelection: cont.initialCountry,
                        favorite: [cont.initialCountry],
                        showDropDownButton: true,
                        showCountryOnly: true,
                        showOnlyCountryWhenClosed: true,
                        showFlagDialog: true,
                        hideMainText: true,
                        showFlagMain: true,
                        barrierColor: Get.isDarkMode ? AppConsts.black : null,
                        textStyle: AppConsts.stylePhoneNumber,
                      ),
                    ),
                    onSaved: (String? value) => cont.onSavedPhone(value!),
                  ),
                ),
                SizedBox(height: size.height * .02),

                ///name
                CustomTextFormField(
                  hint: StringsEn.name.tr,
                  onSaved: (String? value) => controller.onSavedName(value!),
                ),
                SizedBox(height: size.height * .03),

                ///login button
                SizedBox(
                  height: size.height * .05.h,
                  width: size.width * .05.w,
                  child: CustomButton(
                    text: StringsEn.login.tr,
                    onTap: () => controller.signInWithPhone(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
