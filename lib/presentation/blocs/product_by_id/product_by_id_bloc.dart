import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/core/entities/product.dart';
import 'package:test_app/core/usecases/products/get_product_by_id.dart';

part 'product_by_id_event.dart';
part 'product_by_id_state.dart';

class ProductByIdBloc extends Bloc<ProductByIdEvent, ProductByIdState> {
  final GetProductById getProductById;

  ProductByIdBloc({required this.getProductById}) : super(ProductByIdInitial()) {
    on<LoadProductById>(_onLoadProductById);
  }

  void _onLoadProductById(LoadProductById event, Emitter<ProductByIdState> emit) async {
    emit(ProductByIdLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      final product = await getProductById.execute(event.id);
      emit(ProductByIdLoaded(product));
    } catch (e) {
      print(e);
      emit(ProductByIdError(e.toString()));
    }
  }
}
