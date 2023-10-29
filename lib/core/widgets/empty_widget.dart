import 'package:donation/core/consts/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          SizedBox(height: size.height * .2.h),
          SvgPicture.asset(
            AppAssets.empty,
            fit: BoxFit.fill,
            height: size.height * .3.h,
          ),
        ],
      ),
    );
  }
}
