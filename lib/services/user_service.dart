import 'dart:convert';
import 'dart:io';
import 'package:Lenus_Final/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

Future<User> fetchUser() async {
  String filename = "CacheUser.json";
  var cacheDir = await getTemporaryDirectory();

  if (await File(cacheDir.path + "/" + filename).exists()) {
    print("Loading from cache");
    var jsonData = File(cacheDir.path + "/" + filename).readAsStringSync();
    return User.fromJson(json.decode(jsonData));
  } else {
    print("Loading from API");

    final response = await http
        .get('https://my-json-server.typicode.com/dalijardak/test/user');
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

fullNameEdit(String newName) async {
  // set up PUT request arguments
  String url = 'https://my-json-server.typicode.com/dalijardak/test/user';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"name" : "$newName"}';
  // make PUT request
  Response response = await http.put(url, headers: headers, body: json);
  // check the status code for the result
  int statusCode = response.statusCode;
  // this API passes back the updated item with the id added
  //String body = response.body;
  // {
  //   "title": "Hello",
  //   "body": "body text",
  //   "userId": 1,
  //   "id": 1
  // }

  print(statusCode);
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
    'http://b713083a6842.ngrok.io/client/signup',
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
    'http://b713083a6842.ngrok.io/client/login',
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
