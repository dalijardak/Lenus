import 'package:Lenus_Final/screens/restaurant_page.dart';
import 'package:Lenus_Final/screens/spa_page.dart';
import 'package:Lenus_Final/screens/sports_menu_page.dart';
import 'package:Lenus_Final/screens/user_screen.dart';
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
        '/': (context) => UserScreen(),
        '/RestaurantPage': (context) => RestaurantPage(),
        '/Sports': (context) => SportsPage(),
        '/SPA': (context) => SPADetailsPAge(),
      },
    );
  }
}
