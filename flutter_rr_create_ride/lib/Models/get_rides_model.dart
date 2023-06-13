// To parse this JSON data, do
//
//     final ridesList = ridesListFromJson(jsonString);

import 'dart:convert';

RidesList ridesListFromJson(String str) => RidesList.fromJson(json.decode(str));

String ridesListToJson(RidesList data) => json.encode(data.toJson());

class RidesList {
  String id;
  String rideTitle;
  DateTime rideCreationTime;
  String rideStatus;
  String routeDescription;
  DateTime startDate;
  DateTime endDate;
  String startAddress;
  String endAddress;
  EndLocation startLocation;
  EndLocation endLocation;
  dynamic startLocationDesc;
  dynamic endLocationDesc;
  dynamic approxBudgetNonFuel;
  dynamic approxBudgetFuel;
  dynamic maxNoOfPeople;
  dynamic minNoOfPeople;
  String rideTerrainType;
  bool rideCreatorReq;
  RideCreatorId rideCreatorId;
  List<dynamic> approvedRideMembers;
  List<dynamic> interestedRideMembers;
  List<dynamic> ridePhotos;
  List<dynamic> rideVideos;
  dynamic routeFile;

  RidesList({
    required this.id,
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
    this.startLocationDesc,
    this.endLocationDesc,
    this.approxBudgetNonFuel,
    this.approxBudgetFuel,
    this.maxNoOfPeople,
    this.minNoOfPeople,
    required this.rideTerrainType,
    required this.rideCreatorReq,
    required this.rideCreatorId,
    required this.approvedRideMembers,
    required this.interestedRideMembers,
    required this.ridePhotos,
    required this.rideVideos,
    this.routeFile,
  });

  factory RidesList.fromJson(Map<String, dynamic> json) => RidesList(
    id: json["_id"],
    rideTitle: json["ride_title"],
    rideCreationTime: DateTime.parse(json["ride_creation_time"]),
    rideStatus: json["ride_status"],
    routeDescription: json["route_description"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    startAddress: json["start_address"],
    endAddress: json["end_address"],
    startLocation: EndLocation.fromJson(json["start_location"]),
    endLocation: EndLocation.fromJson(json["end_location"]),
    startLocationDesc: json["start_location_desc"],
    endLocationDesc: json["end_location_desc"],
    approxBudgetNonFuel: json["approx_budget_non_fuel"],
    approxBudgetFuel: json["approx_budget_fuel"],
    maxNoOfPeople: json["max_no_of_people"],
    minNoOfPeople: json["min_no_of_people"],
    rideTerrainType: json["ride_terrain_type"],
    rideCreatorReq: json["ride_creator_req"],
    rideCreatorId: RideCreatorId.fromJson(json["ride_creator_id"]),
    approvedRideMembers: List<dynamic>.from(json["approved_ride_members"].map((x) => x)),
    interestedRideMembers: List<dynamic>.from(json["interested_ride_members"].map((x) => x)),
    ridePhotos: List<dynamic>.from(json["ride_photos"].map((x) => x)),
    rideVideos: List<dynamic>.from(json["ride_videos"].map((x) => x)),
    routeFile: json["route_file"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
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
    "ride_creator_id": rideCreatorId.toJson(),
    "approved_ride_members": List<dynamic>.from(approvedRideMembers.map((x) => x)),
    "interested_ride_members": List<dynamic>.from(interestedRideMembers.map((x) => x)),
    "ride_photos": List<dynamic>.from(ridePhotos.map((x) => x)),
    "ride_videos": List<dynamic>.from(rideVideos.map((x) => x)),
    "route_file": routeFile,
  };
}

class EndLocation {
  String type;
  List<double> coordinates;

  EndLocation({
    required this.type,
    required this.coordinates,
  });

  factory EndLocation.fromJson(Map<String, dynamic> json) => EndLocation(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

class RideCreatorId {
  String id;
  String rrAAboutMe;
  String rrABloodGroup;
  String rrACurrentAddress;
  EndLocation rrACurrentAddressGps;
  DateTime rrADob;
  String rrAEmail;
  String rrAFullName;
  String rrAGender;
  String rrAMobile;
  String rrAName;
  String rrANickName;
  String rrAPermanentAddress;
  dynamic rrAPermanentAddressGps;
  String rrBDrivingLicenseNumber;
  DateTime rrBDrivingLicenseValidTill;
  dynamic rrCPhotos;
  dynamic rrCProfilePhoto;
  dynamic rrCVideos;
  List<RrDEmergencyContact> rrDEmergencyContacts;
  dynamic rrDLastSeenLocation;
  dynamic rrDLastSeenTime;
  int rrECampingSkillScale;
  int rrEMechanicSkillScale;
  int rrEMedicalSkillScale;
  String rrFMedicalCondition;
  dynamic rrGRideSummary;
  List<dynamic> rrGBikes;
  dynamic rrHMyFavLinks;
  String rrZCognitoId;
  dynamic rrZSrcUid;

  RideCreatorId({
    required this.id,
    required this.rrAAboutMe,
    required this.rrABloodGroup,
    required this.rrACurrentAddress,
    required this.rrACurrentAddressGps,
    required this.rrADob,
    required this.rrAEmail,
    required this.rrAFullName,
    required this.rrAGender,
    required this.rrAMobile,
    required this.rrAName,
    required this.rrANickName,
    required this.rrAPermanentAddress,
    this.rrAPermanentAddressGps,
    required this.rrBDrivingLicenseNumber,
    required this.rrBDrivingLicenseValidTill,
    this.rrCPhotos,
    this.rrCProfilePhoto,
    this.rrCVideos,
    required this.rrDEmergencyContacts,
    this.rrDLastSeenLocation,
    this.rrDLastSeenTime,
    required this.rrECampingSkillScale,
    required this.rrEMechanicSkillScale,
    required this.rrEMedicalSkillScale,
    required this.rrFMedicalCondition,
    this.rrGRideSummary,
    required this.rrGBikes,
    this.rrHMyFavLinks,
    required this.rrZCognitoId,
    this.rrZSrcUid,
  });

  factory RideCreatorId.fromJson(Map<String, dynamic> json) => RideCreatorId(
    id: json["_id"],
    rrAAboutMe: json["rr_a_about_me"],
    rrABloodGroup: json["rr_a_blood_group"],
    rrACurrentAddress: json["rr_a_current_address"],
    rrACurrentAddressGps: EndLocation.fromJson(json["rr_a_current_address_gps"]),
    rrADob: DateTime.parse(json["rr_a_dob"]),
    rrAEmail: json["rr_a_email"],
    rrAFullName: json["rr_a_full_name"],
    rrAGender: json["rr_a_gender"],
    rrAMobile: json["rr_a_mobile"],
    rrAName: json["rr_a_name"],
    rrANickName: json["rr_a_nick_name"],
    rrAPermanentAddress: json["rr_a_permanent_address"],
    rrAPermanentAddressGps: json["rr_a_permanent_address_gps"],
    rrBDrivingLicenseNumber: json["rr_b_driving_license_number"],
    rrBDrivingLicenseValidTill: DateTime.parse(json["rr_b_driving_license_valid_till"]),
    rrCPhotos: json["rr_c_photos"],
    rrCProfilePhoto: json["rr_c_profile_photo"],
    rrCVideos: json["rr_c_videos"],
    rrDEmergencyContacts: List<RrDEmergencyContact>.from(json["rr_d_emergency_contacts"].map((x) => RrDEmergencyContact.fromJson(x))),
    rrDLastSeenLocation: json["rr_d_last_seen_location"],
    rrDLastSeenTime: json["rr_d_last_seen_time"],
    rrECampingSkillScale: json["rr_e_camping_skill_scale"],
    rrEMechanicSkillScale: json["rr_e_mechanic_skill_scale"],
    rrEMedicalSkillScale: json["rr_e_medical_skill_scale"],
    rrFMedicalCondition: json["rr_f_medical_condition"],
    rrGRideSummary: json["rr_g_ride_summary"],
    rrGBikes: List<dynamic>.from(json["rr_g_bikes"].map((x) => x)),
    rrHMyFavLinks: json["rr_h_my_fav_links"],
    rrZCognitoId: json["rr_z_cognito_id"],
    rrZSrcUid: json["rr_z_src_uid"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "rr_a_about_me": rrAAboutMe,
    "rr_a_blood_group": rrABloodGroup,
    "rr_a_current_address": rrACurrentAddress,
    "rr_a_current_address_gps": rrACurrentAddressGps.toJson(),
    "rr_a_dob": "${rrADob.year.toString().padLeft(4, '0')}-${rrADob.month.toString().padLeft(2, '0')}-${rrADob.day.toString().padLeft(2, '0')}",
    "rr_a_email": rrAEmail,
    "rr_a_full_name": rrAFullName,
    "rr_a_gender": rrAGender,
    "rr_a_mobile": rrAMobile,
    "rr_a_name": rrAName,
    "rr_a_nick_name": rrANickName,
    "rr_a_permanent_address": rrAPermanentAddress,
    "rr_a_permanent_address_gps": rrAPermanentAddressGps,
    "rr_b_driving_license_number": rrBDrivingLicenseNumber,
    "rr_b_driving_license_valid_till": "${rrBDrivingLicenseValidTill.year.toString().padLeft(4, '0')}-${rrBDrivingLicenseValidTill.month.toString().padLeft(2, '0')}-${rrBDrivingLicenseValidTill.day.toString().padLeft(2, '0')}",
    "rr_c_photos": rrCPhotos,
    "rr_c_profile_photo": rrCProfilePhoto,
    "rr_c_videos": rrCVideos,
    "rr_d_emergency_contacts": List<dynamic>.from(rrDEmergencyContacts.map((x) => x.toJson())),
    "rr_d_last_seen_location": rrDLastSeenLocation,
    "rr_d_last_seen_time": rrDLastSeenTime,
    "rr_e_camping_skill_scale": rrECampingSkillScale,
    "rr_e_mechanic_skill_scale": rrEMechanicSkillScale,
    "rr_e_medical_skill_scale": rrEMedicalSkillScale,
    "rr_f_medical_condition": rrFMedicalCondition,
    "rr_g_ride_summary": rrGRideSummary,
    "rr_g_bikes": List<dynamic>.from(rrGBikes.map((x) => x)),
    "rr_h_my_fav_links": rrHMyFavLinks,
    "rr_z_cognito_id": rrZCognitoId,
    "rr_z_src_uid": rrZSrcUid,
  };
}

class RrDEmergencyContact {
  String name;
  String email;
  String phone;

  RrDEmergencyContact({
    required this.name,
    required this.email,
    required this.phone,
  });

  factory RrDEmergencyContact.fromJson(Map<String, dynamic> json) => RrDEmergencyContact(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
  };
}
