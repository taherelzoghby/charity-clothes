// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donation/core/helper/dialog_help.dart';
import 'package:donation/core/widgets/image_widget.dart';
import 'package:donation/features/order_tracking/presentation/view_model/order_tracing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:donation/core/consts/route.dart';
import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/models/item_model.dart';

import '../../../../../core/widgets/customButton.dart';

class ItemTrack extends StatelessWidget {
  const ItemTrack({
    Key? key,
    required this.item,
  }) : super(key: key);
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    final cont = Get.find<OrderTrackingController>();

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(6.sp),
      child: AspectRatio(
        aspectRatio: AppConsts.aspect16on10,
        child: Container(
          decoration: AppConsts.decorationItemTrack,
          child: Padding(
            padding: AppConsts.padding8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const AspectRatio(aspectRatio: AppConsts.aspect40on1),

                ///info
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      ///image

                      Expanded(
                        flex: 2,
                        child: ImageWidget(image: item.imageUrl!),
                      ),
                      SizedBox(width: size.width * .03.w),

                      ///info (date-pieces-status)
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ///date-time
                            Text(
                              "${StringsEn.date.tr} : ${DateFormat.yMd().format(DateTime.parse(item.date!))} ${item.time!}",
                              style: AppConsts.styleError,
                            ),
                            SizedBox(height: size.height * .01.h),

                            ///number of pieces
                            Text(
                              '${StringsEn.numberOfPieces.tr} : ${item.pieces}',
                              style: AppConsts.style16,
                            ),
                            SizedBox(height: size.height * .01.h),

                            ///status
                            Row(
                              children: [
                                Text(
                                  '${StringsEn.status.tr} : ',
                                  style: AppConsts.style16,
                                ),
                                Text(
                                  item.status!,
                                  style: AppConsts.style16Green,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const AspectRatio(aspectRatio: AppConsts.aspect40on1),

                ///details button - cancel button
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ///details button
                      Expanded(
                        child: Padding(
                          padding: AppConsts.paddingV12,
                          child: CustomButton(
                            text: StringsEn.details.tr,
                            onTap: () => Get.toNamed(
                              orderDetailsPath,
                              arguments: item,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * .05.w),

                      ///cancel button
                      Expanded(
                        child: Padding(
                          padding: AppConsts.paddingV12,
                          child: CustomButton(
                            text: StringsEn.cancel.tr,
                            isBorder: true,
                            styleText: AppConsts.style18Grey,
                            background: AppConsts.white,

                            ///delete item
                            onTap: () => customDialog(
                              title: 'Do you Want to delete this Item?',
                              textConfirm: 'Delete',
                              onConfirm: () => cont.delete(id: item.idProduct),
                              onCancel: () => Get.back(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
