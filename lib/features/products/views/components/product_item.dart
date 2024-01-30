import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/products/domain/entity/product.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';

class ProductItem extends StatelessWidget {
  Product product;
  void Function(Product)? onPressed;

  ProductItem({Key? key,required this.product,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.neutral200,
        borderRadius: BorderRadius.circular(3.w)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                product.name,
                style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral900,
                  fontSize: 15.sp,
                ),
              ),

              IconButton(onPressed: (){
                if(onPressed != null) {
                  onPressed!(product);
                }
              } , icon: Icon(Icons.delete))
            ],
          ),
          Space(
            height: 0.5.h,
          ),
          Text(
            product.description,
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral700, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
