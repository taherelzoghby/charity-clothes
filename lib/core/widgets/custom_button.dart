import 'package:donation/core/consts/style.dart';
import 'package:flutter/material.dart';

class CustomButtonCircle extends StatelessWidget {
  const CustomButtonCircle({
    Key? key,
    required this.widget,
    required this.onTap,
  }) : super(key: key);
  final Widget widget;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * .06,
        width: size.width * .125,
        decoration: BoxDecoration(
          color: AppConsts.sWhite.withOpacity(.5),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(child: widget),
      ),
    );
  }
}
