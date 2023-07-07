part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  get products => null;
}

class PaginationInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class PaginationLoading extends ProductState {
  @override
  List<Object> get props => [];
}

class PaginationLoading2 extends ProductState {
  @override
  List<Object> get props => [];
}

class PaginationSuccess extends ProductState {
  final List<ProductEntity> products;
  final ScrollController scrollController;

  const PaginationSuccess(this.products, this.scrollController);

  @override
  List<Object> get props => [products];
}

class PaginationFailure extends ProductState {
  final String errMessage;

  const PaginationFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
