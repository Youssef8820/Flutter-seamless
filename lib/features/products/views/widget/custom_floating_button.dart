import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/config/app_theme.dart';

import '../../../../generated/locale_keys.g.dart';

class CustomFloatingButton extends StatelessWidget {

  void Function()? onPressed;

  CustomFloatingButton({Key? key,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppTheme.neutral800,
      onPressed: onPressed,
      child: Center(
        child: Text(
          "+",
          style: AppTheme.mainTextStyle(
            color: AppTheme.neutral100,
            fontSize: 25.sp,
          ),
          textAlign: TextAlign.center,

        ),
      ),
    );
  }
}
