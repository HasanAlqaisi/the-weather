import 'package:dartz/dartz.dart';
import 'package:the_weather/core/error/failure.dart';

abstract class ParameterizdUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}
