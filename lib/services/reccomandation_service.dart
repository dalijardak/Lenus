import 'dart:convert';
import 'dart:io';
import 'package:Lenus_Final/models/user.dart';
import 'package:Lenus_Final/util/apiUrl.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<User> fetchReccomandation() async {
  String filename = "CacheReccomndation.json";
  var cacheDir = await getTemporaryDirectory();

  if (await File(cacheDir.path + "/" + filename).exists()) {
    print("Loading from cache");
    var jsonData = File(cacheDir.path + "/" + filename).readAsStringSync();
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
      throw Exception("Failed to load Reccomandation");
    }
  }
}
