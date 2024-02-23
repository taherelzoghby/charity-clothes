import 'package:donation/core/services/service_locator.dart';
import 'package:donation/features/add_info_page/data/repo/add_info_repo_implementation.dart';
import 'package:donation/features/add_info_page/presentation/view/widgets/add_info_body.dart';
import 'package:donation/features/add_info_page/presentation/view_model/add_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/consts/style.dart';

class AddInfoView extends StatefulWidget {
  const AddInfoView({super.key});

  @override
  State<AddInfoView> createState() => _AddInfoViewState();
}

class _AddInfoViewState extends State<AddInfoView> {
  final cont = Get.put(
    AddInfoController(
      addInfoRepo: getIt.get<AddInfoRepoImplementation>(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: cont.isLoadingSubmitted.value
            ? AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppConsts.mainColor,
              )
            : AppBar(
                leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppConsts.sWhite,
                  ),
                ),
                backgroundColor: AppConsts.mainColor,
              ),
        body: const SafeArea(
          child: AddInfoBody(),
        ),
      ),
    );
  }
}
