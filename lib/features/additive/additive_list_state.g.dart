// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additive_list_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AdditiveListState extends AdditiveListState {
  @override
  final bool isLoading;
  @override
  final List<Additive> additives;

  factory _$AdditiveListState([void updates(AdditiveListStateBuilder b)]) =>
      (new AdditiveListStateBuilder()..update(updates)).build();

  _$AdditiveListState._({this.isLoading, this.additives}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('AdditiveListState', 'isLoading');
    }
    if (additives == null) {
      throw new BuiltValueNullFieldError('AdditiveListState', 'additives');
    }
  }

  @override
  AdditiveListState rebuild(void updates(AdditiveListStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AdditiveListStateBuilder toBuilder() =>
      new AdditiveListStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdditiveListState &&
        isLoading == other.isLoading &&
        additives == other.additives;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, isLoading.hashCode), additives.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AdditiveListState')
          ..add('isLoading', isLoading)
          ..add('additives', additives))
        .toString();
  }
}

class AdditiveListStateBuilder
    implements Builder<AdditiveListState, AdditiveListStateBuilder> {
  _$AdditiveListState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  List<Additive> _additives;
  List<Additive> get additives => _$this._additives;
  set additives(List<Additive> additives) => _$this._additives = additives;

  AdditiveListStateBuilder();

  AdditiveListStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _additives = _$v.additives;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdditiveListState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AdditiveListState;
  }

  @override
  void update(void updates(AdditiveListStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AdditiveListState build() {
    final _$result = _$v ??
        new _$AdditiveListState._(isLoading: isLoading, additives: additives);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
