import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sempl/utils/pj_colors.dart';
import 'package:sempl/utils/pj_styles.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    required this.onTap,
    super.key,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        height: 45.w,
        width: 331.w,
        margin: EdgeInsets.only(bottom: 56.w),
        decoration: BoxDecoration(color: PjColors.blue, borderRadius: BorderRadius.circular(30.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ПРОДОЛЖИТЬ',
              style:
                  PjStyles.styleSansRegular.copyWith(color: PjColors.white, height: 15 / 15, letterSpacing: 0.02 * 15),
            ),
            SizedBox(
              width: 5.w,
            ),
            SvgPicture.asset('assets/icons/continue.svg')
          ],
        ),
      ),
    );
  }
}
