import "package:flutter/material.dart";

import 'congestion.dart';

class CongsSlide extends StatefulWidget {
  @override
  _CongsSlideState createState() => _CongsSlideState();
}

class _CongsSlideState extends State<CongsSlide> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        SliderItem(
          title: "Restaurant",
          color: Colors.redAccent,
          icon: Icons.restaurant,
        ),
        SliderItem(
          title: "Pool",
          color: Colors.pinkAccent,
          icon: Icons.pool,
        ),
        SliderItem(
          title: "Caffe",
          color: Colors.yellow,
          icon: Icons.ac_unit,
        ),
        SliderItem(
          title: "Reception",
          color: Colors.greenAccent,
          icon: Icons.ac_unit,
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
