import 'package:floor/floor.dart';
import 'package:smart_soft/features/products/data/model/product/product_schema.dart';

@dao
abstract class ProductDao {

  @Query('SELECT * FROM ProductSchema')
  Future<List<ProductSchema>> getAllProducts();

  @insert
  Future<void> insertProduct(ProductSchema product);

  @Query('DELETE FROM ProductSchema WHERE id = :id')
  Future<void> deleteProduct(int id);

  @Query('SELECT * FROM ProductSchema WHERE id = :id')
  Future<ProductSchema?> getProductById(int id);

}