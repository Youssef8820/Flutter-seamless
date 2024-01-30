import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/features/products/data/repo/product_repo.dart';

import '../../../../core/errors/failure.dart';

class DeleteProductUseCase {

  ProductRepo repo = getIt<ProductRepo>();

  Future<Either<Failure, void>> call(int id) async {
    return await repo.deleteProduct(id);
  }

}