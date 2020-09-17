import 'package:Lenus_Final/models/user.dart';
import 'package:Lenus_Final/services/user_service.dart';
import 'package:Lenus_Final/util/sizeConfig.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<User> futureUser;
  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E4DFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          new Container(
            height: getY(context) * 0.27,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(55.00),
                bottomRight: Radius.circular(55.00),
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/heisenberg.jpeg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              backgroundColor: Color(0xffbebebe),
                              radius: 15.0,
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                iconSize: 17,
                                icon: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                                onPressed: null,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.00, 2.00),
                          color: Color(0xff000000).withOpacity(0.16),
                          blurRadius: 6,
                          spreadRadius: -10,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        FontAwesome.chevron_circle_left,
                        size: 35,
                      ),
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder<User>(
            future: futureUser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: ListView(
                      padding: EdgeInsets.all(15),
                      children: [
                        elementInfo(
                          "Name",
                          snapshot.data.name,
                          context,
                        ),
                        elementInfo(
                          "Email",
                          snapshot.data.email,
                          context,
                        ),
                        elementInfo(
                          "Phone",
                          snapshot.data.phone,
                          context,
                        ),
                        elementInfo(
                          "Address",
                          "Albequerque",
                          context,
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Expanded(
                child: Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

Widget elementInfo(String type, String data, BuildContext context) {
  return Container(
    height: getY(context) * 0.15,
    width: getX(context) * 0.8,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: TextStyle(
            fontFamily: "Helvetica Neue",
            fontSize: 16,
            color: Color(0xffffffff),
          ),
        ),
        TextField(
          enabled: false,
          decoration: InputDecoration(
            hintText: data,
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffBEBEBE),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
