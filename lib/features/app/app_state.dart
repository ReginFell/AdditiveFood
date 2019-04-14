import 'package:additive_food/features/additive/list/additive_list_state.dart';
import 'package:additive_food/features/profle/profile_state.dart';
import 'package:built_value/built_value.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  AdditiveListState get additiveListState;
  ProfileState get profileState;

  factory AppState() {
    return _$AppState._(
        additiveListState: AdditiveListState(), profileState: ProfileState());
  }

  AppState._();
}
