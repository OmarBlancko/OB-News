import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import '../../domain/models/article.dart';
import '../../utils/constants/app_strings.dart';
import 'image_Placeholder.dart';

class SportsNewsBuilder extends StatelessWidget {
  late final ScrollController scrollController;
  late final List<Article> articles;
  late final bool noMoreData;
  final void Function(Article article)? onRemove;
  final void Function(Article article)? onArticlePressed;
  SportsNewsBuilder(
      {super.key, required this.scrollController,
      required this.articles,
      required this.noMoreData,
      this.onArticlePressed,
      this.onRemove}) {
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final dateString = DateFormat("yyyy-MM-dd   HH:MM")
            .format(DateTime.parse(articles[index].publishedAt ?? ""));

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (onArticlePressed != null) {
              onArticlePressed?.call(articles[index]);
            }
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: FadeInImage(
                    fadeInCurve: Curves.fastOutSlowIn,
                    imageErrorBuilder: (_, __, ___) =>
                        const CustomImagePlaceHolder(),
                    placeholder: const AssetImage(newsPlaceholderImagePath),
                    image: NetworkImage(articles[index].urlToImage ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
                // SizedBox(height: 7.h,),
                Container(
                  padding: EdgeInsets.all(5.h),
                  child: Text(
                    articles[index].title ?? "",
                    style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Butler',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                if (articles[index].source!.name!.isNotEmpty)
                  Row(
                    children: [
                      SizedBox(
                        width: 8.w,
                      ),
                      Icon(
                        Ionicons.logo_web_component,
                        size: 13.w,
                      ),
                      const Text('  '),
                      Text(articles[index].source!.name ?? ""),
                    ],
                  ),
                Container(
                  padding: EdgeInsets.all(10.w),
                  child: Text(articles[index].description ?? ""),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Ionicons.time_outline, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        dateString,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: articles.length,
    );
  }
}
