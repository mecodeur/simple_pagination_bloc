part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class getProductsEvent extends ProductEvent {

  @override
  List<Object> get props => [];
}

class loadMoreProductsEvent extends ProductEvent {
  final int param;

  loadMoreProductsEvent({required this.param});

  @override
  List<Object> get props => [];
}
