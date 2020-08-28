import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';

class FoodDetails extends StatelessWidget {
  final String title;
  final AssetImage image;
  final String description;

  FoodDetails({
    this.title,
    this.description,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: this.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 450.00,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        this.title,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 65, right: 220),
                      child: Text(
                        "Details",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xff1e4dff),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(55.00),
                    topRight: Radius.circular(55.00),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 300.00,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(55.00),
                    topRight: Radius.circular(55.00),
                  ),
                ),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 60),
                    child: new Text(
                      this.description,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                icon: Icon(
                  FontAwesome.chevron_circle_left,
                  size: 40,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
