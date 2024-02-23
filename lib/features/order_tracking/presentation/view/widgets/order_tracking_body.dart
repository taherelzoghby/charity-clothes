import 'package:donation/core/consts/style.dart';
import 'package:donation/core/services/service_locator.dart';
import 'package:donation/core/widgets/empty_widget.dart';
import 'package:donation/core/widgets/loading_widget.dart';
import 'package:donation/features/order_tracking/presentation/view/widgets/data_list_view.dart';
import 'package:donation/features/order_tracking/presentation/view_model/order_tracing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/repo/order_tracking_repo_implementation.dart';

class OrderTrackingBody extends StatefulWidget {
  const OrderTrackingBody({super.key});

  @override
  State<OrderTrackingBody> createState() => _OrderTrackingBodyState();
}

class _OrderTrackingBodyState extends State<OrderTrackingBody> {
  final OrderTrackingController cont = Get.put(
    OrderTrackingController(
      orderTrackingRepo: getIt.get<OrderTrackingRepoImplementation>(),
    ),
  );

  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  onRefresh() async {
    await cont.getData();
    refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      onRefresh: () => onRefresh(),
      controller: refreshController,
      header: const WaterDropHeader(
        waterDropColor: AppConsts.mainColor,
      ),
      child: Obx(
        () => cont.isLoading.value
            ? const LoadingWidget()

            ///if no data
            : cont.items.isEmpty
                ? const EmptyWidget()

                ///hava data
                : DataListView(items: cont.items),
      ),
    );
  }
}
