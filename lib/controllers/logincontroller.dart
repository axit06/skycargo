import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skycargo/model/daskborddata.dart';
import '../apicontroller.dart';
import '../bottomhomescreen.dart';
import '../model/city_api.dart';
import '../model/country_api.dart';
import '../model/state_api.dart';

class LoginController extends GetxController {
  final ApiService _apiService = ApiService();
  bool submit = false;
  bool btm = false;

  // Observable variables for email and password.
  final email = ''.obs;
  final password = ''.obs;
  var countryname = <Countrycode>[].obs;
  var statelist = <Statedata>[].obs;
  var citylist = <Citydata>[].obs;
  var daskbordlist = <Daskborddata>[].obs;
  var isLoading = true.obs;
  String baseUrlcountry = 'http://13.127.41.199:4000/Api/getcountry';
  String baseUrlstate = 'http://13.127.41.199:4000/Api/getstate';
  String baseUrlcity = 'http://13.127.41.199:4000/Api/getcity';
  String baseUrldaskbord = 'http://13.127.41.199:4000/Api/dashboard';

  @override
  void onInit() {
    super.onInit();
    fetchData();
    Citysdata(0);
    daskbords();
  }

  // Function to perform the login API call.
  Future login() async {
    try {
      final response =
          await ApiService.login(email.value, password.value, submit);
      if (submit) {
        Get.snackbar(
          "Login Failed",
          "Please double check your input.",
          icon: Image.asset("assets/WarningCircle.png",
              color: const Color(0xffff5630)),
          backgroundColor: Colors.white,
        );
      } else {
        Get.to(const Bottomhomepage());
        Fluttertoast.showToast(msg: "successfully");
      }
      // Handle the successful login response here
      // You might store the user token, navigate to the next screen, etc.
    } catch (e) {
      // Handle login error
      print('Login error: $e');
    }
  }

  Future fetchData() async {
    String apiUrl = baseUrlcountry; // Replace this with your API endpoint URL
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Countrycode _Countrycode =
          Countrycode.fromJson(jsonDecode(response.body));
      countryname.add(Countrycode(
          status: _Countrycode.status,
          responseCode: _Countrycode.responseCode,
          generalSettings: _Countrycode.generalSettings,
          imgPath: _Countrycode.imgPath,
          countries: _Countrycode.countries,
          nameCode: _Countrycode.nameCode,
          countryCode: _Countrycode.countryCode,
          message: _Countrycode.message));
      isLoading.value = true;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Statedata> Statedatas(int sid) async {
    String apiUrl = baseUrlstate;
    Statedata stated;
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final Map body = {"countries": sid};
    final responses = await http.post(Uri.parse(apiUrl),
        headers: headers, body: json.encode(body));
    if (responses.statusCode == 200) {
      final result = jsonDecode(responses.body);
      stated = Statedata.fromJson(result);
      statelist.add(Statedata(
          status: stated.status,
          responseCode: stated.responseCode,
          stateData: stated.stateData,
          message: stated.message));
    } else {
      throw Exception('Failed to load data');
    }
    isLoading.value = true;
    return stated;
  }

  Future<Citydata> Citysdata(int ctid) async {
    String apiUrl = baseUrlstate;
    Citydata cityd;
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final Map body = {"states": ctid};
    final responses = await http.post(Uri.parse(apiUrl),
        headers: headers, body: json.encode(body));
    if (responses.statusCode == 200) {
      final result = jsonDecode(responses.body);
      cityd = Citydata.fromJson(result);
      citylist.add(Citydata(
          status: cityd.status,
          responseCode: cityd.responseCode,
          cityData: cityd.cityData,
          message: cityd.message));
    } else {
      throw Exception('Failed to load data');
    }
    isLoading.value = true;
    return cityd;
  }

  Future<Daskborddata> daskbords() async {
    String apiUrl = baseUrlstate;
    Daskborddata daskb;
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final Map body = {"role": "2", "login_user_id": "5"};
    final responses = await http.post(Uri.parse(apiUrl),
        headers: headers, body: json.encode(body));
    if (responses.statusCode == 200) {
      final result = jsonDecode(responses.body);
      daskb = Daskborddata.fromJson(result);
      daskbordlist.add(Daskborddata(
          status: daskb.status,
          responseCode: daskb.responseCode,
          packagesTotal: daskb.packagesTotal,
          shipmentsTotal: daskb.shipmentsTotal,
          pickupsTotal: daskb.pickupsTotal,
          consolidatedTotal: daskb.consolidatedTotal,
          registeredPackagesData: daskb.registeredPackagesData,
          shipmentsData: daskb.shipmentsData,
          pickupsData: daskb.pickupsData,
          consolidatedData: daskb.consolidatedData,
          message: daskb.message));
    } else {
      throw Exception('Failed to load data');
    }
    isLoading.value = true;
    return daskb;
  }
}
