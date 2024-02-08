import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';

class PinTextField extends StatelessWidget {
  void Function(String)? onCompleted;
  void Function(String)? onChange;

  PinTextField({super.key, this.onCompleted,this.onChange});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 20.w,
      height: 8.h,
      textStyle: AppTheme.mainTextStyle(
          color: AppTheme.neutral900, fontSize: 18.sp),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.neutral300),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppTheme.neutral500),
      borderRadius: BorderRadius.circular(20),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: onCompleted,
      onChanged: onChange,
    );
  }
}
