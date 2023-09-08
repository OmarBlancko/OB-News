import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import '../widgets/app_header.dart';
import '../../domain/models/article.dart';
import '../../utils/extensions/scroll_controller.dart';
import '../cubits/remote_articles/remote_articles_cubit.dart';
import '../widgets/sports_news.dart';
import 'article_details_view.dart';

// ignore: must_be_immutable
class SportsNewsView extends HookWidget {
  final sportsKey = GlobalKey();
  static const routeName = '/sportsNewsView';
  static List<Article> sportsFetchedData = [];

  SportsNewsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final remoteArticleCubit = BlocProvider.of<RemoteArticlesCubit>(context);
    final scrollController = useScrollController();
    useEffect(() {
      scrollController.onScrollEndsListener(callback: () async {
        await remoteArticleCubit.searchForNewsArticles(searchWord: 'football');
      });
      return;
    }, const []);
    return Scaffold(
      key: sportsKey,
      body: Column(
        children: [
          AppHeader('OB Sports News'),
          const Icon(Ionicons.football),
          RefreshIndicator(
            onRefresh: () async {
              await context
                  .read<RemoteArticlesCubit>()
                  .searchForNewsArticles(searchWord: 'football');
            },
            child: SizedBox(
              height: 560.5.h,
              child: sportsFetchedData.isEmpty
                  ? BlocBuilder<RemoteArticlesCubit, RemoteArticlesState>(
                      bloc: remoteArticleCubit
                        ..searchForNewsArticles(searchWord: 'football'),
                      builder: (_, state) {
                        // print(fetchedData.length);
                        if (state is RemoteArticlesLoading) {
                          return const Center(
                              child: CupertinoActivityIndicator());
                        } else if (state is RemoteArticlesFailed) {
                          if (kDebugMode) {
                            print(state.error);
                          }
                          return Center(
                            child: IconButton(
                              icon: const Icon(
                                Icons.refresh,
                              ),
                              onPressed: () async {
                                // print('pressed');
                                await remoteArticleCubit
                                    .getBreakingNewsArticles()
                                    // ignore: avoid_print
                                    .then((value) => print('done'));
                              },
                            ),
                          );
                        } else if (state is RemoteArticlesSuccess) {
                          sportsFetchedData = state.articles;
                          return SportsNewsBuilder(
                            scrollController: scrollController,
                            articles: state.articles,
                            noMoreData: state.noMoreData,
                            onArticlePressed: (article) {
                              context.push(ArticleDetailsView.routeName,
                                  extra: article);
                            },
                          );

                        } else {
                          return const Center(
                            child: Text('something goes wrong'),
                          );
                        }

                      },
                    )
                  : SportsNewsBuilder(
                      scrollController: scrollController,
                      articles: sportsFetchedData,
                      noMoreData: false,
                      onArticlePressed: (article) {
                        context.push(ArticleDetailsView.routeName,
                            extra: article);
                      }),
            ),
          ),
        ],
      ),
    );
  }
}

seeDetails(BuildContext context) {}
