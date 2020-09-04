import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';

class SportsDetails extends StatelessWidget {
  final String title;
  final String fees;
  final String description;
  final AssetImage image;

  SportsDetails({
    this.title,
    this.fees,
    this.description,
    this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                height: 400.00,
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
                      padding: EdgeInsets.only(top: 7),
                      child: Text(
                        this.fees,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 16,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40, right: 220),
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
                height: 250.00,
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
                    padding: EdgeInsets.only(left: 20, right: 20, top: 60),
                    child: new Text(
                      this.description,
                      textAlign: TextAlign.start,
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
            this.fees == "Free"
                ? Container(
                    height: 0,
                  )
                : Positioned.fill(
                    bottom: 30,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 46.00,
                        width: 257.00,
                        decoration: BoxDecoration(
                          color: Color(0xff1e4dff),
                          borderRadius: BorderRadius.circular(25.00),
                        ),
                        child: Center(
                          child: Text(
                            "Booking",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 18,
                              color: Color(0xffffffff),
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
