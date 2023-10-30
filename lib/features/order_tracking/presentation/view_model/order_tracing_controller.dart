// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/helper/overlay_helper.dart';
import 'package:donation/core/models/item_model.dart';
import 'package:donation/features/order_tracking/data/repo/order_tracking_repo.dart';
import 'package:get/get.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class OrderTrackingController extends GetxController {
  OrderTrackingRepo orderTrackingRepo;

  OrderTrackingController({required this.orderTrackingRepo});

  final items = <ItemModel>[].obs;
  final isLoading = false.obs;
  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  onRefresh() async {
    await getData();
    refreshController.refreshCompleted();
  }

  onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.loadComplete();
  }

  ///get data from firestore
  getData() async {
    ///clear data in items List
    items.clear();
    isLoading.value = true;
    try {
      await orderTrackingRepo.getData().then(
        (value) {
          if (value.isNotEmpty) {
            items.assignAll(value);
          }
        },
      );
    } catch (e) {
      print(e.toString());
    }
    isLoading.value = false;
    update();
  }

  ///delete product with id
  delete({required int id}) {
    print(id);
    try {
      orderTrackingRepo.deleteProduct(id: id);
      OverlayHelper.showSuccessToast(
        Get.overlayContext!,
        StringsEn.successfulDeleted.tr,
      );
      getData();
      Get.back();
    } catch (e) {
      OverlayHelper.showWarningToast(
        Get.overlayContext!,
        StringsEn.someThingOccur.tr,
      );
    }
  }

  @override
  void onReady() {
    getData();
    super.onReady();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
}
