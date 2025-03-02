import '../../result.dart';
import '../model/SourcesResponse/Sources.dart';

abstract class SourceDataSource
{
  Future<Result<List<Source>>> getSources(String categoryId) ;

}