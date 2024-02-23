import 'package:carousel_slider/carousel_slider.dart';
import 'package:donation/core/consts/assets.dart';
import 'package:donation/core/consts/route.dart';
import 'package:donation/core/consts/strings.dart';
import 'package:donation/core/consts/style.dart';
import 'package:donation/core/widgets/customButton.dart';
import 'package:donation/features/gNavBar/presentation/view_model/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import 'carousel_slider_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final cont = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: AppConsts.mainPadding,
      child: ListView(
        children: [
          ///logo
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: size.height * .1.h,
              child: Image.asset(AppAssets.logo, fit: BoxFit.fill),
            ),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          ///CarouselSlider
          SectionCarouselSlider(
            onPageChanged: (int index, CarouselPageChangedReason c) =>
                cont.carsoulChanged(index),
          ),
          const AspectRatio(aspectRatio: AppConsts.aspect16on1),

          ///000
          Obx(
            () => PageViewDotIndicator(
              currentItem: cont.index.value,
              count: AppAssets.images.length,
              unselectedColor: Colors.black26,
              selectedColor: AppConsts.mainColor,
              size: Size(size.width * .06.w, size.height * .008.h),
              unselectedSize: Size(size.width * .02.w, size.height * .01.h),
              alignment: Alignment.center,
              boxShape: BoxShape.rectangle,
              //defaults to circle
              borderRadius: AppConsts.radius5,
              //only for rectangle shape
              onItemClicked: (index) {},
            ),
          ),

          ///
          const AspectRatio(aspectRatio: AppConsts.aspect16on2),

          ///donate clothes button
          AspectRatio(
            aspectRatio: AppConsts.aspectRatioButtonAuth,
            child: CustomButton(
              text: StringsEn.donateClothes.tr,
              onTap: () => Get.toNamed(loginDonatePath),
            ),
          ),
        ],
      ),
    );
  }
}
