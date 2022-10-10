// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'manipulate_tweet_bloc.dart';

abstract class ManipulateTweetEvent extends Equatable {
  const ManipulateTweetEvent();

  @override
  List<Object> get props => [];
}

class AddTweetEvent extends ManipulateTweetEvent {
  final String tweet;
  const AddTweetEvent({
    required this.tweet,
  });
}

class EditTweetEvent extends ManipulateTweetEvent {
  final TweetModel tweetModel;
  const EditTweetEvent({
    required this.tweetModel,
  });
}
