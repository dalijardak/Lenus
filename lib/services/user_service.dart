import 'dart:convert';
import 'dart:io';
import 'package:Lenus_Final/models/user.dart';
import 'package:Lenus_Final/util/apiUrl.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

//Profile
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

//Sign Up
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
    throw Exception(response.body);
  }
}

// LogIn

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
    print("Cache Created");
    var x = isFirstTime();
    x.then((value) => print(value));
    return user;
  } else
    return null;
}

// isLoggedIn
Future<bool> isLoggedIn() async {
  String filename = "accessToken.json";
  var cacheDir = await getTemporaryDirectory();

  if (await File(cacheDir.path + "/" + filename).exists())
    return true;
  else
    return false;
}

//Check In
Future<String> checkIn(String code) async {
  String filename = "accessToken.json";
  var cacheDir = await getTemporaryDirectory();
  var jsonData = File(cacheDir.path + "/" + filename).readAsStringSync();
  var id = json.decode(jsonData)["id"];

  final http.Response response = await http.get(
    '$url/mobile/enter/$id/$code',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    var tempDir = await getTemporaryDirectory();
    String reservationFile = "reservation.json";
    File file = new File(tempDir.path + "/" + reservationFile);
    file.writeAsString(code, flush: true, mode: FileMode.write);
    print("Reservation Code Added");
    return jsonResponse.toString();
  } else {
    throw Exception("Failed to load res");
  }
}

//Chat
Future<String> sendText(String message) async {
  String reservationFile = "reservation.json";
  var tempDir = await getTemporaryDirectory();

  var jsonDataRes =
      File(tempDir.path + "/" + reservationFile).readAsStringSync();
  var reservationCode = jsonDataRes;
  print(reservationCode);
  final http.Response response = await http.post(
    '$url/mobile/request/$reservationCode',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: message,
  );
  if (response.statusCode == 201 || response.statusCode == 200)
    print(response.body);
  else {
    throw Exception("Failed to send Message");
  }
  return response.body.toString();
}

//FeedBack
Future<String> sendFeedBack(
    String categorie, int rating, String description) async {
  // Token Cache
  String filename = "accessToken.json";
  var cacheDir = await getTemporaryDirectory();
  var jsonDataId = File(cacheDir.path + "/" + filename).readAsStringSync();
  var id = json.decode(jsonDataId)["id"];
  var name = json.decode(jsonDataId)["firstName"] +
      " " +
      json.decode(jsonDataId)["lastName"];
  print(jsonDataId);

  // Reservation Code Cache
  String reservationFile = "reservation.json";
  var jsonDataRes =
      File(cacheDir.path + "/" + reservationFile).readAsStringSync();
  var reservationCode = jsonDataRes;
  print(jsonDataRes);

  final http.Response response = await http.post(
    '$url/mobile/feedback/$reservationCode',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      "hotelId": "",
      "clientId": id,
      "name": name,
      "department": categorie,
      "text": description,
      "stars": rating,
    }),
  );
  if (response.statusCode == 201 || response.statusCode == 200)
    print("Success");
  else {
    throw Exception("Failed to send Message");
  }
  return response.body.toString();
}

//Logout
Future<void> logOut() async {
  final cacheDir = await getTemporaryDirectory();

  if (cacheDir.existsSync()) {
    cacheDir.deleteSync(recursive: true);
  }
}

// First Time Regestration
Future<bool> isFirstTime() async {
  String filename = "accessToken.json";

  var cacheDir = await getTemporaryDirectory();
  if (await File(cacheDir.path + "/" + filename).exists()) {
    var jsonData = File(cacheDir.path + "/" + filename).readAsStringSync();
    var id = json.decode(jsonData)["id"];
    final response = await http.get("$url/mobile/$id");
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse == true) return true;
    }
  }
  return false;
}

//Prefers
Future<bool> sendPrefer(String key, String value) async {
  String filename = "accessToken.json";
  var cacheDir = await getTemporaryDirectory();
  var jsonData = File(cacheDir.path + "/" + filename).readAsStringSync();
  var id = json.decode(jsonData)["id"];
  final http.Response response = await http.post(
    '$url/mobile/premorials/$id',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      "key": key,
      "values": [value],
      "id": id
    }),
  );
  if (response.statusCode == 200) {
    print(response.body);
    return true;
  } else
    return false;
}

Future<bool> sendQuiz(String title, List<int> numberList) async {
  String filename = "accessToken.json";
  var cacheDir = await getTemporaryDirectory();
  var jsonData = File(cacheDir.path + "/" + filename).readAsStringSync();
  var id = json.decode(jsonData)["id"];
  final response = await http.post(
    "$url/mobile/quiz/$id",
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      "key": title,
      "answers": numberList,
      "id": id.toString(),
    }),
  );

  if (response.statusCode == 200) {
    print("Succes");
    return true;
  } else
    print(response.statusCode.toString() + response.body.toString());
  return false;
}
//Quiz Service : $url/mobile/quizz/$id

Future<String> getName() async {
  String filename = "accessToken.json";
  var cacheDir = await getTemporaryDirectory();
  var jsonDataId = File(cacheDir.path + "/" + filename).readAsStringSync();
  var name = json.decode(jsonDataId)["firstName"] +
      " " +
      json.decode(jsonDataId)["lastName"];
  return name;
}
