import 'dart:convert';
import 'package:Lenus_Final/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<User> fetchUser() async {
  final response = await http
      .get('https://my-json-server.typicode.com/dalijardak/test/user');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return User.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
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
  String body = response.body;
  // {
  //   "title": "Hello",
  //   "body": "body text",
  //   "userId": 1,
  //   "id": 1
  // }

  print(statusCode);
}

Future<User> createUser(User user) async {
  final http.Response response = await http.post(
    'http://a16b64f49653.ngrok.io/add',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(user.toJson()),
  );
  if (response.statusCode == 201 || response.statusCode == 200) {
    print("Success");
    print(response.body);
  } else {
    print(response.statusCode);
    throw Exception('Failed to load User');
  }
}
