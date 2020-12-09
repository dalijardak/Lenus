import 'package:Lenus_Final/models/order.dart';
import 'package:Lenus_Final/services/order_service.dart';
import 'package:Lenus_Final/util/descriptions/spa_description.dart';
import 'package:Lenus_Final/util/sizeConfig.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';

class SPADetailsPage extends StatefulWidget {
  @override
  _SPADetailsPageState createState() => _SPADetailsPageState();
}

class _SPADetailsPageState extends State<SPADetailsPage> {
  void _validate() {
    bool send = false;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text("SPA"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    send
                        ? FutureBuilder<bool>(
                            future: sendOrder(
                              Order(
                                name: "SPA",
                                quantity: 1,
                                price: 20,
                              ),
                            ),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text("Order Sent Successfully");
                              }
                              return Container(
                                width: getX(context),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.blue),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Text("Confirm Order ?"),
                  ],
                ),
              ),
              actions: <Widget>[
                send
                    ? FlatButton(
                        child: Text('Done'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    : FlatButton(
                        child: Text('Confirm'),
                        onPressed: () {
                          setState(() {
                            send = true;
                          });
                        },
                      )
              ],
            );
          });
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
                height: getY(context) * 0.5,
                width: getX(context),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/spa.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: getY(context) * 0.57,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Spa and Beauty",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 15,
                        right: 20,
                        left: 20,
                      ),
                      child: Text(
                        spa_description_1,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30, right: 220),
                      child: Text(
                        "Details",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14,
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
                height: getY(context) * 0.32,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(55.00),
                    topRight: Radius.circular(55.00),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 80,
                  ),
                  child: Container(
                    height: 120,
                    child: ListView(
                      children: [
                        new Text(
                          spa_description_2,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 12,
                            color: Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: 30,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  child: Container(
                    height: 35.00,
                    width: getY(context) * 0.3,
                    decoration: BoxDecoration(
                      color: Color(0xff1e4dff),
                      borderRadius: BorderRadius.circular(25.00),
                    ),
                    child: Center(
                      child: Text(
                        "Booking",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 16,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  onTap: _validate,
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                icon: Icon(
                  FontAwesome.chevron_circle_left,
                  size: 40,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
