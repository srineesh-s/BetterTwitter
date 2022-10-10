import 'package:bettertwitter/config/constants/app_strings.dart';
import 'package:bettertwitter/config/routing/app_router.dart';
import 'package:bettertwitter/models/tweets/tweet_model.dart';
import 'package:bettertwitter/models/user/user_model.dart';
import 'package:bettertwitter/screens/user_tweets/bloc/user_tweet_bloc.dart';
import 'package:bettertwitter/screens/user_tweets/ui/user_tweet_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_tweet_view_test.mocks.dart';

@GenerateMocks([
  UserTweetBloc,
  UserTweetState,
  UserTweetFailure,
  DeleteTweetSuccess,
  UserTweetLoading,
  UserTweetInitial,
  UserTweetSuccess
])
void main() {
  late MockUserTweetBloc mockUserTweetBloc;
  late MockUserTweetState mockUserTweetState;
  late MockUserTweetFailure mockUserTweetFailure;
  late MockDeleteTweetSuccess mockDeleteTweetSuccess;
  late MockUserTweetLoading mockUserTweetLoading;
  late MockUserTweetInitial mockUserTweetInitial;
  late MockUserTweetSuccess mockUserTweetSuccess;
  late Widget sut;

  setUp(() {
    mockUserTweetBloc = MockUserTweetBloc();
    mockUserTweetState = MockUserTweetState();
    mockUserTweetFailure = MockUserTweetFailure();
    mockDeleteTweetSuccess = MockDeleteTweetSuccess();
    mockUserTweetLoading = MockUserTweetLoading();
    mockUserTweetInitial = MockUserTweetInitial();
    mockUserTweetSuccess = MockUserTweetSuccess();
    sut = MaterialApp(
      onGenerateRoute: generateRoute,
      home: BlocProvider<UserTweetBloc>(
        create: (context) => mockUserTweetBloc,
        child: UserTweetView(),
      ),
    );
  });

  testWidgets("Testing the screen appbar", ((widgetTester) async {
    when(mockUserTweetBloc.stream).thenAnswer((realInvocation) =>
        Stream<UserTweetState>.fromIterable([mockUserTweetInitial]));
    when(mockUserTweetBloc.state).thenReturn(mockUserTweetInitial);
    await widgetTester.pumpWidget(sut);
    expect(find.text(AppStrings.yourTweets), findsOneWidget);
    await widgetTester.pumpAndSettle();
  }));
  testWidgets("Testing the loading", ((widgetTester) async {
    when(mockUserTweetBloc.stream).thenAnswer((realInvocation) =>
        Stream<UserTweetState>.fromIterable([mockUserTweetLoading]));
    when(mockUserTweetBloc.state).thenReturn(mockUserTweetLoading);
    await widgetTester.pumpWidget(sut);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  }));
  testWidgets("Testing the delete success", ((widgetTester) async {
    when(mockUserTweetBloc.stream).thenAnswer((realInvocation) =>
        Stream<UserTweetState>.fromIterable([mockDeleteTweetSuccess]));
    when(mockUserTweetBloc.state).thenReturn(mockDeleteTweetSuccess);
    await widgetTester.pumpWidget(sut);
    await widgetTester.pumpAndSettle();
  }));
  testWidgets("Testing the tweet failure ", ((widgetTester) async {
    when(mockUserTweetFailure.message).thenReturn("error");
    when(mockUserTweetBloc.stream).thenAnswer((realInvocation) =>
        Stream<UserTweetState>.fromIterable([mockUserTweetFailure]));
    when(mockUserTweetBloc.state).thenReturn(mockUserTweetFailure);
    await widgetTester.pumpWidget(sut);
    await widgetTester.pumpAndSettle();
  }));
  testWidgets("Testing the tweet success with empty list ",
      ((widgetTester) async {
    when(mockUserTweetSuccess.tweets).thenReturn([]);

    when(mockUserTweetBloc.stream).thenAnswer((realInvocation) =>
        Stream<UserTweetState>.fromIterable([mockUserTweetSuccess]));
    when(mockUserTweetBloc.state).thenReturn(mockUserTweetSuccess);
    await widgetTester.pumpWidget(sut);
    await widgetTester.pumpAndSettle();
  }));
  testWidgets("Testing the tweet success with elements list ",
      ((widgetTester) async {
    when(mockUserTweetSuccess.tweets).thenReturn([
      TweetModel(
          id: "id",
          userId: "userId",
          tweet: "tweet",
          user: UserModel(
              name: "name", email: "email", image: "image", userId: "userId"),
          date: "datedsajndasknadksjnasdjknkads"),
    ]);

    when(mockUserTweetBloc.stream).thenAnswer((realInvocation) =>
        Stream<UserTweetState>.fromIterable([mockUserTweetSuccess]));
    when(mockUserTweetBloc.state).thenReturn(mockUserTweetSuccess);
    await widgetTester.pumpWidget(sut);
    await widgetTester.pumpAndSettle();
  }));
}
