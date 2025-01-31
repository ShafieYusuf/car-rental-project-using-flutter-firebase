import 'package:carrental/application/bloc/bloc/car_bloc.dart';
import 'package:carrental/data/datasources/firebase_car_datasource.dart';
import 'package:carrental/data/repositories/car_repository.dart';
import 'package:carrental/domain/repositories/crepositort.dart';
import 'package:carrental/domain/usescases/getcars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDataSource>(
      () => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>()),
    );
    getIt.registerLazySingleton<CarRepository>(
      () => CarRepositoryImpl(getIt<FirebaseCarDataSource>()),
    );
    getIt.registerLazySingleton<GetCars>(
      () => GetCars(getIt<CarRepository>()),
    );
    getIt.registerFactory(() => CarBloc(getcars: getIt<GetCars>()));
  } catch (e) {
    rethrow;
  }
}
