import '../data/model/articels_response/Articles.dart';
import '../result.dart';

abstract class ArticlesRepository
{
  Future<Result<List<Articles>>> getArticles(String sourceID);
}