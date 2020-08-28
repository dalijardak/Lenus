import 'package:Lenus_Final/screens/sports_details_page.dart';
import 'package:Lenus_Final/util/descriptions/sports_description.dart';
import 'package:Lenus_Final/widgets/appBar.dart';
import "package:flutter/material.dart";
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        returnIcon: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SportsItem(
                title: "Yoga",
                icon: MdiIcons.yoga,
                image: AssetImage("assets/images/yoga.jpg"),
                description: yoga,
                fees: "Free",
              ),
              SportsItem(
                title: "Handball",
                icon: MdiIcons.handball,
                image: AssetImage("assets/images/handball.jpg"),
                description: handball,
                fees: "Free",
              ),
              SportsItem(
                title: "Tennis",
                icon: MdiIcons.tennis,
                image: AssetImage("assets/images/tennis.jpg"),
                description: tennis,
                fees: "2,5 \$ / 1 hour",
              ),
              SportsItem(
                title: "Golf",
                icon: MdiIcons.golf,
                image: AssetImage("assets/images/golf.jpg"),
                description: golf,
                fees: "5 \$ / 1 hour",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SportsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final AssetImage image;
  final String description;
  final String fees;

  SportsItem({
    this.title,
    this.image,
    this.description,
    this.fees,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 138.00,
        width: 315.00,
        decoration: BoxDecoration(
          color: Color(0xff1e4dff),
          borderRadius: BorderRadius.circular(18.00),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              this.icon,
              size: 45,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                this.title,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color(0xffffffff),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SportsDetails(
            title: this.title,
            description: this.description,
            image: this.image,
            fees: this.fees,
          ),
        ),
      ),
    );
  }
}
