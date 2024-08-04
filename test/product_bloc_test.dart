import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_app/core/entities/product.dart';
import 'package:test_app/core/entities/rating.dart';
import 'package:test_app/core/usecases/products/get_products.dart';
import 'package:test_app/presentation/blocs/product/product_bloc.dart';

class MockGetProducts extends Mock implements GetProducts {}

void main() {
  group('ProductsBloc', () {
    late ProductBloc productBloc;
    late MockGetProducts mockGetProducts;

    setUp(() {
      mockGetProducts = MockGetProducts();
      productBloc = ProductBloc(
        getProducts: mockGetProducts,
      );
    });

    tearDown(() {
      productBloc.close();
    });

    final testProduct = Product(
      id: 1,
      title: 'Test Product',
      price: 10.0,
      description: 'Test Description',
      image: 'image1.png',
      rating: Rating(rate: 2, count: 10),
    );

    blocTest<ProductBloc, ProductState>(
      'Se emiten ProductLoading y ProductLoaded cuando se añade el evento LoadProducts y getProducts tiene éxito',
      build: () {
        when(() => mockGetProducts.execute())
            .thenAnswer((_) async => [testProduct]);
        return productBloc;
      },
      act: (bloc) => bloc.add(LoadProducts()),
      expect: () => [
        ProductLoading(),
        ProductLoaded([testProduct]),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'Se emiten ProductLoading y ProductError cuando se añade el evento LoadProducts y getProducts falla',
      build: () {
        when(() => mockGetProducts.execute())
            .thenThrow(Exception('Failed to load product'));
        return productBloc;
      },
      act: (bloc) => bloc.add(LoadProducts()),
      expect: () => [
        ProductLoading(),
        ProductError('Exception: Failed to load product'),
      ],
    );
  });
}
