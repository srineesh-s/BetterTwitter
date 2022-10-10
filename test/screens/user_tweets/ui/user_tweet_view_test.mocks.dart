// Mocks generated by Mockito 5.3.2 from annotations
// in bettertwitter/test/screens/user_tweets/ui/user_tweet_view_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:bettertwitter/screens/user_tweets/bloc/user_tweet_bloc.dart'
    as _i3;
import 'package:bettertwitter/screens/user_tweets/repository/user_tweet_rep.dart'
    as _i2;
import 'package:bloc/bloc.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUserTweetRepository_0 extends _i1.SmartFake
    implements _i2.UserTweetRepository {
  _FakeUserTweetRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserTweetState_1 extends _i1.SmartFake
    implements _i3.UserTweetState {
  _FakeUserTweetState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UserTweetBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserTweetBloc extends _i1.Mock implements _i3.UserTweetBloc {
  MockUserTweetBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UserTweetRepository get userTweetRepository => (super.noSuchMethod(
        Invocation.getter(#userTweetRepository),
        returnValue: _FakeUserTweetRepository_0(
          this,
          Invocation.getter(#userTweetRepository),
        ),
      ) as _i2.UserTweetRepository);
  @override
  set userTweetRepository(_i2.UserTweetRepository? _userTweetRepository) =>
      super.noSuchMethod(
        Invocation.setter(
          #userTweetRepository,
          _userTweetRepository,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.UserTweetState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeUserTweetState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.UserTweetState);
  @override
  _i4.Stream<_i3.UserTweetState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i4.Stream<_i3.UserTweetState>.empty(),
      ) as _i4.Stream<_i3.UserTweetState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);
  @override
  void add(_i3.UserTweetEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i3.UserTweetEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i3.UserTweetState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i3.UserTweetEvent>(
    _i5.EventHandler<E, _i3.UserTweetState>? handler, {
    _i5.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onTransition(
          _i5.Transition<_i3.UserTweetEvent, _i3.UserTweetState>? transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  void onChange(_i5.Change<_i3.UserTweetState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [UserTweetState].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserTweetState extends _i1.Mock implements _i3.UserTweetState {
  MockUserTweetState() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);
}

/// A class which mocks [UserTweetFailure].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserTweetFailure extends _i1.Mock implements _i3.UserTweetFailure {
  MockUserTweetFailure() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: '',
      ) as String);
  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);
}

/// A class which mocks [DeleteTweetSuccess].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteTweetSuccess extends _i1.Mock
    implements _i3.DeleteTweetSuccess {
  MockDeleteTweetSuccess() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);
}

/// A class which mocks [UserTweetLoading].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserTweetLoading extends _i1.Mock implements _i3.UserTweetLoading {
  MockUserTweetLoading() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);
}
