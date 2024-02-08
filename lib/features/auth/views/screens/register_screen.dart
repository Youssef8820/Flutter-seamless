import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/auth/views/blocs/register/register_cubit.dart';
import 'package:smart_soft/features/auth/views/widgets/certificate_upload.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_back_button.dart';
import '../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../../core/views/widgets/custom_text_field.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../blocs/login/login_cubit.dart';

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
              height: 2.h,
            ),

            CustomBackButton(),

            Space(
              height: 4.h,
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
              LocaleKeys.username,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 12.sp),
            ).tr(),
            Space(
              height: 0.5.h,
            ),
            CustomTextField(
              controller: context.read<LoginCubit>().emailController,
              prefixIcon: Padding(
                padding: EdgeInsets.all(3.w),
                child: SvgPicture.asset(
                  AppImages.profile,
                  width: 3.w,
                  height: 3.h,
                ),

              ),
              hint: LocaleKeys.username_hint.tr(),
            ),
            Space(
              height: 1.h,
            ),

            Text(
              LocaleKeys.phone_number,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 12.sp),
            ).tr(),
            Space(
              height: 0.5.h,
            ),
            CustomTextField(
              controller: context.read<LoginCubit>().emailController,
              prefixIcon: Padding(
                padding: EdgeInsets.all(3.w),
                child: SvgPicture.asset(
                  AppImages.phone,
                  width: 3.w,
                  height: 3.h,
                ),

              ),
              hint: LocaleKeys.phone_number_hint.tr(),
            ),
            Space(
              height: 1.h,
            ),

            Text(
              LocaleKeys.trade_register,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 12.sp),
            ).tr(),
            Space(
              height: 0.5.h,
            ),
            CustomTextField(
              controller: context.read<LoginCubit>().emailController,
              prefixIcon: Padding(
                padding: EdgeInsets.all(3.w),
                child: SvgPicture.asset(
                  AppImages.tradeRegister,
                  width: 3.w,
                  height: 3.h,
                ),

              ),
              hint: LocaleKeys.trade_register_hint.tr(),
            ),
            Space(
              height: 1.h,
            ),

            Text(
              LocaleKeys.tax_id_number,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 12.sp),
            ).tr(),
            Space(
              height: 0.5.h,
            ),
            CustomTextField(
              controller: context.read<LoginCubit>().emailController,
              prefixIcon: Padding(
                padding: EdgeInsets.all(3.w),
                child: SvgPicture.asset(
                  AppImages.taxId,
                  width: 3.w,
                  height: 3.h,
                ),

              ),
              hint: LocaleKeys.tax_id_number_hint.tr(),
            ),
            Space(
              height: 1.h,
            ),

            Text(
              LocaleKeys.registration_certificate,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 12.sp),
            ).tr(),
            Space(
              height: 0.5.h,
            ),
            CertificateUpload(
              width: double.infinity,
              height: 6.h,
            ),
            Space(
              height: 1.h,
            ),

            Text(
              LocaleKeys.password,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 12.sp),
            ).tr(),
            Space(
              height: 0.5.h,
            ),
            CustomTextField(
              controller: context.read<LoginCubit>().emailController,
              prefixIcon: Padding(
                padding: EdgeInsets.all(3.w),
                child: SvgPicture.asset(
                  AppImages.password,
                  width: 3.w,
                  height: 3.h,
                ),

              ),
              hint: LocaleKeys.password_hint.tr(),
            ),


            Space(
              height: 3.h,
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
                        color: AppTheme.primary900, fontSize: 12.sp),
                  ).tr(),
                ),
              ],
            ),

            Space(
              height: 2.h,
            ),

            BlocConsumer<RegisterCubit,RegisterState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return MainButton(
                            width: 86.w,
                            height: 6.5.h,
                            color: AppTheme.primary900,
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
