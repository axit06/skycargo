// To parse this JSON data, do
//
//     final statedata = statedataFromJson(jsonString);

import 'dart:convert';

Statedata statedataFromJson(String str) => Statedata.fromJson(json.decode(str));

String statedataToJson(Statedata data) => json.encode(data.toJson());

class Statedata {
  String status;
  String responseCode;
  List<StateDatum> stateData;
  String message;

  Statedata({
    required this.status,
    required this.responseCode,
    required this.stateData,
    required this.message,
  });

  factory Statedata.fromJson(Map<String, dynamic> json) => Statedata(
    status: json["status"],
    responseCode: json["ResponseCode"],
    stateData: List<StateDatum>.from(json["state_data"].map((x) => StateDatum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "ResponseCode": responseCode,
    "state_data": List<dynamic>.from(stateData.map((x) => x.toJson())),
    "message": message,
  };
}

class StateDatum {
  int id;
  String countriesId;
  String stateName;

  StateDatum({
    required this.id,
    required this.countriesId,
    required this.stateName,
  });

  factory StateDatum.fromJson(Map<String, dynamic> json) => StateDatum(
    id: json["id"],
    countriesId: json["countries_id"],
    stateName: json["state_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "countries_id": countriesId,
    "state_name": stateName,
  };
}
