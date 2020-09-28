import 'package:Lenus_Final/models/occupation.dart';
import 'package:Lenus_Final/services/occupation_service.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'congestionView.dart';

class CongsSlide extends StatefulWidget {
  @override
  _CongsSlideState createState() => _CongsSlideState();
}

class _CongsSlideState extends State<CongsSlide> {
  Future<List<Occupation>> occupationList = fetchOccupation();
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
    return FutureBuilder<List<Occupation>>(
      future: occupationList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: snapshot.data
                .map(
                  (e) => SliderItem(
                    title: e.title,
                    occupation: e.occupation,
                    color: selectedColor(e.occupation),
                    icon: MdiIcons.abTesting,
                  ),
                )
                .toList(),
          );
        }
        return Expanded(
          child: Center(
            child: Container(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ),
        );
      },
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
