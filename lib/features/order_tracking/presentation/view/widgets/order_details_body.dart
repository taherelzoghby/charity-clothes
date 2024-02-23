import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/helper/cache_helper.dart';
import 'package:donation/core/models/item_model.dart';
import 'package:donation/core/widgets/tile_text.dart';
import 'package:donation/features/order_tracking/presentation/view/widgets/section_address.dart';
import 'package:donation/features/order_tracking/presentation/view/widgets/section_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OrderDetailsBody extends StatefulWidget {
  const OrderDetailsBody({super.key});

  @override
  State<OrderDetailsBody> createState() => _OrderDetailsBodyState();
}

class _OrderDetailsBodyState extends State<OrderDetailsBody> {
  ItemModel item = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConsts.mainPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          ///customer name
          TileText(
            first: StringsEn.customerName.tr,

            ///todo
            second: CacheHelper.getData(key: StringsEn.name) ?? 'Unknown',
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          ///phone number
          TileText(
            first: StringsEn.phoneNumber.tr,

            ///todo
            second: CacheHelper.getData(key: StringsEn.phoneNumber) ??
                '000000000000',
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          ///address
          SectionAddress(
            address: item.address!.address!,
            apartmentNumber: item.address!.apartmentNumber!,
            specialMarque: item.address!.areaNumber!,
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          ///info
          SectionInfo(item: item),
        ],
      ),
    );
  }
}
