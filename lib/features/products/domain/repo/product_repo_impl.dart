import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/core/errors/exception.dart';
import 'package:smart_soft/core/errors/failure.dart';
import 'package:smart_soft/features/products/data/data_source/local_data_source/product_local_data_source.dart';
import 'package:smart_soft/features/products/data/model/product/product_schema.dart';
import 'package:smart_soft/features/products/data/repo/product_repo.dart';
import 'package:smart_soft/features/products/domain/entity/product.dart';

class ProductRepoImpl implements ProductRepo {



  @override
  Future<Either<Failure, void>> deleteProduct(int id) async {
    try {

      return right(await getIt<ProductLocalDataSource>().deleteProduct(id));

    } on LocalDataException catch(e){

      return left(LocalDataFailure(e.toString(),failureCode: 0));

    } catch (e) {

      return left(InternalFailure(e.toString(),failureCode: 0));

    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    try {

      final products = await getIt<ProductLocalDataSource>().getAllProducts();

      return right(products.map((e) => Product(e.id,e.name,e.description)).toList());

    } on LocalDataException catch(e){

      return left(LocalDataFailure(e.toString(),failureCode: 0));

    } catch (e) {

      return left(InternalFailure(e.toString(),failureCode: 0));

    }
  }

  @override
  Future<Either<Failure, void>> insertProduct(Product product) async {
    try {

      ProductSchema productSchema = ProductSchema(product.id, product.name,product.description);

      return right(await getIt<ProductLocalDataSource>().insertProduct(productSchema));

    } on LocalDataException catch(e){

      return left(LocalDataFailure(e.toString(),failureCode: 0));

    } catch (e) {

      return left(InternalFailure(e.toString(),failureCode: 0));

    }
  }
}