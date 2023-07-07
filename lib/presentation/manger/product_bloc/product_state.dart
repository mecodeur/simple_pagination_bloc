part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  get products => null;
}

class ProductsInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductsLoading extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductsPaginationLoading extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductsSuccess extends ProductState {
  final List<ProductEntity> products;

  const ProductsSuccess(this.products);

  @override
  List<Object> get props => [products];
}

class ProductsFailure extends ProductState {
  final String errMessage;

  const ProductsFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
