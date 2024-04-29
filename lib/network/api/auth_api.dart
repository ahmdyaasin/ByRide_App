import 'dart:convert';
import 'dart:io';

import 'package:byride_app/network/api/constant.dart';
import 'package:byride_app/network/dio_client.dart';
import 'package:dio/dio.dart';

class AuthApi {
  final DioClient dioClient;

  AuthApi(this.dioClient);

  Future<dynamic> login(String username, String password, String email) async {
    try {
      var params = {
        "username": username,
        "email": email,
        "password": password,
      };

      Response response = await dioClient.post(
        '${Endpoints.baseUrl}/login',
        data: json.encode(params),
      );
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> signUpUser(
      String username, String password, String email, String fullname) async {
    try {
      var params = {
        "username": username,
        "password": password,
        "email": email,
        "fullname": fullname
      };

      Response response = await dioClient.post(
        '${Endpoints.baseUrl}/service_users',
        data: json.encode(params),
      );
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> signUpProvider(
      String username, String password, String email, String fullname) async {
    try {
      var params = {
        "username": username,
        "password": password,
        "email": email,
        "fullname": fullname
      };

      Response response = await dioClient.post(
        '${Endpoints.baseUrl}/service_providers',
        data: json.encode(params),
      );
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> booking(String userId, String vehicleId, String startDate,
      String endDate, String totalCost, String rentalTime) async {
    try {
      var params = {
        "user_id": userId,
        "vehicle_id": vehicleId,
        "start_date": startDate,
        "end_date": endDate,
        "total_cost": totalCost,
        "rental_time": rentalTime
      };

      Response response = await dioClient.post(
        '${Endpoints.baseUrl}/rentals',
        data: json.encode(params),
      );
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> addVehicle(
      String brand,
      String model,
      int year,
      String rental,
      int availability,
      int pid,
      String type,
      String picture,
      String transmission,
      String numseats) async {
    try {
      var params = {
        "brand": brand,
        "model": model,
        "year": year,
        "rental_rate": rental,
        "availability": availability,
        "service_provider_id": pid,
        "type": type,
        "picture_path": picture,
        "transmission": transmission,
        "num_seats": numseats
      };
      Response response = await dioClient.post(
        '${Endpoints.baseUrl}/vehicles',
        data: json.encode(params),
      );
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> updateVehicle(
      String userid,
      String brand,
      String model,
      int year,
      String rental,
      int availability,
      int pid,
      String type,
      String picture,
      String transmission,
      String numseats) async {
    try {
      var params = {
        "brand": brand,
        "model": model,
        "year": year,
        "rental_rate": rental,
        "availability": availability,
        "service_provider_id": userid,
        "type": type,
        "picture_path": picture,
        "transmission": transmission,
        "num_seats": numseats
      };

      Response response = await dioClient.put(
        '${Endpoints.baseUrl}/vehicles/$pid',
        data: json.encode(params),
      );
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> addProfileUserPicture(
      String picture
) async {
    try {
      var params = {
        "profile_picture_path": picture
      };
      Response response = await dioClient.post(
        '${Endpoints.baseUrl}/service_users',
        data: json.encode(params),
      );
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> updateProfileUserPicture(
      String username,
      String fullname,
      String email,
      int pid,
      String type,
      String picture) async {
    try {
      var params = {
        "profile_picture_path": picture,
        "username": username,
        "email" : email,
        "fullname" : fullname
      };

      Response response = await dioClient.put(
        '${Endpoints.baseUrl}/service_users/$pid',
        data: json.encode(params),
      );
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }
}



