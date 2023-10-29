import 'package:donation/core/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:donation/core/models/item_model.dart';
import 'package:intl/intl.dart';

import '../../../../../core/consts/strings.dart';
import '../../../../../core/consts/style.dart';
import '../../../../../core/widgets/tile_text.dart';

class SectionInfo extends StatelessWidget {
  const SectionInfo({
    Key? key,
    required this.item,
  }) : super(key: key);
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(6.sp),
      child: Container(
        height: size.height * .21.h,
        width: size.width.w,
        decoration: BoxDecoration(
          color: AppConsts.white,
          borderRadius: BorderRadius.circular(15.sp),
          boxShadow: AppConsts.boxShadowsItemTrack,
        ),
        child: Padding(
          padding: EdgeInsets.all(5.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: size.height * .01.h),

              ///info
              Row(
                children: [
                  ///image
                  ImageWidget(
                    height: size.height * .125.h,
                    width: size.width * .3.w,
                    image: item.imageUrl!,
                  ),
                  SizedBox(width: size.width * .01.w),

                  ///info (date-pieces-status)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///date
                      TileText(
                        first: StringsEn.date.tr,
                        second:
                            "${DateFormat.yMd().format(DateTime.parse(item.date!))} ${item.time!}",
                        siz: .55,
                      ),
                      SizedBox(height: size.height * .01.h),

                      ///number of pieces
                      TileText(
                        first: StringsEn.numberOfPieces.tr,
                        second: item.pieces!,
                        siz: .55,
                      ),
                      SizedBox(height: size.height * .01.h),

                      ///status
                      Row(
                        children: [
                          Text(
                            '${StringsEn.status.tr} :    ',
                            style: AppConsts.style14,
                          ),
                          Text(
                            item.status!,
                            style: AppConsts.style16Green,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: size.height * .005.h),
              const Divider(),

              ///messages
              TileText(
                first: StringsEn.messeges.tr,
                second: StringsEn.noMesseges.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
