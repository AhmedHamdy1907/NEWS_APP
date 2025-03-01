import 'package:news_apps/data/model/articels_response/Articles.dart';
import 'package:news_apps/result.dart';

abstract class ArticlesDataSource
{
  Future<Result<List<Articles>>>getArticles(String sourceId);
}