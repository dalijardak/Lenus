import 'package:Lenus_Final/util/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  validate() {
    if (_formKey.currentState.validate()) {
      //To DO
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          height: getY(context),
          width: getX(context),
          padding:
              EdgeInsets.only(top: getY(context) * 0.1, right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/logo/logo_h.png"),
                height: getY(context) * 0.1,
                width: getX(context) * 0.4,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getY(context) * 0.05,
                  bottom: getY(context) * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Text(
                      "NEW \nACCOUNT",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Color(0xff000000),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 56.00,
                          width: 56.00,
                          decoration: BoxDecoration(
                            color: Color(0xffbebebe),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            MdiIcons.camera,
                            color: Colors.white,
                            size: 34,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: new Text(
                            "Uplod your\nprofile picture",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 12,
                              color: Color(0xff030303).withOpacity(0.30),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  height: getY(context) * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: "Username",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Username is required";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Email is required";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password is required";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password is required";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: new Text(
                  "Forgot Password ?",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    color: Color(0xff1e4dff).withOpacity(0.45),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getY(context) * 0.03,
                ),
                child: new InkWell(
                  onTap: () => Navigator.pushNamed(context, "/Questions"),
                  child: Container(
                    height: 46.00,
                    width: 257.00,
                    decoration: BoxDecoration(
                      color: Color(0xff1e4dff),
                      borderRadius: BorderRadius.circular(25.00),
                    ),
                    child: Center(
                      child: new Text(
                        "Sign Up",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18,
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
      )),
    );
  }
}
