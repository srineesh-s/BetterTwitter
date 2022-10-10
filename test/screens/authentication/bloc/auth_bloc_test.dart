import 'package:bettertwitter/screens/authentication/bloc/authentication_bloc.dart';
import 'package:bettertwitter/screens/authentication/repository/auth_repository.dart';
import 'package:bettertwitter/services/auth_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_bloc_test.mocks.dart';

@GenerateMocks([AuthService, AuthRepository])
void main() {
  late MockAuthService mockAuthService;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthService = MockAuthService();
    mockAuthRepository = MockAuthRepository();
  });

  blocTest<AuthenticationBloc, AuthenticationState>(
    'Checking the initial state is empty',
    build: () => AuthenticationBloc(mockAuthRepository),
    expect: () => <AuthenticationState>[],
  );
  blocTest<AuthenticationBloc, AuthenticationState>(
    'Checking the sign in state is working',
    build: () {
      when(mockAuthRepository.login('email', 'password'))
          .thenAnswer((realInvocation) async => true);
      return AuthenticationBloc(mockAuthRepository);
    },
    act: ((bloc) => bloc.add(LoginEvent(email: 'email', password: 'password'))),
    expect: () => <AuthenticationState>[
      AuthenticationLoading(),
      AuthenticationSuccess(),
    ],
  );
  blocTest<AuthenticationBloc, AuthenticationState>(
    'Checking the sign in state failure',
    build: () {
      when(mockAuthRepository.login('email', 'password'))
          .thenThrow(Exception());
      return AuthenticationBloc(mockAuthRepository);
    },
    act: ((bloc) => bloc.add(LoginEvent(email: 'email', password: 'password'))),
    expect: () => <AuthenticationState>[
      AuthenticationLoading(),
      AuthenticationFailure(""),
    ],
  );
  blocTest<AuthenticationBloc, AuthenticationState>(
    'Checking the signup state',
    build: () {
      when(mockAuthRepository.signup('email', 'password', 'srineesh'))
          .thenAnswer((realInvocation) async => true);
      return AuthenticationBloc(mockAuthRepository);
    },
    act: ((bloc) => bloc.add(SignupEvent(
        email: 'email',
        password: 'password',
        name: "srineesh",
        image: 1.toString()))),
    expect: () => <AuthenticationState>[
      AuthenticationLoading(),
      AuthenticationSuccess(),
    ],
  );
  blocTest<AuthenticationBloc, AuthenticationState>(
    'Checking the signup failure state',
    build: () {
      when(mockAuthRepository.signup('email', 'password', 'srineesh'))
          .thenThrow(Exception());
      return AuthenticationBloc(mockAuthRepository);
    },
    act: ((bloc) => bloc.add(SignupEvent(
        email: 'email',
        password: 'password',
        name: "srineesh",
        image: 1.toString()))),
    expect: () => <AuthenticationState>[
      AuthenticationLoading(),
      AuthenticationFailure(""),
    ],
  );
  blocTest<AuthenticationBloc, AuthenticationState>(
    'Checking the Signout state',
    build: () {
      when(mockAuthRepository.signout())
          .thenAnswer((realInvocation) async => true);
      return AuthenticationBloc(mockAuthRepository);
    },
    act: ((bloc) => bloc.add(SignoutEvent())),
    expect: () => <AuthenticationState>[
      AuthenticationLoading(),
      SignoutSuccess(),
    ],
  );
}
