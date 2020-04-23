import 'package:http/http.dart';

import '../widgets/page_widget.dart';
import '../../models/newUser.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/authController.dart';
import '../pages/shared.dart';
import '../pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum AuthMode { LOGIN, SIGNUP, PassengerUI }

class _LoginPageState extends State<LoginPage> {
  // To adjust the layout according to the screen size
  // so that our layout remains responsive ,we need to
  // calculate the screen height
  final _formKey = GlobalKey<FormState>();
  NewUserModel newUserModel;
  double screenHeight;
  String serverResponse = "Done!";
  AuthMode _authMode = AuthMode.LOGIN;
  AuthController authController = new AuthController();
  String oldResponse;
  Future<Response> responseNew;
  String email = '';
  String password = '';
  Shared sharedPreference;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            LowerHalf(),
            UpperHalf(),
            _authMode == AuthMode.LOGIN
                ? loginCard(context)
                : singUpCard(context),
            PageTitle()
          ],
        ),
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
              child: Form(
                key: _formKey,
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
                          labelText: "Your Email",
                          hasFloatingPlaceholder: true),
                      validator: (val) =>
                          val.isEmpty ? 'Enter your email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Password", hasFloatingPlaceholder: true),
                      validator: (val) => val.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
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
                        // FlatButton(
                        //   child: Text("Login"),
                        //   color: Color(0xFF4B9DFE),
                        //   textColor: Colors.white,
                        //   padding: EdgeInsets.only(
                        //       left: 38, right: 38, top: 15, bottom: 15),
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(5)),
                        //   onPressed: () {},
                        // )
                        FlatButton(
                          child: Text("Login"),
                          // color: Color(0xFF4B9DFE),
                          color: Colors.green[900],
                          textColor: Colors.white,
                          padding: EdgeInsets.only(
                              left: 38, right: 38, top: 15, bottom: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onPressed: () {
                            // async {
                            //   if (_formKey.currentState.validate()) {
                            //     await authController.signInUser(email,password);
                            //     String message = authController.message;
                            //     print(message);
                            //     if (message == 'Sign in success'){
                            //       print (authController.message);
                            //     } else {
                            //       print ('could not log in');
                            //     }
                            //   }
                            if (_formKey.currentState.validate()) {
                              authController
                                  .signInUser(email, password)
                                  .then((value) {
                                serverResponse =
                                    authController.getResponseSignIn();
                                // Future<SharedPreferences> sharedPreferences =
                                //     SharedPreferences.getInstance();
                                print("done 1");
                                print(serverResponse + "signIn");
                                if (serverResponse == "Sign in success") {
                                  setState(() {
                                    sharedPreference=new Shared(authController.getToken(),authController.getUID());
                                    // sharedPreferences.setString(
                                    //     "token",
                                    //     authController.getToken());  // cache user data
                                    // sharedPreferences.setString(
                                    //     "uid", authController.getUID());

                                    // _authMode = AuthMode.PassengerUI;
                                  });
                                  showAlertDialog(
                                      context, "You are logged in", "success");
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => Home()));

                                  // clearTextBoxes();
                                  // setState(() {
                                  //   _authMode = AuthMode.LOGIN;
                                  // });
                                  // } else if ((serverResponse ==
                                  //     "{error: Must be a valid email address}")) {
                                  //   serverResponse = "email error";
                                  //   showAlertDialog(
                                  //       context,
                                  //       "Please enter a valid email address",
                                  //       "Alert");
                                  // } else if ((serverResponse ==
                                  //     "{error: Must be a valid phone number}")) {
                                  //   serverResponse = "phone num error";
                                  //   showAlertDialog(
                                  //       context,
                                  //       "Please enter a valid phone number",
                                  //       "Alert");
                                  // }else if ((serverResponse ==
                                  //     "{error: Password must be at least 6 characters long}")) {
                                  //   serverResponse = "password error";
                                  //   showAlertDialog(
                                  //       context,
                                  //       "Password must be at least 6 characters long",
                                  //       "Alert");
                                } else {
                                  serverResponse = "other error";
                                  showAlertDialog(
                                      context, "Login Error", "Alert");
                                }
                              });
                            }
                          },
                        ),
                      ],
                    )
                  ],
                ),
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
                        labelText: "Phone Number  Ex:07xxxxxxxx",
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
                          newUserModel = new NewUserModel(
                              email: emailInp.text,
                              password: passwordInp.text,
                              firstName: firstNameInp.text,
                              secondName: secondNameInp.text,
                              phoneNumber: phoneNumberInp.text);
                          // _makeGetRequest();
                          // responseNew= authController.makeGetRequest(newUserModel);
                          authController
                              .makeGetRequest(newUserModel)
                              .then((value) {
                            serverResponse = authController.getResponse();
                            print(serverResponse + "12");
                            if (serverResponse ==
                                "{message: Email has been sent to " +
                                    authController.email +
                                    "}") {
                              showAlertDialog(
                                  context,
                                  "Verification email has been send",
                                  "Success");
                              clearTextBoxes();
                              setState(() {
                                _authMode = AuthMode.LOGIN;
                              });
                            } else if ((serverResponse ==
                                "{error: Must be a valid email address}")) {
                              serverResponse = "email error";
                              showAlertDialog(
                                  context,
                                  "Please enter a valid email address",
                                  "Alert");
                            } else if ((serverResponse ==
                                "{error: Must be a valid phone number}")) {
                              serverResponse = "phone num error";
                              showAlertDialog(context,
                                  "Please enter a valid phone number", "Alert");
                            } else if ((serverResponse ==
                                "{error: Password must be at least 6 characters long}")) {
                              serverResponse = "password error";
                              showAlertDialog(
                                  context,
                                  "Password must be at least 6 characters long",
                                  "Alert");
                            } else {
                              serverResponse = "other error";
                              showAlertDialog(
                                  context, "Please fill the form", "Alert");
                            }
                          });

                          // if (authController.getResponse() == null) {
                          //   serverResponse = 'null2';
                          // } else {
                          //   serverResponse = (responseNew) as String;
                          // }
                          // oldResponse=authController.getResponse();
                          // serverResponse=oldResponse;

                          //test
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

  showAlertDialog(
      BuildContext context, String toDisplay, String titleToDisplay) {
    // set up the button
    Widget okButton =
        FlatButton(child: Text("OK"), onPressed: () => Navigator.pop(context));

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(titleToDisplay),
      content: Text(toDisplay),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

// Below commenting has been done for developing purposes
  void clearTextBoxes() {
    firstNameInp.clear();
    secondNameInp.clear();
    emailInp.clear();
    phoneNumberInp.clear();
    passwordInp.clear();
  }
}

// flutter textfield validation

// TextFormField(
//   // The validator receives the text that the user has entered.
//   validator: (value) {
//     if (value.isEmpty) {
//       return 'Please enter some text';
//     }
//     return null;
//   },
// );

// flutter operators

// && AND
// || OR
// ! NOT
