import 'package:donation/core/consts/style.dart';
import 'package:donation/core/services/service_locator.dart';
import 'package:donation/core/widgets/empty_widget.dart';
import 'package:donation/core/widgets/loading_widget.dart';
import 'package:donation/features/order_tracking/presentation/view/widgets/item_track.dart';
import 'package:donation/features/order_tracking/presentation/view_model/order_tracing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/repo/order_tracking_repo_implementation.dart';

class OrderTrackingBody extends StatelessWidget {
  const OrderTrackingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: OrderTrackingController(
        orderTrackingRepo: getIt.get<OrderTrackingRepoImplementation>(),
      ),

      ///if loading
      builder: (cont) => SmartRefresher(
        enableTwoLevel: true,
        onRefresh: () => cont.onRefresh(),
        controller: cont.refreshController,
        header: const WaterDropHeader(waterDropColor: AppConsts.mainColor),
        child: cont.isLoading.value
            ? const LoadingWidget()

            ///if no data
            : cont.items.isEmpty
                ? const EmptyWidget()

                ///hava data
                : Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: ItemTrack(item: cont.items[index]),
                          ),
                        ),
                      ),
                      itemCount: cont.items.length,
                    ),
                  ),
      ),
    );
  }
}
