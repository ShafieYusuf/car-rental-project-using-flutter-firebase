part of 'car_bloc.dart';

@immutable
sealed class CarState {}

class CarLoading extends CarState {}

class CarsLoaded extends CarState {
  final List<Car> car;

  CarsLoaded({required this.car});
}

class CarsError extends CarState {
  final String message;
  CarsError(this.message);
}
