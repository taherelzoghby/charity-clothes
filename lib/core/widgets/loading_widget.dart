import 'package:donation/core/consts/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(decoration: AppConsts.decorationLoadingMap),
        const CupertinoActivityIndicator(
          color: AppConsts.mainColor,
        ),
      ],
    );
  }
}
