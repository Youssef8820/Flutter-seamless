
import 'package:floor/floor.dart';

@entity
class ProductSchema {

  @primaryKey
  final int? id;

  final String name;
  final String description;

  ProductSchema(this.id, this.name, this.description);

}