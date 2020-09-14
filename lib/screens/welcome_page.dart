import 'package:Lenus_Final/util/sizeConfig.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: getY(context),
        width: getX(context),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/backgrounds/welcome_screen.png"),
              fit: BoxFit.cover),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage("assets/logo/logo_white.png"),
              ),
            ),
            Positioned(
              right: getX(context) * 0.05,
              bottom: getY(context) * 0.03,
              child: Row(
                children: [
                  new Text(
                    "Start",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 24,
                      color: Color(0xffffffff),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesome.chevron_circle_right,
                      size: 30,
                    ),
                    color: Colors.white,
                    onPressed: () => Navigator.pushNamed(context, "/Login"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
