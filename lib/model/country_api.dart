// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

Countrycode countryFromJson(String str) => Countrycode.fromJson(json.decode(str));

String countryToJson(Countrycode data) => json.encode(data.toJson());

class Countrycode {
  String status;
  String responseCode;
  List<GeneralSetting> generalSettings;
  String imgPath;
  List<CountryElement> countries;
  List<String> nameCode;
  List<String> countryCode;
  String message;

  Countrycode({
    required this.status,
    required this.responseCode,
    required this.generalSettings,
    required this.imgPath,
    required this.countries,
    required this.nameCode,
    required this.countryCode,
    required this.message,
  });

  factory Countrycode.fromJson(Map<String, dynamic> json) => Countrycode(
    status: json["status"],
    responseCode: json["ResponseCode"],
    generalSettings: List<GeneralSetting>.from(json["general_settings"].map((x) => GeneralSetting.fromJson(x))),
    imgPath: json["img_path"],
    countries: List<CountryElement>.from(json["countries"].map((x) => CountryElement.fromJson(x))),
    nameCode: List<String>.from(json["nameCode"].map((x) => x)),
    countryCode: List<String>.from(json["CountryCode"].map((x) => x)),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "ResponseCode": responseCode,
    "general_settings": List<dynamic>.from(generalSettings.map((x) => x.toJson())),
    "img_path": imgPath,
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
    "nameCode": List<dynamic>.from(nameCode.map((x) => x)),
    "CountryCode": List<dynamic>.from(countryCode.map((x) => x)),
    "message": message,
  };
}

class CountryElement {
  int id;
  String countriesName;
  String countriesIso;

  CountryElement({
    required this.id,
    required this.countriesName,
    required this.countriesIso,
  });

  factory CountryElement.fromJson(Map<String, dynamic> json) => CountryElement(
    id: json["id"],
    countriesName: json["countries_name"],
    countriesIso: json["countries_iso"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "countries_name": countriesName,
    "countries_iso": countriesIso,
  };
}

class GeneralSetting {
  int id;
  String siteTitle;
  String siteLogo;
  String siteCurrency;
  String siteTimezone;
  String currencyPlacement;
  String thousandsSeparator;
  String onesignalAppId;
  String onesignalApiKey;
  String twilioSid;
  String twilioAuthToken;
  String twilioPhoneNo;

  GeneralSetting({
    required this.id,
    required this.siteTitle,
    required this.siteLogo,
    required this.siteCurrency,
    required this.siteTimezone,
    required this.currencyPlacement,
    required this.thousandsSeparator,
    required this.onesignalAppId,
    required this.onesignalApiKey,
    required this.twilioSid,
    required this.twilioAuthToken,
    required this.twilioPhoneNo,
  });

  factory GeneralSetting.fromJson(Map<String, dynamic> json) => GeneralSetting(
    id: json["id"],
    siteTitle: json["site_title"],
    siteLogo: json["site_logo"],
    siteCurrency: json["site_currency"],
    siteTimezone: json["site_timezone"],
    currencyPlacement: json["currency_placement"],
    thousandsSeparator: json["thousands_separator"],
    onesignalAppId: json["onesignal_app_id"],
    onesignalApiKey: json["onesignal_api_key"],
    twilioSid: json["twilio_sid"],
    twilioAuthToken: json["twilio_auth_token"],
    twilioPhoneNo: json["twilio_phone_no"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "site_title": siteTitle,
    "site_logo": siteLogo,
    "site_currency": siteCurrency,
    "site_timezone": siteTimezone,
    "currency_placement": currencyPlacement,
    "thousands_separator": thousandsSeparator,
    "onesignal_app_id": onesignalAppId,
    "onesignal_api_key": onesignalApiKey,
    "twilio_sid": twilioSid,
    "twilio_auth_token": twilioAuthToken,
    "twilio_phone_no": twilioPhoneNo,
  };
}
