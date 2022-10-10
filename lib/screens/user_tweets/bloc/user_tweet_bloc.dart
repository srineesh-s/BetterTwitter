import 'package:bettertwitter/models/tweets/tweet_model.dart';
import 'package:bettertwitter/screens/user_tweets/repository/user_tweet_rep.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_tweet_event.dart';
part 'user_tweet_state.dart';

class UserTweetBloc extends Bloc<UserTweetEvent, UserTweetState> {
  UserTweetBloc(this.userTweetRepository) : super(UserTweetInitial()) {
    on<GetUserTweetsEvent>((event, emit) async {
      emit(UserTweetLoading());
      try {
        List<TweetModel> tweets = await userTweetRepository.getUserTweets();
        emit(UserTweetSuccess(tweets: tweets));
      } catch (e) {
        emit(UserTweetFailure(e.toString()));
      }
    });
    on<DeleteUserTweetEvent>((event, emit) async {
      emit(UserTweetLoading());
      try {
        await userTweetRepository.deleteUserTweet(event.tweetModel);
        emit(DeleteTweetSuccess());
      } catch (e) {
        emit(UserTweetFailure(e.toString()));
      }
    });
    // on<DeleteUserTweetEvent>(())
  }
  UserTweetRepository userTweetRepository;
}
