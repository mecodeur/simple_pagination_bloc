import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pagination_bloc/domain/entities/product_entity.dart';

import '../../../domain/usecases/get_products_usecase.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProductsUseCase;
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  int param = 0;

  ProductBloc(this.getProductsUseCase) : super(PaginationInitial()) {
    scrollController.addListener(() {
      add(loadMoreProductsEvent(param: param));
    });

    on<getProductsEvent>((event, emit) async {
      emit(PaginationLoading());
      final result = await getProductsUseCase(param);
      result.fold((failure) {
        return emit(PaginationFailure(failure.message));
      }, (products) {
        return emit(PaginationSuccess(products, scrollController));
      });
    });

    on<loadMoreProductsEvent>((event, emit) async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        isLoading = true;
        final result = await getProductsUseCase(param + 10);
        result.fold((failure) {
          isLoading = false;
          return emit(PaginationFailure(failure.message));
        }, (products) {
          param = param + 10;
          return emit(PaginationSuccess(
              [...state.products, ...products], scrollController));
        });
      }
    });
  }

  @override
  void dispose() {}
/*
  @override
  Future<void> close() {
    scrollController.dispose(); // Dispose the scrollController
    return super.close();
  }*/
}
