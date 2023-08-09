import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../constans.dart';
import '../features/complete/presentation/Complete_Screen.dart';
import '../features/home/presentation/home_Page.dart';
import '../features/open/presentation/openScreen.dart';
import '../features/todo/presentation/todoScreen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: const [
          OpenScreen(),
          Home_Page(),
          TodoScreen(),
          Complete_Screen(),
        ],
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style1,
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.equal_circle),
        title: ("Open"),
        textStyle: Theme.of(context).textTheme.bodyMedium,
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.asterisk_circle),
        title: ("Assigned"),
        textStyle: Theme.of(context).textTheme.bodyMedium,
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.doc),
        title: ("Todo"),
        textStyle: Theme.of(context).textTheme.bodyMedium,
        activeColorPrimary: Colors.amber,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.checkmark_alt_circle),
        title: ("Done"),
        textStyle: Theme.of(context).textTheme.bodyMedium,
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
