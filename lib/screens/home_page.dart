import 'package:Lenus_Final/widgets/congestionSlider.dart';
import 'package:Lenus_Final/widgets/discover_slider.dart';
import 'package:Lenus_Final/widgets/reccom_slide.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(5),
      physics: BouncingScrollPhysics(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    "HELLO \nUSER NAME",
                    style: TextStyle(
                      fontFamily: "Myriad Pro",
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Color(0xff2f2f30),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 15),
              child: Text(
                "See Congestion areas",
                style: TextStyle(
                  fontFamily: "Helvetica Neue",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xff2f2f30),
                ),
              ),
            ),
            Container(
              height: 180,
              child: CongsSlide(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Text(
                "What you can do",
                style: TextStyle(
                  fontFamily: "Helvetica Neue",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xff2f2f30),
                ),
              ),
            ),
            constDiag(),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 15),
              child: Text("For You",
                  style: TextStyle(
                    fontFamily: "Helvetica Neue",
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xff2f2f30),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 15),
              child: Text(
                "You may be interested in these products\nand activities",
                style: TextStyle(
                  fontFamily: "Helvetica Neue",
                  fontSize: 16,
                  color: Color(0xffbebebe),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: ReccomSlide(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Text(
                "Discover",
                style: TextStyle(
                  fontFamily: "Helvetica Neue",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color(0xff2f2f30),
                ),
              ),
            ),
            Container(
              height: 200,
              child: DiscoverSlider(),
            ),
          ],
        ),
      ),
    );
  }
}
