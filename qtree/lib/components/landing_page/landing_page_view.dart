import 'package:flutter/material.dart';
import 'package:qtree/components/home_page/home_page.dart';
import 'package:qtree/components/landing_page/landing_page.dart';
import 'package:qtree/theme/colorTheme.dart';
import './landing_page_view_model.dart';

class LandingPageView extends State<LandingPage> {
  LandingPageViewModel? viewModel;
  LandingPageView() {
    viewModel = new LandingPageViewModel();
  }
  int selectedIndex = 2;
  List<Widget> pageContent = [
    Center(
      child: Container(
        alignment: Alignment.center,
        child: Text("Live Chat"),
      ),
    ),
    Center(
      child: Container(
        child: Text("Profile"),
      ),
    ),
    Center(
      child: Container(
        child: Text("Home"),
      ),
    ),
    Center(
      child: Container(
        child: Text("Menu"),
      ),
    ),
    Center(
      child: Container(
        child: Text("Favourites"),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        selectedIconTheme: IconThemeData(color: Colors.orange),
        selectedLabelStyle: TextStyle(color: Colors.orange),
        selectedItemColor: Colors.orange,
        unselectedIconTheme:
            IconThemeData(color: ColorTheme.colorTheme.darkGrey),
        items: [
          new BottomNavigationBarItem(
              icon: Icon(Icons.chat), label: "live chat"),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "profile"),
          new BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          new BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded), label: "menu"),
          new BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "favourites"),
        ],
      ),
      body: switchCaseFun(),
      // selectedIndex == 0
      // ? Center(
      //     child: Container(
      //       child: Text("Live chat"),
      //     ),
      //   )
      //     : selectedIndex == 1
      //         ? Center(
      //             child: Container(
      //               child: Text("Profile"),
      //             ),
      //           )
      //         : Container()
    );
  }

  Widget switchCaseFun() {
    switch (selectedIndex) {
      case 0:
        return Center(
          child: Container(
            child: Text("Live chat"),
          ),
        );
      case 1:
        return Center(
          child: Container(
            child: Text("Profile"),
          ),
        );
      case 2:
        return HomePage();

      default:
        return Container();
    }
  }
}
