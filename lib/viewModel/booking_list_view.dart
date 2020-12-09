import 'package:Lenus_Final/models/booking_list.dart';
import 'package:Lenus_Final/viewModel/booking_view.dart';
import "package:flutter/material.dart";

class BookingListView extends StatelessWidget {
  final BookingList bookingList;

  BookingListView({
    this.bookingList,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: bookingList.length(),
      itemBuilder: (context, index) {
        if (bookingList.length() == 0)
          return Text("Empty List");
        else
          return Padding(
            padding: EdgeInsets.only(
              top: 15,
              bottom: 15,
            ),
            child: BookingView(
              booking: bookingList.getItem(index),
            ),
          );
      },
    );
  }
}
