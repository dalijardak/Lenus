import 'package:Lenus_Final/screens/restaurantPage.dart';
import 'package:Lenus_Final/screens/userScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lenus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => UserScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/RestaurantPage': (context) => RestaurantPage(),
      },
    );
  }
}
