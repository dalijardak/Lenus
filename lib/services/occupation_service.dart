import 'dart:convert';
import 'package:Lenus_Final/models/occupation.dart';
import 'package:Lenus_Final/util/apiUrl.dart';
import 'package:http/http.dart' as http;

const String link = "$url/mobile/occupation";
var occupations = new List<Occupation>();
Future<List<Occupation>> fetchOccupation() async {
  final response = await http.get("$url/mobile/occupation");
  if (response.statusCode == 200) {
    var jsonResponse = response.body;
    print(json.decode(jsonResponse));
    Iterable list = json.decode(response.body);
    occupations = list.map((model) => Occupation.fromJson(model)).toList();
    print(
      occupations[0].toJson(),
    );
    return occupations;
  } else {
    throw Exception("Failed to load Occupation");
  }
}

//Done with some modifs
