import 'package:Lenus_Final/models/order.dart';
import 'package:Lenus_Final/services/order_service.dart';
import 'package:Lenus_Final/util/sizeConfig.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';

class SportsDetails extends StatefulWidget {
  final String title;
  final String fees;
  final String description;
  final AssetImage image;

  SportsDetails({
    this.title,
    this.fees,
    this.description,
    this.image,
  });
  @override
  _SportsDetailsState createState() => _SportsDetailsState();
}

class _SportsDetailsState extends State<SportsDetails> {
  void _validate() {
    bool send = false;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text(this.widget.title),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    send
                        ? FutureBuilder<bool>(
                            future: sendOrder(
                              Order(
                                name: this.widget.title,
                                quantity: 1,
                                price: 2.5,
                              ),
                            ),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(snapshot.data.toString());
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
                FlatButton(
                  child: Text('Confirm'),
                  onPressed: () {
                    setState(() {
                      send = true;
                    });
                  },
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    image: this.widget.image,
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
                      padding: EdgeInsets.only(top: 7),
                      child: Text(
                        this.widget.fees,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 16,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40, right: 220),
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
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 60),
                    child: new Text(
                      this.widget.description,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            this.widget.fees == "Free"
                ? Container(
                    height: 0,
                  )
                : Positioned.fill(
                    bottom: 30,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        child: Container(
                          height: 35,
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
                                fontSize: 18,
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
