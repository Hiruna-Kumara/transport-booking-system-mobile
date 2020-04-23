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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Shared sharedPreferences;
  String uid;
  bool _isLoading = true;
  

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
          FlatButton(
            child: Text(
              "Past Trips", 
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => PastTrip(uid: uid))); // view past trips of the conductor
              print("past trips clicked");
            },     
          ),
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
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage())); 
            },  
          ), 
        ],
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            child: Text(
              "Log Out", 
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ), onPressed: () {},
          ),
          // BusDetails(uid: uid) // to show the details of the bus the conductor is currently assigned to
        ],
      ),
    );
  }
}