import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pagination_bloc/domain/entities/product_entity.dart';

import '../../../domain/usecases/get_products_usecase.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProductsUseCase;

  ProductBloc(this.getProductsUseCase) : super(ProductsInitial()) {
    on<getProductsEvent>((event, emit) async {
      emit(ProductsLoading());
      final result = await getProductsUseCase(0);
      result.fold((failure) {
        return emit(ProductsFailure(failure.message));
      }, (products) {
        return emit(ProductsSuccess(products));
      });
    });

    on<loadMoreProductsEvent>((event, emit) async {
      final result = await getProductsUseCase(event.param);
      result.fold((failure) {
        return emit(ProductsFailure(failure.message));
      }, (products) {
        return emit(ProductsSuccess([...state.products, ...products]));
      });
    });
  }
}
