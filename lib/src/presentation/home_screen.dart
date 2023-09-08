import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'views/breaking_news_view.dart';
import 'views/saved_articles_view.dart';
import 'views/sports_news_view.dart';
import 'widgets/custom_navigation_bar.dart';

class HomeScreen extends HookWidget {
  static const routeName='/homeScreen';
  const HomeScreen({super.key});
  static final List<Widget> _widgetOptions = [
    BreakingNewsView(),
    SportsNewsView(),
    const SavedArticlesView(),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState<int>(0);

    return Scaffold(
      bottomNavigationBar:CustomBottomBar() ,
      body: _widgetOptions.elementAt(selectedIndex.value.toInt()),
    );
  }
}
