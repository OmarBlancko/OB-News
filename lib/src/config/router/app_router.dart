import '../../domain/models/article.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/home_screen.dart';
import '../../presentation/views/article_details_view.dart';
import '../../presentation/views/breaking_news_view.dart';
import '../../presentation/views/saved_articles_view.dart';
import '../../presentation/views/splash_screen.dart';
import '../../presentation/views/sports_news_view.dart';
import '../../presentation/views/temp_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return SplashScreen();
      },
    ),
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) {
        return HomeScreen();
      },
    ),
    GoRoute(
      path: BreakingNewsView.routeName,
      builder: (context, state) {
        return BreakingNewsView();
      },
    ),
    GoRoute(
      path: SportsNewsView.routeName,
      builder: (context, state) => SportsNewsView(),
    ),
    GoRoute(
      path: SavedArticlesView.routeName,
      builder: (context, state) => const SavedArticlesView(),
    ),
    GoRoute(
        path: ArticleDetailsView.routeName,
        builder: (context, state) {
          final article = state.extra! as Article;
          return ArticleDetailsView(article: article);
        }),
    // GoRoute(
    //     path: TempView.routeName,
    //     builder: (context, state) {
    //       final article = state.extra! as Article;
    //       return TempView();
    //     }),

    // GoRoute(
    //   path: 'breaking-news-view',
    //   builder: (context, state) => BreakingNewsView(),
    // )
  ]);
}
