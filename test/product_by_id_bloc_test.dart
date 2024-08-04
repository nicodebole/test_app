import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_app/core/entities/product.dart';
import 'package:test_app/core/entities/rating.dart';
import 'package:test_app/core/usecases/products/get_product_by_id.dart';
import 'package:test_app/presentation/blocs/product_by_id/product_by_id_bloc.dart';

class MockGetProductById extends Mock implements GetProductById {}

void main() {
  group('ProductByIdBloc', () {
    late ProductByIdBloc productByIdBloc;
    late MockGetProductById mockGetProductById;

    setUp(() {
      mockGetProductById = MockGetProductById();
      productByIdBloc = ProductByIdBloc(getProductById: mockGetProductById);
    });

    tearDown(() {
      productByIdBloc.close();
    });

    final testProduct = Product(
      id: 1,
      title: 'Test Product',
      price: 10.0,
      description: 'Test description',
      image: 'image.png',
      rating: Rating(rate: 2, count: 10),
    );

    test('El estado inicial es ProductByIdInitial', () {
      expect(productByIdBloc.state, ProductByIdInitial());
    });

    blocTest<ProductByIdBloc, ProductByIdState>(
      'Se emiten ProductByIdLoading y ProductByIdLoaded cuando se añade el evento LoadProductById y getProductById tiene éxito',
      build: () {
        when(() => mockGetProductById.execute(1))
            .thenAnswer((_) async => testProduct);
        return productByIdBloc;
      },
      act: (bloc) => bloc.add(const LoadProductById(1)),
      expect: () => [
        ProductByIdLoading(),
        ProductByIdLoaded(testProduct),
      ],
      verify: (_) {
        verify(() => mockGetProductById.execute(1)).called(1);
      },
    );

    blocTest<ProductByIdBloc, ProductByIdState>(
      'Se emiten ProductByIdLoading y ProductByIdError cuando se añade el evento LoadProductById y getProductById falla',
      build: () {
        when(() => mockGetProductById.execute(1))
            .thenThrow(Exception('Failed to load product'));
        return productByIdBloc;
      },
      act: (bloc) => bloc.add(const LoadProductById(1)),
      expect: () => [
        ProductByIdLoading(),
        isA<ProductByIdError>().having(
            (e) => e.message, 'message', 'Exception: Failed to load product'),
      ],
      verify: (_) {
        verify(() => mockGetProductById.execute(1)).called(1);
      },
    );
  });
}
