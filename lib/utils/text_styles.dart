import 'package:flutter/material.dart';
import 'package:sharehub/utils/colors.dart';

class AppTextStyles {
  static const TextStyle textWhite = TextStyle(
      color: AppColors.white
  );

  static const TextStyle textMediumGrey = TextStyle(
    color: AppColors.mediumGrey
  );

  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle text1 = TextStyle(
    fontSize: 12,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  static const TextStyle textSmall = TextStyle(
    fontSize: 10,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
}