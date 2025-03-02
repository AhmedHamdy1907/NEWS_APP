import 'package:news_apps/data/api/api_manger/ApiManger.dart';
import 'package:news_apps/data/data_source_contract/sources_datasource.dart';
import 'package:news_apps/data/model/SourcesResponse/Sources.dart';
import 'package:news_apps/result.dart';

class SourceDataSourceImpl extends SourceDataSource
{
  ApiManger apiManger;
  SourceDataSourceImpl({required this.apiManger});
  @override
  Future<Result<List<Source>>> getSources(String categoryId)async
  {
   Result<List<Source>> result= await apiManger.getSources(categoryId);
   switch(result)
   {
     case Success<List<Source>>():
       return Success(data: result.data);
     case ServerError<List<Source>>():
       return ServerError(code: result.code, massage: result.massage);
     case Error<List<Source>>():
       return  Error(exception: result.exception);
   }
  }

}