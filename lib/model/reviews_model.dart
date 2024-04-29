// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);

import 'dart:convert';

List<ReviewModel> reviewModelFromJson(String str) => List<ReviewModel>.from(
    json.decode(str).map((x) => ReviewModel.fromJson(x)));

String reviewModelToJson(List<ReviewModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReviewModel {
  int id;
  int userId;
  int vehicleId;
  int rating;
  String comment;
  DateTime reviewTime;

  ReviewModel({
    required this.id,
    required this.userId,
    required this.vehicleId,
    required this.rating,
    required this.comment,
    required this.reviewTime,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        id: json["id"],
        userId: json["user_id"],
        vehicleId: json["vehicle_id"],
        rating: json["rating"],
        comment: json["comment"],
        reviewTime: DateTime.parse(json["review_time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "vehicle_id": vehicleId,
        "rating": rating,
        "comment": comment,
        "review_time": reviewTime.toIso8601String(),
      };
}
