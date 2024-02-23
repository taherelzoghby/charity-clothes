import 'package:flutter/material.dart';

import '../../../../../core/consts/style.dart';

class CurrentPositionWidget extends StatelessWidget {
  const CurrentPositionWidget({
    super.key,
    required this.currentPosition,
  });

  final String currentPosition;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppConsts.aspect16on2,
      child: Container(
        decoration: AppConsts.decorationNormal,
        child: Center(
          child: Text(currentPosition, style: AppConsts.style18),
        ),
      ),
    );
  }
}
