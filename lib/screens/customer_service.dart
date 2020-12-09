import 'dart:async';

import 'package:Lenus_Final/services/user_service.dart';
import 'package:Lenus_Final/util/sizeConfig.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class CustomerService extends StatefulWidget {
  @override
  _CustomerServiceState createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {
  TextEditingController messageController;
  ScrollController _controller = ScrollController();
  bool isDisabled = true;
  final df = new DateFormat('hh:mm a');

  List messagesList = [
    {
      "text": "Welcome Sir",
      "type": "Receiver",
    },
    {
      "text": " Thank you",
      "type": "Sender",
    }
  ];

  List<bool> isSelected = [true, false, false, false, false];
  int selectedIndex = 0;
  void initState() {
    super.initState();
    messageController = TextEditingController(text: "");
  }

  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  _onTap(int index) {
    setState(() {
      for (var i = 0; i < 3; i++) isSelected[i] = false;
      isSelected[index] = true;
    });
  }

  _sendMsg() {
    sendText(messageController.text);
    setState(() {
      messagesList.add(
        {"text": messageController.text, "type": "Sender"},
      );
      isDisabled = true;
    });

    messageController.clear();
    Timer(
        Duration(milliseconds: 300),
        () => _controller.animateTo(_controller.position.maxScrollExtent,
            duration: Duration(milliseconds: 100), curve: Curves.linear));
    Timer(Duration(seconds: 1), () {
      setState(() {
        messagesList.add(
          {
            "text":
                "Thank you for reaching out. Someone will be with you shortly.",
            "type": "Receiver"
          },
        );
      });
    });
    Timer(
        Duration(milliseconds: 1500),
        () => _controller.animateTo(_controller.position.maxScrollExtent,
            duration: Duration(milliseconds: 100), curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.88,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            new Container(
              height: getY(context) * 0.17,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.00, 3.00),
                    color: Color(0xff000000).withOpacity(0.16),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Text(
                    "Customer Service",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color(0xff000000),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        child: new Text(
                          "Food",
                          style: TextStyle(
                            fontFamily: "Helvetica Neue",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: isSelected[0]
                                ? Colors.white
                                : Color(0xff1e4dff),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Color(0xff1e4dff)),
                        ),
                        color: isSelected[0] ? Color(0xff1e4dff) : Colors.white,
                        onPressed: () => _onTap(0),
                      ),
                      FlatButton(
                        child: new Text(
                          "Room Service",
                          style: TextStyle(
                            fontFamily: "Helvetica Neue",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: isSelected[1]
                                ? Colors.white
                                : Color(0xff1e4dff),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue),
                        ),
                        color: isSelected[1] ? Color(0xff1e4dff) : Colors.white,
                        onPressed: () => _onTap(1),
                      ),
                      FlatButton(
                        child: new Text(
                          "Activities",
                          style: TextStyle(
                            fontFamily: "Helvetica Neue",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: isSelected[2]
                                ? Colors.white
                                : Color(0xff1e4dff),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue),
                        ),
                        color: isSelected[2] ? Color(0xff1e4dff) : Colors.white,
                        onPressed: () => _onTap(2),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
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
                    left: 30,
                    right: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "WELCOME TO HELP CENTER ",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color(0xff000000),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 15),
                        child: Text(
                          "We are available 24h/24",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        height: getY(context) * 0.46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: ListView.builder(
                          controller: _controller,
                          itemCount: messagesList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: msgBox(
                                messagesList[index]["text"],
                                messagesList[index]["type"],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: 30,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 46.00,
                  width: 320.00,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 3.00),
                        color: Color(0xff000000).withOpacity(0.16),
                        blurRadius: 6,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25.00),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        width: 270,
                        child: TextField(
                          onChanged: buttonState,
                          controller: messageController,
                          decoration: InputDecoration(
                            hintText: "Write a message ...",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        enableFeedback: true,
                        disabledColor: Colors.grey,
                        color: Colors.blue,
                        icon: Icon(
                          Icons.send,
                        ),
                        onPressed: isDisabled ? null : _sendMsg,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void buttonState(String message) {
    setState(() {
      if (message.length > 0)
        isDisabled = false;
      else
        isDisabled = true;
    });
  }

  Widget msgBox(String text, String type) {
    return (type == "Receiver")
        ? Align(
            alignment: Alignment.centerLeft,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 5),
                constraints: BoxConstraints(
                  maxWidth: 250,
                  minWidth: 30,
                ),
                decoration: BoxDecoration(
                  color: Color(0xffbbbbbb),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.00),
                    topRight: Radius.circular(18.00),
                    bottomRight: Radius.circular(18.00),
                  ),
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                df.format(new DateTime.now()),
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ]),
          )
        : Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 5),
                  constraints: BoxConstraints(
                    maxWidth: 250,
                    minWidth: 30,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xff1e4dff),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.00),
                      topRight: Radius.circular(18.00),
                      bottomLeft: Radius.circular(18.00),
                    ),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  df.format(new DateTime.now()),
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ],
            ),
          );
  }
}
