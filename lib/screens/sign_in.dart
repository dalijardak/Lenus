import 'package:Lenus_Final/util/sizeConfig.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  _validate() {
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
                    top: getY(context) * 0.1,
                    bottom: getY(context) * 0.1,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      "Welcome back ",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    height: getY(context) * 0.2,
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
                            labelText: "Password",
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
                    top: getY(context) * 0.15,
                  ),
                  child: InkWell(
                    onTap: _validate,
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(context, "/Home"),
                      child: Container(
                        height: 46.00,
                        width: 257.00,
                        decoration: BoxDecoration(
                          color: Color(0xff1e4dff),
                          borderRadius: BorderRadius.circular(25.00),
                        ),
                        child: Center(
                          child: new Text(
                            "Sign In",
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
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Container(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new Text(
                          "Don’t have an account ?",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 16,
                            color: Color(0xff070606).withOpacity(0.30),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, "/SignUp"),
                          child: new Text(
                            "Sign Up",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16,
                              color: Color(0xff070606),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
