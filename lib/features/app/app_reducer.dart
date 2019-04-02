import 'package:additive_food/features/additive/list/additive_list_reducer.dart';
import 'package:additive_food/features/app/app_state.dart';

AppState appReducer(AppState state, action) {
  print(action);

  return state.rebuild((b) => b
    ..additiveListState
        .replace(additiveListReducer(state.additiveListState, action)));
}
