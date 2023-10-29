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

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cont = Get.find<HomeController>();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Column(
          children: [
            ///logo
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: size.height * .1.h,
                child: Image.asset(
                  AppAssets.logo,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: size.height * .025),

            ///CarouselSlider
            SizedBox(
              height: size.height * .35.h,
              child: CarouselSlider(
                items: AppAssets.images
                    .map(
                      (image) => Container(
                        decoration: AppConsts.decoration,
                        height: size.height,
                        child: Image.asset(
                          image,
                          fit: BoxFit.fill,
                          width: size.width * .9,
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: size.height,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 1,
                  onPageChanged: (int index, CarouselPageChangedReason c) =>
                      cont.carsoulChanged(index),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(height: size.height * .015),

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
                borderRadius: BorderRadius.circular(5.sp),
                //only for rectangle shape
                onItemClicked: (index) {},
              ),
            ),

            ///
            SizedBox(height: size.height * .05),

            ///donate clothes button
            SizedBox(
              height: size.height * .08.h,
              width: size.width * .8.w,
              child: CustomButton(
                text: StringsEn.donateClothes.tr,
                onTap: () => Get.toNamed(loginDonatePath),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
