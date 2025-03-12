import 'package:flutter/cupertino.dart';
import 'package:news_apps/data/api/api_manger/ApiManger.dart';
import 'package:news_apps/data/data_sourcre_impl/articles_datasource_impl.dart';
import 'package:news_apps/data/data_sourcre_impl/sources_datasource_impl.dart';
import 'package:news_apps/data/repository_impl/articles_repository_impl.dart';
import 'package:news_apps/data/repository_impl/source_repository_impl.dart';
import 'package:news_apps/domain/use-Case/articles_usecase.dart';
import 'package:news_apps/domain/use-Case/source_usecase.dart';


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
GetArticlesUseCase getArticlesUseCase()
{
  return GetArticlesUseCase(repository:getArticlesRepository() );
}



////////////////////////////////////////
getSourceRepository()
{
 return SourceRepositoryImpl(sourceDataSource: getSourceDataSource());
}

getSourceDataSource()
{
  return SourceDataSourceImpl(apiManger: ApiManger());
}

GetSourceUseCse getSourceUseCase()
{
  return GetSourceUseCse(sourcesRepository: getSourceRepository());
}
