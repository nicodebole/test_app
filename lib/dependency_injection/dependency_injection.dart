import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/config/config.dart';
import 'package:test_app/core/entities/product.dart';
import 'package:test_app/services/connectivity_service.dart';
import 'package:test_app/core/usecases/products/get_product_by_id.dart';
import 'package:test_app/core/usecases/products/get_products.dart';
import 'package:test_app/data/datasources/product_hive_datasource.dart';
import 'package:test_app/presentation/blocs/product/product_bloc.dart';
import 'package:test_app/presentation/blocs/product_by_id/product_by_id_bloc.dart';
import '../data/datasources/product_remote_datasource.dart';
import '../data/repositories/product_repository_impl.dart';

class DependencyInjection {
  static ProductBloc provideProductBloc() {
    final remoteDataSource = ProductRemoteDataSource(Config.productsApiUrl);

    final productsBox = Hive.box<Product>('products');
    final hiveDataSource = ProductHiveDatasource(productsBox);

    final repository = ProductRepositoryImpl(
      remoteDataSource: remoteDataSource,
      hiveDataSource: hiveDataSource,
      connectivityService: ConnectivityService(),
    );
    final getProducts = GetProducts(repository);

    return ProductBloc(
      getProducts: getProducts,
    );
  }

  static ProductByIdBloc provideProductByIdBloc() {
    final remoteDataSource = ProductRemoteDataSource(Config.productsApiUrl);
    final productsBox = Hive.box<Product>('products');
    final hiveDataSource = ProductHiveDatasource(productsBox);

    final repository = ProductRepositoryImpl(
      remoteDataSource: remoteDataSource,
      hiveDataSource: hiveDataSource,
      connectivityService: ConnectivityService(),
    );
    final getProductById = GetProductById(repository);

    return ProductByIdBloc(getProductById: getProductById);
  }
}
