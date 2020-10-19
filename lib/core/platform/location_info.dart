import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:the_weather/core/error/failure.dart';

abstract class LocationInfo {
  /// Request permission to access the location of the device.
  ///
  /// Returns a [Right(LocationPermission)] when the permission request done.
  ///
  /// returns a [PermissionSetUpNotDone] when the dev forgot to add in manifest and the ios thing.
  ///
  /// returnes a[PermissionInProgressFailure] if permissions are requested
  /// while an earlier request has not yet been completed.
  Future<Either<Failure, LocationPermission>> get permissionState;

  Future<bool> get isServiceEnabled;

  /// Returns [Right(Position)] taking the supplied [desiredAccuracy] into account.
  ///
  /// returns a [PermissionDeniedFailure] when trying to request the device's
  /// location when the user denied access.
  Future<Either<Failure, Position>> get currentPosition;
}

class LocationInfoImpl implements LocationInfo {
  final GeolocatorPlatform geolocation;

  LocationInfoImpl(this.geolocation);

  @override
  Future<Either<Failure, Position>> get currentPosition =>
      handleCurrentLocation();

  @override
  Future<Either<Failure, LocationPermission>> get permissionState async =>
      requestAndgetPermissionState();

  @override
  Future<bool> get isServiceEnabled => geolocation.isLocationServiceEnabled();

  Future<Either<Failure, LocationPermission>>
      requestAndgetPermissionState() async {
    try {
      return Right(await geolocation.requestPermission());
    } on PermissionDefinitionsNotFoundException {
      return Left(PermissionSetUpNotDone());
    } on PermissionRequestInProgressException {
      return Left(PermissionInProgressFailure());
    } catch (e) {
      return Left(e);
    }
  }

  Future<Either<Failure, Position>> handleCurrentLocation() async {
    try {
      return Right(await geolocation.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low));
    } on PermissionDeniedException {
      return Left(PermissionDeniedFailure());
    } catch (e) {
      return Left(e);
    }
  }
}
