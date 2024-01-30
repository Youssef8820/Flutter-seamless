import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_soft/features/products/views/bloc/product/product_cubit.dart';
import 'package:smart_soft/features/products/views/components/product_item.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../components/empty_products_list.dart';
import '../widget/custom_floating_button.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  @override
  void initState() {
    context.read<ProductCubit>().getAllProducts(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: BlocConsumer<ProductCubit,ProductState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Space(
                        height: 2.h,
                      ),
                      Text(
                        LocaleKeys.home,
                        style: AppTheme.mainTextStyle(
                          color: AppTheme.neutral900,
                          fontSize: 20.sp,
                        ),
                        textAlign: TextAlign.center,

                      ).tr(),
                      Space(
                        height: 3.h,
                      ),

                      (ProductSuccess.products.isEmpty)? const EmptyProductsList() : ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                          itemBuilder: (context,index){
                            return ProductItem(
                              onPressed: (product){
                                context.read<ProductCubit>().onDeleteClick(context,product.id!);
                              },
                              product: ProductSuccess.products[index],

                            );
                          },
                          separatorBuilder: (context,index){
                            return Space(height: 2.h,);
                          },
                          itemCount: ProductSuccess.products.length
                      ),
                      Space(
                        height: 5.h,
                      ),
                    ],
                  ),
                );
              },
            ),
            floatingActionButton: CustomFloatingButton(
              onPressed: () =>
                  context.read<ProductCubit>().onPlusClick(context),
            )
        )
    );
  }
}
