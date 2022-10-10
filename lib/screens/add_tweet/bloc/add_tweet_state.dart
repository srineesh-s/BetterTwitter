part of 'add_tweet_bloc.dart';

abstract class AddTweetState extends Equatable {
  const AddTweetState();

  @override
  List<Object> get props => [];
}

class AddTweetInitial extends AddTweetState {}

class AddTweetLoading extends AddTweetState {}

class AddTweetSuccess extends AddTweetState {}

class AddTweetFailure extends AddTweetState {
  final String message;
  const AddTweetFailure({
    required this.message,
  });
}
