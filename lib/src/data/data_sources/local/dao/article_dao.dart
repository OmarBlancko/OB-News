import 'package:floor/floor.dart';
import '../../../../utils/constants/app_strings.dart';
import '../../../../domain/models/article.dart';

@dao
abstract class ArticleDao {
  @Query('SELECT * FROM $articlesTableName')
  Future<List<Article>> getAllSavedArticles () ;
  @Insert(onConflict:OnConflictStrategy.replace)
  Future<void> insertArticle(Article article);
  @delete
  Future<void> deleteArticle(Article article);
  @Query('SELECT * FROM $articlesTableName where title = :title')
  Future<bool?> isExistingInDatabase(String title);

}