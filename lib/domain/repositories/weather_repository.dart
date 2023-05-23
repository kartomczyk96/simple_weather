import 'package:simple_weather/data/remote_data_sources/weather_remote_data_souce.dart';
import 'package:simple_weather/domain/models/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDataSource);

  final WeatherRemoteDataSource _weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final resposneData = await _weatherRemoteDataSource.getWeatherData(
      city: city,
    );

    if (resposneData == null) {
      return null;
    }

    final name = resposneData['location']['name'] as String;
    final temperature = (resposneData['current']['temp_c'] + 0.0) as double;
    return WeatherModel(city: name, temperature: temperature);
  }
}
