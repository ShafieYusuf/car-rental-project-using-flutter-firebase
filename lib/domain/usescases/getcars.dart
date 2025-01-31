import 'package:carrental/data/models/car_model.dart';
import 'package:carrental/domain/repositories/crepositort.dart';

class GetCars {
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<Car>> call() async {
    return await repository.fetchCars();
  }
}
