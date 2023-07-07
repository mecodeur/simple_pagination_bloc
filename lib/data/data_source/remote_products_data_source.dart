import 'package:pagination_bloc/core/utils/api_service.dart';
import 'package:pagination_bloc/data/models/products_model.dart';

abstract class BaseRemoteProductsDataSource {
  Future<List<ProductsModel>> getProducts(int param);
}

class RemoteProductsDataSource implements BaseRemoteProductsDataSource {
  final int limit = 10;
  final ApiService apiService;

  RemoteProductsDataSource(this.apiService);

  @override
  Future<List<ProductsModel>> getProducts(int param) async {
    final Map<String, dynamic> result =
        await apiService.get(endPoint: 'products?limit=$limit&skip=$param');

    List<ProductsModel> products = [];

    products = List<ProductsModel>.from(
        (result['products'] as List).map((e) => ProductsModel.fromJson(e)));

    return products;
  }
}
