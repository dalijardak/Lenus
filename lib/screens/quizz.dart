import 'package:Lenus_Final/services/user_service.dart';
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
            title: "View",
          ),
          QuizPage(
            question: "Which image makes you \nfeel excited ?",
            imageUrl_1: "assets/Quiz/quiz_2_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_2_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_2_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_2_d.jpg",
            icon: MdiIcons.emoticonExcited,
            onTap: _onItemTapped,
            title: "Events",
          ),
          QuizPage(
            question: "What would you rather \n decorate your bedroom with ?",
            imageUrl_1: "assets/Quiz/quiz_3_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_3_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_3_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_3_d.jpg",
            onTap: _onItemTapped,
            title: "Decoration",
          ),
          QuizPage(
            question: "What's your favourite \n type of music ?",
            imageUrl_1: "assets/Quiz/quiz_4_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_4_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_4_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_4_d.jpg",
            icon: MdiIcons.musicNote,
            onTap: _onItemTapped,
            title: "Music",
          ),
          QuizPage(
            question: "Feel free to \n pick a flower ",
            imageUrl_1: "assets/Quiz/quiz_5_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_5_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_5_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_5_d.jpg",
            icon: MdiIcons.flower,
            onTap: _onItemTapped,
            title: "Flower",
          ),
          QuizPage(
            question: "Choose your favorite \n meal ",
            imageUrl_1: "assets/Quiz/quiz_6_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_6_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_6_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_6_d.jpg",
            icon: MdiIcons.food,
            onTap: _onItemTapped,
            title: "Meal",
          ),
          QuizPage(
            question: "Which desser would \n you rather have ?",
            imageUrl_1: "assets/Quiz/quiz_7_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_7_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_7_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_7_d.jpg",
            icon: MdiIcons.iceCream,
            onTap: _onItemTapped,
            title: "Desert",
          ),
          QuizPage(
            question: "What drink would you want ?",
            imageUrl_1: "assets/Quiz/quiz_8_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_8_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_8_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_8_d.jpg",
            icon: MdiIcons.coffee,
            onTap: _onItemTapped,
            title: "Drinks",
          ),
          QuizPage(
            question: "Which sport you prefer \n to play?",
            imageUrl_1: "assets/Quiz/quiz_9_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_9_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_9_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_9_d.jpg",
            icon: MdiIcons.football,
            onTap: _onItemTapped,
            title: "Sports",
          ),
          QuizPage(
            question: "Which fruit dou you prefer ?",
            imageUrl_1: "assets/Quiz/quiz_10_a.jpg",
            imageUrl_2: "assets/Quiz/quiz_10_b.jpg",
            imageUrl_3: "assets/Quiz/quiz_10_c.jpg",
            imageUrl_4: "assets/Quiz/quiz_10_d.jpg",
            icon: MdiIcons.fruitCherries,
            onTap: _onItemTapped,
            title: "Fruits",
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

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();

  final String question;
  final String imageUrl_1;
  final String imageUrl_2;
  final String imageUrl_3;
  final String imageUrl_4;
  final IconData icon;
  final dynamic onTap;
  final String title;

  QuizPage({
    this.question,
    this.imageUrl_1,
    this.imageUrl_2,
    this.imageUrl_3,
    this.imageUrl_4,
    this.icon,
    this.onTap,
    this.title,
  });
}

class _QuizPageState extends State<QuizPage> {
  double _height = 300;
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
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: getY(context) * 0.85,
                width: getX(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      this.widget.icon,
                      color: Colors.blue,
                      size: getY(context) * 0.12,
                    ),
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
                    Container(
                      height: getY(context) * 0.6,
                      child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        children: [
                          image(
                            this.widget.imageUrl_1,
                            context,
                            this.widget.title,
                            [1, 0, 0, 0],
                          ),
                          image(
                            this.widget.imageUrl_2,
                            context,
                            this.widget.title,
                            [0, 1, 0, 0],
                          ),
                          image(
                            this.widget.imageUrl_3,
                            context,
                            this.widget.title,
                            [0, 0, 1, 0],
                          ),
                          image(
                            this.widget.imageUrl_4,
                            context,
                            this.widget.title,
                            [0, 0, 0, 1],
                          ),
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

  Widget image(
      String imgurl, BuildContext context, String title, List<int> numberList) {
    return InkWell(
      child: Align(
        child: AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 200),
          height: _height,
          width: _height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imgurl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(18.00),
          ),
        ),
      ),
      onLongPress: () => setState(() {
        _height = 100;
      }),
      onTap: () {
        sendQuiz(title, numberList);
        this.widget.onTap();
      },
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
