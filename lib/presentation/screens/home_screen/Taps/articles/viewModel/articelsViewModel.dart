import 'package:news_apps/base/base_state/base_state.dart';
import 'package:news_apps/base/base_viewModel/base_viewModel.dart';
import 'package:news_apps/data/model/articels_response/Articles.dart';
import '../../../../../../repository_contract/articles_repository_contract.dart';
import '../../../../../../result.dart';
class ArticlesViewModel extends BaseViewModel<List<Articles>>
{
  ArticlesRepository articlesRepository;
ArticlesViewModel({required this.articlesRepository}):super(state: LoadingState());

  void getArticlesBySourceId(String sourceId) async {
    state =LoadingState();
    notifyListeners();
    Result<List<Articles>>  result = await articlesRepository.getArticles(sourceId);
    switch (result) {
      case Success<List<Articles>>():
        emit(SuccessState(data: result.data));
      case ServerError<List<Articles>>():
        emit(ErrorState(serverError: result));
      case Error<List<Articles>>():
        emit(ErrorState(error: result));
    }
    notifyListeners(); // بعد ما خلصنا لازم نعمل تحديث للـ UI
  }
}

//  sealed class ArticelsState {}
// class ArtiSuccessState extends ArticelsState
// {
//   List<Articles>articles;
//   ArtiSuccessState({required this.articles});
// }
// class ArticlesInitialState extends ArticelsState {}
// class ArticlesLoadingState extends ArticelsState
// {
//   String? loadingMessage;
//   ArticlesLoadingState ({ this.loadingMessage});
// }
//
// class ArticelsErrorState extends ArticelsState {
//   ServerError? serverError;
//   Error? error;
//   ArticelsErrorState({this.error, this.serverError});
// }

// void getArticlesBySourceId (String sourceId)async
  // {
  // try
  //     {
  //       isLoading =true;
  //       notifyListeners();
  //       ArticelsResponse response =await ApiManger.getArticels(sourceId);
  //       isLoading=false;
  //       if(response.status=='ok')
  //       {
  //         articles=response.articles;
  //       }
  //       else
  //       {
  //         errorMessage=response.message;
  //         notifyListeners();
  //       }
  //       notifyListeners();
  //     }
  //     catch(e)
  //     {
  //       isLoading=false;
  //       errorMessage=e.toString();
  //       notifyListeners();
  //     }
  //
  //
  // }

