// Mocks generated by Mockito 5.3.2 from annotations
// in bettertwitter/test/screens/home/ui/home_view_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:bettertwitter/models/tweets/tweet_model.dart' as _i8;
import 'package:bettertwitter/screens/authentication/bloc/authentication_bloc.dart'
    as _i3;
import 'package:bettertwitter/screens/authentication/repository/auth_repository.dart'
    as _i2;
import 'package:bettertwitter/screens/home/bloc/home_bloc.dart' as _i5;
import 'package:bettertwitter/screens/home/repository/home_rep.dart' as _i4;
import 'package:bloc/bloc.dart' as _i7;
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

class _FakeAuthRepository_0 extends _i1.SmartFake
    implements _i2.AuthRepository {
  _FakeAuthRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthenticationState_1 extends _i1.SmartFake
    implements _i3.AuthenticationState {
  _FakeAuthenticationState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHomeRepository_2 extends _i1.SmartFake
    implements _i4.HomeRepository {
  _FakeHomeRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTweetStream_3 extends _i1.SmartFake implements _i5.TweetStream {
  _FakeTweetStream_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthenticationBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationBloc extends _i1.Mock
    implements _i3.AuthenticationBloc {
  MockAuthenticationBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AuthRepository get authRepository => (super.noSuchMethod(
        Invocation.getter(#authRepository),
        returnValue: _FakeAuthRepository_0(
          this,
          Invocation.getter(#authRepository),
        ),
      ) as _i2.AuthRepository);
  @override
  set authRepository(_i2.AuthRepository? _authRepository) => super.noSuchMethod(
        Invocation.setter(
          #authRepository,
          _authRepository,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.AuthenticationState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeAuthenticationState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.AuthenticationState);
  @override
  _i6.Stream<_i3.AuthenticationState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<_i3.AuthenticationState>.empty(),
      ) as _i6.Stream<_i3.AuthenticationState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);
  @override
  void add(_i3.AuthenticationEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i3.AuthenticationEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i3.AuthenticationState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i3.AuthenticationEvent>(
    _i7.EventHandler<E, _i3.AuthenticationState>? handler, {
    _i7.EventTransformer<E>? transformer,
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
          _i7.Transition<_i3.AuthenticationEvent, _i3.AuthenticationState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  void onChange(_i7.Change<_i3.AuthenticationState>? change) =>
      super.noSuchMethod(
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

/// A class which mocks [SignoutSuccess].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignoutSuccess extends _i1.Mock implements _i3.SignoutSuccess {
  MockSignoutSuccess() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);
}

/// A class which mocks [HomeBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeBloc extends _i1.Mock implements _i5.HomeBloc {
  MockHomeBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.HomeRepository get homeRepository => (super.noSuchMethod(
        Invocation.getter(#homeRepository),
        returnValue: _FakeHomeRepository_2(
          this,
          Invocation.getter(#homeRepository),
        ),
      ) as _i4.HomeRepository);
  @override
  set homeRepository(_i4.HomeRepository? _homeRepository) => super.noSuchMethod(
        Invocation.setter(
          #homeRepository,
          _homeRepository,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.TweetStream get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeTweetStream_3(
          this,
          Invocation.getter(#state),
        ),
      ) as _i5.TweetStream);
  @override
  _i6.Stream<_i5.TweetStream> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<_i5.TweetStream>.empty(),
      ) as _i6.Stream<_i5.TweetStream>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);
  @override
  void add(_i5.HomeEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i5.HomeEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i5.TweetStream? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i5.HomeEvent>(
    _i7.EventHandler<E, _i5.TweetStream>? handler, {
    _i7.EventTransformer<E>? transformer,
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
          _i7.Transition<_i5.HomeEvent, _i5.TweetStream>? transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  void onChange(_i7.Change<_i5.TweetStream>? change) => super.noSuchMethod(
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

/// A class which mocks [AuthenticationInitial].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationInitial extends _i1.Mock
    implements _i3.AuthenticationInitial {
  MockAuthenticationInitial() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);
}

/// A class which mocks [AuthenticationLoading].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationLoading extends _i1.Mock
    implements _i3.AuthenticationLoading {
  MockAuthenticationLoading() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);
}

/// A class which mocks [AuthenticationSuccess].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationSuccess extends _i1.Mock
    implements _i3.AuthenticationSuccess {
  MockAuthenticationSuccess() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<Object> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object>[],
      ) as List<Object>);
}

/// A class which mocks [TweetStream].
///
/// See the documentation for Mockito's code generation for more information.
class MockTweetStream extends _i1.Mock implements _i5.TweetStream {
  MockTweetStream() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i8.TweetModel> get tweets => (super.noSuchMethod(
        Invocation.getter(#tweets),
        returnValue: <_i8.TweetModel>[],
      ) as List<_i8.TweetModel>);
  @override
  set tweets(List<_i8.TweetModel>? _tweets) => super.noSuchMethod(
        Invocation.setter(
          #tweets,
          _tweets,
        ),
        returnValueForMissingStub: null,
      );
}