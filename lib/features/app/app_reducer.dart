import 'package:additive_food/features/additive/list/additive_list_reducer.dart';
import 'package:additive_food/features/app/app_state.dart';
import 'package:additive_food/features/profle/profile_reducer.dart';

AppState appReducer(AppState state, action) {
  print(action);

  return state.rebuild((b) => b
    ..profileState.replace(profileReducer(state.profileState, action))
    ..additiveListState
        .replace(additiveListReducer(state.additiveListState, action)));
}
