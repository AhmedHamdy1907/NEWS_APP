import 'package:flutter/material.dart';
import 'package:news_apps/domain/entity/Articles_entity.dart';

import '../../../../../data/api/api_manger/ApiManger.dart';
import '../../../../../data/model/articels_response/Articles.dart';
import '../../Taps/articles/widget/articleWidget.dart';
// typedef MyListArticles = void Function(List<Articles>?articles);
class SearchResult extends StatelessWidget {
  String text;
  // MyListArticles articlesList;
   SearchResult({super.key,required this.text});
  @override
  Widget build(BuildContext context) {
    return   FutureBuilder(
        future: ApiManger.Searchresult(text),
        builder: (context, snapshot)
        {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data?.status == "error" || snapshot.hasError) {
            return Text(
                snapshot.data?.message ?? "Check Enternet Connection");
// كده بقوله لو وصلت لي ال server  بس ال dat اللي جايه غلط اعرض ال massage
// طيب لو ال massage بي null معني ذللك انه موصلش لي ال server فبقوله اعرض سبب الايرور اللي موجود في ال snapshot
          }
          //TODO
          List<Articles> articles = snapshot.data!.articles!;
          List<ArticlesEntity> articlesEn= articles.map((e)=>e.toArticlesEntity()).toList();
          return Expanded(
            child: ListView.builder(itemBuilder: (context, index) =>
                ArticleWidget(article: articlesEn[index]),
              itemCount: articles.length,),
          );
        });
  }
}


