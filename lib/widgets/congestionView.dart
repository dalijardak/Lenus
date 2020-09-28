import 'package:Lenus_Final/screens/congestion_details_page.dart';
import 'package:Lenus_Final/services/occupation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SliderItem extends StatefulWidget {
  final String title;
  final Color color;
  final IconData icon;
  final double occupation;

  SliderItem({
    Key key,
    @required this.title,
    @required this.color,
    @required this.icon,
    @required this.occupation,
  }) : super(key: key);

  @override
  _SliderItemState createState() => _SliderItemState();
}

IconData customIcon(String title) {
  var icon;
  switch (title) {
    case "Reception":
      icon = MaterialCommunityIcons.account_tie;
      break;
    case "Bar":
      icon = Icons.local_bar;
      break;
    case "Gym":
      icon = MaterialCommunityIcons.dumbbell;
      break;
    case "Restaurant":
      icon = Icons.restaurant;
      break;
    case "Pool":
      icon = Icons.pool;
      break;
    case "Spa":
      icon = Icons.spa;
      break;
  }
  return icon;
}

class _SliderItemState extends State<SliderItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 5),
      child: InkWell(
        child: Container(
          height: 150.00,
          width: 150.00,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                customIcon(this.widget.title),
                color: Colors.white,
                size: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${this.widget.title}",
                style: TextStyle(
                  fontFamily: "Helvetica Neue",
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Color(0xffffffff),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: this.widget.color,
            borderRadius: BorderRadius.circular(18.00),
          ),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CongestionDetails(
              title: this.widget.title,
              occupation: this.widget.occupation,
              color: this.widget.color,
            ),
          ),
        ),
        onLongPress: () => fetchOccupation(),
      ),
    );
  }
}

class BoxItem extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final Color color;

  BoxItem({
    this.title,
    this.height,
    this.width,
    this.color,
  });
  Widget text(String text) {
    if (text == "")
      return SizedBox(
        height: 5,
      );
    else
      return Padding(
        padding: EdgeInsets.only(top: 5),
        child: new Text(
          this.title,
          style: TextStyle(
            fontFamily: "Helvetica Neue",
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xffbebebe),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: this.width != null ? this.width : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: this.height,
            width: 8.00,
            decoration: BoxDecoration(
              color: this.color,
              borderRadius: BorderRadius.circular(11.00),
            ),
          ),
          text(this.title),
        ],
      ),
    );
  }
}
