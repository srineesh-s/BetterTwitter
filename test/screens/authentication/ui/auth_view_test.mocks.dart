// Mocks generated by Mockito 5.3.2 from annotations
// in bettertwitter/test/screens/authentication/ui/auth_view_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:bettertwitter/screens/authentication/bloc/authentication_bloc.dart'
    as _i3;
import 'package:bettertwitter/screens/authentication/repository/auth_repository.dart'
    as _i2;
import 'package:bettertwitter/services/auth_service.dart' as _i4;
import 'package:bettertwitter/services/firestore_service.dart' as _i5;
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

class _FakeAuthService_2 extends _i1.SmartFake implements _i4.AuthService {
  _FakeAuthService_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDbService_3 extends _i1.SmartFake implements _i5.DbService {
  _FakeDbService_3(
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

/// A class which mocks [AuthenticationFailure].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationFailure extends _i1.Mock
    implements _i3.AuthenticationFailure {
  MockAuthenticationFailure() {
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

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i2.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.AuthService get authService => (super.noSuchMethod(
        Invocation.getter(#authService),
        returnValue: _FakeAuthService_2(
          this,
          Invocation.getter(#authService),
        ),
      ) as _i4.AuthService);
  @override
  set authService(_i4.AuthService? _authService) => super.noSuchMethod(
        Invocation.setter(
          #authService,
          _authService,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.DbService get dbService => (super.noSuchMethod(
        Invocation.getter(#dbService),
        returnValue: _FakeDbService_3(
          this,
          Invocation.getter(#dbService),
        ),
      ) as _i5.DbService);
  @override
  set dbService(_i5.DbService? _dbService) => super.noSuchMethod(
        Invocation.setter(
          #dbService,
          _dbService,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<bool> login(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            email,
            password,
          ],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<bool> signup(
    String? email,
    String? password,
    String? name,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #signup,
          [
            email,
            password,
            name,
          ],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<bool> signout() => (super.noSuchMethod(
        Invocation.method(
          #signout,
          [],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
}
