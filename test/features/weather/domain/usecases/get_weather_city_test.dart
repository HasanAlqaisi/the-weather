import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_weather/features/weather/domain/entities/weather_entity.dart';
import 'package:the_weather/features/weather/domain/repositories/weather_repo.dart';
import 'package:the_weather/features/weather/domain/usecases/get_weather_city.dart';

class MockWeatherRepo extends Mock implements WeatherRepo {}

void main() {
  GetWeatherByCityName useCase;
  MockWeatherRepo mockWeatherRepo;

  setUp(() {
    mockWeatherRepo = MockWeatherRepo();
    useCase = GetWeatherByCityName(mockWeatherRepo);
  });

  final weatherEntity = WeatherEntity();

  test('Should get weather by city Name', () async {
    when(mockWeatherRepo.getWeatherByCityName(cityName: 'Baghdad'))
        .thenAnswer((_) async => Right(weatherEntity));

    final result = await useCase('Baghdad');

    expect(result, Right(weatherEntity));
  });
}
