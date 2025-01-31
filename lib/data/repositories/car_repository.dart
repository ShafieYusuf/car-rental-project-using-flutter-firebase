import 'package:carrental/data/datasources/firebase_car_datasource.dart';
import 'package:carrental/data/models/car_model.dart';
import 'package:carrental/domain/repositories/crepositort.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }
}
