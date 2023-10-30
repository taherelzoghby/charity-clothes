import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/services/service_locator.dart';
import 'package:donation/core/widgets/dialog.dart';
import 'package:donation/features/auth_donate_clothes/data/auth_repo/auth_repo_implementation.dart';
import 'package:donation/features/connect_us/data/auth_repo/auth_connect_us_repo_implementation.dart';
import 'package:donation/features/connect_us/presentation/view/widgets/connectus_body.dart';
import 'package:donation/features/connect_us/presentation/view_model/connect_us_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/consts/assets.dart';

class ConnectUsView extends StatelessWidget {
  const ConnectUsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      ConnectUsController(
        authConnectUsRepo: getIt.get<AuthConnectUsRepoImplementation>(),
        authRepo: getIt.get<AuthRepoImplementation>(),
      ),
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConsts.mainColor,
        title: Text(
          StringsEn.connectUs.tr,
          style: AppConsts.style18,
        ),
        centerTitle: true,
        actions: [
          ///settings
          GetBuilder(
            init: ConnectUsController(
              authConnectUsRepo: getIt.get<AuthConnectUsRepoImplementation>(),
              authRepo: getIt.get<AuthRepoImplementation>(),
            ),
            builder: (cont) => PopupMenuButton(
              position: PopupMenuPosition.under,
              icon: const Icon(Icons.settings),
              onSelected: (val) {
                if (val == 0) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialogWidget(
                        contentText: StringsEn.questionLang.tr,
                        confirmFunction: () {
                          ///change language
                          cont.changeLanguage(
                              code: cont.currentLang == 'ar' ? 'en' : 'ar');
                        },
                        declineFunction: () => Get.back(),
                        confirmText: StringsEn.yes.tr,
                        cancelText: StringsEn.no.tr,
                      );
                    },
                  );
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Row(
                    children: [
                      ///image
                      SvgPicture.asset(
                        cont.currentLang == 'ar'
                            ? AppAssets.us
                            : AppAssets.egypt,
                        height: size.height * .02,
                      ),
                      SizedBox(width: size.width * .02),

                      ///english or arabic
                      Text(
                        cont.currentLang == 'ar'
                            ? StringsEn.English.tr
                            : StringsEn.Arabic.tr,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: const ConnectUsBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(StringsEn.feedback.tr),
        icon: const Icon(Icons.feedback),
        backgroundColor: AppConsts.mainColor,
        foregroundColor: AppConsts.white,
      ),
    );
  }
}
