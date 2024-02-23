
import 'package:donation/core/consts/assets.dart';
import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/services/localiziation_services/localization_services.dart';
import 'package:donation/core/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PopUbWidget extends StatefulWidget {
  const PopUbWidget({super.key});

  @override
  State<PopUbWidget> createState() => _PopUbWidgetState();
}

class _PopUbWidgetState extends State<PopUbWidget> {
  final cont = Get.find<LocalizationsServices>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return PopupMenuButton(
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
                  cont.changeLocale(
                    cont.lang.value == 'ar' ? 'en' : 'ar',
                  );
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
                cont.lang.value == 'ar' ? AppAssets.us : AppAssets.egypt,
                height: size.height * .02,
              ),
              SizedBox(width: size.width * .02),

              ///english or arabic
              Text(
                cont.lang.value == 'ar'
                    ? StringsEn.English.tr
                    : StringsEn.Arabic.tr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
