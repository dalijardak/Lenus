/*import 'package:flutter_icons/flutter_icons.dart';
import "package:flutter/material.dart";

class BottomNav extends StatefulWidget {
  int currentpage = 0;

  BottomNav({
    this.currentpage,
  });

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      this.widget.currentpage = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
*/
