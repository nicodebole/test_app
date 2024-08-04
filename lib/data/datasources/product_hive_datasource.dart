import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/core/entities/product.dart';

class ProductHiveDatasource {
  final Box<Product> box;

  ProductHiveDatasource(this.box);

  List<Product> getProducts() {
    return box.values.toList();
  }

  Product? getProductById(int id) {
    return box.get({'id': id});
  }

  Future<void> saveProducts(List<Product> products) async {
    for (var product in products) {
      await box.put(product.id, product);
    }
  }
}
