import 'package:Lenus_Final/models/user.dart';
import 'package:Lenus_Final/services/user_service.dart';
import 'package:Lenus_Final/util/sizeConfig.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool error = false;
  bool isLoading = false;
  bool isVisible = true;

  _validate() {
    setState(() {
      isLoading = true;
      error = false;
    });
    User user = User(
      email: emailController.text,
      password: passwordController.text,
    );
    if (_formKey.currentState.validate()) {
      logIn(user).then((value) {
        setState(() {
          isLoading = false;
        });
        if (value == null)
          setState(() {
            error = true;
          });
        else {
          setState(() {
            error = false;
          });
          isFirstTime().then((value) {
            if (value)
              Navigator.pushNamed(context, "/Questions");
            else
              Navigator.pushNamed(context, "/ReservationCodePage");
          });
        }
      }).catchError(
        (error) => print(
          error.toString(),
        ),
      );
    } else
      setState(() {
        isLoading = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: getX(context),
              padding: EdgeInsets.only(
                  top: getY(context) * 0.1, right: 20, left: 20),
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
                      height: getY(context) * 0.22,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
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
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: isVisible,
                            decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: IconButton(
                                icon: isVisible
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                              ),
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
                  error
                      ? Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "Please verify your Email or Password",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 20,
                        ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getY(context) * 0.14,
                    ),
                    child: isLoading
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.blue),
                          )
                        : InkWell(
                            onTap: () => _validate(),
                            child: Container(
                              height: getY(context) * 0.06,
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
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
                      height: getY(context) * 0.05,
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
                            onTap: () =>
                                Navigator.pushNamed(context, "/SignUp"),
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
      ),
    );
  }
}
