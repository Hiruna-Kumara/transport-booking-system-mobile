import 'package:flutter/material.dart';

class UpperHalf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight / 2,
      child: Image.asset(
        'assets/bus1.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}

class LowerHalf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    print("lowerHalf");

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: screenHeight / 2,
        color: Color(0xFFECF0F3),
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}

// class ErrorAlert  {
//   @override
//   Widget build(BuildContext context) {
//     // set up the button
//     Widget okButton = FlatButton(
//       child: Text("OK"),
//       onPressed: () {},
//     );

//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text("My title"),
//       content: Text("This is my message."),
//       actions: [
//         okButton,
//       ],
//     );

//     // show the dialog
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }