import 'package:flutter/material.dart';
import 'package:pagination_bloc/presentation/pages/widgets/products_listview_blocbuilder.dart';

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
      body: ProductsListViewBlocBuilder(),
    );
  }
}
