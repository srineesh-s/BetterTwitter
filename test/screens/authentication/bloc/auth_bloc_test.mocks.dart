// Mocks generated by Mockito 5.3.2 from annotations
// in bettertwitter/test/screens/authentication/bloc/auth_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:bettertwitter/models/user/user_model.dart' as _i3;
import 'package:bettertwitter/screens/authentication/repository/auth_repository.dart'
    as _i7;
import 'package:bettertwitter/services/auth_service.dart' as _i4;
import 'package:bettertwitter/services/firestore_service.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i2;
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

class _FakeFirebaseAuth_0 extends _i1.SmartFake implements _i2.FirebaseAuth {
  _FakeFirebaseAuth_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserModel_1 extends _i1.SmartFake implements _i3.UserModel {
  _FakeUserModel_1(
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

/// A class which mocks [AuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthService extends _i1.Mock implements _i4.AuthService {
  MockAuthService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseAuth get auth => (super.noSuchMethod(
        Invocation.getter(#auth),
        returnValue: _FakeFirebaseAuth_0(
          this,
          Invocation.getter(#auth),
        ),
      ) as _i2.FirebaseAuth);
  @override
  set auth(_i2.FirebaseAuth? _auth) => super.noSuchMethod(
        Invocation.setter(
          #auth,
          _auth,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.UserModel get userFromFirebaseUser => (super.noSuchMethod(
        Invocation.getter(#userFromFirebaseUser),
        returnValue: _FakeUserModel_1(
          this,
          Invocation.getter(#userFromFirebaseUser),
        ),
      ) as _i3.UserModel);
  @override
  _i6.Future<_i2.User?> signInWithEmailAndPassword(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithEmailAndPassword,
          [
            email,
            password,
          ],
        ),
        returnValue: _i6.Future<_i2.User?>.value(),
      ) as _i6.Future<_i2.User?>);
  @override
  _i6.Future<bool> isUserLoggedIn() => (super.noSuchMethod(
        Invocation.method(
          #isUserLoggedIn,
          [],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<_i2.User?> signUpWithEmailAndPassword(
    String? email,
    String? password,
    String? userName,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #signUpWithEmailAndPassword,
          [
            email,
            password,
            userName,
          ],
        ),
        returnValue: _i6.Future<_i2.User?>.value(),
      ) as _i6.Future<_i2.User?>);
  @override
  _i6.Future<dynamic> signOut() => (super.noSuchMethod(
        Invocation.method(
          #signOut,
          [],
        ),
        returnValue: _i6.Future<dynamic>.value(),
      ) as _i6.Future<dynamic>);
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i7.AuthRepository {
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
