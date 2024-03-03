import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sempl/screen/auth_screen/components/continue_button.dart';
import 'package:sempl/screen/auth_screen/components/header_widget.dart';
import 'package:sempl/screen/auth_screen/components/phone_field.dart';
import 'package:sempl/screen/auth_screen/cubit/cb_auth_screen.dart';
import 'package:sempl/utils/pj_colors.dart';
import 'package:sempl/utils/pj_styles.dart';

@RoutePage()
class AuthScreen extends StatefulWidget implements AutoRouteWrapper {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CbAuthScreen>(
      create: (context) => CbAuthScreen(),
      child: this,
    );
  }
}

class _AuthScreenState extends State<AuthScreen> {
  bool isAgree = false;
  final MaskTextInputFormatter formatter =
  MaskTextInputFormatter(mask: '### ### ## ##', filter: {"#": RegExp(r'[0-9]')});
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  final _formKeyAuth = GlobalKey<FormState>();
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: PjColors.white,
          body: Form(
            key: _formKeyAuth,
            child: Column(
              children: [
                HeaderWidget(),
                SizedBox(
                  height: 36.w,
                ),
                PhoneField(
                    focusNode: _focusNode,
                    formatter: formatter,
                    controller: _controller,
                    onChange: (val) {
                      setState(() {
                        if (val
                            .trim()
                            .replaceAll(' ', '')
                            .length == 10) {
                          isPressed = false;
                          _formKeyAuth.currentState!.validate();
                          _focusNode.unfocus();
                        }
                      });
                    }),
                if (isPressed &&
                    (_controller.text.isEmpty || _controller.text
                        .trim()
                        .replaceAll(' ', '')
                        .length < 10)) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 3.w, left: 30.w),
                      child: Text(
                        'пожалуйста, заполните это поле',
                        style:
                        PjStyles.styleSansRegular.copyWith(fontSize: 10.sp, height: 12 / 10, color: PjColors.red),
                      ),
                    ),
                  )
                ],
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: 25.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            isAgree = !isAgree;
                          });
                        },
                        child: Container(
                          height: 16.w,
                          width: 16.w,
                          margin: EdgeInsets.only(left: 22.w, right: 7.w),
                          decoration: BoxDecoration(
                              color: isAgree ? PjColors.blue : null,
                              borderRadius: BorderRadius.circular(2.r),
                              border:
                              Border.all(width: 1.w, color: !isAgree && isPressed ? PjColors.red : PjColors.blue)),
                          child: isAgree
                              ? Padding(
                            padding: EdgeInsets.only(left: 2.5.w, right: 2.19.w, top: 4.w, bottom: 3.51.w),
                            child: SvgPicture.asset('assets/icons/check.svg'),
                          )
                              : null,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: PjStyles.styleSansRegular.copyWith(fontSize: 12.sp, height: 14.4 / 12),
                          children: <TextSpan>[
                            TextSpan(text: 'Я соглашаюсь с '),
                            TextSpan(
                              text: 'Условиями Пользовательского\n',
                              style: PjStyles.styleSansRegular.copyWith(
                                  fontSize: 12.sp,
                                  height: 14.4 / 12,
                                  color: PjColors.blue,
                                  decoration: TextDecoration.underline),
                            ),
                            TextSpan(
                              text: 'Соглашения ',
                              style: PjStyles.styleSansRegular.copyWith(
                                  fontSize: 12.sp,
                                  height: 14.4 / 12,
                                  color: PjColors.blue,
                                  decoration: TextDecoration.underline),
                            ),
                            TextSpan(
                              text: 'и ',
                              style: PjStyles.styleSansRegular.copyWith(fontSize: 12.sp, height: 14.4 / 12),
                            ),
                            TextSpan(
                              text: 'Политикой Конфиденциальности',
                              style: PjStyles.styleSansRegular.copyWith(
                                  fontSize: 12.sp,
                                  height: 14.4 / 12,
                                  color: PjColors.blue,
                                  decoration: TextDecoration.underline),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ContinueButton(
                  onTap: () {
                    if (_formKeyAuth.currentState!.validate() && isAgree) {
                      print('alles gut');
                    } else {
                      setState(() {
                        isPressed = true;
                      });
                      print('alles schlecht');
                    }
                  },
                )
              ],
            ),
          )),
    );
  }
}
