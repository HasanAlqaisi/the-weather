import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_weather/core/error/failure.dart';
import 'package:the_weather/core/platform/location_info.dart';

class MockGeolocator extends Mock implements GeolocatorPlatform {}

void main() {
  LocationInfoImpl locationInfoImpl;
  MockGeolocator mockGeolocator;

  setUp(() {
    mockGeolocator = MockGeolocator();
    locationInfoImpl = LocationInfoImpl(mockGeolocator);
  });

  group('requestAndgetPermissionState', () {
    test('should return always if user accepted the permission', () async {
      when(mockGeolocator.requestPermission())
          .thenAnswer((_) async => LocationPermission.always);

      final result = await locationInfoImpl.permissionState;

      verify(mockGeolocator.requestPermission());
      expect(result, Right(LocationPermission.always));
    });

    test('should return denied if user denied the permission', () async {
      when(mockGeolocator.requestPermission())
          .thenAnswer((_) async => LocationPermission.denied);

      final result = await locationInfoImpl.permissionState;

      verify(mockGeolocator.requestPermission());
      expect(result, Right(LocationPermission.denied));
    });

    test(
        'should return deniedForever if user click don\'t ask again about the permission',
        () async {
      when(mockGeolocator.requestPermission())
          .thenAnswer((_) async => LocationPermission.deniedForever);

      final result = await locationInfoImpl.permissionState;

      verify(mockGeolocator.requestPermission());
      expect(result, Right(LocationPermission.deniedForever));
    });

    test(
        'should return whileInUse if user accepted the permission only while using the app',
        () async {
      when(mockGeolocator.requestPermission())
          .thenAnswer((_) async => LocationPermission.whileInUse);

      final result = await locationInfoImpl.permissionState;

      verify(mockGeolocator.requestPermission());
      expect(result, Right(LocationPermission.whileInUse));
    });

    test(
        'should return PermissionSetUpNotDone if the dev forgot to add the required setup',
        () async {
      when(mockGeolocator.requestPermission())
          .thenThrow(PermissionDefinitionsNotFoundException(''));

      final result = await locationInfoImpl.permissionState;

      verify(mockGeolocator.requestPermission());
      expect(result, Left(PermissionSetUpNotDone()));
    });

    test(
        'should return PermissionInProgressFailure if there\'s a running request',
        () async {
      when(mockGeolocator.requestPermission())
          .thenThrow(PermissionRequestInProgressException(''));

      final result = await locationInfoImpl.permissionState;

      verify(mockGeolocator.requestPermission());
      expect(result, Left(PermissionInProgressFailure()));
    });
  });

  group('currentPosition', () {
    test('should return Position when no exceptions', () async {
      when(mockGeolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.low))
          .thenAnswer((_) async => Position());

      final result = await locationInfoImpl.currentPosition;

      verify(mockGeolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low));
      expect(result, Right(Position()));
    });

    test(
        'should return PermissionDeniedFailure when the user denied the permission',
        () async {
      when(mockGeolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.low))
          .thenThrow(PermissionDeniedException(''));

      final result = await locationInfoImpl.currentPosition;

      verify(mockGeolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low));
      expect(result, Left(PermissionDeniedFailure()));
    });
  });

  group('isServiceEnabled', () {
    test('should return true if location service is on', () async {
      when(mockGeolocator.isLocationServiceEnabled())
          .thenAnswer((_) async => true);

      final result = await locationInfoImpl.isServiceEnabled;

      verify(mockGeolocator.isLocationServiceEnabled());
      expect(result, true);
    });
  });
}
