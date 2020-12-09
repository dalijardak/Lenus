import "package:flutter/material.dart";

import 'congestionView.dart';

class CongestDiagram extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BoxItem(
                height: 30,
                width: 21,
                color: Colors.greenAccent,
                title: "",
              ),
              BoxItem(
                height: 80,
                width: 21,
                color: Colors.redAccent,
                title: "",
              ),
              BoxItem(
                height: 60,
                width: 21,
                color: Colors.pinkAccent,
                title: "",
              ),
              BoxItem(
                height: 70,
                width: 21,
                color: Colors.redAccent,
                title: "",
              ),
              BoxItem(
                height: 35,
                width: 21,
                color: Colors.greenAccent,
                title: "",
              ),
              BoxItem(
                height: 45,
                width: 21,
                color: Colors.redAccent,
                title: "",
              )
            ],
          ),
          new Container(
            height: 1.00,
            width: 300.00,
            color: Color(0xffbebebe),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 24,
                width: 21,
                child: Column(
                  children: [
                    Container(
                      height: 7,
                      width: 2,
                      color: Color(0xffbebebe),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "06h",
                      style: TextStyle(
                        fontFamily: "Helvetica Neue",
                        fontSize: 12,
                        color: Color(0xffbebebe),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 24,
                width: 21,
                child: Column(children: [
                  Container(
                    height: 7,
                    width: 2,
                    color: Color(0xffbebebe),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "09h",
                    style: TextStyle(
                      fontFamily: "Helvetica Neue",
                      fontSize: 12,
                      color: Color(0xffbebebe),
                    ),
                  ),
                ]),
              ),
              Container(
                height: 24,
                width: 21,
                child: Column(
                  children: [
                    Container(
                      height: 7,
                      width: 2,
                      color: Color(0xffbebebe),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "12h",
                      style: TextStyle(
                        fontFamily: "Helvetica Neue",
                        fontSize: 12,
                        color: Color(0xffbebebe),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 24,
                width: 21,
                child: Column(
                  children: [
                    Container(
                      height: 7,
                      width: 2,
                      color: Color(0xffbebebe),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "15h",
                      style: TextStyle(
                        fontFamily: "Helvetica Neue",
                        fontSize: 12,
                        color: Color(0xffbebebe),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 24,
                width: 21,
                child: Column(
                  children: [
                    Container(
                      height: 7,
                      width: 2,
                      color: Color(0xffbebebe),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "18h",
                      style: TextStyle(
                        fontFamily: "Helvetica Neue",
                        fontSize: 12,
                        color: Color(0xffbebebe),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 24,
                width: 21,
                child: Column(
                  children: [
                    Container(
                      height: 7,
                      width: 2,
                      color: Color(0xffbebebe),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "21h",
                      style: TextStyle(
                        fontFamily: "Helvetica Neue",
                        fontSize: 12,
                        color: Color(0xffbebebe),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
