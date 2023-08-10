// To parse this JSON data, do
//
//     final citydata = citydataFromJson(jsonString);

import 'dart:convert';

Citydata citydataFromJson(String str) => Citydata.fromJson(json.decode(str));

String citydataToJson(Citydata data) => json.encode(data.toJson());

class Citydata {
  String status;
  String responseCode;
  List<CityDatum> cityData;
  String message;

  Citydata({
    required this.status,
    required this.responseCode,
    required this.cityData,
    required this.message,
  });

  factory Citydata.fromJson(Map<String, dynamic> json) => Citydata(
    status: json["status"],
    responseCode: json["ResponseCode"],
    cityData: List<CityDatum>.from(json["city_data"].map((x) => CityDatum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "ResponseCode": responseCode,
    "city_data": List<dynamic>.from(cityData.map((x) => x.toJson())),
    "message": message,
  };
}

class CityDatum {
  int id;
  String countriesId;
  String stateId;
  String cityName;

  CityDatum({
    required this.id,
    required this.countriesId,
    required this.stateId,
    required this.cityName,
  });

  factory CityDatum.fromJson(Map<String, dynamic> json) => CityDatum(
    id: json["id"],
    countriesId: json["countries_id"],
    stateId: json["state_id"],
    cityName: json["city_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "countries_id": countriesId,
    "state_id": stateId,
    "city_name": cityName,
  };
}
