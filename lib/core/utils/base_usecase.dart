import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'errors/failure.dart';

abstract class BaseUseCase<T, Parameters> {

  Future<Either<Failure, T>> call(Parameters param);

}

class NoParam extends Equatable {
  @override
  List<Object> get props => [];
}