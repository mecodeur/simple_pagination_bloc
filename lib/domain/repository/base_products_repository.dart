import 'package:dartz/dartz.dart';
import 'package:pagination_bloc/domain/entities/product_entity.dart';

import '../../core/utils/errors/failure.dart';

abstract class BaseProductsRepository{

  Future<Either<Failure, List<ProductEntity>>> getProducts(int param);

}