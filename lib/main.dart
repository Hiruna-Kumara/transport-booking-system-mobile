import 'dart:convert';

import 'package:flutter/material.dart';
// import 'dart.io';
import 'package:http/http.dart' as http;
// import 'package:flut_http/http_service.dart';
// import 'package:flut_http/post_detail.dart';
// import 'package:flut_http/post_model.dart';

void main() => runApp(MyApp());

enum AuthMode { LOGIN, SIGNUP }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

// class MyCustomForm extends StatefulWidget {
//   @override
//   _MyCustomFormState createState() => _MyCustomFormState();
// }

class _LoginPageState extends State<LoginPage> {
  // To adjust the layout according to the screen size
  // so that our layout remains responsive ,we need to
  // calculate the screen height
  double screenHeight;
  String firstName;
  String secondName;
  String password;
  String email;
  String phoneNumber;
  String serverResponse = "Done!";
  AuthMode _authMode = AuthMode.LOGIN;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            lowerHalf(context),
            upperHalf(context),
            _authMode == AuthMode.LOGIN
                ? loginCard(context)
                : singUpCard(context),
            pageTitle()
          ],
        ),
      ),
    );
  }

  Widget upperHalf(BuildContext context) {
    return Container(
      height: screenHeight / 2,
      child: Image.asset(
        'assets/bus1.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget lowerHalf(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: screenHeight / 2,
        color: Color(0xFFECF0F3),
      ),
    );
  }

  Widget loginCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: screenHeight / 4),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Your Email", hasFloatingPlaceholder: true),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password", hasFloatingPlaceholder: true),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {},
                        child: Text("Forgot Password ?"),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      FlatButton(
                        child: Text("Login"),
                        color: Color(0xFF4B9DFE),
                        textColor: Colors.white,
                        padding: EdgeInsets.only(
                            left: 38, right: 38, top: 15, bottom: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              "Don't have an account ?",
              style: TextStyle(color: Colors.grey),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _authMode = AuthMode.SIGNUP;
                });
              },
              textColor: Colors.black87,
              child: Text("Create Account"),
            )
          ],
        )
      ],
    );
  }

  Widget pageTitle() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // IconData(0xf36d, fontFamily: iconFont, fontPackage: iconFontPackage),

          Icon(
            Icons.airline_seat_recline_normal,
            size: 48,
            color: Colors.white,
          ),
          Text(
            "Bus Booking",
            style: TextStyle(
                fontSize: 34, color: Colors.white, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  final firstNameInp = TextEditingController();
  final secondNameInp = TextEditingController();
  final passwordInp = TextEditingController();
  final emailInp = TextEditingController();
  final phoneNumberInp = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    firstNameInp.dispose();
    secondNameInp.dispose();
    passwordInp.dispose();
    emailInp.dispose();
    phoneNumberInp.dispose();
    super.dispose();
  }

  Widget singUpCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: screenHeight / 5),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "First Name", hasFloatingPlaceholder: true),
                    controller: firstNameInp,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Second Name", hasFloatingPlaceholder: true),
                    controller: secondNameInp,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                          labelText: "Your Email",
                          hasFloatingPlaceholder: true),
                      controller: emailInp),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Phone Number",
                        hasFloatingPlaceholder: true),
                    controller: phoneNumberInp,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password", hasFloatingPlaceholder: true),
                    controller: passwordInp,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Password must be at least 8 characters and include a special character and number",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      FlatButton(
                        child: Text("Sign Up"),
                        color: Color(0xFF4B9DFE),
                        textColor: Colors.white,
                        padding: EdgeInsets.only(
                            left: 38, right: 38, top: 15, bottom: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {
                          firstName = firstNameInp.text;
                          secondName = secondNameInp.text;
                          email = emailInp.text;
                          phoneNumber = phoneNumberInp.text;
                          password = passwordInp.text;
                          _makeGetRequest();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              "Already have an account?",
              style: TextStyle(color: Colors.grey),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _authMode = AuthMode.LOGIN;
                });
              },
              textColor: Colors.black87,
              child: Text("Login"),
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FlatButton(
            child: Text(
              "Terms & Conditions",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(serverResponse),
        ),
      ],
    );
  }

  // _makeGetRequest()async{
  //   // Response response=await post(_localhost());
  //   // Response
  //   var response=await http.post('https://transport-booking-system.herokuapp.com/api/signup,body:{"firstName":"Hiruna","secondName":"Kumara","email":"vshkumara@gmail.com","password":"1234","phoneNumber":"+94712006085","role":"OWNER"}');
  //   setState(() {
  //     serverResponse = response.body;
  //   });
  // }
  // var namea=myController.text;
  // String names=myController.text;
  Future<http.Response> _makeGetRequest() async {
    var url = 'https://transport-booking-system.herokuapp.com/api/signup';
    var body = json.encode({
      "firstName": firstName,
      "secondName": secondName,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "role": "PASSENGER"
    });

    // Map data = {
    //   'apikey': '12345678901234567890'
    // };
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    //encode Map to JSON
    // var body = json.encode(data);

    final response = await http.post(
      url,
      body: body,
      headers: headers,
    );
    final responseJson = json.decode(response.body);
    // serverResponse=responseJson;
    print(responseJson);
    // if (responseJson.message=="Email has been sent to"+email})
    // print("${response.body}");
    serverResponse = response.body;
    return response;
  }
//************************************************************************ */

  // String _localhost() {
  //   // return 'http://10.0.2.2.3000';
  //   const obj = {
  //     "firstName": "Hiruna",
  //     "secondName": "Kumara",
  //     "email": "vshkumara@gmail.com",
  //     "password": "1234",
  //     "phoneNumber": "+94712006085",
  //     "role": "OWNER"
  //   };
  //   // return 'https://transport-booking-system.herokuapp.com/api/signup,body:$obj';
  //   return 'https://transport-booking-system.herokuapp.com/api/signup,body:{"firstName":"Hiruna","secondName":"Kumara","email":"vshkumara@gmail.com","password":"1234","phoneNumber":"+94712006085","role":"OWNER"}';
  // }
}
