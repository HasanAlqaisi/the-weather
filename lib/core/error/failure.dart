import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List prop = const <dynamic>[];

  @override
  List<Object> get props => prop;
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class PermissionSetUpNotDone extends Failure {}

class PermissionInProgressFailure extends Failure {
}

class PermissionDeniedFailure extends Failure {
}

class LocationServiceOffFailure extends Failure {
}

class NoInternetFailure extends Failure {
}
