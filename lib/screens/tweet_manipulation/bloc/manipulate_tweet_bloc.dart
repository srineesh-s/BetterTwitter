import 'package:bettertwitter/models/tweets/tweet_model.dart';
import 'package:bettertwitter/screens/tweet_manipulation/reposiotry/manipulate_tweet_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'manipulate_tweet_event.dart';
part 'manipulate_tweet_state.dart';

class ManipulateTweetBloc
    extends Bloc<ManipulateTweetEvent, ManipulateTweetState> {
  ManipulateTweetBloc(this.manipulateTweetRepository)
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

  ManipulateTweetRepository manipulateTweetRepository;
}
