import 'package:Lenus_Final/screens/user_screen.dart';
import 'package:Lenus_Final/util/sizeConfig.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';

class ReminderPage extends StatefulWidget {
  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  PageController pageController;
  int selectedIndex = 0;

  void _onItemTapped() {
    setState(() {
      selectedIndex++;
      pageController.animateToPage(selectedIndex,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: new NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: [
          Reminder(
            title: "Keep\nDistance",
            imageUrl: "assets/backgrounds/distance.png",
            index: 0,
            onTap: _onItemTapped,
          ),
          Reminder(
            title: "Keep Your \nHands Clean",
            imageUrl: "assets/backgrounds/clean_hands.png",
            index: 1,
            onTap: _onItemTapped,
          ),
          Reminder(
            title: "Wash \nYour Hands",
            imageUrl: "assets/backgrounds/wash.png",
            index: 2,
            onTap: _onItemTapped,
          ),
          Reminder(
            title: "Use Mask",
            imageUrl: "assets/backgrounds/mask.png",
            index: 3,
            onTap: () => Navigator.of(context).push(
              _createRoute(
                UserScreen(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Reminder extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int index;
  final dynamic onTap;

  Reminder({
    this.title,
    this.imageUrl,
    this.index,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getY(context),
      decoration: BoxDecoration(
        color: Color(0xff1E4DFF),
      ),
      child: index == 0
          //keep distance
          ? Stack(
              alignment: Alignment.center,
              children: [
                new Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Myriad Pro",
                    fontWeight: FontWeight.w700,
                    fontSize: 42,
                    color: Color(0xffa3daf9),
                  ),
                ),
                Positioned(
                  top: getY(context) * 0.15,
                  right: getX(context) * 0.07,
                  child: Image(
                    height: getY(context) * 0.2,
                    width: getY(context) * 0.2,
                    image: AssetImage(imageUrl),
                  ),
                ),
                Positioned(
                  bottom: getY(context) * 0.15,
                  left: getX(context) * 0.07,
                  child: Image(
                    height: getY(context) * 0.2,
                    width: getY(context) * 0.2,
                    image: AssetImage(imageUrl),
                  ),
                ),
                Positioned(
                  right: getX(context) * 0.05,
                  bottom: getY(context) * 0.03,
                  child: Row(
                    children: [
                      new Text(
                        "Got It !",
                        style: TextStyle(
                          fontFamily: "Myriad Pro",
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Colors.white,
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
                        onPressed: onTap,
                      ),
                    ],
                  ),
                ),
              ],
            )
          //other pages
          : Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: getY(context) * 0.2,
                      width: getY(context) * 0.2,
                      image: AssetImage(imageUrl),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: "Myriad Pro",
                        fontWeight: FontWeight.w700,
                        fontSize: 42,
                        color: Color(0xffa3daf9),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: getX(context) * 0.05,
                  bottom: getY(context) * 0.03,
                  child: Row(
                    children: [
                      new Text(
                        "Got It !",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 24,
                          color: Color(0xffffffff),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        icon: Icon(
                          FontAwesome.chevron_circle_right,
                          size: 30,
                        ),
                        color: Colors.white,
                        onPressed: onTap,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
