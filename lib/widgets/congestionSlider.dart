import 'package:Lenus_Final/models/congestion.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';

import 'congestionView.dart';

class CongsSlide extends StatefulWidget {
  final List<Congestion> congestionList = [
    Congestion(title: "Restaurant", congestRate: 0.8),
    Congestion(title: "Pool", congestRate: 0.6),
    Congestion(title: "Bar", congestRate: 0.4),
    Congestion(title: "Gym", congestRate: 0.23),
    Congestion(title: "SPA", congestRate: 0.12),
    Congestion(title: "Reception", congestRate: 0.35),
  ];
  @override
  _CongsSlideState createState() => _CongsSlideState();
}

class _CongsSlideState extends State<CongsSlide> {
  Color selectedColor(double x) {
    if (x < 0.25)
      return Color(0xffA3DAF9);
    else if (x > 0.25 && x < 0.5)
      return Color(0xffFFD42B);
    else if (x > 0.5 && x < 0.75)
      return Color(0xffFFC8DE);
    else
      return Color(0xffFA5757);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        SliderItem(
          title: this.widget.congestionList[0].title,
          color: selectedColor(this.widget.congestionList[0].congestRate),
          icon: Icons.restaurant,
          congestRate: this.widget.congestionList[0].congestRate,
        ),
        SliderItem(
          title: this.widget.congestionList[1].title,
          color: selectedColor(this.widget.congestionList[1].congestRate),
          icon: Icons.pool,
          congestRate: this.widget.congestionList[1].congestRate,
        ),
        SliderItem(
          title: this.widget.congestionList[2].title,
          color: selectedColor(this.widget.congestionList[2].congestRate),
          icon: Icons.local_bar,
          congestRate: this.widget.congestionList[2].congestRate,
        ),
        SliderItem(
          title: this.widget.congestionList[3].title,
          color: selectedColor(this.widget.congestionList[3].congestRate),
          icon: MaterialCommunityIcons.dumbbell,
          congestRate: this.widget.congestionList[3].congestRate,
        ),
        SliderItem(
          title: this.widget.congestionList[4].title,
          color: selectedColor(this.widget.congestionList[4].congestRate),
          icon: MaterialCommunityIcons.spa,
          congestRate: this.widget.congestionList[4].congestRate,
        ),
        SliderItem(
          title: this.widget.congestionList[5].title,
          color: selectedColor(this.widget.congestionList[5].congestRate),
          icon: MaterialCommunityIcons.account_tie,
          congestRate: this.widget.congestionList[5].congestRate,
        ),
      ],
    );
  }
}

Widget constDiag() {
  return Padding(
    padding: EdgeInsets.only(top: 10, left: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BoxItem(
          title: "Gym",
          height: 60,
          color: Colors.blueAccent,
        ),
        BoxItem(
          title: "Pool",
          height: 40,
          color: Colors.yellow,
        ),
        BoxItem(
          title: "Restaurant",
          height: 20,
          color: Colors.redAccent,
        ),
        BoxItem(
          title: "SPA",
          height: 60,
          color: Colors.blue,
        ),
      ],
    ),
  );
}
