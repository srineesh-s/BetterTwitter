part of 'add_tweet_bloc.dart';

abstract class AddTweetState extends Equatable {
  const AddTweetState();

  @override
  List<Object> get props => [];
}

class ManipulateTweetInitial extends AddTweetState {}

class ManipulateTweetLoading extends AddTweetState {}

class ManipulateTweetSuccess extends AddTweetState {}

class ManipulateTweetFailure extends AddTweetState {
  final String message;
  const ManipulateTweetFailure({
    required this.message,
  });
}
