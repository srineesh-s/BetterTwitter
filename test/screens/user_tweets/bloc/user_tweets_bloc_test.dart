import 'package:bettertwitter/models/tweets/tweet_model.dart';
import 'package:bettertwitter/models/user/user_model.dart';
import 'package:bettertwitter/screens/user_tweets/bloc/user_tweet_bloc.dart';
import 'package:bettertwitter/screens/user_tweets/repository/user_tweet_rep.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_tweets_bloc_test.mocks.dart';

@GenerateMocks([UserTweetRepository])
void main() {
  late MockUserTweetRepository mockUserTweetRepository;

  setUp(() {
    mockUserTweetRepository = MockUserTweetRepository();
  });

  blocTest<UserTweetBloc, UserTweetState>(
    'Initially event check',
    setUp: () {
      when(mockUserTweetRepository.getUserTweets()).thenAnswer(
        (realInvocation) async => [],
      );
    },
    build: () => UserTweetBloc(mockUserTweetRepository),
    expect: () => [],
  );
  blocTest<UserTweetBloc, UserTweetState>(
    'adding get users event',
    setUp: () {
      when(mockUserTweetRepository.getUserTweets()).thenAnswer(
        (realInvocation) async => [],
      );
    },
    build: () => UserTweetBloc(mockUserTweetRepository),
    act: (bloc) => bloc.add(GetUserTweetsEvent()),
    expect: () => [UserTweetLoading(), UserTweetSuccess(tweets: [])],
  );
  blocTest<UserTweetBloc, UserTweetState>(
    'adding get users failure event',
    setUp: () {
      when(mockUserTweetRepository.getUserTweets()).thenThrow(
        Exception(),
      );
    },
    build: () => UserTweetBloc(mockUserTweetRepository),
    act: (bloc) => bloc.add(GetUserTweetsEvent()),
    expect: () => [UserTweetLoading(), UserTweetFailure("")],
  );
  blocTest<UserTweetBloc, UserTweetState>(
    'deleting users event',
    setUp: () {
      when(mockUserTweetRepository.deleteUserTweet(TweetModel(
              id: "id",
              userId: "userId",
              tweet: "tweet",
              user: UserModel(
                email: "email",
                image: "image",
                name: "name",
                userId: "userId",
              ),
              date: "date")))
          .thenAnswer(
        (realInvocation) async => true,
      );
    },
    build: () => UserTweetBloc(mockUserTweetRepository),
    act: (bloc) => bloc.add(DeleteUserTweetEvent(
        tweetModel: TweetModel(
            id: "id",
            userId: "userId",
            tweet: "tweet",
            user: UserModel(
              email: "email",
              image: "image",
              name: "name",
              userId: "userId",
            ),
            date: "date"))),
    expect: () => [UserTweetLoading(), UserTweetFailure("")],
  );
}
