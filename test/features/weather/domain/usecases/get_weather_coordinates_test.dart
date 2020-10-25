import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_weather/features/weather/domain/entities/weather_entity.dart';
import 'package:the_weather/features/weather/domain/repositories/weather_repo.dart';
import 'package:the_weather/features/weather/domain/usecases/get_weather_coordinates.dart';

class MockWeatherRepo extends Mock implements WeatherRepo {}

void main() {
  GetWeatherByCoordinates useCase;
  MockWeatherRepo mockWeatherRepo;

  setUp(() {
    mockWeatherRepo = MockWeatherRepo();
    useCase = GetWeatherByCoordinates(mockWeatherRepo);
  });

  final weatherEntity = WeatherEntity();

  test('Should get weather by coordinates', () async {
    when(mockWeatherRepo.getWeatherByCoordinates());
        // .thenAnswer((_) async => Right(weatherEntity));

    final result = await useCase();

    expect(result, Right(weatherEntity));
  });
}
