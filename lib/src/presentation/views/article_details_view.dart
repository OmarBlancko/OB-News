import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:oktoast/oktoast.dart';
import '../../domain/models/article.dart';
import '../cubits/local_articles/local_articles_cubit.dart';
import '../widgets/image_Placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleDetailsView extends HookWidget {
  static const routeName = '/articleDetailsView';
  final Article article;

  const ArticleDetailsView({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localArticlesCubit = BlocProvider.of<LocalArticlesCubit>(context);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.pop(),
          child: const Icon(Ionicons.chevron_back, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildArticleTitleAndDate(),
            _buildArticleImage(),
            _buildArticleDescription(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final isExist= await localArticlesCubit.saveArticle(article: article);
          isExist ?
          showToast('You saved article already',margin: const EdgeInsets.all(100)) :
          showToast('Article Saved Successfully',margin:const EdgeInsets.all(100));
        },
        child: const Icon(Ionicons.bookmark, color: Colors.white),
      ),
    );
  }

  Widget _buildArticleTitleAndDate() {
    final publishDate = DateFormat("yyyy-MM-dd   HH:MM").format(DateTime.parse(article.publishedAt??""));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article.title ?? '',
            style: const TextStyle(
              fontFamily: 'Butler',
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
           SizedBox(height: 14.h),
          Row(
            children: [
               const Icon(Ionicons.time_outline, size: 16),
               SizedBox(width: 4.w),
              Text(
                publishDate,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildArticleImage() {
    return Container(
      width: double.maxFinite,
      height: 250.h,
      margin:  EdgeInsets.only(top: 14.h),
      child: Image.network(
        article.urlToImage ?? '',
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        errorBuilder: (_, __, ___) => const CustomImagePlaceHolder(),
      ),
    );
  }

  Widget _buildArticleDescription() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.h),
      child: Text(
        '${article.description}\n\n${article.content}',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
