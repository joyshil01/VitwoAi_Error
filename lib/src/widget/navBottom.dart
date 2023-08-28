// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constans.dart';
import '../features/complete/presentation/Complete_Screen.dart';
import '../features/home/presentation/home_Page.dart';
import '../features/open/presentation/openScreen.dart';
import '../features/todo/presentation/todoScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool role = false;

  @override
  void initState() {
    userRole();
    super.initState();
  }

  void userRole() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      role = localStorage.getString('userType') == 'Approver'
          ? true
          : localStorage.getString('userType') == 'Viewer'
              ? true
              : false;
    });
  }

  int _selectedTab = 0;

  List _pages = [
    const OpenScreen(),
    const Home_Page(),
    const TodoScreen(),
    const Complete_Screen(),
  ];
  List _pages1 = [
    const Home_Page(),
    const TodoScreen(),
    const Complete_Screen(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: role == true ? _pages[_selectedTab] : _pages1[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: role == true
            ? _selectedTab == 0
                ? Colors.red
                : _selectedTab == 1
                    ? mainColor
                    : _selectedTab == 2
                        ? Colors.amber
                        : _selectedTab == 3
                            ? Colors.green
                            : Colors.white
            : _selectedTab == 0
                ? mainColor
                : _selectedTab == 1
                    ? Colors.amber
                    : _selectedTab == 2
                        ? Colors.green
                        : Colors.white,
        unselectedItemColor: Colors.grey,
        items: role == true
            ? const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.equal_circle),
                  label: "Open",
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.asterisk_circle),
                  label: "Assigned",
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.doc),
                  label: "Todo",
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.checkmark_alt_circle),
                  label: "Done",
                ),
              ]
            : const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.asterisk_circle),
                  label: "Assigned",
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.doc),
                  label: "Todo",
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.checkmark_alt_circle),
                  label: "Done",
                ),
              ],
      ),
    );
  }
}
