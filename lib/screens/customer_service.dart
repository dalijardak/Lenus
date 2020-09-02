import "package:flutter/material.dart";

class CustomerService extends StatefulWidget {
  @override
  _CustomerServiceState createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {
  TextEditingController messageController;
  Color iconColor = Colors.grey;
  void initState() {
    super.initState();
    messageController = TextEditingController(text: "");
  }

  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xff1E4DFF),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Customer Service",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0xffffffff),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Food",
                            style: TextStyle(
                              fontFamily: "Helvetica Neue",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xffffffff),
                            ),
                          ),
                          Text(
                            "Room Service",
                            style: TextStyle(
                              fontFamily: "Helvetica Neue",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xffffffff),
                            ),
                          ),
                          Text(
                            "Activities",
                            style: TextStyle(
                              fontFamily: "Helvetica Neue",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xffffffff),
                            ),
                          ),
                          Text(
                            "Payement",
                            style: TextStyle(
                              fontFamily: "Helvetica Neue",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
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
                  padding: EdgeInsets.all(30),
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
                        height: 250,
                        child: ListView(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height: 76.00,
                                width: 220.00,
                                decoration: BoxDecoration(
                                  color: Color(0xff1e4dff),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(9.00),
                                    topRight: Radius.circular(9.00),
                                    bottomRight: Radius.circular(9.00),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '''Thank you for reaching out.\nSomeone will be with you shortly.''',
                                      style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 16,
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
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 108,
              child: Container(
                height: 1.00,
                width: 412.00,
                color: Color(0xffbebebe),
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
                          onChanged: setColor,
                          controller: messageController,
                          decoration: InputDecoration(
                            hintText: "Write a message ...",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.send,
                          color: iconColor,
                        ),
                        onPressed: null,
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

  void setColor(String message) {
    setState(() {
      if (message.length > 0)
        iconColor = Colors.blueAccent;
      else
        iconColor = Colors.grey;
    });
  }
}
