import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/article.dart';
import '../views/article_details_view.dart';
import 'article_widget.dart';

Widget buildArticles(ScrollController scrollController, List<Article> articles,
    bool noMoreData) {
  return CustomScrollView(
    controller: scrollController,
    slivers: [
      SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) => ArticleWidget(
                  article: articles[index],
                  onArticlePressed: (article) => context
                      .push(ArticleDetailsView.routeName, extra: article),
                ),
            childCount: articles.length),
      ),
      if (!noMoreData)
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 14, bottom: 32),
            child: CupertinoActivityIndicator(),
          ),
        ),
    ],
  );
}