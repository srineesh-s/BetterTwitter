part of 'user_tweet_bloc.dart';

abstract class UserTweetState extends Equatable {
  const UserTweetState();

  @override
  List<Object> get props => [];
}

class UserTweetInitial extends UserTweetState {}

class UserTweetLoading extends UserTweetState {}

class UserTweetSuccess extends UserTweetState {
  final List<TweetModel> tweets;

  const UserTweetSuccess({required this.tweets});
}

class UserTweetFailure extends UserTweetState {
  final String message;

  const UserTweetFailure(this.message);
}

class DeleteTweetSuccess extends UserTweetState {}
