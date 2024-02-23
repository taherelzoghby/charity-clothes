import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation/core/consts/route.dart';
import 'package:donation/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading_widget.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    this.height,
    this.width,
    required this.image,
  }) : super(key: key);
  final double? height;
  final double? width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(imageViewPath, arguments: image),
      child: Container(
        height: height,
        width: width,
        decoration: AppConsts.decorationImage,
        child: Hero(
          tag: image,
          child: ClipRRect(
            borderRadius: AppConsts.radius15,
            child: CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const LoadingWidget(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
