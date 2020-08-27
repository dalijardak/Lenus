import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RestaurantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                width: 200,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      icon: Icon(Icons.search),
                      border: InputBorder.none),
                ),
              ),
            ],
          ),
          height: 35.00,
          width: 300,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                offset: Offset(0.00, 3.00),
                color: Color(0xff000000).withOpacity(0.16),
                blurRadius: 6,
              ),
            ],
            borderRadius: BorderRadius.circular(20.00),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              FontAwesome.chevron_circle_left,
              color: Colors.grey,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
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
                  type: "breakfast",
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
                  type: "lunch",
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
                  type: "dinner",
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
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          CategoriesItem(
            icon: Icons.local_pizza,
            title: "Pizza",
          ),
          CategoriesItem(
            icon: Icons.local_drink,
            title: "Drinks",
          ),
          CategoriesItem(
            icon: Icons.cake,
            title: "Cake",
          ),
          CategoriesItem(
            icon: MaterialCommunityIcons.ice_cream,
            title: "IceCream",
          ),
        ],
      ),
    );
  }
}

class CategoriesItem extends StatelessWidget {
  final IconData icon;
  final String title;

  CategoriesItem({
    this.icon,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 7.5,
        left: 7.5,
      ),
      child: Container(
        height: 89.00,
        width: 94.00,
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
          color: Color(0xfffa5757),
          borderRadius: BorderRadius.circular(18.00),
        ),
      ),
    );
  }
}

class FoodSlider extends StatelessWidget {
  final String type;

  FoodSlider({
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    switch (this.type) {
      case "breakfast":
        {
          return Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                FoodItem(
                  image: AssetImage("assets/images/english_breakfast.jpg"),
                  title: "English Breakfast",
                ),
                FoodItem(
                  image: AssetImage("assets/images/continental_breakfast.jpg"),
                  title: "Continental Breakfast",
                ),
              ],
            ),
          );
        }
        break;

      case "lunch":
        {
          return Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                FoodItem(
                  image: AssetImage("assets/images/healthy_lunch.jpg"),
                  title: "English Breakfast",
                ),
                FoodItem(
                  image: AssetImage("assets/images/vegetables.jpg"),
                  title: "Continental Breakfast",
                ),
                FoodItem(
                  image: AssetImage("assets/images/fast_food.jpg"),
                  title: "Fast Food",
                ),
              ],
            ),
          );
        }
        break;

      case "dinner":
        {
          return Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                FoodItem(
                  image: AssetImage("assets/images/soup.jpg"),
                  title: "English Breakfast",
                ),
                FoodItem(
                  image: AssetImage("assets/images/healthy.jpg"),
                  title: "Continental Breakfast",
                ),
              ],
            ),
          );
        }
        break;
    }
    return null;
  }
}

class FoodItem extends StatelessWidget {
  final AssetImage image;
  final String title;

  FoodItem({
    this.image,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 7.5,
        left: 7.5,
      ),
      child: Container(
        height: 250,
        width: 230,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150.00,
              width: 230.00,
              decoration: BoxDecoration(
                image: DecorationImage(image: this.image, fit: BoxFit.fill),
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
    );
  }
}
