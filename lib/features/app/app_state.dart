import 'package:additive_food/features/additive/additive_list_state.dart';
import 'package:built_value/built_value.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {

  AdditiveListState get additiveListState;

  factory AppState() {
    return _$AppState._(
        additiveListState: AdditiveListState()
    );
  }

  AppState._();
}