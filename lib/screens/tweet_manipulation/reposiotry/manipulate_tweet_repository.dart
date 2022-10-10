// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bettertwitter/config/constants/db_names.dart';
import 'package:bettertwitter/models/tweets/tweet_model.dart';
import 'package:bettertwitter/services/auth_service.dart';
import 'package:bettertwitter/services/firestore_service.dart';

class ManipulateTweetRepository {
  DbService dbService;
  AuthService authService;
  ManipulateTweetRepository(
      {required this.dbService, required this.authService});

  Future<void> addTweet(String tweet) async {
    try {
      await dbService.addDataToCollection(
        collectionName: CollectionNames.tweets,
        data: TweetModel(
          id: "id",
          date: DateTime.now().toString(),
          user: authService.userFromFirebaseUser,
          userId: authService.userFromFirebaseUser.userId,
          tweet: tweet,
        ).toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
