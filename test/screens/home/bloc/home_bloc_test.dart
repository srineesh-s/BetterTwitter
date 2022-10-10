import 'package:bettertwitter/models/tweets/tweet_model.dart';
import 'package:bettertwitter/models/user/user_model.dart';
import 'package:bettertwitter/screens/home/bloc/home_bloc.dart';
import 'package:bettertwitter/screens/home/repository/home_rep.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late MockHomeRepository mockHomeRepository;
  setUp(() {
    mockHomeRepository = MockHomeRepository();
  });

  blocTest<HomeBloc, TweetStream>(
    'Initially the stream is empty',
    setUp: () {
      when(mockHomeRepository.videoDataStream).thenAnswer(
        (realInvocation) => Stream<List<TweetModel>>.fromIterable([]),
      );
    },
    build: () => HomeBloc(mockHomeRepository),
    // seed: () => VideoStreamState(currentFrame: frame, isPlaying: true),
    act: (bloc) => bloc.add(HomeStreamEvent()),
    expect: () => [],
  );

  blocTest<HomeBloc, TweetStream>(
    'When sent elements, the stream is updated',
    setUp: () {
      when(mockHomeRepository.videoDataStream).thenAnswer(
        (realInvocation) => Stream<List<TweetModel>>.fromIterable([
          [
            TweetModel(
                id: "id",
                userId: "userId",
                tweet: "tweet",
                user: UserModel(
                  email: "email",
                  image: "image",
                  name: "name",
                  userId: "userId",
                ),
                date: "date")
          ]
        ]),
      );
    },
    build: () => HomeBloc(mockHomeRepository),
    // seed: () => VideoStreamState(currentFrame: frame, isPlaying: true),
    act: (bloc) => bloc.add(HomeStreamEvent()),
    expect: () => [isA<TweetStream>()],
  );
}
