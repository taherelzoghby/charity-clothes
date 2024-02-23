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
      padding: AppConsts.padding8,
      child: AspectRatio(
        aspectRatio: AppConsts.aspect16on8,
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
                  child: Row(
                    children: [
                      ///image
                      Expanded(
                        flex: 2,
                        child: ImageWidget(image: item.imageUrl!),
                      ),
                      SizedBox(width: size.width * .01.w),

                      ///info (date-pieces-status)
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                      ),
                    ],
                  ),
                ),
                const AspectRatio(aspectRatio: AppConsts.aspect40on1),
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
      ),
    );
  }
}
