import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ihm_projet_mobilite/views/map_view.dart';
import 'package:ihm_projet_mobilite/views/shopping_lists_view.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "/HomeView";

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        title: Text(
          'Carte',
          style: TextStyle(fontSize: index == 0 ? 18 : 12),
        ),
        icon: Container(
          child: Icon(
            Icons.map,
            color: index == 0 ? Colors.blue : Colors.black,
            size: index == 0 ? 32 : 24,
          ),
        ),
      ),
      BottomNavigationBarItem(
        title: Text(
          'Liste des courses',
          style: TextStyle(fontSize: index == 1 ? 18 : 12),
        ),
        icon: Icon(
          Icons.shopping_basket,
          color: index == 1 ? Colors.blue : Colors.black,
          size: index == 1 ? 32 : 24,
        ),
      ),
    ];
  }

  Widget buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      onPageChanged: (index) {
        _pageChanged(index);
      },
      children: <Widget>[
        MapView(),
        ShoppingListsView()
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(title: Text('Hello World')),
          body: buildPageView(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: buildBottomNavBarItems(),
            onTap: (int index) {
              _bottomTapped(index);
            },
          ),
        ),
      ],
    );
  }

  // ---------- Utils --------- //

  void _pageChanged(int index) {
    setState(() {
      this.index = index;
    });
  }

  void _bottomTapped(int index) {
    setState(() {
      this.index = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}
