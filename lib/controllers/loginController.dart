import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_tindev/util/appException.dart';
class LoginController {

  final String apiUrl = 'http://localhost:5000';
  Future<dynamic> login(String email, String password) async {
    var responseJson;
    final response = await http.post(
      '$apiUrl/user/login', 
      body: <String, String>{
        "email": email,
        "password": password,
      },
    );
    responseJson = _returnResponse(response);
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    var responseJson;
    switch (response.statusCode) {
      case 200:
        responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        try {
          responseJson = json.decode(response.body.toString());
          print(responseJson);
          return responseJson;

        } on Exception {
          throw FetchDataException(
              'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
        }
    }
  }

}