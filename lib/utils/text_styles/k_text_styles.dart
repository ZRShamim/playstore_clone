import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:playstore_clone/utils/color/custom_colors.dart';

class KTextStyles {
  static TextStyle header1 = TextStyle(
    color: Colors.white,
    fontSize: 12.sp,
  );

  // Play Store Page Styles

  static TextStyle psBodyText = TextStyle(
    fontSize: 10.sp,
    color: KColors.psGrey,
    fontWeight: FontWeight.w400,
  );

  static TextStyle psHeading = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: KColors.psBlack,
  );
}
