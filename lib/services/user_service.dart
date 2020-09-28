import 'dart:convert';
import 'dart:io';
import 'package:Lenus_Final/models/user.dart';
import 'package:Lenus_Final/util/apiUrl.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<User> fetchUser() async {
  String filename = "accessToken.json";
  var cacheDir = await getTemporaryDirectory();

  if (await File(cacheDir.path + "/" + filename).exists()) {
    print("Loading from cache");
    var jsonData = File(cacheDir.path + "/" + filename).readAsStringSync();
    print(jsonData);
    return User.fromJson(json.decode(jsonData));
  } else {
    print("Loading from API");

    final response = await http.get('$url/dalijardak/test/user');
    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      User user = User.fromJson(json.decode(jsonResponse));
      var tempDir = await getTemporaryDirectory();
      File file = new File(tempDir.path + "/" + filename);
      file.writeAsString(jsonResponse, flush: true, mode: FileMode.write);
      print("Cashe Created");

      return user;
    } else {
      throw Exception("Failed to load User");
    }
  }
}

Future<User> createUser(User user) async {
  String filename = "accessToken.json";
  var cacheDir = await getTemporaryDirectory();

  if (await File(cacheDir.path + "/" + filename).exists()) {
    print("Loading from cache");
    var jsonData = File(cacheDir.path + "/" + filename).readAsStringSync();
    return User.fromJson(json.decode(jsonData));
  }
  final http.Response response = await http.post(
    '$url/client/signup',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(user.register()),
  );
  if (response.statusCode == 201 || response.statusCode == 200) {
    print("Success");
    print(response.body);
    var jsonResponse = response.body;
    User user = User.fromJson(json.decode(jsonResponse));
    var tempDir = await getTemporaryDirectory();
    File file = new File(tempDir.path + "/" + filename);
    file.writeAsString(jsonResponse, flush: true, mode: FileMode.write);
    print("Cashe Created");
    return user;
  } else {
    print(response.body);
  }
}

Future<User> logIn(User user) async {
  String filename = "accessToken.json";
  final http.Response response = await http.post(
    '$url/client/login/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(user.logIn()),
  );
  if (response.statusCode == 201 || response.statusCode == 200) {
    print("Success");
    print(response.body);
    var jsonResponse = response.body;
    User user = User.fromJson(json.decode(jsonResponse));
    var tempDir = await getTemporaryDirectory();
    File file = new File(tempDir.path + "/" + filename);
    file.writeAsString(jsonResponse, flush: true, mode: FileMode.write);
    print("Cashe Created");
    return user;
  } else
    return null;
}

Future<bool> isLoggedIn() async {
  String filename = "accessToken.json";
  var cacheDir = await getTemporaryDirectory();

  if (await File(cacheDir.path + "/" + filename).exists())
    return true;
  else
    return false;
}

Future<String> checkIn(String code) async {
  String filename = "accessToken.json";
  var cacheDir = await getTemporaryDirectory();
  var jsonData = File(cacheDir.path + "/" + filename).readAsStringSync();
  var data = json.decode(jsonData)["id"];
  final http.Response response = await http.get(
    '$url/mobile/enter/$data/$code',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    return jsonResponse.toString();
  } else {
    throw Exception("Failed to load res");
  }
}
