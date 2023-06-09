import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../constans.dart';
import '../features/complete/presentation/Complete_Screen.dart';
import '../features/home/presentation/home_Page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: [
          Home_Page(),
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
        icon: const Badge(
          label: Text('20'),
          smallSize: 4,
          isLabelVisible: true,
          child: Icon(CupertinoIcons.home),
        ),
        title: ("Home"),
        textStyle: Theme.of(context).textTheme.bodyMedium,
        activeColorPrimary: mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.checkmark_alt_circle),
        title: ("Complete"),
        textStyle: Theme.of(context).textTheme.bodyMedium,
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
