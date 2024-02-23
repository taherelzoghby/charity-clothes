import 'package:donation/core/consts/style.dart';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.background = AppConsts.mainColor,
    this.isBorder = false,
    this.styleText = AppConsts.style18,
  });

  final String text;
  final Color background;
  final bool isBorder;
  final Function() onTap;
  final TextStyle styleText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppConsts.radius15,
      child: Container(
        decoration: BoxDecoration(
          color: background,
          borderRadius: AppConsts.radius15,
          border: isBorder ? Border.all(color: AppConsts.grey) : null,
          boxShadow: AppConsts.boxShadows,
        ),
        child: Center(
          child: Text(text, style: styleText),
        ),
      ),
    );
  }
}
