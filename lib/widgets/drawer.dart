import "package:flutter/material.dart";
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(image: AssetImage("assets/logo/logo.png")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _createDrawerItem(
              icon: MdiIcons.orderBoolAscending,
              text: "Orders",
              onTap: () {
                Scaffold.of(context).openEndDrawer();
                Navigator.pushNamed(context, "/Orders");
              },
            ),
            _createDrawerItem(
              icon: MdiIcons.book,
              text: "Bookings",
              onTap: () {
                Scaffold.of(context).openEndDrawer();
                Navigator.pushNamed(context, "/Booking");
              },
            ),
            _createDrawerItem(
              icon: MdiIcons.gift,
              text: "Gifts",
              onTap: () {
                Scaffold.of(context).openEndDrawer();
                Navigator.pushNamed(context, "/Gifts");
              },
            ),
            _createDrawerItem(
              icon: MdiIcons.speaker,
              text: "Feedback",
              onTap: () {
                Scaffold.of(context).openEndDrawer();
                Navigator.pushNamed(context, "/Feedback");
              },
            ),
            _createDrawerItem(
              icon: MdiIcons.information,
              text: "About Lenus",
              onTap: () {
                Scaffold.of(context).openEndDrawer();
                Navigator.pushNamed(context, "/About");
              },
            ),
            _createDrawerItem(
              icon: MdiIcons.logout,
              text: "Log Out",
            )
          ],
        ),
      ),
    );
  }
}

Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
