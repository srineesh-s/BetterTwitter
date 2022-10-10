part of 'user_tweet_bloc.dart';

abstract class UserTweetEvent extends Equatable {
  const UserTweetEvent();

  @override
  List<Object> get props => [];
}

class GetUserTweetsEvent extends UserTweetEvent {
  final String userId;

  const GetUserTweetsEvent({required this.userId});
}

class DeleteUserTweetEvent extends UserTweetEvent {
  final TweetModel tweetModel;

  const DeleteUserTweetEvent({required this.tweetModel});
}
