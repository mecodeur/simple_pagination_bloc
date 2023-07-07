import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_bloc/presentation/manger/product_bloc/product_bloc.dart';
import 'package:pagination_bloc/presentation/pages/widgets/products_listview.dart';

class ProductsListViewBlocBuilder extends StatelessWidget {
  const ProductsListViewBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsListView(
            products: state.products,
          );
        } else if (state is ProductsFailure) {
          return Center(child: Text('Error ${state.errMessage}'));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
