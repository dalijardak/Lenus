import 'package:Lenus_Final/screens/categories_list.dart';
import 'package:Lenus_Final/screens/food_details_page.dart';
import 'package:Lenus_Final/util/food_categories.dart';
import 'package:Lenus_Final/util/food_list.dart';
import 'package:Lenus_Final/widgets/appBar.dart';
import 'package:Lenus_Final/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RestaurantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        returnIcon: true,
      ),
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(5),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15),
                child: Text(
                  "FIND YOUR\nFAVORITE FOOD",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                    color: Color(0xff2f2f30),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15),
                child: new Text(
                  "Show All categories",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color(0xff2f2f30),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: CategoriesSlider(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15),
                child: Text(
                  "Menu Of the day",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color(0xff0c0c0c),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 15),
                child: Text(
                  "Breakfast",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xff0c0c0c),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: FoodSlider(
                  type: breakfast,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 15),
                child: Text(
                  "Lunch",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xff0c0c0c),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: FoodSlider(
                  type: lunch,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 15),
                child: Text(
                  "Dinner",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xff0c0c0c),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: FoodSlider(
                  type: dinner,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          CategoriesItem(
            icon: Icons.local_pizza,
            title: "Pizza",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoriesList(type: pizzas),
              ),
            ),
          ),
          CategoriesItem(
            icon: Icons.local_drink,
            title: "Drinks",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoriesList(
                  type: drinks,
                ),
              ),
            ),
          ),
          CategoriesItem(
            icon: Icons.cake,
            title: "Cake",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoriesList(
                  type: cake,
                ),
              ),
            ),
          ),
          CategoriesItem(
            icon: MaterialCommunityIcons.ice_cream,
            title: "IceCream",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoriesList(
                  type: iceCreams,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  CategoriesItem({
    this.icon,
    this.title,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 7.5,
        left: 7.5,
      ),
      child: InkWell(
        child: Container(
          height: 90.00,
          width: 90.00,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                this.icon,
                size: 40,
                color: Colors.white,
              ),
              Text(
                this.title,
                style: TextStyle(
                  fontFamily: "Myriad Pro",
                  fontSize: 16,
                  color: Color(0xffffffff),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Color(0xff1E4DFF),
            borderRadius: BorderRadius.circular(18.00),
          ),
        ),
        onTap: this.onTap,
      ),
    );
  }
}

class FoodSlider extends StatelessWidget {
  final List<dynamic> type;

  FoodSlider({
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: type
            .map(
              (e) => FoodItem(
                title: e["title"],
                imageUrl: e["image_url"],
                description: e["description"],
              ),
            )
            .toList(),
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  FoodItem({
    this.imageUrl,
    this.description,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(
          right: 7.5,
          left: 7.5,
        ),
        child: Container(
          height: 200,
          width: 230,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150.00,
                width: 230.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(this.imageUrl),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(18.00),
                ),
              ),
              Text(
                this.title,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 16,
                  color: Color(0xff0c0c0c),
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FoodDetails(
            title: this.title,
            description: this.description,
            image: this.imageUrl,
          ),
        ),
      ),
    );
  }
}
