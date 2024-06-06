import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '3453304dd0cd45f2acf44707240306';

  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=Cairo&cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errrorMessage = e.response?.data['error']['message'] ??
          'Oops! there was an error, try again';
      throw Exception(errrorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops! there was an error, try again');
    }
  }
}
