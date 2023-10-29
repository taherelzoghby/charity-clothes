// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donation/core/consts/style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    this.onChanged,
    this.obscureText = false,
    this.perfixIcon,
    this.readOnly = false,
    this.maxLines = 1,
    this.perfixText = '',
  }) : super(key: key);
  final String hint;
  final void Function(String)? onChanged;
  final bool obscureText;
  final Widget? perfixIcon;
  final bool readOnly;
  final int maxLines;
  final String perfixText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      readOnly: readOnly,
      obscureText: obscureText,
      style: AppConsts.stylePhoneNumber,
      cursorColor: AppConsts.mainColor,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppConsts.stylePhoneNumber,
        prefixIcon: perfixIcon,
        prefixText: perfixText,
        prefixStyle: AppConsts.stylePhoneNumber,
        enabledBorder: AppConsts.decorationFieldNormal,
        focusedBorder: AppConsts.decorationField,
        errorBorder: AppConsts.decorationFieldError,
        focusedErrorBorder: AppConsts.decorationFieldError,
        disabledBorder: AppConsts.decorationFieldNormal,
      ),
    );
  }
}
