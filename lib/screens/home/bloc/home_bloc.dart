import 'package:bettertwitter/models/user/user_model.dart';
import 'package:bettertwitter/screens/home/repository/home_rep.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.homeRepository) : super(HomeInitial()) {
    on<HomeStreamEvent>((event, emit) async {
      emit(TweetLoading());
      try {
        await emit.forEach(homeRepository.videoDataStream,
            onData: ((List<UserModel> data) {
          print(data[0].name);
          return TweetStream(users: data);
        }));
      } catch (e) {
        emit(TweetError());
      }
    }, transformer: restartable());
  }

  HomeRepository homeRepository;
}
