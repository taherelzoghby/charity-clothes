import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/enter_address_body.dart';

class EnterAddressPage extends StatelessWidget {
  const EnterAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppConsts.sWhite,
          ),
        ),
        title: Text(
          StringsEn.enterAddressDetails.tr,
          style: AppConsts.style18,
        ),
        centerTitle: true,
        backgroundColor: AppConsts.mainColor,
      ),
      body: const SafeArea(
        child: EnterAddressBody(),
      ),
    );
  }
}
