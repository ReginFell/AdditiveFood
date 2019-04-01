import 'package:additive_food/features/additive/additive_list_actions.dart';
import 'package:additive_food/features/additive/additive_list_state.dart';
import 'package:redux/redux.dart';

Reducer<AdditiveListState> additiveListReducer = combineReducers([
  TypedReducer<AdditiveListState, LoadingAction>(loading),
  TypedReducer<AdditiveListState, AdditivesLoadedAction>(loaded),
]);

AdditiveListState loading(
    AdditiveListState additiveListState, LoadingAction action) {
  return additiveListState.rebuild((b) => b..isLoading = true);
}

AdditiveListState loaded(
    AdditiveListState additiveListState, AdditivesLoadedAction action) {
  return additiveListState.rebuild((b) => b
    ..additives = action.additives
    ..isLoading = false);
}
