import 'package:additive_food/features/profle/profile_actions.dart';
import 'package:additive_food/features/profle/profile_state.dart';
import 'package:redux/redux.dart';

Reducer<ProfileState> profileReducer = combineReducers([
  TypedReducer<ProfileState, StartLoadingAction>(loading),
  TypedReducer<ProfileState, ProfileLoadedAction>(profileLoaded),
]);

ProfileState loading(ProfileState profileState, StartLoadingAction action) {
  return profileState.rebuild((b) => b..isLoading = true);
}

ProfileState profileLoaded(
    ProfileState profileState, ProfileLoadedAction action) {
  return profileState.rebuild((b) => b
    ..isLoading = false
    ..user = action.user);
}
