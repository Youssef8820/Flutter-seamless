import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/products/domain/usecase/delete_product_use_case.dart';
import 'package:smart_soft/features/products/domain/usecase/get_all_products_use_case.dart';
import 'package:smart_soft/features/products/domain/usecase/insert_product_use_case.dart';
import 'package:smart_soft/features/products/views/screens/add_product_screen.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/views/widgets/custom_flush_bar.dart';
import '../../../domain/entity/product.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  onPlusClick(BuildContext context){
    navigateToAddProductScreen(context);
  }

  onAddClick(BuildContext context){
    addProduct(context);
  }

  onDeleteClick(BuildContext context,int id) {
    deleteProduct(context,id);
  }

  addProduct(BuildContext context){
    if(nameController.text.isNotEmpty && descriptionController.text.isNotEmpty){
      Product product = Product(null, nameController.text, descriptionController.text);
      getIt<InsertProductUseCase>().call(product).then(
              (value) => value.fold(
                  (error) {

                emit(ProductError(error));
                showFlushBar(
                    context,
                    title: "Error ${error.failureCode}",
                    message : error.message
                );
                emit(ProductInitial());
              },
                  (success) {
                emit(ProductAdded());
                getAllProducts(context);
                Navigator.pop(context);
                emit(ProductInitial());
              }
          )
      );
    } else {

    }

  }

  getAllProducts(BuildContext context){
    getIt<GetAllProductsUseCase>().call().then(
      (value) => value.fold(
        (error) {

          emit(ProductError(error));
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );
          emit(ProductInitial());
        },
        (success) {

          emit(ProductSuccess(success));
          emit(ProductInitial());
        }
      )
    );
  }

  deleteProduct(BuildContext context,int id){
    getIt<DeleteProductUseCase>().call(id).then(
        (value) => value.fold(
            (error) {

          emit(ProductError(error));
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );
          emit(ProductInitial());
        },
            (success) {

          emit(ProductDeleted());
          getAllProducts(context);
          emit(ProductInitial());
        }
      )
    );
  }

  navigateToAddProductScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> const AddProductScreen()));
  }



}
