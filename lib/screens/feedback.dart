import 'package:Lenus_Final/services/user_service.dart';
import 'package:Lenus_Final/util/sizeConfig.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  //Feedback variables
  final TextEditingController descriptionController = TextEditingController();
  int feedBackRating = 1;
  String dropDownValue = "Restaurant";

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> typeList = ["Restaurant", "Housekeeping", "Hospitality"];
  List<bool> isSelected = [true, false, false, false, false];
  int selectedIndex = 0;
  _onTap(int index) {
    setState(() {
      for (var i = 0; i < 5; i++) isSelected[i] = false;
      isSelected[index] = true;
    });
  }

  void _validate() {
    sendFeedBack(dropDownValue, feedBackRating, descriptionController.text)
        .then(
          (value) => _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(
                "Successfully Sent",
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
            ),
          ),
        )
        .catchError(
          (test) => _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(
                "Error on sending message",
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
          ),
        );
    descriptionController.clear();
  }

  Widget rating(int x, IconData iconData, String description) {
    return Column(
      children: [
        IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(
              iconData,
              size: isSelected[x] ? 50 : 40,
            ),
            color: isSelected[x] ? Color(0xff1e4dff) : Colors.grey,
            onPressed: () {
              _onTap(x);
              setState(() {
                feedBackRating = x + 1;
              });
            }),
        isSelected[x]
            ? Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color(0xff1e4dff),
                ),
              )
            : SizedBox(
                height: 18,
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "FeedBack",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xff000000),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(0.00, 2.00),
                color: Color(0xff000000).withOpacity(0.16),
                blurRadius: 6,
                spreadRadius: -15,
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(
              FontAwesome.chevron_circle_left,
              size: 30,
            ),
            color: Colors.white,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              height: getY(context) * 0.9,
              width: getX(context) * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new Text(
                    "Select Categorie",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xff000000),
                    ),
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    value: dropDownValue,
                    icon: Icon(Icons.arrow_downward),
                    items: typeList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        dropDownValue = newValue;
                      });
                    },
                  ),
                  new Text(
                    "How was your experience?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xff000000),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      rating(0, MdiIcons.emoticonFrownOutline, "Terrible"),
                      rating(1, MdiIcons.emoticonSadOutline, "Bad"),
                      rating(2, MdiIcons.emoticonNeutralOutline, "Satisfied"),
                      rating(3, MdiIcons.emoticonHappyOutline, "Good"),
                      rating(4, MdiIcons.emoticonExcitedOutline, "Great"),
                    ],
                  ),
                  new Text(
                    "Describe what you have experienced",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xff000000),
                    ),
                  ),
                  TextFormField(
                    controller: descriptionController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                    decoration: InputDecoration(
                      labelText: "Description",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: new BorderSide(width: 2),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                      onPressed: _validate,
                      color: Colors.white,
                      child: new Text(
                        "Send",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xff1e4dff),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.grey),
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
