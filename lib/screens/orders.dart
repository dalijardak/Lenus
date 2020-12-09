import 'package:Lenus_Final/models/order.dart';
import 'package:Lenus_Final/services/order_service.dart';
import 'package:Lenus_Final/util/sizeConfig.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  String somme = "o";
  String sum(List<Order> orders) {
    double s = 0;
    for (var order in orders) s = s + order.price * order.quantity;
    return s.toString();
  }

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
                child: FutureBuilder<List<Order>>(
                  future: getOrders(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var orders = snapshot.data;
                      print(sum(orders));
                      return Column(
                        children: [
                          Container(
                            height: getY(context) * 0.60,
                            child: ListView.builder(
                              itemCount: orders.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: OrderItem(
                                    name: orders[index].name,
                                    price: double.parse(
                                      orders[index].price.toString(),
                                    ),
                                    quantity: orders[index].quantity,
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
                                  sum(orders) + " \$",
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
                      );
                    }
                    return Container(
                      width: getX(context),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
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
          color: Color(0xffBEBEBE),
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
                    color: Colors.black,
                  ),
                ),
                new Text(
                  "${this.widget.price.toInt().toString()} \$",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    color: Color(0xff1E4DFF),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 130,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Quantity : ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18,
                          color: Colors.black,
                        ),
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
