import 'package:bettertwitter/models/tweets/tweet_model.dart';
import 'package:bettertwitter/models/user/user_model.dart';
import 'package:bettertwitter/screens/home/repository/home_rep.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, TweetStream> {
  HomeBloc(this.homeRepository) : super(TweetStream(tweets: [])) {
    on<HomeStreamEvent>((event, emit) async {
      await emit.forEach(homeRepository.videoDataStream,
          onData: ((List<TweetModel> data) {
        return TweetStream(tweets: data);
      }));
    }, transformer: restartable());
  }

  HomeRepository homeRepository;
}
