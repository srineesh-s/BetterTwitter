import 'package:bettertwitter/models/tweets/tweet_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_tweet_event.dart';
part 'user_tweet_state.dart';

class UserTweetBloc extends Bloc<UserTweetEvent, UserTweetState> {
  UserTweetBloc() : super(UserTweetInitial()) {
    on<UserTweetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
