import 'dart:convert';

import 'package:byride_app/model/providers.dart';
import 'package:byride_app/model/rental_model.dart';
import 'package:byride_app/model/users_model.dart';
import 'package:byride_app/model/vehicle_model.dart';
import 'package:byride_app/network/api/data_api.dart';
import 'package:dio/dio.dart';

import '../network/dio_exception.dart';

class DataRepository {
  final DataApi dataApi;

  DataRepository({required this.dataApi});
  Future<List<VehicleModel>> getVehicle() async {
    try {
      final response = await dataApi.getVehicle();
      final rString = json.encode(response.data);
      return vehicleModelFromJson(rString);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<List<RentalModel>> getRental() async {
    try {
      final response = await dataApi.getRentals();
      final rString = json.encode(response.data);
      return rentalModelFromJson(rString);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<List<UsersModel>> getUsers() async {
    try {
      final response = await dataApi.gerUsers();
      final rString = json.encode(response.data);
      return usersModelFromJson(rString);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<List<ProvidersCar>> getProvidersCar(String id) async {
    try {
      final response = await dataApi.getProvidersCar(id);
      final rString = json.encode(response.data);
      return providersCarFromJson(rString);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
