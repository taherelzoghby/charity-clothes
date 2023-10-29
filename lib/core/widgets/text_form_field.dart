// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donation/core/consts/strings.dart';
import 'package:flutter/material.dart';

import 'package:donation/core/consts/style.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hint,
    this.onSaved,
    this.onChanged,
    this.obscureText = false,
    this.perfixIcon,
    this.readOnly = false,
    this.maxLines = 1,
    this.perfixText = '',
  }) : super(key: key);
  final String hint;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final bool obscureText;
  final Widget? perfixIcon;
  final bool readOnly;
  final int maxLines;
  final String perfixText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: hint == StringsEn.numberOfPieces.tr
          ? TextInputType.number
          : TextInputType.text,
      maxLines: maxLines,
      readOnly: readOnly,
      obscureText: obscureText,
      style: AppConsts.stylePhoneNumber,
      cursorColor: AppConsts.mainColor,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your $hint';
        }
        return null;
      },
      onFieldSubmitted: onSaved,
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
