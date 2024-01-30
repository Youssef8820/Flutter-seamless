// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:smart_soft/features/products/data/model/product/product_dao.dart';
import 'package:smart_soft/features/products/data/model/product/product_schema.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [ProductSchema])
abstract class AppDatabase extends FloorDatabase {
  ProductDao get productDao;
}