
import 'package:byride_app/network/api/constant.dart';
import 'package:byride_app/network/dio_client.dart';
import 'package:dio/dio.dart';

class DataApi {
  final DioClient dioClient;
  DataApi(this.dioClient);
  Future<Response> getVehicle() async {
    try {
      final Response response =
          await dioClient.get('${Endpoints.baseUrl}/vehicles');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getRentals() async {
    try {
      final Response response =
          await dioClient.get('${Endpoints.baseUrl}/rentals');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> gerUsers() async {
    try {
      final Response response =
          await dioClient.get('${Endpoints.baseUrl}/users');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getProvidersCar(String id) async {
    try {
      final Response response =
          await dioClient.get('${Endpoints.baseUrl}/vehiclespr/$id');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
