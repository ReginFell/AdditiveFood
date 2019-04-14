// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProfileState extends ProfileState {
  @override
  final bool isLoading;
  @override
  final User user;

  factory _$ProfileState([void updates(ProfileStateBuilder b)]) =>
      (new ProfileStateBuilder()..update(updates)).build();

  _$ProfileState._({this.isLoading, this.user}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('ProfileState', 'isLoading');
    }
  }

  @override
  ProfileState rebuild(void updates(ProfileStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileStateBuilder toBuilder() => new ProfileStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileState &&
        isLoading == other.isLoading &&
        user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, isLoading.hashCode), user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProfileState')
          ..add('isLoading', isLoading)
          ..add('user', user))
        .toString();
  }
}

class ProfileStateBuilder
    implements Builder<ProfileState, ProfileStateBuilder> {
  _$ProfileState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  User _user;
  User get user => _$this._user;
  set user(User user) => _$this._user = user;

  ProfileStateBuilder();

  ProfileStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _user = _$v.user;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProfileState;
  }

  @override
  void update(void updates(ProfileStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ProfileState build() {
    final _$result =
        _$v ?? new _$ProfileState._(isLoading: isLoading, user: user);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
