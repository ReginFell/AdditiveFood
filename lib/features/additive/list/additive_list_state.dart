import 'package:additive_food/data/adittive/model/additive.dart';
import 'package:built_value/built_value.dart';

part 'package:additive_food/features/additive/list/additive_list_state.g.dart';

abstract class AdditiveListState
    implements Built<AdditiveListState, AdditiveListStateBuilder> {
  bool get isLoading;

  @nullable
  Exception get error;

  List<Additive> get additives;

  factory AdditiveListState() {
    return _$AdditiveListState._(
        isLoading: false, error: null, additives: List());
  }

  AdditiveListState._();
}
