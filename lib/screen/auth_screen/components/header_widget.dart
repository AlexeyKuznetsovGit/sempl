import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sempl/utils/pj_colors.dart';
import 'package:sempl/utils/pj_styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 268.w,
        width: MediaQuery.of(context).size.width,
        color: PjColors.blue,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: ClipRect(
                  child: SizedOverflowBox(
                    alignment: Alignment.bottomRight,
                    size: Size(120.w, 135.w),
                    child: SvgPicture.asset(
                      'assets/icons/star.svg',
                      height: 181.w,
                      width: 181.w,
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 35.w),
                child: Text(
                  'SEMPL!',
                  style: PjStyles.styleDrukBold
                      .copyWith(fontSize: 31.55.sp, height: 40.04 / 31.55, letterSpacing: null),
                ),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: ClipRect(
                  child: SizedOverflowBox(
                    alignment: Alignment.bottomRight,
                    size: Size(120.w, 135.w),
                    child: SvgPicture.asset(
                      'assets/icons/star.svg',
                      height: 181.w,
                      width: 181.w,
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.bottomRight,
              child: ClipRect(
                child: Container(
                  padding: EdgeInsets.only(left: 20.w),
                  child: SizedOverflowBox(
                    alignment: Alignment.topLeft,
                    size: Size(100.w, 172.w),
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(-11.68 / 360),
                      child: SvgPicture.asset(
                        'assets/icons/triangle.svg',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 98.w),
                  child: ClipRect(
                    child: SizedOverflowBox(
                      alignment: Alignment.topLeft,
                      size: Size(
                        50.w,
                        55.86.w,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/romb.svg',
                        height: 55.86.w,
                        width: 55.86.w,
                      ),
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 142.w, left: 23.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ДОБРО ПОЖАЛОВАТЬ!',
                      style: PjStyles.styleDrukBold.copyWith(color: PjColors.textWhite),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Text(
                      'Для входа или регистрации в приложении\nвведите свой номер телефона:',
                      style: PjStyles.styleSansRegular.copyWith(color: PjColors.textWhite),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}