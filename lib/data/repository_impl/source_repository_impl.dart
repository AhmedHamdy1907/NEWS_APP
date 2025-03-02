import 'package:news_apps/data/data_source_contract/sources_datasource.dart';
import 'package:news_apps/data/model/SourcesResponse/Sources.dart';
import 'package:news_apps/result.dart';

import '../../repository_contract/sources_repository_contract.dart';

class SourceRepositoryImpl extends SourcesRepository
{
  SourceDataSource sourceDataSource;
  SourceRepositoryImpl({required this.sourceDataSource});

  @override
  Future<Result<List<Source>>> getSources(String categoryId) async
  {
    Result<List<Source>> result=await sourceDataSource.getSources(categoryId);
    switch (result)
        {
      case Success<List<Source>>():
        return Success(data: result.data);
      case ServerError<List<Source>>():
        return ServerError(code: result.code, massage: result.massage);
      case Error<List<Source>>():
        return Error(exception: result.exception);
    }
  }

}