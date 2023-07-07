import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_bloc/core/utils/locator_service.dart';
import 'package:pagination_bloc/data/repository/products_repository.dart';
import 'package:pagination_bloc/domain/usecases/get_products_usecase.dart';
import 'package:pagination_bloc/presentation/manger/product_bloc/product_bloc.dart';
import 'package:pagination_bloc/presentation/pages/products.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) =>
            ProductBloc(GetProductsUseCase(getIt<ProductsRepository>()))
              ..add(getProductsEvent()),
        child: Products(title: 'Products Pagination'),
      ),
    );
  }
}
