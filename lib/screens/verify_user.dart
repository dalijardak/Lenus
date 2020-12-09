import 'package:Lenus_Final/screens/reminders.dart';
import 'package:Lenus_Final/screens/welcome_page.dart';
import 'package:Lenus_Final/services/user_service.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  void initState() {
    redirect(this.context);
    super.initState();
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: Duration(milliseconds: 1500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  Future redirect(BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 500));
    isLoggedIn().then(
      (value) => value
          ? Navigator.of(context).push(
              _createRoute(
                ReminderPage(),
              ),
            )
          : Navigator.of(context).push(
              _createRoute(
                WelcomePage(),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(backgroundColor: Colors.white, body: Container()),
    );
  }
}
