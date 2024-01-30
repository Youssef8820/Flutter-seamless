import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/errors/failure.dart';

import '../../domain/entity/product.dart';

abstract class ProductRepo {

  Future<Either<Failure,List<Product>>> getAllProducts();

  Future<Either<Failure,void>> insertProduct(Product product);

  Future<Either<Failure,void>> deleteProduct(int id);

}