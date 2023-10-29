import 'package:donation/core/consts/style.dart';
import 'package:donation/core/services/service_locator.dart';
import 'package:donation/core/widgets/loading_dialog.dart';
import 'package:donation/features/auth_donate_clothes/data/auth_repo/auth_repo_implementation.dart';
import 'package:donation/features/connect_us/data/auth_repo/auth_connect_us_repo_implementation.dart';
import 'package:donation/features/connect_us/presentation/view_model/connect_us_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    super.key,
    required this.contentText,
    required this.confirmFunction,
    required this.declineFunction,
    required this.confirmText,
    required this.cancelText,
  });

  final String contentText;
  final void Function() confirmFunction;
  final void Function() declineFunction;
  final String confirmText;
  final String cancelText;

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: Get.put(
        ConnectUsController(
          authConnectUsRepo: getIt.get<AuthConnectUsRepoImplementation>(),
          authRepo: getIt.get<AuthRepoImplementation>(),
        ),
      ),
      builder: (cont) {
        return cont.isLoading.value
            ? const LoadingDialog()
            : AlertDialog(
                content: Text(contentText),
                actions: [
                  TextButton(
                    onPressed: declineFunction,
                    child: Text(
                      cancelText,
                      style: AppConsts.style16.copyWith(color: AppConsts.red),
                    ),
                  ),
                  TextButton(
                    onPressed: confirmFunction,
                    child: Text(
                      confirmText,
                      style: AppConsts.style16
                          .copyWith(color: AppConsts.mainColor),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
