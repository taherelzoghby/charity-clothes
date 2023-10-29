import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/widgets/tile_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionAddress extends StatelessWidget {
  const SectionAddress({
    super.key,
    required this.address,
    required this.apartmentNumber,
    required this.specialMarque,
  });

  final String address;
  final String apartmentNumber;
  final String specialMarque;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///address
            TileText(first: StringsEn.address.tr, second: address),

            ///apartmentNumber
            TileText(
              first: StringsEn.apartmentNumber.tr,
              second: apartmentNumber,
            ),

            ///specialMarque
            TileText(
              first: StringsEn.specialMarque.tr,
              second: specialMarque,
            ),
          ],
        ),
        const Icon(Icons.location_on, color: AppConsts.grey),
      ],
    );
  }
}
