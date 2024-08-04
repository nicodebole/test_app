import 'package:test_app/core/entities/product.dart';
import 'package:test_app/core/repositories/products/product_repository.dart';
import 'package:test_app/core/services/connectivity_service.dart';
import 'package:test_app/data/datasources/product_hive_datasource.dart';
import 'package:test_app/data/datasources/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductHiveDatasource hiveDataSource;
  final ConnectivityService connectivityService;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.hiveDataSource,
    required this.connectivityService,
  });

  @override
  Future<List<Product>> getProducts() async {
    if (await connectivityService.isConnected()) {
      final products = await remoteDataSource.getProducts();
      await hiveDataSource.saveProducts(products);
      return products;
    }

    return hiveDataSource.getProducts();
  }

  @override
  Future<Product> getProductById(int id) async {
    if (await connectivityService.isConnected()) {
      final product = await remoteDataSource.getProductById(id);
      await hiveDataSource.saveProducts([product]);
      return product;
    }

    final product = hiveDataSource.getProductById(id);
    if (product != null) {
      return product;
    } else {
      throw Exception('Product not found');
    }
  }
}
