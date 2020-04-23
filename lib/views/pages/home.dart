import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:transport_booking_system_mobile/views/pages/auth.dart';
// import 'package:transport_booking_system_conductor_mobile/views/screens/past_trip.dart';
// import 'package:transport_booking_system_conductor_mobile/views/screens/sign_in.dart';
// import 'package:transport_booking_system_conductor_mobile/views/shared_widgets/page_widget.dart';
// import '../../controllers/authController.dart';
// import 'package:flutter/material.dart';
import '../widgets/page_widget.dart';
import '../pages/shared.dart';
import '../pages/bus_details.dart';

// import 'package:http/http.dart';

// import '../widgets/page_widget.dart';
// import '../../models/newUser.dart';
// import 'package:flutter/material.dart';
// import '../../controllers/authController.dart';
// import '../pages/shared.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String stateCard;
  Shared sharedPreferences;
  String uid = '001';
  // bool _isLoading = true;

  // @override
  // void initState() {
  //   checkLoginStatus();
  //   super.initState();
  // }

  // checkLoginStatus() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   if(sharedPreferences.getString("token") == null){
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage())); // if user is not logged in navigate to sign in page
  //   } else {
  //     setState(() { _isLoading = true; });
  //     uid = sharedPreferences.getString("uid");
  //     setState(() { _isLoading = false; });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return
        // _isLoading? Center(child: CircularProgressIndicator()) :
        Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: PageTitleHomePage(),
        actions: <Widget>[
          // FlatButton(
          //   child: Text(
          //     "Past Trips",
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 18.0,
          //     ),
          //   ),
          //   onPressed: () {
          //     // Navigator.of(context).push(MaterialPageRoute(builder: (context) => PastTrip(uid: uid))); // view past trips of the conductor
          //     print("past trips clicked");
          //   },
          // ),
          FlatButton(
            child: Text(
              "Log Out",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            onPressed: () {
              //   uncomment below***********************
              // sharedPreferences.clear(); // clear cache data
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // crossAxisAlignment: CrossAxisAlignment.center
                Container(
                  width: 150.0,
                  child: TextField(
                    textAlign: TextAlign.left,

                    decoration: InputDecoration(
                        labelText: "Starting", hasFloatingPlaceholder: true),
                    // ),
                  ),
                  alignment: Alignment(10, 12),
                ),
                Container(
                  width: 150.0,
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        labelText: "Destination", hasFloatingPlaceholder: true),
                    // validator: (val) => val.isEmpty ? 'Enter your email' : null,
                    // onChanged: (val) {
                    //   setState(() => email = val);
                    // },
                    // ),
                  ),
                  alignment: Alignment(10, 24),
                ),
              ],
            ),
            // Row(children: <Widget>
            // Text(
            //   // TextAlign.left
            //               "Starting",
            //               style: TextStyle(
            //                 color: Colors.black,
            //                 fontSize: 22,
            //                 fontWeight: FontWeight.w600,

            //               ),
            //             ),

            // SizedBox(
            //   height: 15,
            //   width:15,
            // ),
            //*************************************** */
            // Container(
            //   width: 250.0,
            //   child: TextField(
            //     textAlign: TextAlign.left,
            //     decoration: InputDecoration(
            //         labelText: "Starting", hasFloatingPlaceholder: true),
            //     // ),
            //   ),
            //   alignment: Alignment(10, 12),
            // ),
//**************************************************** */
            // TextFormField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Alignment: Alignment(2, 5);
                // lignment: MainAxisAlignment.spaceBetween;
                FlatButton(
                  child: Text(
                    "Search",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  color: Colors.green[900],
                  onPressed: () {
                    this.stateCard = "done";
                  },
                ),
              ],
            ),

            // decoration: InputDecoration(
            //     labelText: "Your Email", hasFloatingPlaceholder: true),
            //     ),
            // validator: (val) =>
            //     val.isEmpty ? 'Enter your email' : null,
            // onChanged: (val) {
            //   setState(() => email = val);
            // },

            // SizedBox(
            //   height: 15,
            //   width: 15,
            // ),

            // FlatButton(
            //   child: Text(
            //     "Log Out1",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 18.0,
            //     ),
            //   ), onPressed: () {},
            // ),
//           TextFormField(
//   // The validator receives the text that the user has entered.
//   validator: (value) {
//     if (value.isEmpty) {
//       return 'Please enter some text';
//     }
//     return null;
//   },
// ),
            Container(
              child: stateCard == "done" ? BusDetails(uid: uid) : Text(""),
            ),
            // if(stateCard=="done")
            // {
            // BusDetails(uid: uid),
            // }
            // to show the details of the bus the conductor is currently assigned to
            // },
          ],
        ),
      ),
    );
  }
}
