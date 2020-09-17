import 'package:Lenus_Final/models/booking_list.dart';
import 'package:Lenus_Final/util/sizeConfig.dart';
import 'package:Lenus_Final/viewModel/booking_list_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Booking",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xff000000),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(0.00, 2.00),
                color: Color(0xff000000).withOpacity(0.16),
                blurRadius: 6,
                spreadRadius: -15,
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(
              FontAwesome.chevron_circle_left,
              size: 30,
            ),
            color: Colors.white,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: new Text(
                "Your reservations",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color(0xff1e4dff),
                ),
              ),
            ),
            Container(
              height: getY(context),
              padding: EdgeInsets.only(top: 10, right: 20, left: 20),
              child: BookingListView(
                bookingList: BookingList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
