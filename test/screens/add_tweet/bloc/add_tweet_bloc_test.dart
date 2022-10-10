import 'package:bettertwitter/models/tweets/tweet_model.dart';
import 'package:bettertwitter/screens/add_tweet/bloc/add_tweet_bloc.dart';
import 'package:bettertwitter/screens/add_tweet/repository/add_tweet_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_tweet_bloc_test.mocks.dart';

@GenerateMocks([AddTweetRepository])
void main() {
  late MockAddTweetRepository mockAddTweetRepository;

  setUp(() {
    mockAddTweetRepository = MockAddTweetRepository();
  });

  blocTest("Checking the initial state",
      build: () {
        return AddTweetBloc(mockAddTweetRepository);
      },
      expect: () => []);
  blocTest("Checking the event success state",
      build: () {
        return AddTweetBloc(mockAddTweetRepository);
      },
      act: (AddTweetBloc bloc) async {
        bloc.add(AddTweetEvent(tweet: "this is a tweet"));
      },
      expect: () => [AddTweetLoading(), AddTweetSuccess()]);
  blocTest("Checking the event failure state",
      build: () {
        when(mockAddTweetRepository.addTweet(any))
            .thenThrow(Exception("Error"));
        return AddTweetBloc(mockAddTweetRepository);
      },
      act: (AddTweetBloc bloc) async {
        bloc.add(AddTweetEvent(tweet: "this is a tweet"));
      },
      expect: () => [AddTweetLoading(), AddTweetFailure(message: "Error")]);
}
