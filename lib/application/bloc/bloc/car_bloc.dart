import 'package:bloc/bloc.dart';
import 'package:carrental/data/models/car_model.dart';
import 'package:carrental/domain/usescases/getcars.dart';
import 'package:meta/meta.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getcars;

  CarBloc({required this.getcars}) : super(CarLoading()) {
    on<LoadCars>((event, emit) async {
      emit(CarLoading());
      try {
        final cars = await getcars.call();
        emit(CarsLoaded(car: cars));
      } catch (e) {
        emit(CarsError(e.toString()));
      }
    });
  }
}
