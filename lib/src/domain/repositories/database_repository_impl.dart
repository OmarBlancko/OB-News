
import '../../data/data_sources/local/app_database.dart';
import '../models/article.dart';
import 'database_repository.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;
  DatabaseRepositoryImpl(this._appDatabase);
  @override
  Future<List<Article>> getAllSavedArticles() {
    return _appDatabase.articleDao.getAllSavedArticles();
  }

  @override
  Future<bool> saveArticle(Article article) async{
    bool isExisting = await _appDatabase.articleDao.isExistingInDatabase(article.title ?? "") ?? false;
    if (isExisting)
      {
        return true ;
      }
    else {

       _appDatabase.articleDao.insertArticle(article);
       return false;
    }
  }

  @override
  Future<void> deleteArticle(Article article) {
    return _appDatabase.articleDao.deleteArticle(article);
  }
  @override
  Future<bool?> isExistingInDatabase(String title) {
    return _appDatabase.articleDao.isExistingInDatabase(title);
  }
}
