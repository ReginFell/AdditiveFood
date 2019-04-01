import 'package:additive_food/data/adittive/model/additive.dart';
import 'package:built_value/built_value.dart';

part 'additive_list_state.g.dart';

abstract class AdditiveListState implements Built<AdditiveListState, AdditiveListStateBuilder> {

  bool get isLoading;

  List<Additive> get additives;

  factory AdditiveListState() {
    return _$AdditiveListState._(
        isLoading: false,
        additives: List()
    );
  }

  AdditiveListState._();
}
