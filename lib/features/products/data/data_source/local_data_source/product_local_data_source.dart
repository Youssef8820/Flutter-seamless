import 'package:smart_soft/core/bloc/core_cubit.dart';
import 'package:smart_soft/core/errors/exception.dart';
import 'package:smart_soft/features/products/data/model/product/product_schema.dart';

abstract class ProductLocalDataSource {

  Future<List<ProductSchema>> getAllProducts();

  Future<void> insertProduct(ProductSchema product);

  Future<void> deleteProduct(int id);

}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {


  @override
  Future<void> deleteProduct(int id) async {
    try {
      await CoreCubit.database.productDao.deleteProduct(id);
    } catch (e){
      throw LocalDataException(e.toString());
    }
  }

  @override
  Future<List<ProductSchema>> getAllProducts() async {
    try {
      return await CoreCubit.database.productDao.getAllProducts();
    } catch (e){
      throw LocalDataException(e.toString());
    }
  }

  @override
  Future<void> insertProduct(ProductSchema product) async {
    try {
      CoreCubit.database.productDao.insertProduct(product);
    } catch (e) {
      throw LocalDataException(e.toString());
    }
  }

}