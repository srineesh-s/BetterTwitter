import 'package:bettertwitter/config/constants/db_names.dart';
import 'package:bettertwitter/models/tweets/tweet_model.dart';
import 'package:bettertwitter/models/user/user_model.dart';
import 'package:bettertwitter/screens/user_tweets/repository/user_tweet_rep.dart';
import 'package:bettertwitter/services/auth_service.dart';
import 'package:bettertwitter/services/firestore_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_tweet_rep_test.mocks.dart';

@GenerateMocks([AuthService, DbService])
void main() {
  late MockAuthService mockAuthService;
  late MockDbService mockDbService;
  late UserTweetRepository sut;

  setUp(() {
    mockAuthService = MockAuthService();
    mockDbService = MockDbService();
    sut = UserTweetRepository(
        authService: mockAuthService, dbService: mockDbService);
  });

  test("Checking deleting tweet", () async {
    // when(mockAuthService.userFromFirebaseUser.userId).thenReturn("123");
    when(mockDbService.deleteDocument(
            collectionName: CollectionNames.tweets, tweet: "tweet"))
        .thenAnswer((realInvocation) async => true);
    final bool result = await sut.deleteUserTweet(TweetModel(
      tweet: "tweet",
      date: "date",
      id: "id",
      user: UserModel(
        userId: "userId",
        name: "userName",
        image: "userPhoto",
        email: "userEmail",
      ),
      userId: "userId",
    ));
    expect(result, true);
  });
}
