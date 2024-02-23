
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/consts/assets.dart';
import '../../../../../core/consts/style.dart';
import '../../../../../core/widgets/carousel_options.dart';

class SectionCarouselSlider extends StatelessWidget {
  const SectionCarouselSlider({super.key, this.onPageChanged});

  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: AppConsts.aspect13on10,
      child: CarouselSlider(
        items: AppAssets.images
            .map(
              (image) => AspectRatio(
            aspectRatio: AppConsts.aspect13on10,
            child: Container(
              decoration: AppConsts.decoration,
              child: Image.asset(image, fit: BoxFit.fill),
            ),
          ),
        )
            .toList(),
        options: carouselOption(
          size.height,
          onPageChanged: onPageChanged,
        ),
      ),
    );
  }
}
