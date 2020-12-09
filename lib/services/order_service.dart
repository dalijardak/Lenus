import 'dart:convert';
import 'dart:io';
import 'package:Lenus_Final/util/apiUrl.dart';
import 'package:http/http.dart' as http;
import 'package:Lenus_Final/models/order.dart';
import 'package:path_provider/path_provider.dart';

Future<bool> sendOrder(Order order) async {
  String reservationFile = "reservation.json";
  var cacheDir = await getTemporaryDirectory();

  var jsonDataRes =
      File(cacheDir.path + "/" + reservationFile).readAsStringSync();
  var reservationCode = jsonDataRes;
  final response = await http.post(
    '$url/mobile/buy/$reservationCode',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      order.toJson(),
    ),
  );
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<List<Order>> getOrders() async {
  String reservationFile = "reservation.json";
  var cacheDir = await getTemporaryDirectory();

  var jsonDataRes =
      File(cacheDir.path + "/" + reservationFile).readAsStringSync();
  var reservationCode = jsonDataRes;
  final response = await http.get('$url/mobile/buy/$reservationCode');
  var orders = new List<Order>();
  if (response.statusCode == 200) {
    var jsonResponse = response.body;
    print(json.decode(jsonResponse));
    Iterable list = json.decode(response.body);
    orders = list.map((model) => Order.fromJson(model)).toList();
    return orders;
  } else {
    throw Exception("Failed to load Orders");
  }
}
