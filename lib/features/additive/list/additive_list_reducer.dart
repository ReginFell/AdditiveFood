import 'action/additive_list_actions.dart';
import 'state/additive_list_state.dart';
import 'package:redux/redux.dart';

Reducer<AdditiveListState> additiveListReducer = combineReducers([
  TypedReducer<AdditiveListState, LoadingAction>(loading),
  TypedReducer<AdditiveListState, AdditivesLoadedAction>(loaded),
  TypedReducer<AdditiveListState, AdditiveLoadingError>(error),
]);

AdditiveListState loading(
    AdditiveListState additiveListState, LoadingAction action) {
  return additiveListState.rebuild((b) => b
    ..additives = List()
    ..isLoading = true
    ..error = null);
}

AdditiveListState loaded(
    AdditiveListState additiveListState, AdditivesLoadedAction action) {
  return additiveListState.rebuild((b) => b
    ..additives = action.additives
    ..error = null
    ..isLoading = false);
}

AdditiveListState error(
    AdditiveListState additiveListState, AdditiveLoadingError action) {
  return additiveListState.rebuild((b) => b
    ..additives = List()
    ..error = action.error
    ..isLoading = false);
}
