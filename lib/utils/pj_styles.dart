import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sempl/utils/pj_colors.dart';

class PjStyles {
  static TextStyle styleSansRegular = TextStyle(
      color: PjColors.black,
      fontFamily: 'SourceSans3',
      fontWeight: FontWeight.w400,
      fontSize: 15.sp,
      leadingDistribution: TextLeadingDistribution.even,
      height: 18 / 15);
  static TextStyle styleSansBold = TextStyle(
      color: PjColors.black,
      fontFamily: 'SourceSans3',
      fontWeight: FontWeight.w700,
      fontSize: 20.sp,
      leadingDistribution: TextLeadingDistribution.even,
      height: 20 / 20);
  static TextStyle styleDrukBold = TextStyle(
      color: PjColors.black,
      fontFamily: 'DrukCyr',
      fontWeight: FontWeight.w700,
      fontSize: 40.sp,
      letterSpacing: 0.03 * 40,
      leadingDistribution: TextLeadingDistribution.even,
      height: 45.2 / 40);
}