import 'package:bettertwitter/config/constants/app_strings.dart';
import 'package:bettertwitter/config/routing/app_router.dart';
import 'package:bettertwitter/screens/add_tweet/bloc/add_tweet_bloc.dart';
import 'package:bettertwitter/screens/add_tweet/ui/add_tweet_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_tweet_view_test.mocks.dart';

@GenerateMocks([
  AddTweetBloc,
  AddTweetEvent,
  AddTweetState,
  AddTweetInitial,
  AddTweetLoading,
  AddTweetSuccess,
  AddTweetFailure,
])
void main() {
  late MockAddTweetBloc mockAddTweetBloc;
  late MockAddTweetEvent mockAddTweetEvent;
  late MockAddTweetState mockAddTweetState;
  late MockAddTweetInitial mockAddTweetInitial;
  late MockAddTweetLoading mockAddTweetLoading;
  late MockAddTweetSuccess mockAddTweetSuccess;
  late MockAddTweetFailure mockAddTweetFailure;
  late Widget sut;

  setUp(() {
    mockAddTweetBloc = MockAddTweetBloc();
    mockAddTweetEvent = MockAddTweetEvent();
    mockAddTweetState = MockAddTweetState();
    mockAddTweetInitial = MockAddTweetInitial();
    mockAddTweetLoading = MockAddTweetLoading();
    mockAddTweetSuccess = MockAddTweetSuccess();
    mockAddTweetFailure = MockAddTweetFailure();
    sut = MaterialApp(
      onGenerateRoute: generateRoute,
      home: BlocProvider<AddTweetBloc>(
        create: (context) => mockAddTweetBloc,
        child: AddTweetView(),
      ),
    );
  });

  testWidgets("Testing the screen appbar", ((widgetTester) async {
    when(mockAddTweetBloc.stream).thenAnswer((realInvocation) =>
        Stream<AddTweetState>.fromIterable([mockAddTweetInitial]));
    when(mockAddTweetBloc.state).thenReturn(mockAddTweetInitial);
    await widgetTester.pumpWidget(sut);
    expect(find.text(AppStrings.addTweet), findsOneWidget);
    await widgetTester.pumpAndSettle();
  }));
  testWidgets("Testing the loading state", ((widgetTester) async {
    when(mockAddTweetBloc.stream).thenAnswer((realInvocation) =>
        Stream<AddTweetState>.fromIterable([mockAddTweetLoading]));
    when(mockAddTweetBloc.state).thenReturn(mockAddTweetLoading);
    await widgetTester.pumpWidget(sut);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  }));

  testWidgets("Testing the Success state", ((widgetTester) async {
    when(mockAddTweetBloc.stream).thenAnswer((realInvocation) =>
        Stream<AddTweetState>.fromIterable([mockAddTweetSuccess]));
    when(mockAddTweetBloc.state).thenReturn(mockAddTweetSuccess);
    await widgetTester.pumpWidget(sut);
    await widgetTester.pumpAndSettle();
  }));
  testWidgets("Testing the failure state", ((widgetTester) async {
    when(mockAddTweetBloc.stream).thenAnswer((realInvocation) =>
        Stream<AddTweetState>.fromIterable([mockAddTweetFailure]));
    when(mockAddTweetBloc.state).thenReturn(mockAddTweetFailure);
    await widgetTester.pumpWidget(sut);
    await widgetTester.pumpAndSettle();
  }));
}
