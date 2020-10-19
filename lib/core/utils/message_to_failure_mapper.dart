import 'package:the_weather/core/error/failure.dart';

String mapMessgeToFailure(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return 'Server side error';
    case CacheFailure:
      return 'Cache error';
    case PermissionSetUpNotDone:
      return 'Permission error, tell the dev.';
    case PermissionInProgressFailure:
      return 'A running permission there, try later.';
    case PermissionDeniedFailure:
      return 'Please enable the location permission.';
    case LocationServiceOffFailure:
      return 'open the damn location';
    case NoInternetFailure:
      return 'No internet. Try again later';
    default:
      return 'Unkown error happened';
  }
}
