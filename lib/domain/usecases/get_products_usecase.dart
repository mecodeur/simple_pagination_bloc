import 'package:dartz/dartz.dart';
import 'package:pagination_bloc/core/utils/base_usecase.dart';
import 'package:pagination_bloc/domain/repository/base_products_repository.dart';

import '../../core/utils/errors/failure.dart';
import '../entities/product_entity.dart';

class GetProductsUseCase extends BaseUseCase<List<ProductEntity>, int> {
  final BaseProductsRepository baseProductsRepository;

  GetProductsUseCase(this.baseProductsRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(int param) async {
    return await baseProductsRepository.getProducts(param);
  }
}
