import 'package:Lenus_Final/screens/about_page.dart';
import 'package:Lenus_Final/screens/booking_page.dart';
import 'package:Lenus_Final/screens/feedback.dart';
import 'package:Lenus_Final/screens/gift_page.dart';
import 'package:Lenus_Final/screens/questions.dart';
import 'package:Lenus_Final/screens/sign_in.dart';
import 'package:Lenus_Final/screens/orders.dart';
import 'package:Lenus_Final/screens/profile.dart';
import 'package:Lenus_Final/screens/quizz.dart';
import 'package:Lenus_Final/screens/restaurant_page.dart';
import 'package:Lenus_Final/screens/sign_up.dart';
import 'package:Lenus_Final/screens/spa_page.dart';
import 'package:Lenus_Final/screens/sports_menu_page.dart';
import 'package:Lenus_Final/screens/user_screen.dart';
import 'package:Lenus_Final/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
        '/': (context) => WelcomePage(),
        '/Login': (context) => LoginPage(),
        '/SignUp': (context) => SignUpPage(),
        '/Questions': (context) => QuestionsPage(),
        '/Home': (context) => UserScreen(),
        '/Feedback': (context) => FeedbackPage(),
        '/Quiz': (context) => QuizPages(),
        '/RestaurantPage': (context) => RestaurantPage(),
        '/Sports': (context) => SportsPage(),
        '/SPA': (context) => SPADetailsPage(),
        '/Profile': (context) => Profile(),
        '/About': (context) => AboutPage(),
        '/Booking': (context) => BookingPage(),
        '/Orders': (context) => OrdersPage(),
        '/Gifts': (context) => GiftsPage(),
      },
    );
  }
}
