// import 'package:flutter/material.dart';
// // import 'package:transport_booking_system_mobile/controllers/authController.dart';
// import 'package:transport_booking_system_mobile/views/pages/auth.dart';
// import 'package:transport_booking_system_mobile/views/widgets/page_widget.dart';

// class _LoggedInState extends State<LoginPage> {
//   // To adjust the layout according to the screen size
//   // so that our layout remains responsive ,we need to
//   // calculate the screen height
//   // final _formKey = GlobalKey<FormState>();
//   // NewUserModel newUserModel;
//   double screenHeight;
//   String serverResponse = "Done!";
//   AuthMode _authMode = AuthMode.LOGIN;
//   // AuthController authController = new AuthController();
//   // String oldResponse;
//   // Future<Response> responseNew;
//   // String email = '';
//   // String password = '';
//   @override
//   Widget build(BuildContext context) {
//     screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(
//           children: <Widget>[
//             LowerHalf(),
//             UpperHalf(),
//             _authMode == AuthMode.LOGIN
//                 ? passengerUI(context)
//                 : passengerUIBus(context),
//             PageTitle()
//           ],
//         ),
//       ),
//     );
//   }

//   Widget passengerUI(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Container(
//           margin: EdgeInsets.only(top: screenHeight / 5),
//           padding: EdgeInsets.only(left: 10, right: 10),
//           child: Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             elevation: 8,
//             child: Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Text(
//                         "Create Account",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 28,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                           labelText: "First Name",
//                           hasFloatingPlaceholder: true),
//                     ),
//                   ]),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget passengerUIBus(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Container(
//           margin: EdgeInsets.only(top: screenHeight / 5),
//           padding: EdgeInsets.only(left: 10, right: 10),
//           child: Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             elevation: 8,
//             child: Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Text(
//                         "Create Account",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 28,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                           labelText: "First Name",
//                           hasFloatingPlaceholder: true),
//                     ),
//                   ]),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   showAlertDialog(
//       BuildContext context, String toDisplay, String titleToDisplay) {
//     // set up the button
//     Widget okButton =
//         FlatButton(child: Text("OK"), onPressed: () => Navigator.pop(context));

//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text(titleToDisplay),
//       content: Text(toDisplay),
//       actions: [
//         okButton,
//       ],
//     );

//     // show the dialog
//   }
// }
