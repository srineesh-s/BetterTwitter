import 'package:bettertwitter/config/constants/app_strings.dart';
import 'package:bettertwitter/config/routing/app_router.dart';
import 'package:bettertwitter/screens/authentication/bloc/authentication_bloc.dart';
import 'package:bettertwitter/screens/authentication/repository/auth_repository.dart';
import 'package:bettertwitter/screens/authentication/ui/auth_view.dart';
import 'package:bettertwitter/services/auth_service.dart';
import 'package:bettertwitter/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_screen_test.mocks.dart';

@GenerateMocks([
  AuthenticationBloc,
  AuthenticationLoading,
  AuthenticationSuccess,
  AuthenticationFailure,
  AuthRepository
])
void main() {
  late MockAuthenticationBloc mockAuthenticationBloc;
  late MockAuthenticationLoading mockAuthenticationLoading;
  late MockAuthenticationSuccess mockAuthenticationSuccess;
  late MockAuthenticationFailure mockAuthenticationFailure;
  late MockAuthRepository mockAuthRepository;
  late Widget sut;

  setUp(() {
    mockAuthenticationBloc = MockAuthenticationBloc();
    mockAuthenticationLoading = MockAuthenticationLoading();
    mockAuthenticationSuccess = MockAuthenticationSuccess();
    mockAuthenticationFailure = MockAuthenticationFailure();
    mockAuthRepository = MockAuthRepository();
    sut = MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => mockAuthenticationBloc,
        ),
      ],
      child: const MaterialApp(
        onGenerateRoute: generateRoute,
        home: AuthenticationView(),
      ),
    );
  });

  testWidgets('checking the widget', (tester) async {
    when(mockAuthenticationBloc.stream).thenAnswer((realInvocation) =>
        Stream<AuthenticationState>.fromIterable([mockAuthenticationSuccess]));
    when(mockAuthenticationBloc.state).thenReturn(mockAuthenticationSuccess);
    await tester.pumpWidget(sut);
    await tester.pumpAndSettle();
  });
  testWidgets('sending the failure state', (tester) async {
    when(mockAuthenticationFailure.message).thenReturn("failure is present");
    when(mockAuthenticationBloc.stream).thenAnswer((realInvocation) =>
        Stream<AuthenticationState>.fromIterable([mockAuthenticationFailure]));
    when(mockAuthenticationBloc.state).thenReturn(mockAuthenticationFailure);
    await tester.pumpWidget(sut);
    await tester.pumpAndSettle();
  });
  testWidgets('tap the switch sign up button', (tester) async {
    when(mockAuthenticationBloc.stream).thenAnswer((realInvocation) =>
        Stream<AuthenticationState>.fromIterable([mockAuthenticationSuccess]));
    when(mockAuthenticationBloc.state).thenReturn(mockAuthenticationSuccess);
    await tester.pumpWidget(sut);
    final button = find.byKey(Key("switchAuth"));
    await tester.tap(button);
    await tester.pumpAndSettle();
  });
  testWidgets('tap the login button', (tester) async {
    when(mockAuthenticationBloc.stream).thenAnswer((realInvocation) =>
        Stream<AuthenticationState>.fromIterable([mockAuthenticationSuccess]));
    when(mockAuthenticationBloc.state).thenReturn(mockAuthenticationSuccess);
    when(mockAuthenticationBloc.add(any)).thenAnswer((realInvocation) {});
    await tester.pumpWidget(sut);
    final button = find.byKey(Key("Authbutton"));
    await tester.tap(button);
    await tester.pumpAndSettle();
  });
}
