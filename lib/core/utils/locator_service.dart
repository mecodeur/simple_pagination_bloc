import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pagination_bloc/core/utils/api_service.dart';
import 'package:pagination_bloc/data/data_source/remote_products_data_source.dart';
import 'package:pagination_bloc/data/repository/products_repository.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {

  getIt.registerSingleton<ProductsRepository>(ProductsRepository(RemoteProductsDataSource(ApiService(Dio()))));

}