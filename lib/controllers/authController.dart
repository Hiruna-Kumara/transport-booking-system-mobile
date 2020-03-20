
import '../constants.dart';
import '../models/newUser.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthController{
   Future<http.Response> makeGetRequest(NewUserModel newUserModel) async {
    var url = Constants.SERVER+'/signup';
    
    var body = json.encode({
      "firstName": newUserModel.firstName,
      "secondName": newUserModel.secondName,
      "email": newUserModel.email,
      "password": newUserModel.password,
      "phoneNumber": newUserModel.phoneNumber,
      "role": newUserModel.role
    });

    
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
   

    final response = await http.post(
      url,
      body: body,
      headers: headers,
    );
    final responseJson = json.decode(response.body);
    print(responseJson);
    // serverResponse = response.body;
    return response;
  }

}