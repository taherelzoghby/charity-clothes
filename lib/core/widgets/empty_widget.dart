import 'package:donation/core/consts/assets.dart';
import 'package:donation/core/consts/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppConsts.paddingH50,
        child: AspectRatio(
          aspectRatio: AppConsts.aspect13on9,
          child: SvgPicture.asset(AppAssets.empty, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
