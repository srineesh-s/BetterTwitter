part of 'manipulate_tweet_bloc.dart';

abstract class ManipulateTweetState extends Equatable {
  const ManipulateTweetState();

  @override
  List<Object> get props => [];
}

class ManipulateTweetInitial extends ManipulateTweetState {}

class ManipulateTweetLoading extends ManipulateTweetState {}

class ManipulateTweetSuccess extends ManipulateTweetState {}

class ManipulateTweetFailure extends ManipulateTweetState {
  final String message;
  const ManipulateTweetFailure({
    required this.message,
  });
}
