import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';

class EmptyProductsList extends StatelessWidget {
  const EmptyProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,

        children: [

          Space(
            height: 12.h,
          ),

          Center(
            child: SvgPicture.asset(
              AppImages.product,
              width: 86.w,
              height: 20.h,
            ),
          ),

          Space(
            height: 10.h,
          ),

          Center(
            child: Text(
              LocaleKeys.have_no_products,
              style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900,
                fontSize: 25.sp,
              ),
              textAlign: TextAlign.center,

            ).tr(),
          ),

          Space(
            height: 1.5.h,
          ),
          Center(
            child: Text(
              LocaleKeys.have_no_products_description,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral700, fontSize: 12.sp),
              textAlign: TextAlign.center,
            ).tr(),
          ),

        ],
      ),
    );
  }
}
