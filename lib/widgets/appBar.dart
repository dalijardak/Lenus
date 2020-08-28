import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final bool returnIcon;

  MyAppBar({
    Key key,
    this.returnIcon,
  }) : preferredSize = Size.fromHeight(50.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      leading: returnIcon
          ? IconButton(
              icon: Icon(
                FontAwesome.chevron_circle_left,
                color: Colors.grey,
              ),
              onPressed: () => Navigator.pop(context),
            )
          : Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
    );
  }
}
