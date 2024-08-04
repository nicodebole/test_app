import 'package:test_app/core/entities/product.dart';
import 'package:test_app/core/repositories/products/product_repository.dart';

class GetProductById {
  final ProductRepository repository;

  GetProductById(this.repository);

  Future<Product> execute(int id) {
    return repository.getProductById(id);
  }
}
