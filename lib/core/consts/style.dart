import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppConsts {
  static const Color white = Colors.white;
  static const Color backDialog = Color.fromRGBO(254, 253, 253, 1);
  static const Color mainColor = Color.fromRGBO(142, 201, 169, 1);
  static const Color sWhite = Color.fromRGBO(239, 255, 245, 1);
  static const Color secondColor = Color.fromRGBO(146, 184, 162, 1);
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color orange = Color.fromRGBO(255, 221, 79, 1);
  static const Color red = Colors.red;
  static const Color previewColor = Color.fromRGBO(239, 130, 98, 1);

  //decorations
  static BoxDecoration decoration = BoxDecoration(
    border: Border.all(color: mainColor, width: 2),
  );
  static BoxDecoration decorationImage = BoxDecoration(
    border: Border.all(color: mainColor, width: 2),
    borderRadius: BorderRadius.circular(15),
  );
  static BoxDecoration decorationGrey = BoxDecoration(
    border: Border.all(color: grey, width: 2),
  );
  static BoxDecoration decorationNormal = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: grey,
  );
  static BoxDecoration decorationItemTrack = BoxDecoration(
    color: white,
    borderRadius: BorderRadius.circular(15.sp),
    boxShadow: AppConsts.boxShadowsItemTrack,
  );
  static BoxDecoration decorationLoadingMap = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: grey.withOpacity(.2),
  );
  static OutlineInputBorder decorationField = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color.fromRGBO(133, 133, 133, 1),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(15),
  );
  static OutlineInputBorder decorationFieldNormal = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color.fromRGBO(133, 133, 133, 1),
      width: 1,
    ),
    borderRadius: BorderRadius.circular(15),
  );
  static OutlineInputBorder decorationFieldError = OutlineInputBorder(
    borderSide: const BorderSide(
      color: red,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(15),
  );

  //shadows
  static const List<BoxShadow> boxShadows = [
    BoxShadow(
      color: AppConsts.grey,
      blurRadius: 6,
      spreadRadius: .001,
      offset: Offset(1, 2),
    )
  ];
  static const List<BoxShadow> boxShadowsItemTrack = [
    BoxShadow(
      color: AppConsts.grey,
      blurRadius: 6,
      spreadRadius: .001,
      offset: Offset(1, 2),
    )
  ];

  //styles
  static const styleGnavText = TextStyle(
    fontSize: 12,
    color: AppConsts.sWhite,
    fontWeight: FontWeight.bold,
  );
  static const style14 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.grey,
  );
  static const style15 = TextStyle(
    color: Colors.black54,
    fontSize: 15,
  );
  static const style16 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static const style16Green = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: mainColor,
  );
  static const style16Red = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: red,
  );
  static const style18 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: sWhite,
  );
  static const style18Grey = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: grey,
  );
  static TextStyle stylePhoneNumber = TextStyle(
    color: AppConsts.grey,
    fontSize: 17.sp,
  );
  static const TextStyle styleError = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
  static const TextStyle pastedTextStyle = TextStyle(
    color: AppConsts.mainColor,
    fontWeight: FontWeight.bold,
  );

  //padding
  static EdgeInsets mainPadding = EdgeInsets.symmetric(horizontal: 12.w);
  static EdgeInsets paddingV12 = EdgeInsets.symmetric(vertical: 12.h);
  static EdgeInsets paddingH50 = EdgeInsets.symmetric(horizontal: 50.w);
  static EdgeInsets padding8 = const EdgeInsets.all(8);

  //aspect ratio
  static const double aspect16on2 = 16 / 2;
  static const double aspect16on14 = 16 / 14;
  static const double aspect16on13 = 16 / 13;
  static const double aspect16on1 = 16 / 1;
  static const double aspect20on36 = 20 / 36;
  static const double aspect20on2 = 20 / 2;
  static const double aspect16on4 = 16 / 4;
  static const double aspect16on5 = 16 / 5;
  static const double aspect16on3 = 16 / 3;
  static const double aspect16on8 = 16 / 8;
  static const double aspect40on1 = 40 / 1;
  static const double aspect300on1 = 300 / 1;
  static const double aspectRatioButtonAuth = 3 / .5;
  static const double aspectRatioButtonApply = 2.1 / .65;
  static const double aspect13on8 = 13 / 8;
  static const double aspect13on9 = 13 / 9;
  static const double aspect13on10 = 13 / 10;
  static const double aspect13on5 = 13 / 5;
  static const double aspect10on19 = 10 / 19;
  static const double aspect16on7 = 16 / 7;
  static const double aspect2point5on3 = 2.5 / 3;
  static const double halfScreenHeight = 565;

  //radius
  static BorderRadius radius5 = BorderRadius.circular(5.sp);
  static BorderRadius radius15 = BorderRadius.circular(15.sp);
}
