import 'package:bettertwitter/config/constants/db_names.dart';
import 'package:bettertwitter/models/tweets/tweet_model.dart';
import 'package:bettertwitter/models/user/user_model.dart';
import 'package:bettertwitter/screens/add_tweet/repository/add_tweet_repository.dart';
import 'package:bettertwitter/services/auth_service.dart';
import 'package:bettertwitter/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_tweet_repository_test.mocks.dart';

@GenerateMocks([DbService, AuthService])
void main() {
  late MockDbService mockDbService;
  late MockAuthService mockAuthService;
  late AddTweetRepository addTweetRepository;

  setUp(() {
    mockDbService = MockDbService();
    mockAuthService = MockAuthService();
    addTweetRepository = AddTweetRepository(
        dbService: mockDbService, authService: mockAuthService);
  });

  test("Checking the add tweet function", () async {
    when(mockAuthService.userFromFirebaseUser.userId).thenReturn("userId");
    when(mockAuthService.userFromFirebaseUser.name).thenReturn("name");
    when(mockAuthService.userFromFirebaseUser.email).thenReturn("email");
    when(mockAuthService.userFromFirebaseUser.image).thenReturn(1.toString());
    // when(mockAuthService.userFromFirebaseUser).thenAnswer(
    //   ((realInvocation) => UserModel(
    //       userId: "userId", name: "name", email: "email", image: 1.toString())),
    // );
    when(mockAuthService.userFromFirebaseUser).thenReturn(
      UserModel(
          userId: "userId", name: "name", email: "email", image: 1.toString()),
    );
    // when(()mockAuthService.userFromFirebaseUser).thenAnswer(((realInvocation) =>
    //     UserModel(
    //         userId: "userId",
    //         name: "name",
    //         email: "email",
    //         image: 1.toString())));
    when(mockDbService.addDataToCollection(
            collectionName: CollectionNames.tweets, data: any
            // data: TweetModel(
            //         id: "id",
            //         userId: "userId",
            //         tweet: "tweet",
            //         user: UserModel(
            //             userId: "userId",
            //             name: "name",
            //             email: "email",
            //             image: 1.toString()),
            //         date: DateTime.now().toString())
            //     .toJson(),
            ))
        .thenAnswer((_) async => true);
    await addTweetRepository.addTweet("tweet");
  });
}
