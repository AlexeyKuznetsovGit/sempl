import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sempl/router/router.dart';
import 'package:sempl/screen/onboarding_screen/cubit/cb_onboarding_screen.dart';
import 'package:sempl/utils/pj_colors.dart';
import 'package:sempl/utils/pj_styles.dart';

@RoutePage()
class OnBoardingScreen extends StatefulWidget implements AutoRouteWrapper {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CbOnboardingScreen>(
      create: (context) => CbOnboardingScreen(),
      child: this,
    );
  }
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PjColors.blue,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 35.w),
              child: Text(
                'SEMPL!',
                style: PjStyles.styleDrukBold.copyWith(fontSize: 31.55.sp, height: 40.04 / 31.55, letterSpacing: null),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: 35.w),
              child: ClipRect(
                child: SizedOverflowBox(
                    alignment: Alignment.topLeft,
                    size: Size(140.w, 219.93.w),
                    child: SvgPicture.asset(
                      'assets/icons/triangle.svg',
                    )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 155.w),
            child: Align(
                alignment: Alignment.topRight,
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(-21.43 / 360),
                  child: Container(
                    width: 259.w,
                    height: 401.68.w,
                    color: PjColors.white,
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 277.w, left: 17.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'АНКЕТА',
                  style: PjStyles.styleDrukBold,
                ),
                SizedBox(
                  height: 6.w,
                ),
                Text(
                  'Наше приложение включает\nфункцию опроса, которая позволяет\nнам лучше понять ваши предпочтения\nи интересы пользователей',
                  style: PjStyles.styleSansRegular,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 410.w, left: 83.w),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 146.w,
                width: 146.w,
                child: SvgPicture.asset(
                  'assets/icons/star.svg',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 430.65.w, right: 38.6.w),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 205.26.w,
                width: 170.99.w,
                child: SvgPicture.asset(
                  'assets/icons/line.svg',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 648.w, right: 16.w),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (){
                  context.router.push(AuthRoute());
                },
                child: Container(
                  height: 60.w,
                  width: 60.w,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(color: PjColors.white, borderRadius: BorderRadius.circular(15.r)),
                  child: SvgPicture.asset(
                    'assets/icons/arrow.svg',
                    height: 44.w,
                    width: 44.w,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 687.w, left: 16.w),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('05/05', style: PjStyles.styleSansBold,)
            ),
          ),
        ],
      ),
    );
  }
}
