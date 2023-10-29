import 'package:donation/core/consts/style.dart';
import 'package:donation/core/helper/launchUrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TileLauncherUrl extends StatelessWidget {
  const TileLauncherUrl({
    super.key,
    required this.icon,
    required this.value,
  });

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(5.sp),
      child: InkWell(
        onTap: () => launchUr(url: value),
        borderRadius: BorderRadius.circular(15.sp),
        child: Container(
          height: size.height * .05.h,
          width: size.width * .9.w,
          decoration: AppConsts.decoration.copyWith(
            color: AppConsts.white,
            borderRadius: BorderRadius.circular(15.sp),
            boxShadow: AppConsts.boxShadows,
          ),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: size.width * .01.w),

                ///icon
                Icon(icon, color: AppConsts.mainColor),
                SizedBox(width: size.width * .025.w),

                ///value
                SizedBox(
                  width: size.width * .7.w,
                  child: Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
