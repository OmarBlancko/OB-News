import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import '../../domain/models/article.dart';
import '../cubits/local_articles/local_articles_cubit.dart';
import '../widgets/app_header.dart';
import '../widgets/article_widget.dart';
import 'article_details_view.dart';

class SavedArticlesView extends HookWidget {
  static const routeName = '/savedArticlesView';
  const SavedArticlesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localArticleCubit = BlocProvider.of<LocalArticlesCubit>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => context.pop(),
              child: const Icon(Ionicons.chevron_back, color: Colors.black),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 100),
              child: AppHeader('Saved Articles')),
          SizedBox(height: 10.h,),
          Container(
            height: 540,
            child: BlocBuilder<LocalArticlesCubit, LocalArticlesState>(
              bloc:localArticleCubit..getAllSavedArticles() ,
              builder: (_, state) {
                if (state is LocalArticlesLoading) {
                  return const Center(child: CupertinoActivityIndicator());
                } else if (state is LocalArticlesSuccess) {
                  return _buildArticlesList(state.articles);
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticlesList(List<Article> articles) {
    if (articles.isEmpty) {
      return const Center(
          child: Text(
        'NO SAVED ARTICLES',
        style: TextStyle(color: Colors.black),
      ));
    }

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleWidget(
          article: articles[index],
          isRemovable: true,
          onRemove: (article) => BlocProvider.of<LocalArticlesCubit>(context)
              .removeArticle(article: article),
          onArticlePressed: (article) =>
              context.push(ArticleDetailsView.routeName, extra: article),
        );
      },
    );
  }
}
