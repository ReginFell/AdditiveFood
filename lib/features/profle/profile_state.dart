import 'package:additive_food/data/user/model/user.dart';
import 'package:built_value/built_value.dart';

part 'profile_state.g.dart';

abstract class ProfileState
    implements Built<ProfileState, ProfileStateBuilder> {
  bool get isLoading;
  @nullable
  User get user;

  factory ProfileState() {
    return _$ProfileState._(isLoading: false, user: null);
  }

  ProfileState._();
}
