// To parse this JSON data, do
//
//     final createRideModel = createRideModelFromJson(jsonString);

import 'dart:convert';

CreateRideModel createRideModelFromJson(String str) => CreateRideModel.fromJson(json.decode(str));

String createRideModelToJson(CreateRideModel data) => json.encode(data.toJson());

class CreateRideModel {
  String rideTitle;
  DateTime rideCreationTime;
  String rideStatus;
  String routeDescription;
  DateTime startDate;
  DateTime endDate;
  String startAddress;
  String endAddress;
  Location startLocation;
  Location endLocation;
  String startLocationDesc;
  String endLocationDesc;
  int approxBudgetNonFuel;
  int approxBudgetFuel;
  int maxNoOfPeople;
  int minNoOfPeople;
  String rideTerrainType;
  bool rideCreatorReq;

  CreateRideModel({
    required this.rideTitle,
    required this.rideCreationTime,
    required this.rideStatus,
    required this.routeDescription,
    required this.startDate,
    required this.endDate,
    required this.startAddress,
    required this.endAddress,
    required this.startLocation,
    required this.endLocation,
    required this.startLocationDesc,
    required this.endLocationDesc,
    required this.approxBudgetNonFuel,
    required this.approxBudgetFuel,
    required this.maxNoOfPeople,
    required this.minNoOfPeople,
    required this.rideTerrainType,
    required this.rideCreatorReq,
  });

  factory CreateRideModel.fromJson(Map<String, dynamic> json) => CreateRideModel(
    rideTitle: json["ride_title"],
    rideCreationTime: DateTime.parse(json["ride_creation_time"]),
    rideStatus: json["ride_status"],
    routeDescription: json["route_description"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    startAddress: json["start_address"],
    endAddress: json["end_address"],
    startLocation: Location.fromJson(json["start_location"]),
    endLocation: Location.fromJson(json["end_location"]),
    startLocationDesc: json["start_location_desc"],
    endLocationDesc: json["end_location_desc"],
    approxBudgetNonFuel: json["approx_budget_non_fuel"],
    approxBudgetFuel: json["approx_budget_fuel"],
    maxNoOfPeople: json["max_no_of_people"],
    minNoOfPeople: json["min_no_of_people"],
    rideTerrainType: json["ride_terrain_type"],
    rideCreatorReq: json["ride_creator_req"],
  );

  Map<String, dynamic> toJson() => {
    "ride_title": rideTitle,
    "ride_creation_time": rideCreationTime.toIso8601String(),
    "ride_status": rideStatus,
    "route_description": routeDescription,
    "start_date": startDate.toIso8601String(),
    "end_date": endDate.toIso8601String(),
    "start_address": startAddress,
    "end_address": endAddress,
    "start_location": startLocation.toJson(),
    "end_location": endLocation.toJson(),
    "start_location_desc": startLocationDesc,
    "end_location_desc": endLocationDesc,
    "approx_budget_non_fuel": approxBudgetNonFuel,
    "approx_budget_fuel": approxBudgetFuel,
    "max_no_of_people": maxNoOfPeople,
    "min_no_of_people": minNoOfPeople,
    "ride_terrain_type": rideTerrainType,
    "ride_creator_req": rideCreatorReq,
  };
}

class Location {
  String type;
  List<String> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: List<String>.from(json["coordinates"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}
