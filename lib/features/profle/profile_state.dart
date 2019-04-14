import 'package:built_value/built_value.dart';

part 'profile_state.g.dart';

abstract class ProfileState
    implements Built<ProfileState, ProfileStateBuilder> {
  bool get isLoading;

  factory ProfileState() {
    return _$ProfileState._(isLoading: false);
  }

  ProfileState._();
}
