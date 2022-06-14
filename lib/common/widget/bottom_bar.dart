import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/constants/global_variable.dart';
import 'package:shopping_app/features/home/screens/home_screens.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "/actual-home";
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _pageIndex = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderwidth = 5;
  List<Widget> pages = [
    const HomeScreen(),
    const Center(
      child: Text("Account Page"),
    ),
    const Center(
      child: Text("Cart"),
    )
  ];

  updatePage(int page) {
    setState(() {
      _pageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: _pageIndex,
        selectedItemColor: GlobalVariable.selectedNavBarColor,
        unselectedItemColor: GlobalVariable.unSelectedNavBarColor,
        backgroundColor: GlobalVariable.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: (_pageIndex == 0)
                        ? GlobalVariable.selectedNavBarColor
                        : GlobalVariable.backgroundColor,
                    width: bottomBarBorderwidth,
                  ),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: " ",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: (_pageIndex == 1)
                        ? GlobalVariable.selectedNavBarColor
                        : GlobalVariable.backgroundColor,
                    width: bottomBarBorderwidth,
                  ),
                ),
              ),
              child: const Icon(Icons.person_outlined),
            ),
            label: " ",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: (_pageIndex == 2)
                        ? GlobalVariable.selectedNavBarColor
                        : GlobalVariable.backgroundColor,
                    width: bottomBarBorderwidth,
                  ),
                ),
              ),
              child: Badge(
                elevation: 0,
                badgeContent: const Text("2"),
                badgeColor: Colors.white,
                child: const Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ),
            label: " ",
          ),
        ],
      ),
    );
  }
}
