import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_bloc/domain/entities/product_entity.dart';
import 'package:pagination_bloc/presentation/manger/product_bloc/product_bloc.dart';

class ProductsListView extends StatefulWidget {
  const ProductsListView({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  State<ProductsListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  late final ScrollController _scrollController;
  int param = 0;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    //var currentPositions = _scrollController.position.pixels;
    //var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      //if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        param = param + 10;
        await context.read<ProductBloc>()
          ..add(loadMoreProductsEvent(param: param));
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.all(12.0),
      itemCount: widget.products.length,
      itemBuilder: (BuildContext context, int index) {
        print('Is loading : $isLoading');
        return Card(
          child: ListTile(
            leading: Image.network(widget.products[index].thumbnail, height: 50, width: 50,),
            title: Text(widget.products[index].title),
            subtitle: Text(widget.products[index].description),
          ),
        );
      },
    );
  }
}
