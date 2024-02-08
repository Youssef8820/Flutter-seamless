import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/auth/views/blocs/otp/otp_cubit.dart';
import 'package:smart_soft/features/auth/views/blocs/reset_password/reset_password_cubit.dart';
import 'package:smart_soft/features/auth/views/widgets/pin_text_field.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_back_button.dart';
import '../../../../core/views/widgets/custom_text_field.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../blocs/login/login_cubit.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: ListView(
          shrinkWrap: true,
          children: [

            Space(
              height: 2.h,
            ),

            CustomBackButton(),

            Space(
              height: 4.h,
            ),

            Text(
              LocaleKeys.confirm_code,
              style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900,
                fontSize: 25.sp,
              ),
            ).tr(),



            Space(
              height: 2.h,
            ),

            Text(
              LocaleKeys.confirm_code_sub_text,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral900, fontSize: 12.sp),
            ).tr(),

            Space(
              height: 3.h,
            ),


            PinTextField(
              onChange: context.read<OtpCubit>().onPinChange,
              onCompleted: (pin)=> context.read<OtpCubit>().onConfirmClick(context),
            ),

            Space(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text(
                  LocaleKeys.didnt_recive_code.tr(),
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral400, fontSize: 12.sp),
                ).tr(),
                Space(
                  width: 2.w,
                ),
                InkWell(
                  onTap: () => context.read<OtpCubit>().onResendClick(),
                  child: Text(
                    LocaleKeys.resend.tr(),
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.primary900, fontSize: 12.sp),
                  ).tr(),
                ),
              ],
            ),

            Space(
              height: 25.h,
            ),

            MainButton(
              color: AppTheme.primary900,
              width: 86.w,
              height: 6.5.h,
              label: Text(
                LocaleKeys.confirm,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral100, fontSize: 13.sp),
              ).tr(),
              onTap: () => context.read<OtpCubit>().onConfirmClick(context),
            ),
          ],
        ),
      ),
    ));
  }
}
