import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/models/article.dart';
import '../../utils/extensions/scroll_controller.dart';
import '../cubits/remote_articles/remote_articles_cubit.dart';
import '../widgets/app_header.dart';
import '../widgets/article_builder.dart';

// ignore: must_be_immutable
class BreakingNewsView extends HookWidget {
  final breakingNewsKey = GlobalKey();

  static const routeName = '/breakingNewsView';
  static List<Article> breakingNewsData = [];

  BreakingNewsView({super.key});
  @override
  Widget build(BuildContext context) {
    final remoteArticleCubit = BlocProvider.of<RemoteArticlesCubit>(context);
    final scrollController = useScrollController();
    useOnAppLifecycleStateChange(
        (previous, current) => {remoteArticleCubit.getBreakingNewsArticles()});
    useEffect(() {
      scrollController.onScrollEndsListener(callback: () {
        remoteArticleCubit.getBreakingNewsArticles();
      });
      // print(ourData.isEmpty);
      return null;
    }, const []);
    return Scaffold(
      key: breakingNewsKey,
      body: Column(
        children: [
          AppHeader('OB News'),
          SizedBox(
            height: 5.h,
          ),
          RefreshIndicator(
            onRefresh: () async {
              if (breakingNewsData.isEmpty) {
                await context
                    .read<RemoteArticlesCubit>()
                    .getBreakingNewsArticles();
              }
            },
            child: SizedBox(
              height: 560.5.h,

              child: breakingNewsData.isEmpty
                  ? BlocBuilder<RemoteArticlesCubit, RemoteArticlesState>(
                  bloc: remoteArticleCubit,
                  buildWhen: (previous, current) {
                    return true;
                  },
                  builder: (_, state) {
                    if (state is RemoteArticlesLoading) {
                      return const Center(
                          child: CupertinoActivityIndicator());
                    } else if (state is RemoteArticlesFailed) {
                      return Center(
                        child: IconButton(
                          icon: const Icon(
                            Icons.refresh,
                          ),
                          onPressed: () async {
                            await context
                                .read<RemoteArticlesCubit>()
                                .getBreakingNewsArticles();
                          },
                        ),
                      );
                    } else if (state is RemoteArticlesSuccess) {
                      // print('here');
                      breakingNewsData = state.articles;
                      return buildArticles(scrollController,
                          breakingNewsData, state.noMoreData);
                    } else {
                      return const Center(
                        child: Text('something goes wrong'),
                      );
                    }
                    // switch(state.runtimeType) {
                    //
                    //   case  RemoteArticlesLoading():
                    //     return const Center(child: CupertinoActivityIndicator());
                    //   case RemoteArticlesFailed():
                    //     return const Center(child: Icon(Icons.refresh),);
                    //   case RemoteArticlesSuccess():
                    //     return Center();
                    //   default:
                    //     return SizedBox();
                  })
                  : buildArticles(scrollController, breakingNewsData, false),
            ),
          ),
        ],
      ),
    );
  }
}
