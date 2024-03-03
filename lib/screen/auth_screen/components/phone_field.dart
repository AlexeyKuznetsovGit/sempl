import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sempl/utils/pj_colors.dart';
import 'package:sempl/utils/pj_styles.dart';

class PhoneField extends StatefulWidget {
  final MaskTextInputFormatter formatter;
  final FocusNode focusNode;
  final Function(String text) onChange;
  final TextEditingController controller;

  const PhoneField(
      {super.key, required this.focusNode, required this.formatter, required this.controller, required this.onChange});

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 331.w,
      height: 51.w,
      decoration: isError
          ? BoxDecoration(boxShadow: [BoxShadow(color: PjColors.shadowRed, blurRadius: 10, offset: Offset(0, 2))])
          : null,
      child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              setState(() {
                isError = true;
              });
              return '';
            } else if (value.trim().replaceAll(' ', '').length < 10) {
              setState(() {
                isError = true;
              });
              return '';
            }
            setState(() {
              isError = false;
            });
            return null;
          },
          style: PjStyles.styleSansRegular.copyWith(color: PjColors.blue),
          keyboardType: TextInputType.phone,
          controller: widget.controller,
          focusNode: widget.focusNode,
          cursorColor: PjColors.blue,
          inputFormatters: [widget.formatter],
          onChanged: widget.onChange,
          decoration: InputDecoration(
            hintText: '000 000 00 00',
            hintStyle: PjStyles.styleSansRegular.copyWith(color: PjColors.gray),
            prefixIcon: Container(
              decoration: BoxDecoration(
                  color: isError ? Colors.transparent : PjColors.textWhite,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), bottomLeft: Radius.circular(30.r))),
              padding: EdgeInsets.only(left: 11.w),
              margin: EdgeInsets.only(left: 0.5.w, right: 10.w),
              width: 87.w,
              height: 50.w,
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/flag.svg'),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    '(+7)',
                    style: PjStyles.styleSansRegular,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  SvgPicture.asset('assets/icons/arrow_bottom.svg'),
                ],
              ),
            ),
            filled: true,
            fillColor: isError ? PjColors.red.withOpacity(0.2) : PjColors.white,
            errorStyle: TextStyle(height: 0, color: Colors.transparent),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(width: 0.5.w, color: PjColors.red),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(width: 0.5.w, color: PjColors.red),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(width: 0.5.w, color: PjColors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(
                  width: 0.5.w,
                  color: isError
                      ? PjColors.red
                      : widget.controller.text.trim().replaceAll(' ', '').length == 10
                          ? PjColors.blue
                          : PjColors.gray),
            ),
            isDense: true,
            isCollapsed: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.5.w),
          )),
    );
  }
}
