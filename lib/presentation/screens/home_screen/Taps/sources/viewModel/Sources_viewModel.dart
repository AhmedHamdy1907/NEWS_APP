
import 'package:news_apps/domain/entity/Source_entity.dart';
import 'package:news_apps/domain/use-Case/source_usecase.dart';
import '../../../../../../base/base_state/base_state.dart';
import '../../../../../../base/base_viewModel/base_viewModel.dart';
import '../../../../../../domain/repository_contract/sources_repository_contract.dart';
import '../../../../../../result.dart';

class SourcesViewModel extends BaseViewModel<List<SourceEntity>> {
  GetSourceUseCse sourceUseCse;

  SourcesViewModel({required this.sourceUseCse}):super(state: LoadingState());
  void getSourcesByCategoryId(String categoryId) async {
    notifyListeners();
    Result<List<SourceEntity>> result = await sourceUseCse.execute(categoryId);
    switch (result) {
      case Success<List<SourceEntity>>():
        emit(SuccessState(data:result.data ));
      case ServerError<List<SourceEntity>>():
        emit(ErrorState(serverError: result));
      case Error<List<SourceEntity>>():
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


// class SourcesViweModel extends ChangeNotifier
// {
//   SourecesStates state = SourcesLoadingState();
//   void getSourcesByCategoryId(String categoryId) async
//   {
//     var result = await ApiManger.getSources(categoryId);
//     switch(result)
//         {
//
//       case Success<List<Source>>():
//         SourcesSuccessState(source: result.data);
//       case ServerError<List<Source>>():
//         SourcesErrorState(serverError: result);
//       case Error<List<Source>>():
//         SourcesErrorState(error: result);
//         }
//     notifyListeners();
//
//   }
// }













//
//
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
