import 'package:Lenus_Final/models/booking.dart';
import 'package:Lenus_Final/util/booking_list_json.dart';

class BookingList {
  List<Booking> bookingList = List.castFrom(
    booking_list
        .map(
          (e) => Booking(
            name: e["name"],
            number: e["number"],
            date: e["date"],
          ),
        )
        .toList(),
  );

  BookingList({
    bookingList,
  });

  void fillBookingList() {
    booking_list.map(
      (e) => addBooking(
        Booking(
          name: e["name"],
          number: e["number"],
          date: e["date"],
        ),
      ),
    );
  }

  void addBooking(Booking booking) {
    this.bookingList.add(booking);
  }

  int length() {
    return bookingList.length;
  }

  Booking getItem(int i) {
    return bookingList[i];
  }
}
