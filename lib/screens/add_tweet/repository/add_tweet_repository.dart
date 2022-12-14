// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bettertwitter/config/constants/db_names.dart';
import 'package:bettertwitter/models/tweets/tweet_model.dart';
import 'package:bettertwitter/services/auth_service.dart';
import 'package:bettertwitter/services/firestore_service.dart';

class AddTweetRepository {
  DbService dbService;
  AuthService authService;
  AddTweetRepository({required this.dbService, required this.authService});

  Future<void> addTweet(String tweet) async {
    try {
      await dbService.addDataToCollection(
        collectionName: CollectionNames.tweets,
        data: TweetModel(
          id: "id",
          date: DateTime.now().toString(),
          userId: authService.userFromFirebaseUser.userId,
          user: authService.userFromFirebaseUser,
          tweet: tweet,
        ).toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
