import 'package:Lenus_Final/widgets/congestionDiagram.dart';
import 'package:Lenus_Final/widgets/congestionView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CongestionDetails extends StatelessWidget {
  final String title;
  final Color color;
  final double congestRate;

  CongestionDetails({
    this.title,
    this.color,
    this.congestRate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(left: 30, top: 25),
          icon: Icon(
            FontAwesome.chevron_circle_left,
            color: Colors.grey,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.grey,
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15),
                child: Text(
                  "Dashboard",
                  style: TextStyle(
                    fontFamily: "Myriad Pro",
                    fontSize: 24,
                    color: Color(0xff2f2f30),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15),
                child: Text(
                  this.title,
                  style: TextStyle(
                    fontFamily: "Helvetica Neue",
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color(0xff2f2f30),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Container(
                  height: 138.00,
                  width: 335.00,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularPercentIndicator(
                        radius: 60.0,
                        lineWidth: 5.0,
                        percent: this.congestRate,
                        center: Text(
                          "${(this.congestRate * 100).round()} %",
                          style: TextStyle(
                              fontFamily: "Helvetica Neue",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        progressColor: Colors.white,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "${TimeOfDay.now().format(context)}",
                        style: TextStyle(
                          fontFamily: "Helvetica Neue",
                          fontSize: 12,
                          color: Color(0xffffffff),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: this.color,
                    borderRadius: BorderRadius.circular(18.00),
                  ),
                ),
              ),
              estimatedTime(this.congestRate),
              body(this.title),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: Text(
                  "Busy Times",
                  style: TextStyle(
                    fontFamily: "Helvetica Neue",
                    fontSize: 18,
                    color: Color(0xff1e4dff),
                  ),
                ),
              ),
              CongestDiagram(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget estimatedTime(double congestRate) {
  if (congestRate < 0.5)
    return SizedBox(
      height: 100,
    );
  else
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 15),
          child: Text(
            "Estimated time",
            style: TextStyle(
              fontFamily: "Helvetica Neue",
              fontSize: 18,
              color: Color(0xff2f2f30),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 40, bottom: 40),
            child: Text(
              "15 min",
              style: TextStyle(
                fontFamily: "Helvetica Neue",
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xff2f2f30),
              ),
            ),
          ),
        ),
      ],
    );
}

Widget restaurantCongestionDetails() {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(left: 15),
        child: Text(
          "Your table \nis being prepared",
          style: TextStyle(
            fontFamily: "Helvetica Neue",
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Color(0xff2f2f30),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 15, top: 15),
        child: Text(
          "Thanks for waiting",
          style: TextStyle(
            fontFamily: "Helvetica Neue",
            fontSize: 24,
            color: Color(0xff2f2f30),
          ),
        ),
      )
    ],
  );
}

Widget poolCongestionDetails() {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(top: 20, left: 15),
        child: Text(
          "Estimated time",
          style: TextStyle(
            fontFamily: "Helvetica Neue",
            fontSize: 18,
            color: Color(0xff2f2f30),
          ),
        ),
      ),
      Center(
        child: Padding(
          padding: EdgeInsets.only(top: 40, bottom: 40),
          child: Text(
            "15 min",
            style: TextStyle(
              fontFamily: "Helvetica Neue",
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Color(0xff2f2f30),
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 15, top: 15),
        child: Text(
          "Thanks for waiting",
          style: TextStyle(
            fontFamily: "Helvetica Neue",
            fontSize: 24,
            color: Color(0xff2f2f30),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 15, top: 20),
        child: Text(
          "Busy Times",
          style: TextStyle(
            fontFamily: "Helvetica Neue",
            fontSize: 18,
            color: Color(0xff1e4dff),
          ),
        ),
      ),
      CongestDiagram(),
    ],
  );
}

Widget body(String title) {
  if (title == "Restaurant")
    return restaurantCongestionDetails();
  else
    return SizedBox();
}
