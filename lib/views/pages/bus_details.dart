import 'package:flutter/material.dart';
// import '../pages/home.dart';
// import 'package:transport_booking_system_mobile/views/pages/auth.dart';
// import '../../controllers/authController.dart';

// import 'package:transport_booking_system_conductor_mobile/controllers/auth_controller.dart';
// import 'package:transport_booking_system_conductor_mobile/models/api_response.dart';
// import 'package:transport_booking_system_conductor_mobile/models/bus_data.dart';
// import 'package:transport_booking_system_conductor_mobile/views/screens/home.dart';
// import 'package:transport_booking_system_conductor_mobile/views/screens/trip_details.dart';

class BusDetails extends StatefulWidget {
  final String uid;
  BusDetails({this.uid});

  @override
  _BusDetailsState createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  // final AuthController _auth = AuthController();
  // APIResponse<BusData> _apiResponse;
  // AuthController _apiResponse;
  // bool _isLoading;

  // @override
  // void initState() {
  //   _fetchBusDetails();
  //   super.initState();
  // }

  // _fetchBusDetails() async {
  //   setState(() { _isLoading = true; });
  //   _apiResponse = await _auth.getBusDetails(widget.uid); //when receiving data from the api it will be a future
  //   setState(() { _isLoading = false; });
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Card(
            child:Column(
            children: <Widget>[
              // Container(
              //   alignment: Alignment.topRight,
              //   child: FlatButton.icon(
              //     icon: Icon(Icons.refresh),
              //     label: Text(
              //       'Refresh',
              //       style: TextStyle(fontSize: 20.0),
              //     ),
              //     onPressed: () async {
              //       // to load all th bus details and the trip details again
              //       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
              //     },
              //   ),
              // ),
              ListTile(
                title: Text(
                  'KSK Travels',
                  style: TextStyle(fontSize: 18.0),
                ),
                // subtitle: Text(
                //   // _apiResponse.data.busNumber,
                //   'Colombo-Kandy',
                //   // 'num 2',
                //   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                // ),
              ),
              ListTile(
                title: Text(
                  '6.00 AM - 9.00 AM',
                  style: TextStyle(fontSize: 16.0),
                ),
                subtitle: Text(
                  // _apiResponse.data.busType,
                  'luxury',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                  'Bus Number: NA-4521',
                  style: TextStyle(fontSize: 15.0),
                ),
                subtitle: Text(
                  // _apiResponse.data.routeNumber,
                  'Route-1',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                  'LKR 350',
                  style: TextStyle(fontSize: 15.0),
                ),
                // subtitle: Text(
                //   // _apiResponse.data.routeNumber,
                //   'Route-1',
                //   style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                // ),
              ),
              FlatButton(
                        child: Text("View Seats"),
                        color: Colors.green[900],
                        textColor: Colors.white,
                        padding: EdgeInsets.only(
                            left: 38, right: 38, top: 15, bottom: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {

                          
                        },
                      ),
              // TripDetails(busNumber: _apiResponse.data.busNumber, busType: _apiResponse.data.busType), // to show the details of the current trip of the bus
            ],
            
          ),
          ),
          Card(
            child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'AB Travels',
                  style: TextStyle(fontSize: 18.0),
                ),
                // subtitle: Text(
                //   // _apiResponse.data.busNumber,
                //   'Bus Number11',
                //   // 'num 2',
                //   style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                // ),
              ),
              ListTile(
                title: Text(
                  '7.00 AM - 11.00 AM',
                  style: TextStyle(fontSize: 16.0),
                ),
                subtitle: Text(
                  // _apiResponse.data.busType,
                  'semi-luxury',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                  'Bus Number: N/A',
                  style: TextStyle(fontSize: 15.0),
                ),
                subtitle: Text(
                  // _apiResponse.data.routeNumber,
                  'Route-8',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                  'LKR 260',
                  style: TextStyle(fontSize: 15.0),
                  
                ),
                // subtitle: Text(
                //   // _apiResponse.data.routeNumber,
                //   'Route-1',
                //   style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                // ),
              ),
              FlatButton(
                        child: Text("View Seats"),
                        color: Colors.green[900],
                        textColor: Colors.white,
                        padding: EdgeInsets.only(
                            left: 38, right: 38, top: 15, bottom: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {

                          
                        },
                      ),
              // TripDetails(busNumber: _apiResponse.data.busNumber, busType: _apiResponse.data.busType), // to show the details of the current trip of the bus
            ],
            
          ),
          ),
          Card(
            child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Hiru Tours',
                  style: TextStyle(fontSize: 18.0),
                ),
                // subtitle: Text(
                //   // _apiResponse.data.busNumber,
                //   'Bus Number11',
                //   // 'num 2',
                //   style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                // ),
              ),
              ListTile(
                title: Text(
                  '8.00 AM - 2.00 PM',
                  style: TextStyle(fontSize: 16.0),
                ),
                subtitle: Text(
                  // _apiResponse.data.busType,
                  'semi-luxury',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                  'Bus Number: NC-9438',
                  style: TextStyle(fontSize: 15.0),
                ),
                subtitle: Text(
                  // _apiResponse.data.routeNumber,
                  'Route-16',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text(
                  'LKR 320',
                  style: TextStyle(fontSize: 15.0),
                ),
                // subtitle: Text(
                //   // _apiResponse.data.routeNumber,
                //   'Route-1',
                //   style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                // ),
              ),
              FlatButton(
                        child: Text("View Seats"),
                        color: Colors.green[900],
                        textColor: Colors.white,
                        padding: EdgeInsets.only(
                            left: 38, right: 38, top: 15, bottom: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {

                          
                        },
                      ),
              // TripDetails(busNumber: _apiResponse.data.busNumber, busType: _apiResponse.data.busType), // to show the details of the current trip of the bus
            ],
            
          ),
          ),
        ],
      ),
      
    );
  }
  // Widget build(BuildContext context) {
  //   return _isLoading? Center(child: CircularProgressIndicator()) : Card(
  //     margin: EdgeInsets.all(20.0),
  //     child: Column(
  //       children: <Widget>[
  //         Container(
  //           alignment: Alignment.topRight,
  //           child: FlatButton.icon(
  //             icon: Icon(Icons.refresh),
  //             label: Text(
  //               'Refresh',
  //               style: TextStyle(fontSize: 20.0),
  //             ),
  //             onPressed: () async {
  //               // to load all th bus details and the trip details again
  //               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
  //             },
  //           ),
  //         ),
  //         ListTile(
  //           title: Text(
  //             'Bus Number',
  //             style: TextStyle(fontSize: 20.0),
  //           ),
  //           subtitle: Text(
  //             _apiResponse.data.busNumber,
  //             style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //         ListTile(
  //           title: Text(
  //             'Bus Type',
  //             style: TextStyle(fontSize: 20.0),
  //           ),
  //           subtitle: Text(
  //             _apiResponse.data.busType,
  //             style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //         ListTile(
  //           title: Text(
  //             'Route Number',
  //             style: TextStyle(fontSize: 20.0),
  //           ),
  //           subtitle: Text(
  //             _apiResponse.data.routeNumber,
  //             style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //         TripDetails(busNumber: _apiResponse.data.busNumber, busType: _apiResponse.data.busType), // to show the details of the current trip of the bus
  //       ],
  //     ),
  //   );
  // }
}
