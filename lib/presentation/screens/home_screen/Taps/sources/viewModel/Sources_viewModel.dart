import 'package:news_apps/base/base_viewModel/base_viewModel.dart';
import 'package:news_apps/data/api/api_manger/ApiManger.dart';
import 'package:news_apps/data/model/SourcesResponse/Sources.dart';
import 'package:news_apps/result.dart';
import '../../../../../../base/base_state/base_state.dart';
import '../../../../../../repository_contract/sources_repository_contract.dart';
class SourcesViewModel extends BaseViewModel {
  SourcesRepository sourcesRepository;

  SourcesViewModel({required this.sourcesRepository}):super(state: LoadingState());
  void getSourcesByCategoryId(String categoryId) async {
    notifyListeners();
    Result<List<Source>> result = await sourcesRepository.getSources(categoryId);
    switch (result) {
      case Success<List<Source>>():
        emit(SuccessState(data: result.data));
      case ServerError<List<Source>>():
        emit(ErrorState(serverError: result));
      case Error<List<Source>>():
        emit(ErrorState(error: result));
    }
  }
// void getSourcesByCategoryId(String categoryId) async {
//   try
//       {
//         isLoading=true;
//         notifyListeners(); //  كده لسه مجبش الداتا
//         serverResponse  response= await ApiManger.getSources(categoryId);// بيجيب الداتا
//         isLoading=false; // كده الداتا جت
//         if (response.status=="ok")
//         {
//           sources=response.sources;
//         }
//         else
//         {
//           errorMassage=response.message;
//         }
//         notifyListeners();
//       }
//       catch(e)
//   {
//     isLoading=false;
//     errorMassage=e.toString();
//     notifyListeners();
//   }
// }
}

// sealed class SourcesState {}
//
//
//
// class SourcesSuccessState extends SourcesState {
//   List<Source> source;
//   SourcesSuccessState({required this.source});
// }
//
//
// class SourcesLoadingState extends SourcesState {
//   String? loadingMessage;
//   SourcesLoadingState({this.loadingMessage});
// }
//
//
// class SourcesErrorState extends SourcesState {
//   ServerError? serverError;
//   Error? error;
//
//   SourcesErrorState({this.error, this.serverError});
// }
