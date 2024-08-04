part of 'product_by_id_bloc.dart';

sealed class ProductByIdState extends Equatable {
  const ProductByIdState();

  @override
  List<Object> get props => [];
}

final class ProductByIdInitial extends ProductByIdState {}

final class ProductByIdLoading extends ProductByIdState {}

final class ProductByIdLoaded extends ProductByIdState {
  final Product product;

  const ProductByIdLoaded(this.product);

  @override
  List<Object> get props => [product];
}

final class ProductByIdError extends ProductByIdState {
  final String message;

  const ProductByIdError(this.message);

  @override
  List<Object> get props => [message];
}
