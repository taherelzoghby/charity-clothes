import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

carouselOption(
  double height, {
  required dynamic Function(int v, CarouselPageChangedReason c)? onPageChanged,
}) {
  return CarouselOptions(
    height: height,
    viewportFraction: 1,
    initialPage: 0,
    enableInfiniteScroll: true,
    autoPlay: true,
    autoPlayInterval: const Duration(seconds: 3),
    autoPlayAnimationDuration: const Duration(milliseconds: 800),
    autoPlayCurve: Curves.fastOutSlowIn,
    enlargeCenterPage: true,
    enlargeFactor: 1,
    onPageChanged: onPageChanged,
    scrollDirection: Axis.horizontal,
  );
}
