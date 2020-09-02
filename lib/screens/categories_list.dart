import 'package:Lenus_Final/screens/food_details_page.dart';
import 'package:Lenus_Final/screens/restaurant_page.dart';
import 'package:Lenus_Final/util/food_categories.dart';
import 'package:Lenus_Final/widgets/appBar.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  final List<dynamic> type;

  CategoriesList({this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        returnIcon: true,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: 20,
          right: 10,
          left: 10,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: FoodList(type: this.type),
        ),
      ),
    );
  }
}

class FoodList extends StatelessWidget {
  final List<dynamic> type;

  FoodList({
    this.type,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: type
          .map(
            (e) => FoodElement(
              title: e["title"],
              imageUrl: e["image_url"],
              price: e["price"],
            ),
          )
          .toList(),
    );
  }
}

class FoodElement extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String price;

  FoodElement({
    this.title,
    this.imageUrl,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
              height: 140.09,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.00),
              ),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodDetails(
                  title: this.title,
                  description: "lol",
                  image: this.imageUrl,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    color: Color(0xff040404),
                  ),
                ),
                new Text(
                  "${this.price} \$",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    color: Color(0xff040404),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
