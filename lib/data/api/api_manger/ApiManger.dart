import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_apps/data/model/SourcesResponse/Sources.dart';
import 'package:news_apps/data/model/articels_response/Articles.dart';
import '../../../result.dart';
import '../../model/SourcesResponse/SourcesResponse.dart';
import '../../model/articels_response/ArticelsResponse.dart';

class ApiManger {
  static const String _baseUrl = "newsapi.org";
  static const String _sourcesEndPoint = "/v2/top-headlines/sources";
  static const String _articlesEndPoint = "/v2/everything";
  static const String _apiKey = "0e30f2884d9c4e93b28e4fcc61eb4e15";

   Future<Result<List<Source>>> getSources(String categoryId) async {
    try {
      Uri uri = Uri.http(_baseUrl, _sourcesEndPoint,
          {"apiKey": _apiKey, "category": categoryId});
      http.Response serverResponse = await http.get(uri);
      // نفذ الطلب
      // serverResponse.body
      // keda al data gat web2t fe al body 3la he2t string lazm a7welha ela json
      var json = jsonDecode(serverResponse.body);
      // jeonDecode bethawel mn string ela json
      //  jsonEncode bethawel ma json ela  string
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      if (sourcesResponse.status == "ok") {
        return Success(data: sourcesResponse.sources ?? []);
      } else {
        return ServerError(
            code: sourcesResponse.code ?? "",
            massage: sourcesResponse.message ?? "");
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

   Future<Result<List<Articles>>> getArticels(String sourceId) async {
    try {
      Uri url = Uri.http(_baseUrl, _articlesEndPoint, {
        "apiKey": _apiKey,
        "sources": sourceId,
      });
      http.Response serverRespons = await http.get(url);
      var json = jsonDecode(serverRespons.body);
      ArticelsResponse articelsResponse = ArticelsResponse.fromJson(json);
      if (articelsResponse.status == "ok") {
        return Success(data: articelsResponse.articles ?? []);
      } else {
        return ServerError(
            code: articelsResponse.code ?? "",
            massage: articelsResponse.message ?? "");
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

  static Future<ArticelsResponse> Searchresult(String text) async {
    Uri url =
        Uri.http(_baseUrl, _articlesEndPoint, {"apiKey": _apiKey, "q": text});
    http.Response serverRespons = await http.get(url);
    var json = jsonDecode(serverRespons.body);
    ArticelsResponse articelsResponse = ArticelsResponse.fromJson(json);
    return articelsResponse;
  }
}
//
// static Future<ArticelsResponse>getArticels(String? sourceId,String? searhText)
// {
// Uri url =Uri.http(_baseUrl,_articlesEndPoint,
//     {
//       "apiKey":_apiKey,
//       "sources":sourceId,
//       "q":searhText
//     }
// );
// http.get(url);
// }
