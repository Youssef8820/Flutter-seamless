import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/core/views/widgets/custom_text_field.dart';
import 'package:smart_soft/features/products/views/bloc/product/product_cubit.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_back_button.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal : 7.w),
        child: ListView(
          shrinkWrap: true,
          children: [

            Space(
              height: 3.h,
            ),

            CustomBackButton(),

            Space(
              height: 5.h,
            ),

            CustomTextField(
              controller: context.read<ProductCubit>().nameController,
              borderRadius: BorderRadius.circular(4.w),
            ),

            Space(
              height: 2.h,
            ),

            CustomTextField(
              controller: context.read<ProductCubit>().descriptionController,
              borderRadius: BorderRadius.circular(4.w),
              height: 10.h,
            ),

            Space(
              height: 10.h,
            ),

            MainButton(
              width: 86.w,
              height: 7.h,
              label: Text(
                LocaleKeys.add,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral100, fontSize: 14.sp),
              ).tr(),
              onTap: ()=> context.read<ProductCubit>().onAddClick(context),
            ),

          ],
        ),
      ),
    ));
  }
}
