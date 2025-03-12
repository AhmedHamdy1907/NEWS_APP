
import '../../result.dart';
import '../entity/Articles_entity.dart';
abstract class ArticlesRepository
{
  Future<Result<List<ArticlesEntity>>> getArticles(String sourceID);
}