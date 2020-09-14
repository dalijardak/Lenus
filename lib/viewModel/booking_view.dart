import 'package:Lenus_Final/models/booking.dart';
import 'package:Lenus_Final/util/sizeConfig.dart';
import 'package:flutter/material.dart';

class BookingView extends StatelessWidget {
  final Booking booking;

  BookingView({
    this.booking,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getY(context) * 0.2,
      width: getX(context) * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              children: [
                Container(
                  height: 10.00,
                  width: 10.00,
                  decoration: BoxDecoration(
                    color: Color(0xff1e4dff),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  this.booking.name,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 18,
                    color: Color(0xff1e4dff),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Icon(
                  Icons.people,
                  color: Color(0xff1E4DFF),
                ),
              ),
              Text(
                "${this.booking.number} persons",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18,
                  color: Color(0xff1e4dff),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Icon(
                  Icons.watch_later,
                  color: Color(0xff1E4DFF),
                ),
              ),
              Text(
                "${this.booking.date}",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18,
                  color: Color(0xff1e4dff),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
