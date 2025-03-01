import 'package:flutter/cupertino.dart';
import 'package:news_apps/base/base_state/base_state.dart';

class BaseViewModel<T> extends ChangeNotifier
{
 BaseState <T> state =LoadingState();
 BaseViewModel ( {required this.state});
 void emit (BaseState<T> newState)
 {
   state=newState;
   notifyListeners();
 }

}