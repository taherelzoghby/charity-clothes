// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:country_code_picker/country_code_picker.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/helper/code_picker.dart';
import 'package:donation/core/services/service_locator.dart';
import 'package:donation/core/widgets/text_form_field.dart';
import 'package:donation/features/auth_donate_clothes/data/auth_repo/auth_repo_implementation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:donation/core/consts/assets.dart';
import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/widgets/customButton.dart';
import 'package:donation/features/auth_donate_clothes/presenation/view_model/login_controller.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginDonateBody extends StatefulWidget {
  const LoginDonateBody({super.key});

  @override
  State<LoginDonateBody> createState() => _LoginDonateBodyState();
}

class _LoginDonateBodyState extends State<LoginDonateBody> {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        progressIndicator: const CupertinoActivityIndicator(
          color: AppConsts.mainColor,
        ),
        inAsyncCall: controller.isLoading.value,
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: AppConsts.mainPadding,
            child: ListView(
              children: [
                const AspectRatio(aspectRatio: AppConsts.aspect16on1),

                ///image
                AspectRatio(
                  aspectRatio: AppConsts.aspect16on14,
                  child: SvgPicture.asset(AppAssets.loginSvg, fit: BoxFit.fill),
                ),
                const AspectRatio(aspectRatio: AppConsts.aspect16on2),

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
                      padding: AppConsts.padding8,
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
                const AspectRatio(aspectRatio: AppConsts.aspect16on1),

                ///name
                CustomTextFormField(
                  hint: StringsEn.name.tr,
                  onSaved: (String? value) => controller.onSavedName(value!),
                ),
                const AspectRatio(aspectRatio: AppConsts.aspect16on2),

                ///login button
                AspectRatio(
                  aspectRatio: AppConsts.aspectRatioButtonAuth,
                  child: CustomButton(
                    text: StringsEn.login.tr,
                    onTap: () => controller.signInWithPhone(),
                  ),
                ),
                const AspectRatio(aspectRatio: AppConsts.aspect16on2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
