import 'package:Lenus_Final/screens/customer_service.dart';
import 'package:Lenus_Final/widgets/appBar.dart';
import 'package:Lenus_Final/widgets/drawer.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'home_page.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  PageController pageController;
  GlobalKey bottomNavigationKey = GlobalKey();
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      pageController.animateToPage(selectedIndex,
          duration: Duration(milliseconds: 200), curve: Curves.linear);
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

  List<Widget> screens = [
    HomePage(),
    CustomerService(),
    Text("Profile"),
  ];

  bool isDisabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isDisabled
          ? PreferredSize(
              child: Container(),
              preferredSize: Size(0.0, 0.0),
            )
          : MyAppBar(
              returnIcon: false,
            ),
      drawer: MyDrawer(),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
            if (selectedIndex == 1)
              isDisabled = true;
            else
              isDisabled = false;
          });
        },
        children: <Widget>[
          HomePage(),
          CustomerService(),
          Center(
            child: Text("Quizz"),
          ),
          Center(
            child: Text("Notifications"),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text(
              "Home",
            ),
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "Chat",
            ),
            icon: Icon(
              Icons.chat,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "Quizz",
            ),
            icon: Icon(
              Ionicons.logo_game_controller_b,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "Notifications",
            ),
            icon: Icon(
              Icons.notifications,
            ),
          ),
        ],
        selectedItemColor: Colors.black,
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
