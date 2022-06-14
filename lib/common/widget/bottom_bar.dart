import 'package:flutter/material.dart';
import 'package:shopping_app/constants/global_variable.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        selectedItemColor: GlobalVariable.selectedNavBarColor,
        unselectedItemColor: GlobalVariable.unSelectedNavBarColor,
        backgroundColor: GlobalVariable.backgroundColor,
        iconSize: 28,
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
              child:const Icon(Icons.home_outlined),
            ),
            label: " ",
          ), 
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
          )
        ],
      ),
      
    );
  }
}
