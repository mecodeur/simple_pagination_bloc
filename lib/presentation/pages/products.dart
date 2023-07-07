import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manger/product_bloc/product_bloc.dart';

class Products extends StatelessWidget {
  const Products({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is PaginationLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PaginationFailure) {
                return Center(child: Text('Error ${state.errMessage}'));
              } else if (state is PaginationSuccess) {
                return ListView.builder(
                  padding: EdgeInsets.all(12.0),
                  controller: state.scrollController,
                  itemCount: BlocProvider.of<ProductBloc>(context).isLoading
                      ? state.products.length + 1
                      : state.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    var products = state.products;
                    if ( index >= products.length) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Card(
                        child: ListTile(
                          leading: Image.network(
                            products[index].thumbnail,
                            height: 50,
                            width: 50,
                          ),
                          title: Text(products[index].title),
                          subtitle: Text(products[index].description),
                        ),
                      );
                    }
                  },
                );
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }
}
