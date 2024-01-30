import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/auth/views/blocs/register/register_cubit.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../../core/views/widgets/custom_text_field.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: ListView(
          children: [

            Space(
              height: 6.h,
            ),

            Center(
              child: SvgPicture.asset(
                AppImages.register,
                width: 86.w,
                height: 20.h,
              ),
            ),

            Space(
              height: 3.h,
            ),

            Text(
              LocaleKeys.register,
              style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900,
                fontSize: 25.sp,
              ),
            ).tr(),
            Space(
              height: 2.h,
            ),
            Text(
              LocaleKeys.register_description,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral700, fontSize: 12.sp),
            ).tr(),

            Space(
              height: 4.h,
            ),

            CustomTextField(
              controller: context.read<RegisterCubit>().emailController,
              prefixIcon: Padding(
                padding: EdgeInsets.all(3.w),
                child: SvgPicture.asset(
                  AppImages.email,
                  width: 3.w,
                  height: 3.h,
                ),

              ),
              label: LocaleKeys.email.tr(),
              hint: LocaleKeys.email_hint.tr(),
            ),
            Space(
              height: 2.5.h,
            ),
            CustomTextField(
              controller: context.read<RegisterCubit>().passwordController,
              prefixIcon: Padding(
                padding: EdgeInsets.all(3.w),
                child: SvgPicture.asset(
                  AppImages.password,
                  width: 3.w,
                  height: 3.h,
                ),

              ),
              label: LocaleKeys.password.tr(),
              hint: LocaleKeys.password_hint.tr(),
            ),
            Space(
              height: 1.8.h,
            ),


            Space(
              height: 13.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text(
                  LocaleKeys.already_have_account.tr(),
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral400, fontSize: 12.sp),
                ).tr(),
                Space(
                  width: 2.w,
                ),
                InkWell(
                  onTap: ()=> context.read<RegisterCubit>().onLoginClick(context),
                  child: Text(
                    LocaleKeys.login.tr(),
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.neutral900, fontSize: 12.sp),
                  ).tr(),
                ),
              ],
            ),

            Space(
              height: 3.h,
            ),

            BlocConsumer<RegisterCubit,RegisterState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return MainButton(
                            width: 86.w,
                            height: 7.h,
                            label: (state is RegisterLoading)? CustomProgressIndicator(
                              color: AppTheme.neutral100,
                            ) : Text(
                              LocaleKeys.register,
                              style: AppTheme.mainTextStyle(
                                  color: AppTheme.neutral100, fontSize: 14.sp),
                            ).tr(),
                            onTap: ()=> context.read<RegisterCubit>().register(context),
                          );
                },
              ),



          ],
        ),
      ),
    ));
  }
}
