import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/products/data/repo/product_repo.dart';
import 'package:smart_soft/features/products/domain/entity/product.dart';

import '../../../../core/errors/failure.dart';

class InsertProductUseCase {

  ProductRepo repo = getIt<ProductRepo>();

  Future<Either<Failure, void>> call(Product product) async {
    return await repo.insertProduct(product);
  }

}