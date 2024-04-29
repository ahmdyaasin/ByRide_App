import 'package:byride_app/di/service_locater.dart';
import 'package:byride_app/model/providers.dart';
import 'package:byride_app/model/rental_model.dart';
import 'package:byride_app/model/users_model.dart';
import 'package:byride_app/model/vehicle_model.dart';
import 'package:byride_app/respository/data_repository.dart';

class Controller {
  final dRepo = getIt<DataRepository>();
  Future<List<VehicleModel>> getDevices() async {
    final data = await dRepo.getVehicle();
    return data;
  }

  Future<List<RentalModel>> getRentals() async {
    final data = await dRepo.getRental();
    return data;
  }

  Future<List<UsersModel>> getUsers() async {
    final data = await dRepo.getUsers();
    return data;
  }

  Future<List<ProvidersCar>> getProviderCar(String id) async {
    final data = await dRepo.getProvidersCar(id);
    return data;
  }
  
}
