import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/products/data/repo/product_repo.dart';
import 'package:smart_soft/features/products/domain/entity/product.dart';

import '../../../../core/errors/failure.dart';

class GetAllProductsUseCase {

  ProductRepo repo = getIt<ProductRepo>();

  Future<Either<Failure, List<Product>>> call() async {
    return await repo.getAllProducts();
  }

}