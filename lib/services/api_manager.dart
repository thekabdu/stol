import 'dart:convert';

import 'package:dio/dio.dart';

// import 'package:http/http.dart' as http;

class ApiManager {
  Future<String> authenticate(String phone, String code) async {
    // var client = http.Client();FF

    var result = "";
    try {
      var response = await Dio().post(
        'https://pizza.daladev.kz/api/auth/code',
        data: {
          'phone': '+7$phone',
          'code': '$code',
        },
      );
      print(response.data);
      result = response.data['message'];
    } catch (e) {
      print('error is $e');
    }
    // var response = await client.get('https://pizza.daladev.kz/api/login');
    // if (response.statusCode == 200) {
    //   result = jsonDecode(response.body);
    // }
    return result;
  }

  Future<String> sendCode(String phone) async {
    // var client = http.Client();FF

    var result = "";
    try {
      var response = await Dio().post(
        'https://pizza.daladev.kz/api/login',
        data: {
          'phone': '+7$phone',
        },
      );
      print(response);
      result = response.data['message'];
    } catch (e) {
      print(e);
    }
    // var response = await client.get('https://pizza.daladev.kz/api/login');
    // if (response.statusCode == 200) {
    //   result = jsonDecode(response.body);
    // }
    return result;
  }
}
