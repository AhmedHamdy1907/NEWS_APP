import 'package:news_apps/data/api/api_manger/ApiManger.dart';
import 'package:news_apps/data/data_sourcre_impl/articles_datasource_impl.dart';
import 'package:news_apps/data/repository_impl/articles_repository_impl.dart';

ArticlesRepositoryImpl getArticlesRepository()
{
  return ArticlesRepositoryImpl(articlesDataSource: getArticlesDataSource());
}
ArticlesApiDataSourceImpl getArticlesDataSource()
{
  return ArticlesApiDataSourceImpl(apiManger: getApiManger());
}
ApiManger getApiManger()
{
  return ApiManger();
}