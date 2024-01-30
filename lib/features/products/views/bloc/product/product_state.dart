part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductAdded extends ProductState {}

class ProductDeleted extends ProductState {}


class ProductSuccess extends ProductState {
  static List<Product> products = [];

  ProductSuccess(List<Product> products) {
    ProductSuccess.products = products;
  }
}

class ProductError extends ProductState {
  static Failure? failure;

  ProductError(Failure failure){
    ProductError.failure = failure;
  }
}
