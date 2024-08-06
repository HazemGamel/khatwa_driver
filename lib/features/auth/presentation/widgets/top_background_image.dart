import 'package:flutter/material.dart';

import '../../../../core/rescourcs/app_colors.dart';
import '../../../../core/widgets/build_rich_text.dart';
import '../../../../core/widgets/custom_image.dart';

Widget topBackgroundImage() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Align(
          alignment: Alignment.center,
          child: CustomAssetsImage(path: 'assets/logo2.jpeg')),
      const Center(
          child: Text("يلا خطوة",style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),)),
    ],
  );
}
