import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../domain/models/responses/breaking_news_response.dart';
import '../../../utils/constants/app_strings.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<BreakingNewsResponse>> getBreakingNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
    @Query("page") int? page,
    @Query("pageSize") int? pageSize,
  });
  @GET('/everything')
  Future<HttpResponse<BreakingNewsResponse>> searchForNewsArticle({
    @Query("apiKey") String? apiKey,
    @Query("q") String? categorySearchWord , // for category search
    @Query('sortBy') String? sortBy,
    @Query("page") int? page,
    @Query("pageSize") int? pageSize,
    @Query("language") String? language,
  });
}
