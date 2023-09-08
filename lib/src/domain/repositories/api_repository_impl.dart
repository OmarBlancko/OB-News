import '../../data/base/base_api_repostiory.dart';
import '../../data/data_sources/remote/news_api_service.dart';
import '../../utils/resources/data_state.dart';
import '../models/requests/breaking_news_request.dart';
import '../models/responses/breaking_news_response.dart';
import 'api_repository.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final NewsApiService _newsApiService;
  ApiRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<BreakingNewsResponse>> getBreakingNewsArticles(
      {required BreakingNewsRequest request}) {
    return getStateOf(
      request: () => _newsApiService.getBreakingNewsArticles(
          apiKey: request.apiKey,
          category: request.category,
          country: request.country,
          page: request.page,
          pageSize: request.pageSize),
    );
  }

  @override
  Future<DataState<BreakingNewsResponse>> searchForNewsArticles(
      {required BreakingNewsRequest request}) {
    return getStateOf(
      request: () => _newsApiService.searchForNewsArticle(
          apiKey: request.apiKey,
          categorySearchWord: request.category,
          page: request.page,
          pageSize: request.pageSize,
          language: request.language),
    );
  }
}
