import 'package:Lenus_Final/services/user_service.dart';
import 'package:Lenus_Final/util/sizeConfig.dart';
import "package:flutter/material.dart";

class ReservationCodePage extends StatefulWidget {
  @override
  _ReservationCodePageState createState() => _ReservationCodePageState();
}

class _ReservationCodePageState extends State<ReservationCodePage> {
  final reservationCodeController = new TextEditingController();
  _validate() {
    Future<String> msg = checkIn(reservationCodeController.text);
    msg.then((value) {
      if (value == "true")
        Navigator.pushNamed(context, "/Home");
      else
        print("Permission Denied");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Container(
            height: getY(context),
            width: getX(context),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/backgrounds/qs2.png"),
              ),
            ),
            child: Align(
              child: Container(
                height: getY(context) * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    new Text(
                      "Start the \nExperience",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Color(0xffffffff),
                      ),
                    ),
                    Container(
                      height: 46.00,
                      width: getX(context) * 0.42,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(25.00),
                      ),
                      child: TextFormField(
                        controller: reservationCodeController,
                        decoration: InputDecoration(
                          hintText: "Reservation Code",
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Reservation Code is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    RaisedButton(
                      child: Text("Submit"),
                      onPressed: () => _validate(),
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
