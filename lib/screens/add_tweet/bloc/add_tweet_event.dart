// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_tweet_bloc.dart';

abstract class ManipulateTweetEvent {}

class AddTweetEvent extends ManipulateTweetEvent {
  final String tweet;
  AddTweetEvent({
    required this.tweet,
  });
}
