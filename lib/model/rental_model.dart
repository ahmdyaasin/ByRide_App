// To parse this JSON data, do
//
//     final rentalModel = rentalModelFromJson(jsonString);

import 'dart:convert';

List<RentalModel> rentalModelFromJson(String str) => List<RentalModel>.from(json.decode(str).map((x) => RentalModel.fromJson(x)));

String rentalModelToJson(List<RentalModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RentalModel {
    int id;
    int userId;
    int vehicleId;
    DateTime startDate;
    DateTime endDate;
    String totalCost;
    int? rentalTime;

    RentalModel({
        required this.id,
        required this.userId,
        required this.vehicleId,
        required this.startDate,
        required this.endDate,
        required this.totalCost,
        required this.rentalTime,
    });

    factory RentalModel.fromJson(Map<String, dynamic> json) => RentalModel(
        id: json["id"],
        userId: json["user_id"],
        vehicleId: json["vehicle_id"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        totalCost: json["total_cost"],
        rentalTime: json["rental_time"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "vehicle_id": vehicleId,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "total_cost": totalCost,
        "rental_time": rentalTime,
    };
}
