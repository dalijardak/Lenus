import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final bool returnIcon;

  MyAppBar({
    Key key,
    this.returnIcon,
  }) : preferredSize = Size.fromHeight(50.0);
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  TextEditingController searchController = new TextEditingController();
  List<String> items = [
    "RestaurantPage",
    "Sports",
    "SPA",
    "Feedback",
    "Quiz",
    "Profile",
    "Orders",
    "Gifts"
  ];
  List<String> filtredItems = [];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20),
              width: 200,
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                    hintText: "Search",
                    icon: Icon(Icons.search),
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
        height: 35.00,
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(20.00),
          border: Border.all(
            color: Color.fromARGB(90, 112, 112, 112),
          ),
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.center,
            child: InkWell(
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/heisenberg.jpeg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              onTap: () => Navigator.pushNamed(context, "/Profile"),
            ),
          ),
        ),
      ],
      leading: this.widget.returnIcon
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

  Widget search() {
    if (searchController.text.isNotEmpty) {
      List<String> temp = new List<String>();
      for (int i = 0; i < filtredItems.length; i++) {
        if (filtredItems[i]
            .toLowerCase()
            .contains(searchController.text.toLowerCase())) {
          temp.add(filtredItems[i]);
        }
      }
      filtredItems = temp;
    }
    return ListView.builder(
      itemCount: filtredItems.length,
      itemBuilder: (context, index) => ListTile(
        leading: Text(filtredItems[index]),
      ),
    );
  }
}
