import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/services/localiziation_services/localization_services.dart';
import 'package:donation/core/services/service_locator.dart';
import 'package:donation/core/widgets/dialog.dart';
import 'package:donation/features/auth_donate_clothes/data/auth_repo/auth_repo_implementation.dart';
import 'package:donation/features/connect_us/data/auth_repo/auth_connect_us_repo_implementation.dart';
import 'package:donation/features/connect_us/presentation/view/widgets/connectus_body.dart';
import 'package:donation/features/connect_us/presentation/view/widgets/popup_widget.dart';
import 'package:donation/features/connect_us/presentation/view_model/connect_us_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/consts/assets.dart';

class ConnectUsView extends StatefulWidget {
  const ConnectUsView({super.key});

  @override
  State<ConnectUsView> createState() => _ConnectUsViewState();
}

class _ConnectUsViewState extends State<ConnectUsView> {
  @override
  void initState() {
    Get.put(
      ConnectUsController(
        authConnectUsRepo: getIt.get<AuthConnectUsRepoImplementation>(),
        authRepo: getIt.get<AuthRepoImplementation>(),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConsts.mainColor,
        title: Text(
          StringsEn.connectUs.tr,
          style: AppConsts.style18,
        ),
        centerTitle: true,
        actions: const [
          ///settings
          PopUbWidget(),
        ],
      ),
      body: const SafeArea(
        child: ConnectUsBody(),
      ),
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
