import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pagination_bloc/core/utils/errors/failure.dart';
import 'package:pagination_bloc/data/data_source/remote_products_data_source.dart';
import 'package:pagination_bloc/domain/entities/product_entity.dart';
import 'package:pagination_bloc/domain/repository/base_products_repository.dart';

class ProductsRepository implements BaseProductsRepository{

  final RemoteProductsDataSource remoteProductsDataSource;


  ProductsRepository(this.remoteProductsDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(int param) async{
    try {
      final List<ProductEntity> result = await remoteProductsDataSource.getProducts(param);
      return right(result);

    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}