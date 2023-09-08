import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../config/app_themes.dart';
import '../views/breaking_news_view.dart';
import '../views/saved_articles_view.dart';
import '../views/sports_news_view.dart';

class CustomBottomBar extends HookWidget {
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(
            CupertinoIcons.news,
            color: Theme.of(useContext()).colorScheme.secondary,
          ),
          title: ("World news"),
          activeColorPrimary: Color(0xff1e1eff),
          inactiveColorPrimary: CupertinoColors.systemGrey,
          textStyle: navigationItemTextStyle),
      PersistentBottomNavBarItem(
          icon: Icon(
            Ionicons.football,
            color: Theme.of(useContext()).colorScheme.secondary,
          ),
          title: ("Sports news"),
          activeColorPrimary: Color(0xff1e1eff),
          inactiveColorPrimary: CupertinoColors.systemGrey,
          textStyle: navigationItemTextStyle),
      PersistentBottomNavBarItem(
          icon: Icon(
            Ionicons.bookmark_outline,
            color: Theme.of(useContext()).colorScheme.secondary,
          ),
          title: 'Saved',
          activeColorPrimary:Color(0xff1e1eff),
          inactiveColorPrimary: CupertinoColors.systemGrey,
          textStyle: navigationItemTextStyle)
    ];
  }

  List<Widget> _buildScreens() {
    return [
      BreakingNewsView(),
      SportsNewsView(
        // searchWord: 'football',
      ),
      const SavedArticlesView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;
    var index = useState<int>(0);
    controller = PersistentTabController(initialIndex: index.value);
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      controller: controller,
      items: _navBarsItems(),
      resizeToAvoidBottomInset: true,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style9,
    );
  }
}
