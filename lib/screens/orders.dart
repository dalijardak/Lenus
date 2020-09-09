import 'package:Lenus_Final/util/sizeConfig.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final List orders = [
    {
      "name": "Chocolate Cake",
      "price": "5",
      "quantity": "3",
    },
    {
      "name": "Donuts ",
      "price": "8",
      "quantity": "1",
    },
    {
      "name": "Pizza",
      "price": "16",
      "quantity": "1",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Orders",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xff000000),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(0.00, 2.00),
                color: Color(0xff000000).withOpacity(0.16),
                blurRadius: 6,
                spreadRadius: -15,
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(
              FontAwesome.chevron_circle_left,
              size: 30,
            ),
            color: Colors.white,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: getY(context) * 0.9,
          width: getX(context),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your Orders",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xff1e4dff),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: getY(context) * 0.65,
                child: ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: OrderItem(
                        name: orders[index]["name"],
                        price: double.parse(
                          orders[index]["price"].toString(),
                        ),
                        quantity: int.parse(
                          orders[index]["quantity"].toString(),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Text(
                      "Total Amount",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Color(0xff1e4dff),
                      ),
                    ),
                    new Text(
                      "15\$",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Color(0xff1e4dff),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OrderItem extends StatefulWidget {
  final String name;
  final double price;
  final int quantity;

  OrderItem({
    this.name,
    this.price,
    this.quantity,
  });
  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 93.00,
        width: getX(context) * 0.8,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xff1e4dff),
          borderRadius: BorderRadius.circular(18.00),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Text(
                  this.widget.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xffffffff),
                  ),
                ),
                new Text(
                  "${this.widget.price.toInt().toString()}\$",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    color: Color(0xffffffff),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  MdiIcons.trashCan,
                  color: Colors.white,
                  size: 20,
                ),
                Container(
                  width: 120,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          MdiIcons.minusCircle,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: null,
                      ),
                      Text(
                        this.widget.quantity.toString(),
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
                        onPressed: null,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
