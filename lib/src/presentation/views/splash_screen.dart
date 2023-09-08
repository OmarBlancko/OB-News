import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubits/remote_articles/remote_articles_cubit.dart';
import '../home_screen.dart';
import 'breaking_news_view.dart';
import 'sports_news_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _navigateToHome();
  }

  _loadInitialData() async {
    final remoteArticleCubit = BlocProvider.of<RemoteArticlesCubit>(context);
    await remoteArticleCubit.getBreakingNewsArticles().then((value) async {
      setState(() {
        _turns += 2;
      });
      await Future.delayed(const Duration(milliseconds: 10));
      BreakingNewsView.breakingNewsData = remoteArticleCubit.breakingNewsArticles;

    });
    await remoteArticleCubit
        .searchForNewsArticles(searchWord: 'football')
        .then((value) {
      SportsNewsView.sportsFetchedData = remoteArticleCubit.sportsArticles;
      // print('done');
    });
    // print(SportsNewsView.fetchedData.length);
  }

  _navigateToHome() async {

    await Future.delayed(const Duration(seconds: 4)).then((value) {
      context.push(HomeScreen.routeName);
    });
  }

  double _turns = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff102039),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: AnimatedRotation(
          turns: _turns,
          duration: const Duration(seconds: 3),
          child: Image.asset('assets/images/logo.png',),

        ),
      ),
    );
  }
}
