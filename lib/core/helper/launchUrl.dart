import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/helper/overlay_helper.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUr({required String url}) async {
  if (url.startsWith('+20') || url.startsWith('010')) {
    if (!await launchUrl(Uri.parse('tel:$url'),
        mode: LaunchMode.externalApplication)) {
      OverlayHelper.showWarningToast(
        Get.context!,
        StringsEn.someThingOccur.tr,
      );
    }
  } else if (url.contains('@')) {
    if (!await launchUrl(Uri.parse('mailto:$url'),
        mode: LaunchMode.externalApplication)) {
      OverlayHelper.showWarningToast(
        Get.context!,
        StringsEn.someThingOccur.tr,
      );
    }
  } else {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      OverlayHelper.showWarningToast(
        Get.context!,
        StringsEn.someThingOccur.tr,
      );
    }
  }
}
