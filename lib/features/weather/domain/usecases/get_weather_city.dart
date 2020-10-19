import 'package:dartz/dartz.dart';
import 'package:the_weather/core/error/failure.dart';
import 'package:the_weather/core/usecases/usecase.dart';
import 'package:the_weather/features/weather/domain/entities/weather_entity.dart';
import 'package:the_weather/features/weather/domain/repositories/weather_repo.dart';

class GetWeatherByCityName extends ParameterizdUseCase<WeatherEntity, String> {
  final WeatherRepo weatherRepo;

  GetWeatherByCityName(this.weatherRepo);

  @override
  Future<Either<Failure, WeatherEntity>> call(String cityName) async {
    return await weatherRepo.getWeatherByCityName(cityName: cityName);
  }
}