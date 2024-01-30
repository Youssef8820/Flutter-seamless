import '../../data/model/product/product_schema.dart';

class Product{

  late int? id;
  late String name;
  late String description;

  Product(this.id, this.name, this.description);

  Product.formProductSchema(ProductSchema personSchema){
    id = personSchema.id;
    name = personSchema.name;
    description = personSchema.description;
  }

}