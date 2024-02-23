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
      padding: AppConsts.padding8,
      child: InkWell(
        onTap: () => launchUr(url: value),
        borderRadius: AppConsts.radius15,
        child: AspectRatio(
          aspectRatio: AppConsts.aspect20on2,
          child: Container(
            decoration: AppConsts.decoration.copyWith(
              color: AppConsts.white,
              borderRadius: BorderRadius.circular(15.sp),
              boxShadow: AppConsts.boxShadows,
            ),
            child: Center(
              child: Padding(
                padding: AppConsts.mainPadding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///icon
                    Expanded(
                      flex: 1,
                      child: Icon(icon, color: AppConsts.mainColor),
                    ),
                    SizedBox(width: size.width * .025.w),

                    ///value
                    Expanded(
                      flex: 12,
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
        ),
      ),
    );
  }
}
