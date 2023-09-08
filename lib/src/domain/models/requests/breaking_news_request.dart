import '../../../utils/constants/app_strings.dart';
import '../../../utils/constants/app_nums.dart';

class BreakingNewsRequest {
  final String apiKey;
  final String country;
  final String language;
  final String category;
  final int page;
  final int pageSize;
  BreakingNewsRequest({
    this.apiKey = defaultApiKey,
    this.country = 'us',
    this.category = 'general',
    this.language = 'en',
    this.page = 1,
    this.pageSize = defaultPageSize,
  });
}
