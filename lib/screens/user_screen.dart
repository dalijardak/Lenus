import 'package:Lenus_Final/screens/customer_service.dart';
import 'package:Lenus_Final/screens/quizz.dart';
import 'package:Lenus_Final/widgets/drawer.dart';
import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'home_page.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  PageController pageController;
  GlobalKey bottomNavigationKey = GlobalKey();
  int selectedIndex = 0;
  bool isSearching = false;
  bool isDisabled = false;
  TextEditingController searchController = new TextEditingController();
  List<String> items = ["Restaurant", "Sports", "SPA"];
  List<String> filtredItems = ["Restaurant", "Sports", "SPA"];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      pageController.animateToPage(selectedIndex,
          duration: Duration(milliseconds: 200), curve: Curves.linear);
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
        backgroundColor: Colors.white,
        appBar: isDisabled
            ? PreferredSize(
                child: Container(),
                preferredSize: Size(0.0, 0.0),
              )
            : AppBar(
                backgroundColor: Colors.white,
                title: Container(
                  height: 38.00,
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(20.00),
                    border: Border.all(
                      color: Color.fromARGB(90, 112, 112, 112),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        child: TextFormField(
                          controller: searchController,
                          onChanged: searchPressed,
                          decoration: InputDecoration(
                            hintText: "Search",
                            prefixIcon: isSearching
                                ? IconButton(
                                    padding: EdgeInsets.all(0),
                                    enableFeedback: true,
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      searchController.clear();
                                      setState(() {
                                        isSearching = false;
                                      });
                                    },
                                  )
                                : IconButton(
                                    icon: Icon(Icons.search),
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {},
                                  ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/heisenberg.jpeg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        onTap: () => Navigator.pushNamed(context, "/Profile"),
                      ),
                    ),
                  ),
                ],
                leading: Builder(
                  builder: (context) => IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
              ),
        drawer: MyDrawer(),
        body: isSearching
            ? Container(
                child: search(),
              )
            : PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                    if (selectedIndex == 1 || selectedIndex == 2)
                      isDisabled = true;
                    else
                      isDisabled = false;
                  });
                },
                children: <Widget>[
                  HomePage(),
                  CustomerService(),
                  QuizGame(),
                ],
              ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: "Chat",
              icon: Icon(
                MdiIcons.chatProcessingOutline,
              ),
            ),
            BottomNavigationBarItem(
              label: "Quizz",
              icon: Icon(
                Ionicons.logo_game_controller_b,
              ),
            ),
          ],
          selectedItemColor: Color(0xff1E4DFF),
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget search() {
    getItems();
    if (searchController.text.isNotEmpty) {
      List<String> temp = new List<String>();
      for (int i = 0; i < filtredItems.length; i++) {
        if (filtredItems[i].toLowerCase().contains(
              searchController.text.toLowerCase(),
            )) {
          temp.add(filtredItems[i]);
        }
      }
      filtredItems = temp;
    }
    return ListView.builder(
      itemCount: filtredItems.length,
      itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.search),
          title: Text(
            filtredItems[index],
            style: TextStyle(color: Colors.black),
          ),
          onTap: () {
            searchController.clear();
            FocusScope.of(context).unfocus();
            setState(() {
              isSearching = false;
            });
            Navigator.pushNamed(context, "/${filtredItems[index]}");
          }),
    );
  }

  void searchPressed(String text) {
    setState(() {
      if (text.isNotEmpty) {
        isSearching = true;
      } else
        isSearching = false;
    });
  }

  void getItems() {
    setState(() {
      filtredItems = items;
    });
  }
}
