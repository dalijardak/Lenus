import 'package:Lenus_Final/util/descriptions/about.dart';
import 'package:Lenus_Final/util/sizeConfig.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Lenus",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xff000000),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(0.00, 2.00),
                color: Color(0xff000000).withOpacity(0.16),
                blurRadius: 6,
                spreadRadius: -15,
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(
              FontAwesome.chevron_circle_left,
              size: 30,
            ),
            color: Colors.white,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: getY(context),
        width: getX(context),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text(
              about,
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                color: Color(0xff0a0a0a),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                "Values ",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Color(0xff1e4dff),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 10.00,
                      width: 10.00,
                      decoration: BoxDecoration(
                        color: Color(0xff1e4dff),
                        shape: BoxShape.circle,
                      ),
                    ),
                    new Text(
                      "Manage physical distancing between \nclients.",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xff0a0a0a),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 10.00,
                      width: 10.00,
                      decoration: BoxDecoration(
                        color: Color(0xff1e4dff),
                        shape: BoxShape.circle,
                      ),
                    ),
                    new Text(
                      "Avoid contact between customer and\nstaff.",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xff0a0a0a),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 10.00,
                      width: 10.00,
                      decoration: BoxDecoration(
                        color: Color(0xff1e4dff),
                        shape: BoxShape.circle,
                      ),
                    ),
                    new Text(
                      "Offer unique and personalized services\nfor the client.",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xff0a0a0a),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
