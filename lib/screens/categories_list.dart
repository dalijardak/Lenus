import 'package:Lenus_Final/screens/categories_food_details.dart';

import 'package:Lenus_Final/widgets/appBar.dart';
import 'package:Lenus_Final/widgets/drawer.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  final List<dynamic> type;

  CategoriesList({this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        returnIcon: true,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: 20,
          right: 10,
          left: 10,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: FoodList(
            type: this.type,
          ),
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
              description: e["description"],
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
  final double price;
  final String description;

  FoodElement({
    this.title,
    this.imageUrl,
    this.price,
    this.description,
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
                builder: (context) => FoodCategoriesDetails(
                  title: this.title,
                  description: this.description,
                  image: this.imageUrl,
                  price: this.price,
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
                  "${this.price.toString()} \$",
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
