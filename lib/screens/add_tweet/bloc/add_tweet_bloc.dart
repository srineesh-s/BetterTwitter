import 'package:bettertwitter/models/tweets/tweet_model.dart';
import 'package:bettertwitter/screens/add_tweet/repository/add_tweet_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_tweet_event.dart';
part 'add_tweet_state.dart';

class AddTweetBloc extends Bloc<ManipulateTweetEvent, AddTweetState> {
  AddTweetBloc(this.manipulateTweetRepository)
      : super(ManipulateTweetInitial()) {
    on<AddTweetEvent>((event, emit) async {
      emit(ManipulateTweetLoading());
      await manipulateTweetRepository.addTweet(event.tweet).then((value) {
        emit(ManipulateTweetSuccess());
      }).catchError((error) {
        emit(ManipulateTweetFailure(message: error.toString()));
      });
    });
  }

  AddTweetRepository manipulateTweetRepository;
}
