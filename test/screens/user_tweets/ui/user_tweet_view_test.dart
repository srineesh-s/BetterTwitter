import 'package:bettertwitter/screens/user_tweets/bloc/user_tweet_bloc.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  UserTweetBloc,
  UserTweetState,
  UserTweetFailure,
  DeleteTweetSuccess,
  UserTweetLoading,
])
void main() {}
