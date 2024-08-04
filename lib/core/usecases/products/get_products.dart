import 'package:test_app/core/entities/product.dart';
import 'package:test_app/core/repositories/products/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<Product>> execute() {
    return repository.getProducts();
  }
}
