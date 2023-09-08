import '../models/article.dart';

abstract class DatabaseRepository {
  Future<List<Article>> getAllSavedArticles();
  Future<bool> saveArticle(Article article);
  Future<void> deleteArticle(Article article);
  Future<bool?> isExistingInDatabase(String title);
}