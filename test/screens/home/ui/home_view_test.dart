import 'package:bettertwitter/config/constants/app_strings.dart';
import 'package:bettertwitter/config/routing/app_router.dart';
import 'package:bettertwitter/screens/authentication/bloc/authentication_bloc.dart';
import 'package:bettertwitter/screens/home/bloc/home_bloc.dart';
import 'package:bettertwitter/screens/home/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_view_test.mocks.dart';

@GenerateMocks([
  AuthenticationBloc,
  SignoutSuccess,
  HomeBloc,
  AuthenticationInitial,
  AuthenticationLoading,
  AuthenticationSuccess,
  TweetStream
])
void main() {
  late MockAuthenticationBloc mockAuthenticationBloc;
  late MockSignoutSuccess mockSignoutSuccess;
  late MockHomeBloc mockHomeBloc;
  late MockTweetStream mockTweetStream;
  late MockAuthenticationInitial mockAuthenticationInitial;
  late Widget sut;

  setUp(() {
    mockAuthenticationInitial = MockAuthenticationInitial();
    mockAuthenticationBloc = MockAuthenticationBloc();
    mockSignoutSuccess = MockSignoutSuccess();
    mockHomeBloc = MockHomeBloc();
    mockTweetStream = MockTweetStream();
    sut = MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => mockAuthenticationBloc,
        ),
        BlocProvider<HomeBloc>(
          create: (context) => mockHomeBloc,
        ),
      ],
      child: const MaterialApp(
        onGenerateRoute: generateRoute,
        home: HomeView(),
      ),
    );
  });

  testWidgets('Checking the initial state', (WidgetTester tester) async {
    when(mockAuthenticationBloc.stream).thenAnswer((realInvocation) =>
        Stream<AuthenticationState>.fromIterable([mockAuthenticationInitial]));
    when(mockAuthenticationBloc.state).thenReturn(mockAuthenticationInitial);
    when(mockHomeBloc.stream).thenAnswer((realInvocation) =>
        Stream<TweetStream>.fromIterable([mockTweetStream]));
    when(mockHomeBloc.state).thenReturn(mockTweetStream);
    await tester.pumpWidget(sut);
    expect(find.text(AppStrings.appName), findsOneWidget);
    await tester.pumpAndSettle();
  });
}
