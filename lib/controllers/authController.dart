import 'package:http/http.dart';

import '../constants.dart';
import '../models/newUser.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import '../../controllers/authController.dart';

class AuthController {
  String responseBody;
  String responseBodySignIn;
  String email;
  String token;
  String uid;
  Future<http.Response> makeGetRequest(NewUserModel newUserModel) async {
    this.email = newUserModel.email;
    var url = Constants.SERVER + '/signup';
    String phoneNumberValidate = newUserModel.phoneNumber.toString();
    String phoneNumberSend;
    if (phoneNumberValidate.length == 10) {
      phoneNumberSend = "+94" + phoneNumberValidate.substring(1);
    }else{
      phoneNumberSend="";
    }
    var body = json.encode({
      "firstName": newUserModel.firstName,
      "secondName": newUserModel.secondName,
      "email": newUserModel.email,
      "password": newUserModel.password,
      "phoneNumber": phoneNumberSend,
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
    this.responseBody = responseJson.toString();
    // if(responseBody=="{Email has been sent to "+newUserModel.email+"}"){

    //   print ('done');
    //   return response;

    // }

    // serverResponse = response.body;
    // this.oldResponse=response;
    print(responseJson);
    print(response.toString() + "ok");
    return response;
  }

  String getResponse() {
    return responseBody;
  }

  String message;

  Future<String> signInUser(String email, String password) async  {
    String url = Constants.SERVER;

    Response response = await post(
      '$url/signin',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password
      }),
    );
    Map data = jsonDecode(response.body);
    message = data['message'];  
    token=data['token'];
    uid=data['user']['user']['user']['uid'];
    responseBodySignIn=message; 
    return message;
  }
  String getResponseSignIn() {
    return responseBodySignIn;
  }
  String getToken(){
    return token;
  }
  String getUID(){
    return uid;
  }
  // Future<APIResponse<UserData>> signInUser(String email, String password) async {
  //   // sign in the conductor when the email and password is given
  //   String url = Constants.SERVER;

  //   return http.post(
  //     '$url/signin',
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'email': email,
  //       'password': password
  //     })
  //   ).then ((response) {
  //       if(response.statusCode == 200) {
  //         Map<String, dynamic> data = jsonDecode(response.body);
  //         print (UserData.fromJson(data).uid);
  //         print (UserData.fromJson(data).phoneNumber);
  //         print (UserData.fromJson(data).role);
  //         // convert the response to a custom user object
  //         if (UserData.fromJson(data).role == "PASSENGER") { // since the conductors are not created yet
  //           return APIResponse<UserData>(data: UserData.fromJson(data)); 
  //         } else {
  //           return APIResponse<UserData>(error: true, errorMessage: 'Not a valid conductor');
  //         }
  //       }
  //       if(response.statusCode == 400) {
  //         final error = jsonDecode(response.body);
  //         return APIResponse<UserData>(error: true, errorMessage: error['error']);
  //       }
  //       return APIResponse<UserData>(error: true, errorMessage: 'An error occured');
  //     }).
  //     catchError((error) => APIResponse<UserData> (error: true, errorMessage: 'An error occured')); 
  // }
  // Future<String> makeGetRequest2(NewUserModel newUserModel) async {
  //   var url = Constants.SERVER + '/signup';

  //   var body = json.encode({
  //     "firstName": newUserModel.firstName,
  //     "secondName": newUserModel.secondName,
  //     "email": newUserModel.email,
  //     "password": newUserModel.password,
  //     "phoneNumber": newUserModel.phoneNumber,
  //     "role": newUserModel.role
  //   });

  //   Map<String, String> headers = {
  //     'Content-type': 'application/json',
  //     'Accept': 'application/json'
  //   };

  //   final response = await http.post(
  //     url,
  //     body: body,
  //     headers: headers,
  //   );
  //   final responseJson = json.decode(response.body);
  //   print(responseJson);
  //   this.responseBody = responseJson;
  //   // if(responseBody=="{Email has been sent to "+newUserModel.email+"}"){

  //   //   print ('done');
  //   //   return response;

  //   // }

  //   // serverResponse = response.body;
  //   // this.oldResponse=response;
  //   return responseBody;
  // }
}
