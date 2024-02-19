import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AuthMethodsAppBar extends StatelessWidget {
  const AuthMethodsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          color: AppTheme.secondary900,
          height: 6.h,
          width: double.infinity,
        ),
        Positioned(
          left: 3.5.h,
          top: 3.5.h,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: AppTheme.neutral100,
            ),
            width: 11.w,
            height: 11.w,
            child: Icon(
              size: 25,
              Icons.language,
              color: AppTheme.secondary900,
            ),
          ),
        ),
      ],
    );
  }
}
