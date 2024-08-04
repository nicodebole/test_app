import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/config/config.dart';
import 'package:test_app/core/entities/product.dart';
import 'package:test_app/core/services/connectivity_service.dart';
import 'package:test_app/core/usecases/posts/get_post_by_id.dart';
import 'package:test_app/core/usecases/posts/get_posts.dart';
import 'package:test_app/core/usecases/products/get_product_by_id.dart';
import 'package:test_app/core/usecases/products/get_products.dart';
import 'package:test_app/data/datasources/post_remote_datasource.dart';
import 'package:test_app/data/datasources/product_hive_datasource.dart';
import 'package:test_app/data/repositories/posts_repository_impl.dart';
import 'package:test_app/presentation/blocs/post/post_bloc.dart';
import 'package:test_app/presentation/blocs/post_by_id/post_by_id_bloc.dart';
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

  static PostBloc providePostBloc() {
    final client = http.Client();
    final remoteDataSource = PostRemoteDataSource(client);
    final repository = PostRepositoryImpl(remoteDataSource);
    final getPosts = GetPosts(repository);

    return PostBloc(getPosts: getPosts);
  }

  static PostByIdBloc providePostByIdBloc() {
    final client = http.Client();
    final remoteDataSource = PostRemoteDataSource(client);
    final repository = PostRepositoryImpl(remoteDataSource);
    final getPostById = GetPostById(repository);

    return PostByIdBloc(getPostById: getPostById);
  }
}
