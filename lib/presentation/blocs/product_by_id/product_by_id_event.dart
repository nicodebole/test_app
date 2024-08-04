part of 'product_by_id_bloc.dart';

sealed class ProductByIdEvent extends Equatable {
  const ProductByIdEvent();

  @override
  List<Object> get props => [];
}


class LoadProductById extends ProductByIdEvent {
  final int id;

  const LoadProductById(this.id);

  @override
  List<Object> get props => [id];
}