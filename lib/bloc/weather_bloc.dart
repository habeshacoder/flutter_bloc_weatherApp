import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetched>(_getCurrentWeather);
  }
  void _getCurrentWeather(
      WeatherFetched event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weahter = await weatherRepository.getCurrentWeather();
      emit(WeatherSuccess(weatherModel: weahter));
    } catch (error) {
      emit(WeatherFailer(error.toString()));
    }
    //
  }
}
