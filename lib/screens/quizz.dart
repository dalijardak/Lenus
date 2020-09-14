import 'package:Lenus_Final/util/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class QuizPages extends StatefulWidget {
  @override
  _QuizPagesState createState() => _QuizPagesState();
}

class _QuizPagesState extends State<QuizPages> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: new NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: [
          QuizPage(
            question:
                "Which of these pictures makes\n you feel the most relaxed ?",
            imageUrl_1: "assets/Quiz/quiz_1_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_1_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_1_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_1_d.jpg",
            icon: MdiIcons.emoticonHappy,
            onTap: _onItemTapped,
          ),
          QuizPage(
            question: "Which image makes you \nfeel excited ?",
            imageUrl_1: "assets/Quiz/quiz_2_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_2_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_2_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_2_d.jpg",
            icon: MdiIcons.emoticonExcited,
            onTap: _onItemTapped,
          ),
          QuizPage(
            question: "What would you rather \n decorate your bedroom with ?",
            imageUrl_1: "assets/Quiz/quiz_3_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_3_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_3_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_3_d.jpg",
            icon: MdiIcons.deskLamp,
            onTap: _onItemTapped,
          ),
          QuizPage(
            question: "What's your favourite \n type of music ?",
            imageUrl_1: "assets/Quiz/quiz_4_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_4_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_4_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_4_d.jpg",
            icon: MdiIcons.musicNote,
            onTap: _onItemTapped,
          ),
          QuizPage(
            question: "Feel free to \n pick a flower ",
            imageUrl_1: "assets/Quiz/quiz_5_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_5_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_5_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_5_d.jpg",
            icon: MdiIcons.flower,
            onTap: _onItemTapped,
          ),
          QuizPage(
            question: "Choose your favorite \n meal ",
            imageUrl_1: "assets/Quiz/quiz_3_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_3_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_3_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_3_d.jpg",
            icon: MdiIcons.food,
            onTap: _onItemTapped,
          ),
          QuizPage(
            question: "Which desser would \n you rather have ?",
            imageUrl_1: "assets/Quiz/quiz_3_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_3_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_3_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_3_d.jpg",
            icon: MdiIcons.iceCream,
            onTap: _onItemTapped,
          ),
          QuizPage(
            question: "What drink would you want ?",
            imageUrl_1: "assets/Quiz/quiz_3_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_3_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_3_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_3_d.jpg",
            icon: MdiIcons.coffee,
            onTap: _onItemTapped,
          ),
          QuizPage(
            question: "Which sport you prefer \n to play?",
            imageUrl_1: "assets/Quiz/quiz_3_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_3_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_3_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_3_d.jpg",
            icon: MdiIcons.football,
            onTap: _onItemTapped,
          ),
          QuizPage(
            question: "Which fruit dou you prefer ?",
            imageUrl_1: "assets/Quiz/quiz_3_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_3_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_3_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_3_d.jpg",
            icon: MdiIcons.fruitCherries,
            onTap: _onItemTapped,
          ),
          quizEnd(context),
        ],
      ),
    );
  }

  Widget quizEnd(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/backgrounds/quiz_0.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/pie.png"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: new Text(
                  "Congrats",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: Color(0xffffc8de),
                  ),
                ),
              ),
              new Text(
                "You won a Strawberry Tart",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Color(0xffffffff),
                ),
              )
            ],
          ),
          Positioned(
            right: getX(context) * 0.05,
            bottom: getY(context) * 0.03,
            child: Row(
              children: [
                new Text(
                  "Continue",
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
                  onPressed: () => Navigator.pushNamed(context, "/Home"),
                ),
              ],
            ),
          )
        ],
      ),
    );
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
}

class QuizPage extends StatelessWidget {
  final String question;
  final String imageUrl_1;
  final String imageUrl_2;
  final String imageUrl_3;
  final String imageUrl_4;
  final IconData icon;
  final dynamic onTap;

  QuizPage({
    this.question,
    this.imageUrl_1,
    this.imageUrl_2,
    this.imageUrl_3,
    this.imageUrl_4,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/backgrounds/quiz_1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: getY(context) * 0.07,
            left: getX(context) * 0.07,
            child: Icon(
              MdiIcons.windowClose,
              color: Colors.white,
              size: 34,
            ),
          ),
          Positioned(
            bottom: getY(context) * 0.1,
            child: Align(
              child: Container(
                height: getY(context) * 0.75,
                width: getX(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (icon == null)
                        ? SizedBox()
                        : Icon(
                            icon,
                            color: Colors.blue,
                            size: 100,
                          ),
                    new Text(
                      "Which of these pictures makes \nyou feel the most relaxed ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Color(0xffffffff),
                      ),
                    ),
                    Container(
                      height: getY(context) * 0.5,
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: [
                          image(imageUrl_1),
                          image(imageUrl_2),
                          image(imageUrl_3),
                          image(imageUrl_4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget image(String imgurl) {
    return InkWell(
      child: Align(
        child: Container(
          height: 130.00,
          width: 130.00,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imgurl),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(18.00),
          ),
        ),
      ),
      onTap: this.onTap,
    );
  }
}

class QuizGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/backgrounds/quiz_0.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Quiz",
                style: TextStyle(
                  color: Color(0xffFFC8DE),
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "Answer a few questions to start \npersonalizing your journey",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 18,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: getX(context) * 0.05,
            bottom: getY(context) * 0.03,
            child: Row(
              children: [
                new Text(
                  "Start",
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
                  onPressed: () => Navigator.pushNamed(context, "/Quiz"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
