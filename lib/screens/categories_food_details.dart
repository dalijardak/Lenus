import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FoodCategoriesDetails extends StatefulWidget {
  final String title;
  final String image;
  final String description;
  final String price;

  FoodCategoriesDetails({
    this.title,
    this.description,
    this.image,
    this.price,
  });

  @override
  _FoodCategoriesDetailsState createState() => _FoodCategoriesDetailsState();
}

class _FoodCategoriesDetailsState extends State<FoodCategoriesDetails> {
  int _quantity = 0;

  void incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (_quantity > 0)
        _quantity--;
      else
        return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(this.widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 450.00,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        this.widget.title,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: new Text(
                        "${this.widget.price}\$",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                        width: 150,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Icon(
                                MdiIcons.minusCircle,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: decrementQuantity,
                            ),
                            Text(
                              _quantity.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 24,
                                color: Color(0xffffffff),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                MdiIcons.plusCircle,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: incrementQuantity,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 220),
                      child: Text(
                        "Details",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xff1e4dff),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(55.00),
                    topRight: Radius.circular(55.00),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 250.00,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(55.00),
                    topRight: Radius.circular(55.00),
                  ),
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 45),
                        child: new Text(
                          "Ingredient",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Myriad Pro",
                            fontSize: 18,
                            color: Color(0xff1e4dff),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                        child: new Text(
                          this.widget.description,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                icon: Icon(
                  FontAwesome.chevron_circle_left,
                  size: 40,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Positioned.fill(
              bottom: 30,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 35.00,
                  width: 220.00,
                  decoration: BoxDecoration(
                    color: Color(0xff1e4dff),
                    borderRadius: BorderRadius.circular(25.00),
                  ),
                  child: Center(
                    child: Text(
                      "Order",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 16,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
