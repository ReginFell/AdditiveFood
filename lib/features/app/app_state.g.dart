// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final AdditiveListState additiveListState;
  @override
  final ProfileState profileState;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.additiveListState, this.profileState}) : super._() {
    if (additiveListState == null) {
      throw new BuiltValueNullFieldError('AppState', 'additiveListState');
    }
    if (profileState == null) {
      throw new BuiltValueNullFieldError('AppState', 'profileState');
    }
  }

  @override
  AppState rebuild(void updates(AppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        additiveListState == other.additiveListState &&
        profileState == other.profileState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, additiveListState.hashCode), profileState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('additiveListState', additiveListState)
          ..add('profileState', profileState))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  AdditiveListStateBuilder _additiveListState;
  AdditiveListStateBuilder get additiveListState =>
      _$this._additiveListState ??= new AdditiveListStateBuilder();
  set additiveListState(AdditiveListStateBuilder additiveListState) =>
      _$this._additiveListState = additiveListState;

  ProfileStateBuilder _profileState;
  ProfileStateBuilder get profileState =>
      _$this._profileState ??= new ProfileStateBuilder();
  set profileState(ProfileStateBuilder profileState) =>
      _$this._profileState = profileState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _additiveListState = _$v.additiveListState?.toBuilder();
      _profileState = _$v.profileState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void updates(AppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              additiveListState: additiveListState.build(),
              profileState: profileState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'additiveListState';
        additiveListState.build();
        _$failedField = 'profileState';
        profileState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
