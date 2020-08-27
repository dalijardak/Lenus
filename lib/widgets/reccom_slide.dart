import 'package:Lenus_Final/util/reccomndations.dart';
import 'package:Lenus_Final/widgets/reccom_item.dart';
import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';

class ReccomSlide extends StatefulWidget {
  @override
  _ReccomSlideState createState() => _ReccomSlideState();
}

class _ReccomSlideState extends State<ReccomSlide> {
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  // ignore: unused_field
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: MediaQuery.of(context).size.height / 2.4,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          }),
      items: map<Widget>(
        reccomndations,
        (index, i) {
          Map reccomndation = reccomndations[index];
          return SliderItem(
            img: reccomndation['img'],
            name: reccomndation['name'],
            description: reccomndation['description'],
          );
        },
      ).toList(),
    );
  }
}
