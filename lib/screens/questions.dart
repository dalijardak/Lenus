import 'package:Lenus_Final/util/sizeConfig.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  PageController pageController;
  int selectedIndex = 0;

  void _onItemTapped() {
    setState(() {
      selectedIndex++;
      pageController.animateToPage(selectedIndex,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
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
        body: PageView(
          controller: pageController,
          physics: new NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(
              () {
                selectedIndex = index;
              },
            );
          },
          children: [
            Question(
              question: "Do you suffer from\n any kind of illness ?",
              imgUrl: "assets/backgrounds/qs1.png",
              onTap: _onItemTapped,
            ),
            Question(
              question: "Do you suffer from\n any kind of allergies ?",
              imgUrl: "assets/backgrounds/qs2.png",
              onTap: _onItemTapped,
            ),
            Question(
              question: "Do you have any form\n of phobias ?",
              imgUrl: "assets/backgrounds/qs2.png",
              onTap: _onItemTapped,
            ),
            Processing(),
          ],
        ),
      ),
    );
  }
}

class Question extends StatefulWidget {
  final String question;
  final String imgUrl;
  final dynamic onTap;

  Question({
    this.question,
    this.imgUrl,
    this.onTap,
  });
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  bool isEnabled = false;
  Color yesButtonColor = Colors.grey;
  Color noButtonColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getY(context),
      width: getX(context),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(this.widget.imgUrl), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              height: getY(context) * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new Text(
                    this.widget.question,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Color(0xffffffff),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isEnabled = true;
                            yesButtonColor = Colors.white;
                            noButtonColor = Colors.grey;
                          });
                        },
                        child: Container(
                          height: 37.00,
                          width: 96.00,
                          decoration: BoxDecoration(
                            color: yesButtonColor,
                            borderRadius: BorderRadius.circular(19.00),
                          ),
                          child: Center(
                            child: new Text(
                              "Yes",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isEnabled = false;
                            yesButtonColor = Colors.grey;
                            noButtonColor = Colors.white;
                          });
                        },
                        child: Container(
                          height: 37.00,
                          width: 96.00,
                          decoration: BoxDecoration(
                            color: noButtonColor,
                            borderRadius: BorderRadius.circular(19.00),
                          ),
                          child: Center(
                            child: new Text(
                              "No",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Container(
                    height: 46.00,
                    width: 257.00,
                    decoration: BoxDecoration(
                      color: yesButtonColor,
                      borderRadius: BorderRadius.circular(25.00),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        enabled: isEnabled,
                        decoration: InputDecoration(
                          hintText: "Please describe it...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: getX(context) * 0.05,
            bottom: getY(context) * 0.03,
            child: Row(
              children: [
                new Text(
                  "Next",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 24,
                    color: Color(0xffffffff),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: Icon(
                    FontAwesome.chevron_circle_right,
                    size: 30,
                  ),
                  color: Colors.white,
                  onPressed: this.widget.onTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Processing extends StatefulWidget {
  @override
  _ProcessingState createState() => _ProcessingState();
}

class _ProcessingState extends State<Processing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: getY(context),
        width: getX(context),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgrounds/qs1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new Text(
              "We Are Processing \n Your Data",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xffffffff),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              height: 150,
              width: 150,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
