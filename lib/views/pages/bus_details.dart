// import 'package:flutter/material.dart';
// import 'package:transport_booking_system_conductor_mobile/controllers/auth_controller.dart';
// import 'package:transport_booking_system_conductor_mobile/models/api_response.dart';
// import 'package:transport_booking_system_conductor_mobile/models/bus_data.dart';
// import 'package:transport_booking_system_conductor_mobile/views/screens/home.dart';
// import 'package:transport_booking_system_conductor_mobile/views/screens/trip_details.dart';

// class BusDetails extends StatefulWidget {
//   final String uid;
//   BusDetails({this.uid});

//   @override
//   _BusDetailsState createState() => _BusDetailsState();
// }

// class _BusDetailsState extends State<BusDetails> {
//   final AuthController _auth = AuthController();
//   APIResponse<BusData> _apiResponse;
//   bool _isLoading;

//   @override
//   void initState() {
//     _fetchBusDetails();
//     super.initState();
//   }

//   _fetchBusDetails() async {
//     setState(() { _isLoading = true; });
//     _apiResponse = await _auth.getBusDetails(widget.uid); //when receiving data from the api it will be a future
//     setState(() { _isLoading = false; });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _isLoading? Center(child: CircularProgressIndicator()) : Card(
//       margin: EdgeInsets.all(20.0),
//       child: Column(
//         children: <Widget>[
//           Container(
//             alignment: Alignment.topRight,
//             child: FlatButton.icon(
//               icon: Icon(Icons.refresh),
//               label: Text(
//                 'Refresh',
//                 style: TextStyle(fontSize: 20.0),
//               ),
//               onPressed: () async {
//                 // to load all th bus details and the trip details again
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
//               },
//             ),
//           ),
//           ListTile(
//             title: Text(
//               'Bus Number',
//               style: TextStyle(fontSize: 20.0),
//             ),
//             subtitle: Text(
//               _apiResponse.data.busNumber,
//               style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
//             ),
//           ),
//           ListTile(
//             title: Text(
//               'Bus Type',
//               style: TextStyle(fontSize: 20.0),
//             ),
//             subtitle: Text(
//               _apiResponse.data.busType,
//               style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
//             ),
//           ),
//           ListTile(
//             title: Text(
//               'Route Number',
//               style: TextStyle(fontSize: 20.0),
//             ),
//             subtitle: Text(
//               _apiResponse.data.routeNumber,
//               style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
//             ),
//           ),
//           TripDetails(busNumber: _apiResponse.data.busNumber, busType: _apiResponse.data.busType), // to show the details of the current trip of the bus
//         ],
//       ),
//     );
//   }
// }