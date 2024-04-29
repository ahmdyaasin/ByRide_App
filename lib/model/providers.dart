// To parse this JSON data, do
//
//     final providersCar = providersCarFromJson(jsonString);

import 'dart:convert';

List<ProvidersCar> providersCarFromJson(String str) => List<ProvidersCar>.from(json.decode(str).map((x) => ProvidersCar.fromJson(x)));

String providersCarToJson(List<ProvidersCar> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProvidersCar {
    int id;
    String brand;
    String model;
    int year;
    String rentalRate;
    int availability;
    int serviceProviderId;
    String picturePath;
    String type;
    String transmission;
    int numSeats;

    ProvidersCar({
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

    factory ProvidersCar.fromJson(Map<String, dynamic> json) => ProvidersCar(
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
