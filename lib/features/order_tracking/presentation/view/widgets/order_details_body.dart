import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/helper/cache_helper.dart';
import 'package:donation/core/models/item_model.dart';
import 'package:donation/core/widgets/tile_text.dart';
import 'package:donation/features/order_tracking/presentation/view/widgets/section_address.dart';
import 'package:donation/features/order_tracking/presentation/view/widgets/section_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderDetailsBody extends StatelessWidget {
  const OrderDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ItemModel item = Get.arguments;
    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///customer name
          TileText(
            first: StringsEn.customerName.tr,

            ///todo
            second: CacheHelper.getData(key: StringsEn.name) ?? 'Unknown',
          ),
          SizedBox(height: size.height * .02.h),

          ///phone number
          TileText(
            first: StringsEn.phoneNumber.tr,

            ///todo
            second: CacheHelper.getData(key: StringsEn.phoneNumber) ??
                '000000000000',
          ),
          SizedBox(height: size.height * .02.h),

          ///address
          SectionAddress(
            address: item.address!.address!,
            apartmentNumber: item.address!.apartmentNumber!,
            specialMarque: item.address!.areaNumber!,
          ),
          SizedBox(height: size.height * .02.h),

          ///info
          SectionInfo(item: item),
        ],
      ),
    );
  }
}
