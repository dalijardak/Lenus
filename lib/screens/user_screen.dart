import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';

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
          duration: Duration(milliseconds: 500), curve: Curves.linear);
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
    Text("lol"),
    Text("Profile"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                width: 200,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      icon: Icon(Icons.search),
                      border: InputBorder.none),
                ),
              ),
            ],
          ),
          height: 35.00,
          width: 300,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                offset: Offset(0.00, 3.00),
                color: Color(0xff000000).withOpacity(0.16),
                blurRadius: 6,
              ),
            ],
            borderRadius: BorderRadius.circular(20.00),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: Text("hahah"),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: <Widget>[
          HomePage(),
          Center(
            child: Text("Chat"),
          ),
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
