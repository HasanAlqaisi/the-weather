import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_weather/core/network/network_info.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  MockDataConnectionChecker mockDataConnectionChecker;
  NetworkInfoImpl networkInfoImpl;

  group('isConnected', () {
    setUp(() {
      mockDataConnectionChecker = MockDataConnectionChecker();
      networkInfoImpl = NetworkInfoImpl(mockDataConnectionChecker);
    });

    test('should forward the call to DataConnectionChecker.hasConnection', () {
      Future<bool> tHasConnection = Future.value(true);
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnection);

      final result = networkInfoImpl.isConnected;

      verify(mockDataConnectionChecker.hasConnection);
      expect(result, tHasConnection);
    });
  });
}
