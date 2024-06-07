//import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/weather_model.dart';
import '../../services/weather_services.dart';
import '../../views/search_view.dart';
import 'get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit(): super(WeatherInitialState());
  late WeatherModel weatherModel;

  getWeather({required String cityName}) async {
    try {
       weatherModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedStates(weatherModel));
    }  catch (e) {
      emit(WeatherFailureStates(e.toString()));
    }
  }
}
