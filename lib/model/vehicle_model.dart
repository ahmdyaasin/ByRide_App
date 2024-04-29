// To parse this JSON data, do
//
//     final vehicleModel = vehicleModelFromJson(jsonString);

import 'dart:convert';

List<VehicleModel> vehicleModelFromJson(String str) => List<VehicleModel>.from(json.decode(str).map((x) => VehicleModel.fromJson(x)));

String vehicleModelToJson(List<VehicleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VehicleModel {
    int id;
    String brand;
    String model;
    int year;
    String rentalRate;
    int availability;
    int serviceProviderId;
    String? picturePath;
    String type;
    String transmission;
    int numSeats;

    VehicleModel({
        required this.id,
        required this.brand,
        required this.model,
        required this.year,
        required this.rentalRate,
        required this.availability,
        required this.serviceProviderId,
        required this.picturePath,
        required this.type,
        required this.transmission,
        required this.numSeats,
    });

    factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        id: json["id"],
        brand: json["brand"],
        model: json["model"],
        year: json["year"],
        rentalRate: json["rental_rate"],
        availability: json["availability"],
        serviceProviderId: json["service_provider_id"],
        picturePath: json["picture_path"],
        type: json["type"],
        transmission: json["transmission"],
        numSeats: json["num_seats"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "model": model,
        "year": year,
        "rental_rate": rentalRate,
        "availability": availability,
        "service_provider_id": serviceProviderId,
        "picture_path": picturePath,
        "type": type,
        "transmission": transmission,
        "num_seats": numSeats,
    };
}
