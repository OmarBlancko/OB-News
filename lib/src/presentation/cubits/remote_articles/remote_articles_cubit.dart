import 'package:equatable/equatable.dart';

import '../../../domain/models/article.dart';
import '../../../domain/models/requests/breaking_news_request.dart';
import '../../../domain/repositories/api_repository.dart';
import '../../../utils/constants/app_nums.dart';
import '../../../utils/resources/data_state.dart';
import '../../views/sports_news_view.dart';
import '../base/base_cubit.dart';

part 'remote_articles_state.dart';

class RemoteArticlesCubit
    extends BaseCubit<RemoteArticlesState, List<Article>> {
  final ApiRepository _apiRepository;
  List<Article> breakingNewsArticles = [];
  List<Article> sportsArticles = [];

  RemoteArticlesCubit(this._apiRepository) : super(RemoteArticlesLoading(), []);

  int _page = 1;

  Future<void> getBreakingNewsArticles() async {
    _checkAvailability();

    var response;

    await run(() async {
      response = await _apiRepository.getBreakingNewsArticles(
          request: BreakingNewsRequest(page: _page,));
    });
    if (response is DataSuccess) {
      sportsArticles = response.data!.articles;
      sportsArticles.removeWhere((element)
      =>  element.title!.contains('Removed')
      );
      final noMoreData = sportsArticles.length < defaultPageSize;
      data.addAll(sportsArticles);
      _page++;
      emit(RemoteArticlesSuccess(articles: sportsArticles, noMoreData: noMoreData));
    } else if (response is DataFailed) {
      emit(RemoteArticlesFailed(error: response!.error));
    }
  }

  Future<void> searchForNewsArticles({String? searchWord}) async {
    // print(isBusy);
    _checkAvailability();
    var response;

    await run(() async {
      response = await _apiRepository
          .searchForNewsArticles(
              request: BreakingNewsRequest(page: _page, category: searchWord!))
          .then((value) {
        sportsArticles = value.data!.articles;
        return value;
      });
    });
    if (response is DataSuccess) {
      print('success');
      final noMoreData = sportsArticles.length < defaultPageSize;
      data.addAll(sportsArticles);
      _page++;
      emit(RemoteArticlesSuccess(
          articles: sportsArticles, noMoreData: noMoreData));
      SportsNewsView.sportsFetchedData = sportsArticles;
    } else if (response is DataFailed) {
      emit(RemoteArticlesFailed(error: response!.error));
    }
  }

  void _checkAvailability() {
    // print(isBusy);
    if (isBusy) {
      return;
    }
  }
}
